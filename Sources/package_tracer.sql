/*
Package_Tracer enables the tracing of calls to package procedures or functions without manual programming.
This program can generate a package for tracing automatically when the following conditions apply:

  1. the package is accessible to the schema user via a synonym.
  2. the procedure or function is listed in the package header.
  3. there are no pipelined functions in the package.
  4. the package defines no record or table types.
  5. the package header is not wrapped

The enable procedure will generate a package with the same name as the synonym in your local schema.

The link from your local applications to the synonym will be intercepted by the generated package.

The package will contain the same functions and procedures as the original package.

In each function and procedure exists 

1. A call to APEX_DEBUG.MESSAGE to produce log entries with text for valid PL/SQL procedure calls with enquoted parameters, that you can copy and paste into the sql console for testing.
2. A call to invocate the original procedure or functions.
3. A call to APEX_DEBUG.MESSAGE to produce log entries for the output values and return values of the invocation.

For other packages where the above-mentioned conditions do not apply, you can manually add invocations to the api_trace package to support logging for prepared functions or procedures in your own packages.

Use the package_tracer.Enable procedure to start tracing of a package.

Use the package_tracer.Disable procedure to stop tracing of a package.


1. enable
    detect local packages with the same name that may be overwritten.
    support local synonyms. 
        local synonym is dropped before the package is created.
        The origial synonym definition is captured in a comment of the generated package header.
    produce synonyms and grants for dependent objects.
    In the case that additiona privileges are required, print grant statements and then stop-
    create a package header as a slimmed copy of the target package.
    create a package body that for each procedure or function
        prints the call parameter in the APEX debug log.
        then execute the target function or procedure 
        print return values and output parameter after function call in the APEX debug log.

3. disable: 
    execute drop statements for synonyms that are no longer required 
    execute drop statement for the local package 
    recreate the local synonym when no PUBLIC synonym exists.

-- for some APEX APIs you have to grant access to the following objects:
GRANT EXECUTE ON APEX_<version>.WWV_FLOW_SECURITY TO <schema_name>;
GRANT EXECUTE ON APEX_<version>.WWV_FLOW_THEMES TO <schema_name>;
GRANT EXECUTE ON APEX_<version>.WWV_FLOW_THEME_STYLES TO <schema_name>;

-- for the publish app schema functionality you need the following privileges:
GRANT CREATE ANY SYNONYM TO <schema_name>;
GRANT DROP ANY SYNONYM TO <schema_name>;
GRANT CREATE ANY VIEW TO <schema_name>;
GRANT DROP ANY VIEW TO <schema_name>;

*/

CREATE OR REPLACE PACKAGE package_tracer
AUTHID CURRENT_USER 
IS
	c_APEX_Condition_Start     CONSTANT VARCHAR2(1000) := 'if apex_application.g_debug then';
	c_APEX_Condition_End       CONSTANT VARCHAR2(1000) := 'end if;';
	c_Package_Name             CONSTANT VARCHAR2(128) := lower($$plsql_unit);
    g_debug 				   CONSTANT BOOLEAN := FALSE;
    
    TYPE rec_logging_calls IS RECORD (
        Package_Name 	SYS.ALL_ARGUMENTS.PACKAGE_NAME%TYPE, 
        Object_Name 	SYS.ALL_ARGUMENTS.OBJECT_NAME%TYPE, 
        Subprogram_Id 	SYS.ALL_ARGUMENTS.SUBPROGRAM_ID%TYPE, 
        Overload 		SYS.ALL_ARGUMENTS.OVERLOAD%TYPE,
        Procedure_Name 	VARCHAR2(512),
        Logging_Call 	VARCHAR2(32767)
    );
    TYPE tab_logging_calls IS TABLE OF rec_logging_calls;
    
    TYPE rec_dependent_grants IS RECORD (
        Owner           VARCHAR2(128),
        Name            VARCHAR2(128),
        Grant_Stat      VARCHAR2(1000),
        Synonym_Stat    VARCHAR2(1000),
        Grantable       VARCHAR2(3),
        Privilage       VARCHAR2(1000),
        Synonym_Owner   VARCHAR2(128)
    );
    TYPE tab_dependent_grants IS TABLE OF rec_dependent_grants;
    
    TYPE rec_synonyms IS RECORD (
        Synonym_Owner   VARCHAR2(128),
        Synonym_Name    VARCHAR2(128),
        Package_Owner   VARCHAR2(128),
        Package_Name    VARCHAR2(128)
    );
    TYPE tab_synonyms IS TABLE OF rec_synonyms;

    FUNCTION get_APEX_Packages_List RETURN tab_synonyms PIPELINED;
    FUNCTION get_Packages_List (
        p_Search_Name VARCHAR2 DEFAULT '%'
    ) RETURN tab_synonyms PIPELINED;
    
    TYPE rec_Packages_Control IS RECORD (
        Synonym_Name    VARCHAR2(128),
        Package_Owner   VARCHAR2(128),
        Package_Name    VARCHAR2(128),
        Is_Enabled_Switch VARCHAR2(32767),
        Is_Enabled 		VARCHAR2(1),
		Grant_Stats		VARCHAR2(32767),
		Synonym_Stats	VARCHAR2(32767),
		Error_Count		NUMBER
    );
    TYPE tab_Packages_Control IS TABLE OF rec_Packages_Control;
    TYPE cur_Packages_Control IS REF CURSOR RETURN rec_Packages_Control;
    
    FUNCTION get_Packages_Control_List (
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')    
    )
    RETURN tab_Packages_Control PIPELINED;
    
    FUNCTION get_APEX_Control_List 
    RETURN tab_Packages_Control PIPELINED;

	TYPE rec_publish_schema IS RECORD (
		OWNER   		VARCHAR2(128),
		OBJECT_NAME   	VARCHAR2(128), 
		OBJECT_TYPE   	VARCHAR2(128), 
		DEST_OBJECT_TYPE VARCHAR2(128),
		FOREIGN_DEPS_CNT		NUMBER,
		DEST_OBJECT_EXISTS VARCHAR2(3),
		CONFLICTING_OBJECT_EXISTS  VARCHAR2(3),
		DEST_SCHEMA		VARCHAR2(128),
		GRANT_STAT 		VARCHAR2(4000), 
		CREATE_STAT 	VARCHAR2(4000), 
		REVOKE_STAT 	VARCHAR2(4000), 
		DROP_STAT 		VARCHAR2(4000),
		IS_ENABLED_SWITCH VARCHAR2(4000)
	);
    TYPE tab_publish_schema IS TABLE OF rec_publish_schema;

    FUNCTION get_publish_schema (
    	p_Target_Schema IN VARCHAR2 
    )
    RETURN tab_publish_schema PIPELINED;

	PROCEDURE Copy_View (
		p_View_Name IN VARCHAR2,
		p_Dest_Schema IN VARCHAR2 
	);

    FUNCTION Format_Call_Parameter(
        p_Object_Name IN VARCHAR2,
        p_Object_Owner IN VARCHAR2,
        p_Procedure_Name IN VARCHAR2,
        p_Subprogram_ID IN NUMBER,
        p_calling_subprog VARCHAR2,
        p_synonym_name VARCHAR2 DEFAULT NULL,
        p_value_max_length INTEGER DEFAULT 1000,
        p_bind_char VARCHAR2 DEFAULT ':',
        p_overload INTEGER DEFAULT 0,
        p_in_out VARCHAR2 DEFAULT 'IN/OUT' -- IN, OUT, IN/OUT
    ) RETURN VARCHAR2;

	FUNCTION Format_Return_Value (
		p_Procedure_Name IN VARCHAR2,
		p_PLS_Type IN VARCHAR2,
		p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result'
    ) RETURN VARCHAR2;

    -- helper query for listing the procedures with parameters of a package
    FUNCTION Dyn_Log_Call_List (
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Compact IN VARCHAR2 DEFAULT 'Y', --Y/N
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_Condition_Start IN VARCHAR2 DEFAULT c_APEX_Condition_Start,
        p_Condition_End IN VARCHAR2 DEFAULT c_APEX_Condition_End,
        p_Indent IN NUMBER DEFAULT 8
    ) RETURN tab_logging_calls PIPELINED;

    FUNCTION Get_Package_Source  (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Editionable  IN VARCHAR2 DEFAULT 'N',
        p_Type IN VARCHAR2 DEFAULT 'PACKAGE'
    ) RETURN CLOB;

    FUNCTION Get_Package_Synonym_Text (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ) RETURN VARCHAR2;

    PROCEDURE Enable (
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE,
        p_value_max_length INTEGER DEFAULT 1000
    );

    PROCEDURE Enable_APEX (
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE
    );

    PROCEDURE Disable (
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE
    );

    PROCEDURE Disable_APEX (
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE
    );
END package_tracer;
/


CREATE OR REPLACE PACKAGE BODY package_tracer
IS
    c_Quote CONSTANT VARCHAR2(1) := chr(39);	-- Quote Character
	c_DQuote CONSTANT VARCHAR2(1) := chr(34);	-- Double Quote Character
	
    FUNCTION get_APEX_Packages_List 
    RETURN tab_synonyms PIPELINED
    IS 
        c_APEX_Packages CONSTANT VARCHAR2(2000) := 
        'APEX_ACL,APEX_APPLICATION_INSTALL,APEX_APP_SETTING,APEX_AUTHENTICATION,APEX_'
        || 'AUTHORIZATION,APEX_COLLECTION,APEX_CSS,APEX_CUSTOM_AUTH,'
        || 'APEX_ESCAPE,APEX_EXPORT,APEX_ITEM,'
        || 'APEX_JAVASCRIPT,APEX_LANG,APEX_MAIL,APEX_PAGE,APEX_PKG_APP_INSTALL,'
        || 'APEX_REGION,APEX_SESSION,APEX_SPATIAL,APEX_THEME,'
        || 'APEX_UI_DEFAULT_UPDATE,APEX_UTIL,APEX_WEB_SERVICE';
    begin   
        for cur in (
            select 
            	SYN.OWNER 			Synonym_Owner, 
            	SYN.SYNONYM_NAME 	Synonym_Name,
            	SYN.TABLE_OWNER 	Package_Owner,
            	SYN.TABLE_NAME 		Package_Name
            from SYS.All_Synonyms SYN
            where SYN.SYNONYM_NAME IN (
            	SELECT column_value FROM TABLE(apex_string.split(c_APEX_Packages, ','))
            )
            and SYN.OWNER = 'PUBLIC'
            order by Syn.synonym_Name
        ) loop 
            pipe row (cur);
        end loop;
        return;
    end get_APEX_Packages_List;

    FUNCTION get_Packages_List (
        p_Search_Name VARCHAR2 DEFAULT '%'
    ) RETURN tab_synonyms PIPELINED
    IS 
    begin   
        for cur in (
        	select
            	SYN.OWNER 			Synonym_Owner, 
            	SYN.SYNONYM_NAME 	Synonym_Name,
            	SYN.TABLE_OWNER 	Package_Owner,
            	SYN.TABLE_NAME 		Package_Name
            from SYS.All_Synonyms SYN
            join SYS.All_Objects OBJ on SYN.TABLE_NAME = OBJ.OBJECT_NAME and SYN.TABLE_OWNER = OBJ.OWNER
            where Syn.OWNER IN ('PUBLIC', SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') )
            and SYN.SYNONYM_NAME LIKE p_Search_Name
            and OBJ.OBJECT_TYPE = 'PACKAGE'
            and NOT EXISTS ( -- package defines no new record types
                select 1
                from SYS.All_Arguments ARG
                where ARG.TYPE_NAME = ARG.PACKAGE_NAME
                and ARG.PACKAGE_NAME = SYN.TABLE_NAME
                and ARG.OWNER = SYN.TABLE_OWNER
            )
            and exists ( -- package has procedures
                select 1 
                from SYS.ALL_PROCEDURES PRO
                where PRO.OWNER = SYN.TABLE_OWNER
                and PRO.OBJECT_NAME = SYN.TABLE_NAME
                and PRO.OBJECT_TYPE = 'PACKAGE'
                and PRO.PROCEDURE_NAME IS NOT NULL
            )
            and not exists ( -- package has no PIPELINED functions
                select 1 
                from SYS.ALL_PROCEDURES PRO
                where PRO.OWNER = SYN.TABLE_OWNER
                and PRO.OBJECT_NAME = SYN.TABLE_NAME
                and PRO.OBJECT_TYPE = 'PACKAGE'
                and (PRO.PIPELINED = 'YES'
                 or PRO.AGGREGATE  = 'YES')
            )
            and not exists ( -- package is not wrapped
                SELECT 1 
                FROM SYS.All_Source SRC 
                WHERE SRC.OWNER = SYN.TABLE_OWNER
                and Name = SYN.TABLE_NAME
                and type = 'PACKAGE'
                and REGEXP_INSTR(SRC.text, '\s+wrapped\s+', 1, 1, 0, 'i') > 0
                and line = 1
            )
            and SYN.SYNONYM_NAME NOT IN ('APEX_DEBUG', 'APEX_STRING', -- because package_tracer is dependent on this synonyms
                'DBMS_DIMENSION', -- PLS-00307: Zu viele Deklarationen von 'VALIDATE_DIMENSION' entsprechen diesem Aufruf
                'DBMS_SODA_USER_ADMIN', -- PLS-00201
                'APEX_PLUGIN',
                'APEX_INSTANCE_ADMIN',
                'APEX_INSTANCE_REST_ADMIN',
                'API_TRACE'
            )
            order by SYN.SYNONYM_NAME
        ) loop 
            pipe row (cur);
        end loop;
        return;
    end get_Packages_List;
    
    FUNCTION get_Packages_Control_List (
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    )
    RETURN tab_Packages_Control PIPELINED
    IS 
    begin   
        for cur in (
			WITH DEPS AS (
				SELECT Syn.SYNONYM_NAME, Syn.PACKAGE_OWNER, Syn.PACKAGE_NAME,
					LISTAGG(DEP.GRANT_STAT, '; ') WITHIN GROUP (ORDER BY GRANT_STAT) GRANT_STATS,
					LISTAGG(DEP.SYNONYM_STAT, '; ') WITHIN GROUP (ORDER BY SYNONYM_STAT) SYNONYM_STATS
				FROM table(get_Packages_List) SYN
				LEFT OUTER JOIN (
					SELECT DA.Owner Object_Owner, DA.Name Object_Name,
						case when Pri.Privilege IS NULL and DA.referenced_Owner != 'PUBLIC' then 
							'GRANT EXECUTE ON '
							|| DA.referenced_Owner || '.' || DA.referenced_Name 
							|| ' TO ' || p_Dest_Schema 
						end GRANT_STAT,
						case when SYN.OWNER IS NULL AND DB.REFERENCED_OWNER IS NULL then 
							'CREATE OR REPLACE SYNONYM ' || p_Dest_Schema || '.' || DA.referenced_Name
							|| ' FOR ' || DA.referenced_Owner || '.' || DA.referenced_Name 
						end SYNONYM_STAT,
						PRI.Grantable,
						PRI.Privilege,
						SYN.OWNER SYNONYM_OWNER
					FROM SYS.ALL_DEPENDENCIES DA
					LEFT OUTER JOIN SYS.ALL_SYNONYMS SYN 
						ON SYN.OWNER IN (p_Dest_Schema, 'PUBLIC')
						AND Syn.Synonym_Name = DA.referenced_Name
					LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI 
						ON Pri.table_Schema = DA.referenced_Owner 
						AND Pri.table_Name = DA.referenced_Name
						AND Pri.type = DA.referenced_Type
						AND PRI.Grantee IN (p_Dest_Schema, 'PUBLIC')
						AND PRI.privilege IN ('EXECUTE', 'SELECT')
			        LEFT OUTER JOIN ( -- no VIEW OR SYNONYM with this name already exists
						SELECT DB.REFERENCED_NAME, DB.REFERENCED_OWNER
						FROM SYS.ALL_DEPENDENCIES DB 
						WHERE DB.OWNER = p_Dest_Schema
						AND DB.NAME = DB.REFERENCED_NAME
					) DB ON DB.REFERENCED_NAME = DA.REFERENCED_NAME and DB.REFERENCED_OWNER = DA.OWNER
					WHERE (SYN.OWNER IS NULL or Pri.Privilege IS NULL)
					AND NOT(DA.referenced_Owner = 'SYS' AND DA.referenced_Name = 'STANDARD')
				) DEP ON DEP.Object_Owner = SYN.PACKAGE_OWNER AND DEP.Object_Name = SYN.PACKAGE_NAME
				GROUP BY Syn.SYNONYM_NAME, Syn.PACKAGE_OWNER, Syn.PACKAGE_NAME
			)
			SELECT SYNONYM_NAME, PACKAGE_OWNER, PACKAGE_NAME,
				APEX_ITEM.HIDDEN (p_idx => 1, p_value => SYNONYM_NAME, p_item_id => 'f01_'||ROWNUM, p_item_label => 'ROW_SELECTOR$') ||
				APEX_ITEM.SWITCH (p_idx => 2, 
				  p_value => IS_ENABLED, 
				  p_item_id => 'f02_'||ROWNUM, p_item_label => 'SWITCH_ENABLED') 
				|| APEX_ITEM.HIDDEN (p_idx => 3, p_value => IS_ENABLED, p_item_id => 'f03_' || ROWNUM , p_item_label => 'IS_ENABLED') IS_ENABLED_SWITCH,
				IS_ENABLED,
				GRANT_STATS,
				SYNONYM_STATS,
				ERROR_COUNT
			FROM ( 
				SELECT D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME,
					CASE WHEN EXISTS (
						SELECT 1 
						FROM SYS.USER_OBJECTS OBJ
						WHERE OBJ.OBJECT_NAME = D.SYNONYM_NAME
						AND OBJECT_TYPE = 'PACKAGE'
					) THEN 'Y' ELSE 'N' END IS_ENABLED,
					case when GRANT_STATS is not null then GRANT_STATS||';' end GRANT_STATS,
					case when SYNONYM_STATS is not null then SYNONYM_STATS||';' end SYNONYM_STATS,
					(SELECT COUNT(*) 
					 FROM SYS.USER_ERRORS ERR
					 WHERE ERR.NAME = D.SYNONYM_NAME
					 AND ERR.TYPE LIKE 'PACKAGE%'
					) ERROR_COUNT
				FROM DEPS D
				UNION ALL -- enabled loacale packages
				SELECT D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME, 'Y' IS_ENABLED,
					NULL GRANT_STATS, 
					'CREATE OR REPLACE ' || SYNONYM_STATS || ';' SYNONYM_STATS,
					(SELECT COUNT(*) 
					 FROM SYS.USER_ERRORS ERR
					 WHERE ERR.NAME = D.SYNONYM_NAME
					 AND ERR.TYPE LIKE 'PACKAGE%'
					) ERROR_COUNT
				FROM (
					SELECT DEP.NAME SYNONYM_NAME, 
							DEP.REFERENCED_NAME PACKAGE_NAME,
							DEP.REFERENCED_OWNER PACKAGE_OWNER,
							package_tracer.Get_Package_Synonym_Text(DEP.REFERENCED_NAME) SYNONYM_STATS
					FROM SYS.USER_DEPENDENCIES DEP
					where DEP.TYPE = 'PACKAGE BODY'
					and DEP.REFERENCED_TYPE = 'PACKAGE'
					and DEP.REFERENCED_NAME = DEP.NAME
					and DEP.REFERENCED_OWNER != p_Dest_Schema
				) D
				WHERE SYNONYM_STATS IS NOT NULL
			) MAIN
			order by 1
        ) loop 
            pipe row (cur);
        end loop;
        return;
    end get_Packages_Control_List;

    FUNCTION get_APEX_Control_List 
    RETURN tab_Packages_Control PIPELINED
    IS 
    begin   
        for cur in (
			WITH DEPS AS (
				SELECT Syn.SYNONYM_NAME, Syn.PACKAGE_OWNER, Syn.PACKAGE_NAME,
					LISTAGG(DEP.GRANT_STAT, '; ') WITHIN GROUP (ORDER BY GRANT_STAT) GRANT_STATS,
					LISTAGG(DEP.SYNONYM_STAT, '; ') WITHIN GROUP (ORDER BY SYNONYM_STAT) SYNONYM_STATS
				FROM table(get_APEX_Packages_List) SYN
				LEFT OUTER JOIN (
					SELECT DA.Owner Object_Owner, DA.Name Object_Name,
						case when Pri.Privilege IS NULL and DA.referenced_Owner != 'PUBLIC' then 
							'GRANT EXECUTE ON '
							|| DA.referenced_Owner || '.' || DA.referenced_Name 
							|| ' TO ' || SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') 
						end GRANT_STAT,
						case when Syn.Owner IS NULL AND DB.REFERENCED_OWNER IS NULL then 
							'CREATE OR REPLACE SYNONYM ' || SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') || '.' || DA.referenced_Name
							|| ' FOR ' || DA.referenced_Owner || '.' || DA.referenced_Name 
						end SYNONYM_STAT,
						PRI.Grantable,
						PRI.Privilege,
						SYN.OWNER SYNONYM_OWNER
					FROM SYS.ALL_DEPENDENCIES DA
					LEFT OUTER JOIN SYS.ALL_SYNONYMS SYN 
						ON SYN.OWNER IN (SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'), 'PUBLIC')
						AND Syn.Synonym_Name = DA.referenced_Name
					LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI 
						ON Pri.table_Schema = DA.referenced_Owner 
						AND Pri.table_Name = DA.referenced_Name
						AND Pri.type = DA.referenced_Type
						AND PRI.Grantee IN (SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'), 'PUBLIC')
						AND PRI.privilege IN ('EXECUTE', 'SELECT')
			        LEFT OUTER JOIN ( -- no VIEW OR SYNONYM with this name already exists
						SELECT DB.REFERENCED_NAME, DB.REFERENCED_OWNER
						FROM SYS.ALL_DEPENDENCIES DB
						WHERE DB.OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
						AND DB.NAME = DB.REFERENCED_NAME
					) DB ON DB.REFERENCED_NAME = DA.REFERENCED_NAME and DB.REFERENCED_OWNER = DA.OWNER
					WHERE (SYN.OWNER IS NULL OR PRI.PRIVILEGE IS NULL)
					AND NOT(DA.REFERENCED_OWNER = 'SYS' AND DA.REFERENCED_NAME = 'STANDARD')
				) DEP ON DEP.Object_Owner = SYN.PACKAGE_OWNER AND DEP.Object_Name = SYN.PACKAGE_NAME
				GROUP BY SYN.SYNONYM_NAME, SYN.PACKAGE_OWNER, SYN.PACKAGE_NAME
			)
			SELECT SYNONYM_NAME, PACKAGE_OWNER, PACKAGE_NAME,
				APEX_ITEM.HIDDEN (p_idx => 1, p_value => SYNONYM_NAME, p_item_id => 'f01_'||ROWNUM, p_item_label => 'ROW_SELECTOR$') ||
				APEX_ITEM.SWITCH (p_idx => 2, 
				  p_value => IS_ENABLED, 
				  p_item_id => 'f02_'||ROWNUM, p_item_label => 'SWITCH_ENABLED') 
				|| APEX_ITEM.HIDDEN (p_idx => 3, p_value => IS_ENABLED, p_item_id => 'f03_' || ROWNUM , p_item_label => 'IS_ENABLED') IS_ENABLED_SWITCH,
				IS_ENABLED,
				GRANT_STATS,
				SYNONYM_STATS,
				ERROR_COUNT
			FROM ( 
				SELECT D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME,
					CASE WHEN EXISTS (
						SELECT 1 
						FROM SYS.USER_OBJECTS OBJ
						WHERE OBJ.OBJECT_NAME = D.SYNONYM_NAME
						AND OBJECT_TYPE = 'PACKAGE'
					) THEN 'Y' ELSE 'N' END IS_ENABLED,
					case when GRANT_STATS is not null then GRANT_STATS||';' end GRANT_STATS,
					case when SYNONYM_STATS is not null then SYNONYM_STATS||';' end SYNONYM_STATS,
					(SELECT COUNT(*) 
					 FROM SYS.USER_ERRORS ERR
					 WHERE ERR.NAME = D.SYNONYM_NAME
					 AND ERR.TYPE LIKE 'PACKAGE%'
					) ERROR_COUNT
				FROM DEPS D
			) MAIN
			order by 1
        ) loop 
            pipe row (cur);
        end loop;
        return;
    end get_APEX_Control_List;

    FUNCTION get_publish_schema (
    	p_Target_Schema IN VARCHAR2 
    )
    RETURN tab_publish_schema PIPELINED
    IS
    BEGIN
        for cur in (
			WITH PA AS (
				SELECT p_Target_Schema GRANTEE,
					SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') OWNER
				FROM DUAL 
			),
			STATS_Q AS (
				-- views
				-------------------------
				SELECT 'GRANT ' || PRIVS || ' ON ' || S.OWNER || '.' || TABLE_NAME || ' TO ' || PA.GRANTEE GRANT_STAT,
					'CREATE OR REPLACE VIEW ' || PA.GRANTEE || '.' || TABLE_NAME || 
					' AS SELECT * FROM ' || S.OWNER || '.' || TABLE_NAME CREATE_STAT,
					'REVOKE ' || PRIVS || ' ON ' || S.OWNER || '.' || TABLE_NAME || ' FROM ' || PA.GRANTEE REVOKE_STAT, 
					'DROP VIEW ' || PA.GRANTEE || '.' || TABLE_NAME DROP_STAT,
					S.OWNER, S.TABLE_NAME OBJECT_NAME, 
					'VIEW' OBJECT_TYPE, 
					'VIEW' DEST_OBJECT_TYPE,
					FOREIGN_DEPS_CNT
				FROM (
					SELECT 'SELECT'
						|| CASE WHEN TR.PRIVS IS NOT NULL THEN ', ' || TR.PRIVS
						ELSE 
							CASE WHEN UPDATABLE > 0  AND NVL(D.FOREIGN_DEPS_CNT,0) = 0 THEN ', UPDATE' END
							|| CASE WHEN INSERTABLE > 0 AND NVL(D.FOREIGN_DEPS_CNT,0) = 0 THEN ', INSERT' END
							|| CASE WHEN DELETABLE > 0  AND NVL(D.FOREIGN_DEPS_CNT,0) = 0 THEN ', DELETE ' END 
						END PRIVS,
						T.TABLE_NAME, T.OWNER, 
						NVL(D.FOREIGN_DEPS_CNT,0) FOREIGN_DEPS_CNT
					FROM (
						SELECT T.TABLE_NAME, T.OWNER,
							SUM(CASE WHEN UPDATABLE = 'YES' THEN 1 ELSE 0 END) UPDATABLE,
							SUM(CASE WHEN INSERTABLE = 'YES' THEN 1 ELSE 0 END) INSERTABLE,
							SUM(CASE WHEN DELETABLE = 'YES' THEN 1 ELSE 0 END) DELETABLE
						FROM SYS.USER_UPDATABLE_COLUMNS T
						WHERE EXISTS (
							SELECT 'X'
							FROM USER_VIEWS V WHERE V.VIEW_NAME = T.TABLE_NAME
						)
						GROUP BY TABLE_NAME, OWNER
					) T LEFT OUTER JOIN (
					-- when a view is accessing other foreign view, then is view has SELECT-only access
						SELECT D.NAME, COUNT(*) FOREIGN_DEPS_CNT
						FROM SYS.USER_DEPENDENCIES D
						WHERE D.TYPE = 'VIEW'
						AND D.REFERENCED_TYPE IN ('VIEW', 'TABLE', 'SYNONYM')
						AND D.REFERENCED_OWNER != SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
						GROUP BY NAME
					) D ON T.TABLE_NAME = D.NAME
					LEFT OUTER JOIN (
						-- updatable views with INSTEAD OF trigger
						SELECT REGEXP_REPLACE(
							LISTAGG(TRIGGERING_EVENT, ', ') WITHIN GROUP (ORDER BY TRIGGERING_EVENT), 
							'\sOR\s', ', ') PRIVS,
							T.TABLE_NAME
						FROM SYS.USER_TRIGGERS T
						WHERE TRIGGER_TYPE = 'INSTEAD OF'
						AND BASE_OBJECT_TYPE = 'VIEW'
						GROUP BY TABLE_NAME
					) TR ON T.TABLE_NAME = TR.TABLE_NAME
				) S, PA
				WHERE PA.GRANTEE IS NOT NULL
				UNION ALL   
				-- normal tables 
				----------------
				SELECT 
					'GRANT ' || PRIVS || ' ON ' 
					|| PA.OWNER || '.' || TABLE_NAME || ' TO ' || PA.GRANTEE GRANT_STAT,
					'CREATE OR REPLACE VIEW ' || PA.GRANTEE || '.' || T.TABLE_NAME 
					|| ' AS SELECT * FROM ' || PA.OWNER || '.' || T.TABLE_NAME CREATE_STAT,
					'REVOKE ' || PRIVS || ' ON ' 
					 || PA.OWNER || '.' || TABLE_NAME || ' FROM ' || PA.GRANTEE REVOKE_STAT, 
					'DROP VIEW ' || PA.GRANTEE || '.' || T.TABLE_NAME DROP_STAT,
					PA.OWNER, T.TABLE_NAME OBJECT_NAME, 
					'TABLE' OBJECT_TYPE, 
					'VIEW' DEST_OBJECT_TYPE,
					0 FOREIGN_DEPS_CNT
				FROM (
					SELECT T.TABLE_NAME,
						CASE WHEN READ_ONLY = 'NO'
							AND NOT EXISTS (    -- when this table is part of materialized view, then only SELECT allowed 
								SELECT 1
								FROM USER_OBJECTS MV
								WHERE MV.OBJECT_NAME = T.TABLE_NAME
								AND MV.OBJECT_TYPE = 'MATERIALIZED VIEW'
							) THEN 'SELECT, UPDATE, INSERT, DELETE ' 
							ELSE 'SELECT ' 
						END PRIVS 
					FROM SYS.USER_TABLES T
					WHERE T.IOT_NAME IS NULL	-- skip overflow tables of index organized tables
					AND T.TABLE_NAME NOT LIKE 'DR$%$_'  -- skip fulltext index
				) T, PA
				WHERE PA.GRANTEE IS NOT NULL
				AND NOT EXISTS (    -- this table is not part of materialized view log 
					SELECT --+ NO_UNNEST
						1
					FROM SYS.ALL_MVIEW_LOGS MV
					WHERE MV.LOG_TABLE = T.TABLE_NAME
					AND MV.LOG_OWNER = PA.OWNER
				)
				UNION ALL  
				-- Function, Procedure, Package, Type
				-------------------------------
				SELECT 'GRANT EXECUTE ON ' || PA.OWNER || '.' || T.OBJECT_NAME || ' TO ' || PA.GRANTEE GRANT_STAT,
					'CREATE OR REPLACE SYNONYM '  || PA.GRANTEE || '.' || OBJECT_NAME 
					|| ' FOR ' || PA.OWNER || '.' || OBJECT_NAME CREATE_STAT,
					'REVOKE EXECUTE ON ' || PA.OWNER || '.' || T.OBJECT_NAME || ' FROM ' || PA.GRANTEE REVOKE_STAT, 
					'DROP SYNONYM '  || PA.GRANTEE || '.' || OBJECT_NAME DROP_STAT,
					PA.OWNER, T.OBJECT_NAME, 
					T.OBJECT_TYPE, 
					'SYNONYM' DEST_OBJECT_TYPE,
					0 FOREIGN_DEPS_CNT
				FROM SYS.USER_OBJECTS T, PA
				WHERE PA.GRANTEE IS NOT NULL
				AND T.OBJECT_TYPE IN ('FUNCTION','PROCEDURE','PACKAGE','TYPE')
				UNION ALL -- Sequences
				SELECT 'GRANT SELECT ON ' || PA.OWNER || '.' || T.SEQUENCE_NAME || ' TO ' || PA.GRANTEE GRANT_STAT,
					'CREATE OR REPLACE SYNONYM '  || PA.GRANTEE || '.' || SEQUENCE_NAME 
					|| ' FOR ' || PA.OWNER || '.' || SEQUENCE_NAME CREATE_STAT,
					'REVOKE SELECT ON ' || PA.OWNER || '.' || T.SEQUENCE_NAME || ' FROM ' || PA.GRANTEE REVOKE_STAT, 
					'DROP SYNONYM '  || PA.GRANTEE || '.' || SEQUENCE_NAME DROP_STAT,
					PA.OWNER, T.SEQUENCE_NAME OBJECT_NAME, 
					'SEQUENCE' OBJECT_TYPE, 
					'SYNONYM' DEST_OBJECT_TYPE,
					0 FOREIGN_DEPS_CNT
				FROM SYS.USER_SEQUENCES T, PA
				WHERE PA.GRANTEE IS NOT NULL
			), MAIN_Q AS (
				SELECT S.OWNER, S.OBJECT_NAME, S.OBJECT_TYPE, S.DEST_OBJECT_TYPE,
					S.FOREIGN_DEPS_CNT, 
					case when EXISTS (
							SELECT 1 
							FROM SYS.ALL_DEPENDENCIES D
							WHERE D.OWNER = p_Target_Schema
							AND D.NAME = S.OBJECT_NAME
							and D.REFERENCED_OWNER= S.OWNER
							and D.REFERENCED_NAME = S.OBJECT_NAME
							AND D.REFERENCED_TYPE = S.OBJECT_TYPE
						) then 'Y' else 'N'
					end DEST_OBJECT_EXISTS,
					case when EXISTS (
							SELECT 1 
							FROM SYS.ALL_SYNONYMS SYN
							WHERE SYN.SYNONYM_NAME = S.OBJECT_NAME
							AND SYN.OWNER = 'PUBLIC'
						) then 'Y' else 'N'
					end CONFLICTING_OBJECT_EXISTS,
					p_Target_Schema DEST_SCHEMA,
					S.GRANT_STAT, S.CREATE_STAT, S.REVOKE_STAT, S.DROP_STAT
				FROM STATS_Q S
			)
			SELECT S.OWNER, S.OBJECT_NAME, S.OBJECT_TYPE, S.DEST_OBJECT_TYPE, S.FOREIGN_DEPS_CNT, 
				S.DEST_OBJECT_EXISTS, S.CONFLICTING_OBJECT_EXISTS, S.DEST_SCHEMA, 
				S.GRANT_STAT, S.CREATE_STAT, S.REVOKE_STAT, S.DROP_STAT,
				case when CONFLICTING_OBJECT_EXISTS = 'N' then 
					APEX_ITEM.HIDDEN (p_idx => 1, p_value => OBJECT_NAME, p_item_id => 'f01_'||ROWNUM, p_item_label => 'ROW_SELECTOR$') 
					|| APEX_ITEM.SWITCH (p_idx => 2,  p_value => DEST_OBJECT_EXISTS, p_item_id => 'f02_'||ROWNUM, p_item_label => 'SWITCH_ENABLED') 
					|| APEX_ITEM.HIDDEN (p_idx => 3, p_value => DEST_OBJECT_EXISTS, p_item_id => 'f03_' || ROWNUM) 
					|| APEX_ITEM.HIDDEN (p_idx => 4, p_value => GRANT_STAT, p_item_id => 'f04_' || ROWNUM) 
					|| APEX_ITEM.HIDDEN (p_idx => 5, p_value => CREATE_STAT, p_item_id => 'f05_' || ROWNUM) 
					|| APEX_ITEM.HIDDEN (p_idx => 6, p_value => REVOKE_STAT, p_item_id => 'f06_' || ROWNUM) 
					|| APEX_ITEM.HIDDEN (p_idx => 7, p_value => DROP_STAT, p_item_id => 'f07_' || ROWNUM) 
					|| APEX_ITEM.HIDDEN (p_idx => 8, p_value => FOREIGN_DEPS_CNT, p_item_id => 'f08_' || ROWNUM) 
				end IS_ENABLED_SWITCH
			FROM MAIN_Q S
        ) loop 
            pipe row (cur);
        end loop;
        return;
    END get_publish_schema;

    FUNCTION Enquote_Name ( p_Text VARCHAR2 )
    RETURN VARCHAR2 DETERMINISTIC
    IS
    BEGIN
        RETURN c_DQuote || REPLACE(UPPER(p_Text), c_DQuote, c_DQuote||c_DQuote) || c_DQuote ;
    END Enquote_Name;

    FUNCTION Enquote_Literal ( p_Text VARCHAR2, p_value_max_length PLS_INTEGER DEFAULT 1000 )
    RETURN VARCHAR2 DETERMINISTIC
    IS
    BEGIN
        RETURN c_Quote || REPLACE(SUBSTR(p_Text, 1, p_value_max_length), c_Quote, c_Quote||c_Quote) || c_Quote ;
    END Enquote_Literal;
    
	PROCEDURE Copy_View (
		p_View_Name IN VARCHAR2,
		p_Dest_Schema IN VARCHAR2 
	)
	is  
		v_sql_text CLOB;
	begin
		for c in (
			SELECT TEXT,
				(SELECT LISTAGG( COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY COLUMN_ID) COLS 
				FROM SYS.USER_TAB_COLS C
				WHERE C.TABLE_NAME = A.VIEW_NAME
				GROUP BY C.TABLE_NAME) COLS
			FROM USER_VIEWS A WHERE VIEW_NAME = p_View_Name
		) loop
			v_sql_text := 'CREATE OR REPLACE VIEW ' 
			|| Enquote_Name(p_Dest_Schema) || '.' || Enquote_Name(p_View_Name) 
			|| ' ( ' || c.COLS || ' ) '
			|| chr(10) || 'AS ' ||  c.text;
			EXECUTE IMMEDIATE v_sql_text;
		end loop;
	end Copy_View;

	PROCEDURE Log_Elapsed_Time (
		p_Timemark IN OUT NUMBER,
		p_Message IN VARCHAR2)
	is
		v_Timemark number := dbms_utility.get_time;
		v_TimeString VARCHAR2(40) := TO_CHAR((v_Timemark - p_Timemark)/100.0, '9G990D00');
	begin
		p_Timemark := v_Timemark;
		if apex_application.g_debug then
			APEX_DEBUG.Message('%s %s', p_Message, v_TimeString);
		else 
			DBMS_OUTPUT.PUT_LINE (p_Message||chr(9)||v_TimeString);
		end if;
	end Log_Elapsed_Time;

    FUNCTION Is_Printable_Type (
        p_PLS_Type IN VARCHAR2
    ) RETURN BOOLEAN DETERMINISTIC 
    IS 
    BEGIN 
        RETURN p_PLS_Type IN ('BINARY_DOUBLE', 'BINARY_FLOAT', 'BINARY_INTEGER', 'BLOB', 'BOOLEAN',
                'CHAR', 'CLOB', 'DATE', 'DOUBLE PRECISION', 'FLOAT', 'INTEGER', 'NUMBER', 'PLS_INTEGER', 'RAW', 'REAL', 
                'ROWID', 'SMALLINT', 'TIME', 'TIME WITH TIME ZONE', 'TIMESTAMP', 'TIMESTAMP WITH LOCAL TIME ZONE', 
                'TIMESTAMP WITH TIME ZONE', 'UROWID', 'VARCHAR2');
    END Is_Printable_Type;

    /* build an expression that captures the parameters of an package procedure for logging.
       execute with output: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call(NULL) USING OUT v_log_message, IN <param...>
       execute with apex_debug: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call USING <param...>
       the count of the arguments will be checked at runtime.
    */
    FUNCTION Format_Call_Parameter(
        p_Object_Name IN VARCHAR2,
        p_Object_Owner IN VARCHAR2,
        p_Procedure_Name IN VARCHAR2,
        p_Subprogram_ID IN NUMBER,
        p_calling_subprog VARCHAR2,
        p_synonym_name VARCHAR2 DEFAULT NULL,
        p_value_max_length INTEGER DEFAULT 1000,
        p_bind_char VARCHAR2 DEFAULT ':',
        p_overload INTEGER DEFAULT 0,
        p_in_out VARCHAR2 DEFAULT 'IN/OUT' -- IN, OUT, IN/OUT
    ) RETURN VARCHAR2
    IS
        PRAGMA UDF;
        c_newline VARCHAR2(10) := 'chr(10)'||chr(10);
        v_argument_per_line CONSTANT NUMBER := 7;
        c_conop VARCHAR2(10) := ' || ';
        v_argument_name VARCHAR2(200);
        v_offset NUMBER;
        v_result_str VARCHAR2(32767);
        v_subprog VARCHAR2(32767);
        v_count   INTEGER := 0;
   BEGIN 
        for c_cur in (
           SELECT PACKAGE_NAME, OWNER, OBJECT_NAME PROCEDURE_NAME, SUBPROGRAM_ID,
                    IN_OUT, ARGUMENT_NAME, POSITION, PLS_TYPE, DATA_TYPE
            FROM SYS.ALL_ARGUMENTS  
            WHERE OWNER = p_Object_Owner
            AND PACKAGE_NAME = p_Object_Name
            AND OBJECT_NAME = p_Procedure_Name
            AND SUBPROGRAM_ID = p_Subprogram_ID
            AND DATA_LEVEL = 0 
            AND POSITION > 0 -- Position 0 returns the values for the return type of a function. 
            AND ARGUMENT_NAME IS NOT NULL
            ORDER BY POSITION
        ) 
        loop 
            exit when length(v_result_str) > 32000; 
            if (c_cur.IN_OUT != 'IN' or p_in_out IN ('IN', 'IN/OUT')) then
	            v_count := v_count + 1;
            	v_offset := INSTR(c_cur.ARGUMENT_NAME, '_');
            	if v_offset > 0 then 
                	v_argument_name := lower(substr(c_cur.ARGUMENT_NAME, 1, v_offset)) || initcap(substr(c_cur.ARGUMENT_NAME, v_offset+1));
                else 
                	v_argument_name := lower(c_cur.ARGUMENT_NAME);
				end if;
                if v_result_str IS NOT NULL then 
                    v_result_str := v_result_str 
                --    || c_conop || Enquote_Literal(',') 
                    || case when mod(c_cur.POSITION-1, v_argument_per_line) = 0 then c_conop || c_newline else chr(10) end
                    || '    ' || c_conop;
                end if;
                if c_cur.IN_OUT != 'IN' and p_in_out = 'IN' then -- OUT parameters are not converted to a literal.
                    v_result_str := v_result_str 
                    || Enquote_Literal(case when v_count > 1 then ', ' end
                    	|| v_argument_name || '=>' || v_argument_name);
                else 
                    v_result_str := v_result_str 
                    || Enquote_Literal(case when v_count > 1 then ', ' end
                    	|| v_argument_name || '=>') 
                    || c_conop
                    || case when Is_Printable_Type(c_cur.PLS_TYPE)
                        then 
                            'api_trace.'
                            || case when c_cur.PLS_TYPE = 'RAW' then 'Literal_RAW' else 'Literal' end
                            || '(' || p_bind_char || v_argument_name 
                            || case when p_value_max_length != 1000 then ', ' || p_value_max_length end
                            || ')'
                        else 
                            Enquote_Literal('<datatype '||NVL(c_cur.PLS_TYPE, c_cur.DATA_TYPE)||' >')
                    end;
                end if;
            end if;
        end loop;
        v_subprog := lower(case when p_Synonym_Name IS NOT NULL then p_Synonym_Name else p_calling_subprog end);
        if v_result_str IS NOT NULL then 
            v_result_str := Enquote_Literal(v_subprog || '(') || chr(10)
            || '    ' || c_conop || v_result_str || c_conop || Enquote_Literal(')');
        else 
            v_result_str := Enquote_Literal(v_subprog);
        end if;
        RETURN v_result_str;
    END Format_Call_Parameter;

    PROCEDURE Resolve_Synonym (
        p_Synonym_Name IN SYS.ALL_SYNONYMS.SYNONYM_NAME%TYPE,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Dest_Object_Type  IN SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE DEFAULT 'PACKAGE',
        p_Synonym_Owner OUT VARCHAR2,
        p_Package_Name OUT VARCHAR2,
        p_Package_Owner OUT VARCHAR2,
        p_DBLink OUT VARCHAR2,
        p_Object_Type_Out OUT SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE,
        p_Editionable OUT SYS.ALL_OBJECTS.EDITIONABLE%TYPE
    )
    IS 
        v_Synonym_Name VARCHAR2(128) := UPPER(p_Synonym_Name);
        CURSOR all_syn_cur
        IS  
            SELECT SYN.TABLE_OWNER, SYN.TABLE_NAME, SYN.DB_LINK, OBJ.OBJECT_TYPE, SYN.OWNER, OBJ.EDITIONABLE
            FROM SYS.ALL_SYNONYMS SYN 
            JOIN SYS.ALL_OBJECTS OBJ 
              ON SYN.TABLE_OWNER = OBJ.OWNER AND SYN.TABLE_NAME = OBJ.OBJECT_NAME
            WHERE SYN.OWNER IN ('PUBLIC', p_Dest_Schema)
            AND SYN.SYNONYM_NAME = v_Synonym_Name
            AND OBJ.OBJECT_TYPE IN ('SYNONYM', p_Dest_Object_Type)
            ORDER BY CASE WHEN SYN.OWNER = p_Dest_Schema THEN 1 ELSE 2 END;
        CURSOR all_obj_cur
        IS  
            SELECT OBJ.OWNER, OBJ.OBJECT_NAME, OBJ.OBJECT_TYPE, OBJ.OWNER SYN_OWNER, OBJ.EDITIONABLE
            FROM SYS.ALL_OBJECTS OBJ 
            WHERE OBJ.OWNER = p_Dest_Schema
            AND OBJ.OBJECT_TYPE = p_Dest_Object_Type
            AND OBJ.OBJECT_NAME = v_Synonym_Name;
    BEGIN
        p_Package_Owner := NULL;
        p_Package_Name := NULL;
        p_DBLink := NULL;
        p_Object_Type_Out := NULL;
        LOOP 
            OPEN all_syn_cur;
            FETCH all_syn_cur INTO p_Package_Owner, p_Package_Name, p_DBLink, p_Object_Type_Out, p_Synonym_Owner, p_Editionable;
            EXIT WHEN all_syn_cur%NOTFOUND;
            EXIT WHEN p_Object_Type_Out = p_Dest_Object_Type;
            CLOSE all_syn_cur;
            v_Synonym_Name := p_Package_Name;
        END LOOP;
        if all_syn_cur%ISOPEN then 
            CLOSE all_syn_cur;
        end if;
        if p_Package_Owner IS NULL then 
            OPEN all_obj_cur;
            FETCH all_obj_cur INTO p_Package_Owner, p_Package_Name, p_Object_Type_Out, p_Synonym_Owner, p_Editionable;
            CLOSE all_obj_cur;
        end if;
    END Resolve_Synonym;

	FUNCTION Format_Return_Value (
		p_Procedure_Name IN VARCHAR2,
		p_PLS_Type IN VARCHAR2,
		p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result'
    ) RETURN VARCHAR2 
    IS 
    BEGIN
		RETURN Enquote_Literal(p_Procedure_Name ||' returns ') 
		|| case when Is_Printable_Type(p_PLS_Type) then 
			chr(10) || '     || api_trace.'
			|| case when p_PLS_Type= 'RAW' then 'Literal_RAW' else 'Literal' end
			|| '(' || p_Variable_Name || ')'
		end;
    END Format_Return_Value;
	
    FUNCTION Dyn_Log_Call_List (
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Compact IN VARCHAR2 DEFAULT 'Y', --Y/N
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_Condition_Start IN VARCHAR2 DEFAULT c_APEX_Condition_Start,
        p_Condition_End IN VARCHAR2 DEFAULT c_APEX_Condition_End,
        p_Indent IN NUMBER DEFAULT 8
    )
    RETURN tab_logging_calls PIPELINED
    IS
        v_Synonym_Name VARCHAR2(128) := UPPER(p_Package_Name);
        v_Synonym_Owner VARCHAR2(128);
        v_Package_Name_Out VARCHAR2(128);
        v_Package_Owner_Out VARCHAR2(128);
        v_DBLink VARCHAR2(128);
        v_Object_Type_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;
        v_Editionable_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;
		v_Condition_Start CONSTANT VARCHAR2(1000) := case when p_Condition_Start IS NOT NULL then chr(10) || rpad(' ', p_Indent) || p_Condition_Start || chr(10) end;
		v_Condition_End CONSTANT VARCHAR2(1000) := case when p_Condition_End IS NOT NULL then chr(10) || rpad(' ', p_Indent) || p_Condition_End || chr(10) end;
		
        CURSOR all_proc_cur
        IS
        WITH PARAM_Q AS (
        	SELECT PACKAGE_NAME, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD,
        		INITCAP(PACKAGE_NAME) || '.' || INITCAP(OBJECT_NAME) CALLING_SUBPROG, 
        		LISTAGG(LOWER(ARGUMENT_NAME) , ',') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST,
        		LISTAGG(CASE WHEN IN_OUT IN ('IN/OUT', 'IN') THEN LOWER(ARGUMENT_NAME) END, ',') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST_IN,
        		LISTAGG(CASE WHEN IN_OUT IN ('IN/OUT', 'OUT') THEN LOWER(ARGUMENT_NAME) END, ',') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST_OUT,
        		SUM(CASE WHEN IN_OUT IN ('IN/OUT', 'OUT') AND ARGUMENT_NAME IS NOT NULL THEN 1 ELSE 0 END) OUT_COUNT,
        		MAX(CASE WHEN IN_OUT = 'OUT' AND ARGUMENT_NAME IS NULL THEN PLS_TYPE END) RETURN_PLS_TYPE
			FROM SYS.ALL_ARGUMENTS 
			WHERE PACKAGE_NAME = v_Package_Name_Out
			AND OWNER = v_Package_Owner_Out
			GROUP BY PACKAGE_NAME, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD
        )
        SELECT PACKAGE_NAME, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD,
            INITCAP(OBJECT_NAME) PROCEDURE_NAME, 
            CASE WHEN p_Compact = 'Y' and p_Logging_Start_Enabled = 'Y' THEN 
                v_Condition_Start
                || rpad(' ', p_Indent+4)
                || 'EXECUTE IMMEDIATE api_trace.Dyn_Log_Start'
                || case when OVERLOAD is not null then '(p_overload => ' || OVERLOAD || ')' end
                || case when PARAM_LIST_IN IS NOT NULL then -- ??
                	chr(10) 
                	|| rpad(' ', p_Indent+4)
                	|| 'USING '
                	|| PARAM_LIST_IN
                end
                || ';' 
                || v_Condition_End
                || chr(10) || '----' || chr(10) 
                || v_Condition_Start
            	|| rpad(' ', p_Indent+4)
                || 'EXECUTE IMMEDIATE api_trace.Dyn_Log_Exit'
                || case when OVERLOAD is not null then '(p_overload => ' || OVERLOAD || ')' end
                || case when PARAM_LIST_OUT IS NOT NULL then 
                	chr(10) 
                	|| rpad(' ', p_Indent+4)
                	|| 'USING '
                	|| PARAM_LIST_OUT
                end
                || ';' 
                || v_Condition_End
			WHEN p_Compact = 'Y' and p_Logging_Start_Enabled = 'N' THEN 
                v_Condition_Start
                || rpad(' ', p_Indent+4)
                || 'EXECUTE IMMEDIATE api_trace.Dyn_Log_Call'
                || case when OVERLOAD is not null then '(p_overload => ' || OVERLOAD || ')' end
                || case when PARAM_LIST IS NOT NULL then 
                	chr(10) 
                	|| rpad(' ', p_Indent+4)
                	|| 'USING '
                	|| PARAM_LIST
                end
                || ';' 
                || v_Condition_End
            WHEN p_Compact = 'N' and p_Logging_Start_Enabled = 'Y' THEN 
            	v_Condition_Start
            	|| rpad(' ', p_Indent+4)
                || replace(apex_string.format(
                	p_message => p_Logging_Start_Call,
                    p0 => api_trace.Format_Call_Parameter(
                        p_calling_subprog => CALLING_SUBPROG,
                        p_bind_char => null,
                        p_overload => OVERLOAD,
                        p_in_out => 'IN'
                    ),
                    p_max_length=>32767
                ), chr(10), rpad(chr(10), p_Indent))
                || v_Condition_End
                || chr(10) || '----' || chr(10) 
                || v_Condition_Start
            	|| rpad(' ', p_Indent+4)
				|| replace(apex_string.format(
					p_message => p_Logging_Finish_Call,
					p0 => case when OUT_COUNT > 0 then 
						api_trace.Format_Call_Parameter(
							p_calling_subprog => CALLING_SUBPROG,
							p_synonym_name => INITCAP(OBJECT_NAME) || ' output ',
							p_bind_char => null,
							p_overload => OVERLOAD,
							p_in_out => 'OUT'
						)
					end 
					|| case when RETURN_PLS_TYPE IS NOT NULL then 
						Format_Return_Value(
							p_Procedure_Name => CALLING_SUBPROG,
							p_PLS_Type => RETURN_PLS_TYPE, -- returning data type
							p_Variable_Name => p_Variable_Name
						)
					end
					|| case when OUT_COUNT = 0 and RETURN_PLS_TYPE IS NULL then
						api_trace.Literal(CALLING_SUBPROG)
					end,
					p_max_length=>32767
				), chr(10), rpad(chr(10), p_Indent))
				|| v_Condition_End
            WHEN p_Compact = 'N' and p_Logging_Start_Enabled = 'N' THEN 
                v_Condition_Start
            	|| rpad(' ', p_Indent+4)
                || replace(apex_string.format(
                	p_message => p_Logging_API_Call,
                    p0 => api_trace.Format_Call_Parameter(
                        p_calling_subprog => CALLING_SUBPROG,
                        p_bind_char => null,
                        p_overload => OVERLOAD,
                        p_in_out => 'IN/OUT'
                    )
                    || case when RETURN_PLS_TYPE IS NOT NULL then 
                    	' || ' 
                    	|| Format_Return_Value(
							p_Procedure_Name => null,
							p_PLS_Type => RETURN_PLS_TYPE, -- returning data type
							p_Variable_Name => p_Variable_Name
						)
					end,
                    p_max_length=>32767
                ), chr(10), rpad(chr(10), p_Indent))
				|| v_Condition_End
            END LOGGING_CALL
        FROM PARAM_Q
        ORDER BY PACKAGE_NAME,SUBPROGRAM_ID, OVERLOAD;

        v_row rec_logging_calls;
    BEGIN
        Resolve_Synonym (
            p_Synonym_Name => v_Synonym_Name,
            p_Dest_Schema => p_Dest_Schema,
            p_Dest_Object_Type => 'PACKAGE',
            p_Synonym_Owner => v_Synonym_Owner,
            p_Package_Name => v_Package_Name_Out,
            p_Package_Owner => v_Package_Owner_Out,
            p_DBLink => v_DBLink,
            p_Object_Type_Out => v_Object_Type_Out,
            p_Editionable => v_Editionable_Out
        );
        OPEN all_proc_cur;
        LOOP
            FETCH all_proc_cur INTO v_row;
            EXIT WHEN all_proc_cur%NOTFOUND;
            PIPE ROW (v_row);
        END LOOP;
        CLOSE all_proc_cur;
    END Dyn_Log_Call_List;

    PROCEDURE Output_Clob (p_Clob CLOB)
    is 
        v_Offset INTEGER;
        v_Linelen INTEGER;
    begin
        if p_Clob IS NOT NULL then 
            v_Offset := 1;
            loop 
                exit when v_offset >= dbms_lob.getlength(p_Clob);
                v_Linelen := dbms_lob.instr( p_Clob, chr(10), v_Offset);
                if v_Linelen = 0 then 
                    v_Linelen := dbms_lob.getlength(p_Clob) - v_Offset + 1; 
                else 
                    v_Linelen := v_Linelen - v_Offset + 1;
                end if;
                if v_Linelen-1 > 0 then 
                    DBMS_OUTPUT.PUT_LINE (dbms_lob.substr( p_Clob, v_Linelen-1, v_Offset));
                end if;
                v_Offset := v_Offset + v_Linelen;
            end loop;
        end if;
    end Output_Clob;

    FUNCTION Get_Package_Source  (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Editionable  IN VARCHAR2 DEFAULT 'N',
        p_Type IN VARCHAR2 DEFAULT 'PACKAGE'
    ) RETURN CLOB
    IS
        v_Clob CLOB;
        v_SQLText VARCHAR2(4000);
    BEGIN
        dbms_lob.createtemporary(v_Clob, true, dbms_lob.call);
        v_SQLText := 'CREATE OR REPLACE '
        || CASE WHEN p_Editionable = 'Y' THEN 'EDITIONABLE' ELSE 'NONEDITIONABLE' END
        || ' ' || p_Type 
        || ' ' || Enquote_Name(p_Package_Owner)
        || '.' || Enquote_Name(p_Package_Name)
        || chr(10);
        dbms_lob.writeappend (v_Clob, length(v_SQLText), v_SQLText);
        for cur in (
            SELECT TEXT, LINE
            FROM SYS.All_Source 
            where Owner = p_Package_Owner
            and Name = p_Package_Name
            and type = p_Type
            order by LINE
        ) loop 
            if cur.LINE = 1 then 
                v_SQLText := REGEXP_REPLACE(cur.TEXT, '.*?package\s+.*?"{0,1}'||p_Package_Name||'"{0,1}', '',  1, 1, 'in');
                if INSTR(v_SQLText, 'wrapped') > 0 then 
                    return NULL;
                end if;
            else 
                v_SQLText := cur.TEXT;
            end if;
            if length(v_SQLText) > 0 then 
                dbms_lob.writeappend (v_Clob, length(v_SQLText), v_SQLText);
            end if;
        end loop;
        return v_Clob; 
    END Get_Package_Source;

    FUNCTION Get_Package_Spec  (
        p_Object_Name IN VARCHAR2,
        p_Object_Owner IN VARCHAR2,
        p_Editionable  IN VARCHAR2,
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Synonym_Text IN VARCHAR2 DEFAULT NULL
    ) RETURN CLOB
    IS
        v_Clob CLOB;
        v_Comment VARCHAR2(500) := '-- This package was generated by ' || c_Package_Name || ' from Strack Software Development, Berlin, Germany.'
        || chr(10) || '-- It replaces : ' || p_Synonym_Text;
		v_Timemark NUMBER := dbms_utility.get_time;
    BEGIN
        v_Clob := Get_Package_Source(
            p_Package_Name => p_Object_Name,
            p_Package_Owner => p_Object_Owner,
            p_Editionable  => p_Editionable
        );
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Get_Package_Spec: get package ource');   	
        end if;
        if p_Object_Owner != p_Dest_Schema then 
          v_Clob := REPLACE(v_Clob, Enquote_Name(p_Object_Owner), Enquote_Name(p_Dest_Schema));
        end if;
        if p_Object_Name != p_Package_Name then 
          v_Clob := REPLACE(v_Clob, Enquote_Name(p_Object_Name), Enquote_Name(p_Package_Name));
          v_Clob := REGEXP_REPLACE(v_Clob, 'end\s+'||p_Object_Name, 'end '||p_Package_Name, 1, 0, 'i');
        end if;    
        -- remoce PRAGMA clauses
        v_Clob := REGEXP_REPLACE(v_Clob, 'PRAGMA\s+\w+\s*\(.+?\);', '', 1, 0, 'i');
        
        -- remove leading blanks
        v_Clob := LTRIM(v_Clob, chr(10)||chr(32));
        -- remove comments
        v_Clob := REGEXP_REPLACE(v_Clob, '\s*--.*$', '', 1, 0, 'm');
        v_Clob := REGEXP_REPLACE(v_Clob, '/\*.+?\*/', '', 1, 0, 'n');
        -- remove empty lines
        v_Clob := REGEXP_REPLACE(v_Clob, chr(10)||'{2,}', chr(10), 1, 0, 'm');
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Get_Package_Spec: normalize source');   	
        end if;
        -- add comment
      v_Clob := REGEXP_REPLACE(v_Clob, 
        '(package\s+'||Enquote_Name(p_Dest_Schema) || '\.' || Enquote_Name(p_Package_Name) || '.*?\s(is|as)\s)',
        '\1'||v_Comment||chr(10), 
        1, 1, 'in');
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Get_Package_Spec: added Comments');   	
        end if;
        
        return v_Clob; 
    END Get_Package_Spec;

    FUNCTION Get_Package_Synonym_Text (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ) RETURN VARCHAR2 
    IS 
        v_Clob CLOB;
        v_Comment VARCHAR2(32767);
    BEGIN 
        v_Clob := Get_Package_Source(
            p_Package_Name => p_Package_Name,
            p_Package_Owner => p_Package_Owner
        );

        v_Comment := REGEXP_SUBSTR(v_Clob, '^-- It replaces : (.+)$', 1, 1, 'im', 1);
        return v_Comment;
    END Get_Package_Synonym_Text;

    FUNCTION Get_Package_Body (
        p_Object_Name IN VARCHAR2,
        p_Object_Owner IN VARCHAR2,
        p_Editionable  IN VARCHAR2,
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_value_max_length INTEGER DEFAULT 1000
    ) RETURN CLOB
    IS
        v_Header CLOB;

        CURSOR all_proc_cur
        IS
            WITH RETURN_Q AS (
                SELECT PACKAGE_NAME, OWNER, OBJECT_NAME PROCEDURE_NAME, SUBPROGRAM_ID, 
                        IN_OUT, 
                        PLS_TYPE RETURN_PLS_TYPE, 
                        CHAR_USED,
                        CASE when TYPE_NAME IS NOT NULL THEN 
                            CASE WHEN DATA_TYPE = 'REF' THEN ' ref ' END
                            || CASE WHEN TYPE_OWNER NOT IN (OWNER, 'PUBLIC') THEN TYPE_OWNER||'.' END 
                            || TYPE_NAME 
                            || CASE WHEN TYPE_SUBNAME IS NOT NULL THEN '.'||TYPE_SUBNAME END 
                        ELSE 
                            PLS_TYPE 
                        END RETURN_TYPE,
                        TYPE_NAME, TYPE_SUBNAME
                FROM SYS.ALL_ARGUMENTS  
                WHERE DATA_LEVEL = 0 
                AND POSITION = 0
                AND ARGUMENT_NAME IS NULL
            ), ARGUMENTS_Q AS (
                SELECT PACKAGE_NAME, OWNER, OBJECT_NAME PROCEDURE_NAME, SUBPROGRAM_ID,
                        COUNT(*) ARGS_COUNT,
                        SUM(CASE WHEN IN_OUT IN ('IN/OUT', 'OUT') THEN 1 ELSE 0 END) OUT_COUNT,
                        LISTAGG(LOWER(ARGUMENT_NAME), ',') WITHIN GROUP (ORDER BY POSITION) ARGUMENT_NAMES,
                        LISTAGG(LOWER(ARGUMENT_NAME||'=>'||ARGUMENT_NAME), ',') WITHIN GROUP (ORDER BY POSITION) CALL_PARAMETER
                FROM SYS.ALL_ARGUMENTS  
                WHERE DATA_LEVEL = 0 
                AND POSITION > 0
                AND ARGUMENT_NAME IS NOT NULL
                GROUP BY PACKAGE_NAME, OWNER, OBJECT_NAME, SUBPROGRAM_ID
            )
            SELECT PRO.PROCEDURE_NAME, 
                PRO.SUBPROGRAM_ID, PRO.OVERLOAD,
                PRO.AGGREGATE, PRO.PIPELINED, PRO.IMPLTYPEOWNER, PRO.IMPLTYPENAME,
                RET.RETURN_TYPE, RET.TYPE_NAME, RET.TYPE_SUBNAME, RET.RETURN_PLS_TYPE, RET.CHAR_USED,
                NVL(ARG.ARGS_COUNT,0) ARGS_COUNT,
                NVL(ARG.OUT_COUNT,0) OUT_COUNT,
                case when RET.IN_OUT = 'OUT' then 'FUNCTION' else 'PROCEDURE' end PROC_TYPE,
                case when PRO.OVERLOAD IS NULL then ARG.ARGUMENT_NAMES else ARG.CALL_PARAMETER end CALL_PARAMETER,
                REGEXP_SUBSTR(v_Header,  
                        '('
                        || case when RET.IN_OUT = 'OUT' then 'FUNCTION' else 'PROCEDURE' end
                        || '\s+'||PRO.PROCEDURE_NAME
                        || case when ARG.ARGS_COUNT > 0 then '\s*\(.+?\)' end
                        || case when RET.IN_OUT = 'OUT' then '\s+RETURN\s+.*?' else '\s*' end
                        || ');',
                        1, 
                        DENSE_RANK() OVER (PARTITION BY PRO.PROCEDURE_NAME, RET.IN_OUT, SIGN(ARG.ARGS_COUNT) ORDER BY PRO.OVERLOAD),
                        'in', 1) HEADER -- find original procedure header with parameter default values
            FROM SYS.ALL_PROCEDURES PRO
            LEFT OUTER JOIN RETURN_Q RET 
                    ON PRO.OBJECT_NAME = RET.PACKAGE_NAME
                    AND PRO.OWNER = RET.OWNER
                    AND PRO.PROCEDURE_NAME = RET.PROCEDURE_NAME
                    AND PRO.SUBPROGRAM_ID = RET.SUBPROGRAM_ID
            LEFT OUTER JOIN ARGUMENTS_Q ARG 
                    ON PRO.OBJECT_NAME = ARG.PACKAGE_NAME
                    AND PRO.OWNER = ARG.OWNER
                    AND PRO.PROCEDURE_NAME = ARG.PROCEDURE_NAME
                    AND PRO.SUBPROGRAM_ID = ARG.SUBPROGRAM_ID
            WHERE PRO.OBJECT_NAME = p_Object_Name
            AND PRO.OWNER = p_Object_Owner
            AND PRO.OBJECT_TYPE = 'PACKAGE'
            AND PRO.PROCEDURE_NAME IS NOT NULL
            ORDER BY PRO.SUBPROGRAM_ID, PRO.OVERLOAD;
        TYPE proc_tbl IS TABLE OF all_proc_cur%ROWTYPE;
        v_proc_tbl        proc_tbl;
        v_Clob            CLOB;
        v_procedure_name  SYS.ALL_PROCEDURES.PROCEDURE_NAME%TYPE;
        v_subprogram_id   SYS.ALL_PROCEDURES.SUBPROGRAM_ID%TYPE;
        v_overload        SYS.ALL_PROCEDURES.OVERLOAD%TYPE;
        v_object_owner    SYS.ALL_PROCEDURES.OWNER%TYPE;
        v_calling_subprog VARCHAR2(4000);
        v_attributes      VARCHAR2(32767);
        v_trace_call      VARCHAR2(32767);
        v_trace_output    VARCHAR2(32767);
        v_trace_return    VARCHAR2(32767);
        v_sqltext         VARCHAR2(32767);
    BEGIN
        dbms_lob.createtemporary(v_Header, true, dbms_lob.call);
        dbms_lob.createtemporary(v_Clob, true, dbms_lob.call);
        v_object_owner := LOWER(p_Object_Owner);
        v_Header := Get_Package_Source(
            p_Package_Name => p_Object_Name,
            p_Package_Owner => p_Object_Owner,
            p_Editionable  => p_Editionable
        );
        v_Header := LTRIM(v_Header, chr(10)||chr(32));
        -- remove comments
        v_Header := REGEXP_REPLACE(v_Header, '\s*--.*$', '', 1, 0, 'm');
        v_Header := REGEXP_REPLACE(v_Header, '/\*.+?\*/', '', 1, 0, 'n');
        -- remove PRAGMA clauses
        v_Header := REGEXP_REPLACE(v_Header, 'PRAGMA\s+\w+\s*\(.+?\);', '', 1, 0, 'i');
        OPEN all_proc_cur;
        FETCH all_proc_cur BULK COLLECT INTO v_proc_tbl;
        CLOSE all_proc_cur;
        IF v_proc_tbl.FIRST IS NOT NULL THEN
            v_sqltext := chr(10)  
            || 'CREATE OR REPLACE '
            || CASE WHEN p_Editionable = 'Y' THEN 'EDITIONABLE' ELSE 'NONEDITIONABLE' END
            || ' PACKAGE BODY '
            || Enquote_Name(p_Dest_Schema) || '.'
            || Enquote_Name(p_Package_Name) || chr(10) 
            || 'IS ' || chr(10);
            dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);
        
            FOR ind IN 1 .. v_proc_tbl.COUNT
            LOOP
                v_calling_subprog := v_object_owner || '.' || LOWER(p_Object_Name) || '.' || LOWER(v_proc_tbl(ind).PROCEDURE_NAME);
                v_procedure_name := lower(p_Package_Name||'.'|| v_proc_tbl(ind).PROCEDURE_NAME);
                -- DBMS_OUTPUT.PUT_LINE (v_calling_subprog);
                IF p_Logging_Start_Enabled = 'Y' THEN 
					v_trace_call := chr(9) 
					|| apex_string.format(
						p_message => p_Logging_Start_Call,
						p0 => Format_Call_Parameter( 
							p_Object_Name => p_Object_Name,
							p_Object_Owner => p_Object_Owner,
							p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,
							p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,
							p_calling_subprog => v_calling_subprog,
							p_synonym_name => v_procedure_name,
							p_value_max_length => p_value_max_length,
							p_bind_char => null,
							p_overload => v_proc_tbl(ind).OVERLOAD,
							p_in_out => 'IN'
						), 
						p_max_length=>32767
					) || chr(10);
					v_trace_output := chr(9) 
					|| apex_string.format(
						p_message => p_Logging_Finish_Call,
						p0 => case when v_proc_tbl(ind).OUT_COUNT > 0 then 
							Format_Call_Parameter( 
								p_Object_Name => p_Object_Name,
								p_Object_Owner => p_Object_Owner,
								p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,
								p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,
								p_calling_subprog => v_calling_subprog,
								p_synonym_name => v_procedure_name || ' output ',
								p_value_max_length => p_value_max_length,
								p_bind_char => null,
								p_overload => v_proc_tbl(ind).OVERLOAD,
								p_in_out => 'OUT'
							)
						end
						|| case when v_proc_tbl(ind).RETURN_PLS_TYPE IS NOT NULL then 
							Format_Return_Value(
								p_Procedure_Name => v_Procedure_Name,
								p_PLS_Type => v_proc_tbl(ind).RETURN_PLS_TYPE, -- returning data type
								p_Variable_Name => p_Variable_Name
							)
						end
						|| case when v_proc_tbl(ind).OUT_COUNT = 0 and v_proc_tbl(ind).RETURN_PLS_TYPE IS NULL then
							api_trace.Literal(v_Procedure_Name)
						end, 
						p_max_length=>32767
					) || chr(10);
            	ELSE 
            		v_trace_call := null;
					v_trace_output := chr(9) 
					|| apex_string.format(
						p_message => p_Logging_API_Call,
						p0 => Format_Call_Parameter( 
							p_Object_Name => p_Object_Name,
							p_Object_Owner => p_Object_Owner,
							p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,
							p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,
							p_calling_subprog => v_calling_subprog,
							p_synonym_name => v_procedure_name,
							p_value_max_length => p_value_max_length,
							p_bind_char => null,
							p_overload => v_proc_tbl(ind).OVERLOAD,
							p_in_out => 'IN/OUT'
						)
						|| case when v_proc_tbl(ind).RETURN_PLS_TYPE IS NOT NULL then 
							' || ' 
                    		|| Format_Return_Value(
								p_Procedure_Name => null,
								p_PLS_Type => v_proc_tbl(ind).RETURN_PLS_TYPE, -- returning data type
								p_Variable_Name => p_Variable_Name
							)
						end, 
						p_max_length=>32767
					) || chr(10);					
				END IF;
                v_sqltext := v_proc_tbl(ind).HEADER;
                if length(v_sqltext) > 0 then 
                    if v_proc_tbl(ind).PROC_TYPE = 'FUNCTION'
                    and v_proc_tbl(ind).AGGREGATE = 'NO'
                    and v_proc_tbl(ind).PIPELINED = 'NO'
                    then -- normal function with return value; return value is printed.
                        v_sqltext := v_sqltext || chr(10) 
                        || 'is' || chr(10) 
                        || '    lv_result ' || v_proc_tbl(ind).RETURN_TYPE 
                        || case when v_proc_tbl(ind).CHAR_USED != '0' or v_proc_tbl(ind).RETURN_TYPE = 'RAW' 
                            then '(32767)' end 
                        || ';' || chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call
                        || '    lv_result := ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end 
                        || ';' || chr(10) 
                        || v_trace_output
                        || '    return lv_result;' || chr(10) 
                        || 'end ' || lower(v_proc_tbl(ind).PROCEDURE_NAME) || ';' || chr(10) || chr(10);
                    else -- procedures and special function without return value.
                        v_sqltext := v_sqltext || chr(10) 
                        || 'is' || chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call 
                        || '    ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end 
                        || ';' || chr(10) 
                        || v_trace_output
                        || 'end ' || lower(v_proc_tbl(ind).PROCEDURE_NAME) || ';' || chr(10) || chr(10);
                    end if;
                    dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);
                end if;
            END LOOP;
            v_sqltext := 'END ' || p_Package_Name || ';' || chr(10);
            dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);
        END IF;
        return v_Clob;
    END Get_Package_Body;

    PROCEDURE Enable (
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE,
        p_value_max_length INTEGER DEFAULT 1000
    )
    IS 
        v_Synonym_Name VARCHAR2(128) := p_Package_Name;
        v_Synonym_Owner VARCHAR2(128);
        v_Package_Name_Out VARCHAR2(128);
        v_Package_Owner_Out VARCHAR2(128);
        v_Synonym_Text VARCHAR2(1000);
        v_Drop_Synonym_Stat VARCHAR2(1000);
        v_DBLink VARCHAR2(128);
        v_Object_Type_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;
        v_Editionable_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;
        v_Grant_Stats VARCHAR2(32767);
        v_Clob CLOB;
        v_Count NUMBER;
		v_Timemark NUMBER := dbms_utility.get_time;
    BEGIN
        DBMS_OUTPUT.ENABLE(NULL);
        Resolve_Synonym (
            p_Synonym_Name => v_Synonym_Name,
            p_Dest_Schema => p_Dest_Schema,
            p_Dest_Object_Type => 'PACKAGE',
            p_Synonym_Owner => v_Synonym_Owner,
            p_Package_Name => v_Package_Name_Out,
            p_Package_Owner => v_Package_Owner_Out,
            p_DBLink => v_DBLink,
            p_Object_Type_Out => v_Object_Type_Out,
            p_Editionable => v_Editionable_Out
        );
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Resolve_Synonym ' || p_Dest_Schema || '.' || v_Synonym_Name || ' to ' || v_Package_Owner_Out || '.' || v_Package_Name_Out);   	
        end if;
        if v_Package_Name_Out IS NULL then 
            RAISE_APPLICATION_ERROR(-20001, 'The name ' || v_Synonym_Name || ' could not be found.');
            return;
        end if;
        if v_Object_Type_Out = 'PACKAGE' and v_Package_Owner_Out = p_Dest_Schema then 
              RAISE_APPLICATION_ERROR(-20002, 'The package ' || v_Synonym_Name || ' already exists is the current schema.');
            -- option: the package is renamed and the tracing package takes it's name.
        end if; 
        
        select COUNT(*) into v_Count
        from SYS.All_Arguments ARG
        where ARG.Type_Name = ARG.Package_Name
        and Package_Name = v_Package_Name_Out 
        and owner = v_Package_Owner_Out;
        if v_Count > 0 then 
            RAISE_APPLICATION_ERROR(-20003, 'The package ' || v_Synonym_Name || ' is defining table or record types and can´t be traced.');
            return;
        end if;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Checked for table or record types');   	
        end if;

        FOR c_cur IN (
            SELECT DISTINCT
                DA.Owner, DA.Name,
                case when Pri.Privilege IS NULL and DA.referenced_Owner != 'PUBLIC' then 
                    'GRANT EXECUTE ON '
                    || DA.referenced_Owner || '.' || DA.referenced_Name 
                    || ' TO ' || p_Dest_Schema 
                end GRANT_STAT,
                case when Syn.Owner IS NULL AND DB.REFERENCED_OWNER IS NULL then 
                    'CREATE OR REPLACE SYNONYM ' || p_Dest_Schema || '.' || DA.referenced_Name
                    || ' FOR ' || DA.referenced_Owner || '.' || DA.referenced_Name 
                end SYNONYM_STAT,
                PRI.Grantable,
                PRI.Privilege,
                Syn.Owner SYNONYM_OWNER
            FROM SYS.ALL_DEPENDENCIES DA
            LEFT OUTER JOIN SYS.ALL_SYNONYMS SYN 
                ON Syn.Owner IN (p_Dest_Schema, 'PUBLIC')
                AND Syn.Synonym_Name = DA.referenced_Name
            LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI 
                ON Pri.table_Schema = DA.referenced_Owner 
                AND Pri.table_Name = DA.referenced_Name
                AND Pri.type = DA.referenced_Type
                AND PRI.Grantee IN (p_Dest_Schema, 'PUBLIC')
                AND PRI.privilege IN ('EXECUTE', 'SELECT')
            LEFT OUTER JOIN ( -- no object with this name already exists
            	SELECT DB.REFERENCED_NAME, DB.REFERENCED_OWNER
            	FROM SYS.ALL_DEPENDENCIES DB
				WHERE DB.OWNER = p_Dest_Schema
				AND DB.NAME = DB.REFERENCED_NAME
            ) DB ON DB.REFERENCED_NAME = DA.REFERENCED_NAME AND DB.REFERENCED_OWNER = DA.Owner 
            WHERE DA.Owner = v_Package_Owner_Out 
            AND DA.Name = v_Package_Name_Out 
            AND (Syn.Owner IS NULL or Pri.Privilege IS NULL)
            AND NOT(DA.referenced_Owner = 'SYS' AND DA.referenced_Name = 'STANDARD')
        ) LOOP 
            if p_Use_Dbms_Output and c_cur.SYNONYM_STAT IS NOT NULL then
                DBMS_OUTPUT.PUT_LINE (c_cur.SYNONYM_STAT||';'); 
            end if;
            if p_Do_Execute and c_cur.SYNONYM_STAT IS NOT NULL then 
                EXECUTE  IMMEDIATE c_cur.SYNONYM_STAT;
            end if;
            if c_cur.GRANT_STAT IS NOT NULL then 
                v_Grant_Stats := v_Grant_Stats 
                || c_cur.GRANT_STAT || ';' || chr(10);
            end if;
        END LOOP;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Created dependent synonyms');   	
        end if;
        if v_Grant_Stats IS NOT NULL 
        then 
            DBMS_OUTPUT.PUT_LINE ('-- execute the following statements as user sys to enable the creation of the package:');
            DBMS_OUTPUT.PUT_LINE (v_Grant_Stats);
            return;
        end if;
        -- When the synonym is in the local schema, it is dropped.
        if v_Synonym_Owner = p_Dest_Schema then
            v_Drop_Synonym_Stat := 'DROP SYNONYM ' || v_Synonym_Owner || '.' || v_Synonym_Name;
            if p_Use_Dbms_Output then
              output_clob (v_Drop_Synonym_Stat|| ';');
              DBMS_OUTPUT.PUT_LINE ('/');
            end if;
            if p_Do_Execute then 
                EXECUTE IMMEDIATE v_Drop_Synonym_Stat;
            end if;
        end if;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- dropped local synonym');   	
        end if;
        -- the package is in an different schema, so a tracing package can be created.
        -- create package header 
        v_Synonym_Text := case when v_Synonym_Owner = 'PUBLIC' then 'PUBLIC' end 
        || ' SYNONYM '
        || case when v_Synonym_Owner != 'PUBLIC' then Enquote_Name(v_Synonym_Owner)||'.' end
        || Enquote_Name(p_Package_Name)
        || ' for ' || Enquote_Name(v_Package_Owner_Out) || '.' || Enquote_Name(v_Package_Name_Out);
        v_Clob := Get_Package_Spec (
            p_Object_Name => v_Package_Name_Out,
            p_Object_Owner => v_Package_Owner_Out,
            p_Editionable => v_Editionable_Out,
            p_Package_Name => p_Package_Name,
            p_Dest_Schema => p_Dest_Schema,
            p_Synonym_Text => v_Synonym_Text
        );
        if dbms_lob.getlength(v_Clob) = 0 or v_Clob IS NULL then 
            RAISE_APPLICATION_ERROR(-20003, 'The package header for ' || v_Synonym_Name || ' could not be generated.');
            return;
        end if;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- generated package header');   	
        end if;
        if p_Use_Dbms_Output then
          output_clob (v_Clob|| ';');
          DBMS_OUTPUT.PUT_LINE ('/');
        end if;
        if p_Do_Execute then 
            EXECUTE IMMEDIATE v_Clob;
        end if;
        -- create package body
        v_Clob := Get_Package_Body (
            p_Object_Name => v_Package_Name_Out,
            p_Object_Owner => v_Package_Owner_Out,
            p_Editionable => v_Editionable_Out,
            p_Package_Name => p_Package_Name,
            p_Dest_Schema => p_Dest_Schema,
            p_Logging_Start_Enabled => p_Logging_Start_Enabled,
            p_Logging_Start_Call => p_Logging_Start_Call,
            p_Logging_Finish_Call => p_Logging_Finish_Call,
            p_Logging_API_Call => p_Logging_API_Call,
            p_Variable_Name => p_Variable_Name,
            p_value_max_length => p_value_max_length
        );
        if dbms_lob.getlength(v_Clob) = 0 or v_Clob IS NULL then 
            RAISE_APPLICATION_ERROR(-20004, 'The package body for ' || v_Synonym_Name || ' could not be generated.');
            return;
        end if;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- generated package body');   	
        end if;
        if p_Use_Dbms_Output then
            output_clob (v_Clob);
            DBMS_OUTPUT.PUT_LINE ('/');
        end if;
        if p_Do_Execute then 
            EXECUTE IMMEDIATE v_Clob;
        end if;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Enable completion');   	
        end if;
    END Enable;

    PROCEDURE Enable_APEX (
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE
    ) 
    is 
    begin 
        for c_cur in (
            SELECT SYNONYM_NAME from table(get_APEX_Packages_List)
            order by SYNONYM_NAME
        ) loop 
            DBMS_OUTPUT.PUT_LINE ('-- Enabled package ' || c_cur.SYNONYM_NAME);
            begin 
            Enable(
                p_Package_Name=>c_cur.SYNONYM_NAME, 
                p_Logging_Start_Enabled => p_Logging_Start_Enabled,
				p_Logging_Start_Call => p_Logging_Start_Call,
				p_Logging_Finish_Call => p_Logging_Finish_Call,
				p_Logging_API_Call => p_Logging_API_Call,
				p_Variable_Name => p_Variable_Name,
                p_Use_Dbms_Output=>p_Use_Dbms_Output,
                p_Do_Execute=>p_Do_Execute);
            exception
                when others then
                   DBMS_OUTPUT.PUT_LINE ('-- Errors with '|| c_cur.SYNONYM_NAME || ' : ' || SQLERRM);
            end;
        end loop;
    end Enable_APEX;
  
    PROCEDURE Disable (
        p_Package_Name IN VARCHAR2,
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE
    )
    IS 
        v_result_str VARCHAR2(32767);
        v_Synonym_Text VARCHAR2(32767);
        v_Count NUMBER;
    BEGIN
        DBMS_OUTPUT.ENABLE(NULL);
        -- test for existance 
        SELECT COUNT(*) 
        INTO v_Count 
        FROM SYS.ALL_OBJECTS
        WHERE OBJECT_TYPE = 'PACKAGE'
        AND OWNER = p_Dest_Schema
        AND OBJECT_NAME = p_Package_Name;
        if v_Count = 0 then 
              RAISE_APPLICATION_ERROR(-20002, 'The package ' || p_Package_Name || ' could not be found.');
        end if;
        
        v_Synonym_Text := Get_Package_Synonym_Text(p_Package_Name=>p_Package_Name);

        -- produce revoke and drop for dependent objects
        v_result_str := 'DROP PACKAGE '||p_Dest_Schema||'.'||p_Package_Name;
        if p_Use_Dbms_Output then
            DBMS_OUTPUT.PUT_LINE (v_result_str||';');
        end if;
        if p_Do_Execute then
            EXECUTE IMMEDIATE v_result_str;
        end if;
        for c_cur in (
            -- remove local synonyms that where created to suport the dropped package.
            select DISTINCT 'DROP SYNONYM ' || SYN.owner || '.' || Syn.synonym_Name DROP_STAT 
            from SYS.All_Synonyms SYN, -- local supporting synonyms 
                SYS.ALL_SYNONYMS ORI,   -- public synonym to the original package
                SYS.ALL_DEPENDENCIES DEP -- dependencies on the public synonym
            where SYN.Table_Owner = Dep.referenced_Owner
            and SYN.Table_Name = Dep.referenced_Name
            and ORI.Table_Owner = Dep.Owner
            AND ORI.Table_Name = Dep.Name
            and SYN.Owner = p_Dest_Schema
            and ORI.Owner = 'PUBLIC'
            and ORI.Synonym_Name = p_Package_Name
            and not exists (
                select 1 -- no dependencies on the local supporting synonym
                from SYS.ALL_DEPENDENCIES LD 
                where LD.referenced_Owner = SYN.owner
                AND LD.referenced_Name = SYN.synonym_Name
                and LD.referenced_Type = 'SYNONYM'
                and LD.Owner = SYN.owner
            )
        ) loop 
            if p_Use_Dbms_Output then
                DBMS_OUTPUT.PUT_LINE (c_cur.DROP_STAT||';');
            end if;
            if p_Do_Execute then
                EXECUTE IMMEDIATE c_cur.DROP_STAT;
            end if;
        end loop;
        
        -- eventually, recreate local synonym.
        if v_Synonym_Text IS NOT NULL AND INSTR(v_Synonym_Text, 'PUBLIC') != 1 then 
            v_Synonym_Text := 'CREATE ' || v_Synonym_Text;
            if p_Use_Dbms_Output then
                DBMS_OUTPUT.PUT_LINE (v_Synonym_Text||';');
            end if;
            if p_Do_Execute then
                EXECUTE IMMEDIATE v_Synonym_Text;
            end if;   
        end if;
    END Disable;

    PROCEDURE Disable_APEX (
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,
        p_Do_Execute BOOLEAN DEFAULT TRUE
    )
    is
    begin 
        for c_cur in (
            select SYNONYM_NAME from table(get_APEX_Packages_List) SYN
            where exists (
                select 1 
                from SYS.ALL_OBJECTS OBJ 
                where OBJ.object_Name = SYN.SYNONYM_NAME
                and OBJ.owner = p_Dest_Schema
            )
            order by SYNONYM_NAME
        ) loop 
            DBMS_OUTPUT.PUT_LINE ('-- disabled package ' || c_cur.SYNONYM_NAME);
            begin 
                Disable(
                    p_Package_Name=>c_cur.SYNONYM_NAME, 
                    p_Dest_Schema=>p_Dest_Schema,
                    p_Use_Dbms_Output=>p_Use_Dbms_Output,
                    p_Do_Execute=>p_Do_Execute);
            exception
                when others then
                   DBMS_OUTPUT.PUT_LINE ('-- Errors with '|| c_cur.SYNONYM_NAME || ' : ' || SQLERRM);
            end;
        end loop;
    end Disable_APEX;
END package_tracer;
/

/*

- Examples:
GRANT EXECUTE ON APEX_190100.WWV_FLOW_SECURITY TO HR_DATA;

set serveroutput on size unlimited
call package_tracer.Enable('APEX_LANG');
call package_tracer.Enable('APEX_UTIL');

call package_tracer.Disable('APEX_LANG');
call package_tracer.Disable('APEX_UTIL');

select * from table(package_tracer.Dyn_Log_Call_List ('APEX_LANG'));

*/