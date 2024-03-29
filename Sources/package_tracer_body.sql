/*
Copyright 2021 Dirk Strack, Strack Software Development

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY package_tracer
IS
    c_Quote CONSTANT VARCHAR2(1) := chr(39);    -- Quote Character
    c_DQuote CONSTANT VARCHAR2(1) := chr(34);   -- Double Quote Character
    c_Format_Error_Function CONSTANT VARCHAR2(64) := 'DBMS_UTILITY.FORMAT_ERROR_STACK'; -- function for formating for the current error. The output is concatinated to the message.
	g_Hidden_Arguments_Array apex_t_varchar2 := APEX_STRING.SPLIT('P_PASSWORD:P_PASS:P_WALLET_PWD:P_WEB_PASSWORD:P_OLD_PASSWORD:P_NEW_PASSWORD', ':');
	-- g_Hidden_Arguments_Array apex_t_varchar2 := apex_t_varchar2();
    
    FUNCTION in_list(
        p_string in clob,
        p_delimiter in varchar2 DEFAULT ';'
    )
    RETURN sys.odciVarchar2List PIPELINED DETERMINISTIC
    IS
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
        l_string    varchar2(32767);
        n           number          := length(p_string);
        p           number          := 1;
        l_dlen      constant number := length(p_delimiter);
        l_limit     constant number := 4000;
        l_Trim_Set  constant varchar2(50)  := chr(9)||chr(10)||chr(13)||chr(32);
    begin
        if p_string IS NOT NULL then
            loop
                exit when n = 0;
                n := DBMS_LOB.INSTR( p_string, p_delimiter, p );
                l_string := case when n >= p
                    then DBMS_LOB.SUBSTR( p_string, least(n-p, l_limit), p )
                    else DBMS_LOB.SUBSTR( p_string, l_limit, p )
                    end;
                pipe row( ltrim( rtrim( l_string, l_Trim_Set ), l_Trim_Set ) );
                p := n + l_dlen;
            end loop;
        end if;
        return ;
    END in_list;

    FUNCTION Enquote_Name ( p_Text VARCHAR2 )
    RETURN VARCHAR2 DETERMINISTIC
    IS
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
    BEGIN
        RETURN c_DQuote || REPLACE(UPPER(p_Text), c_DQuote) || c_DQuote ;
    END Enquote_Name;

    FUNCTION Enquote_Literal ( p_Text VARCHAR2, p_value_max_length PLS_INTEGER DEFAULT 1000 )
    RETURN VARCHAR2 DETERMINISTIC
    IS
    BEGIN
        RETURN c_Quote || REPLACE(SUBSTR(p_Text, 1, p_value_max_length), c_Quote, c_Quote||c_Quote) || c_Quote ;
    END Enquote_Literal;
    
    FUNCTION get_APEX_Packages_List 
    RETURN tab_synonyms PIPELINED
    IS 
        c_APEX_Packages CONSTANT VARCHAR2(2000) := 
           'APEX_ACL,APEX_APPLICATION_INSTALL,APEX_APP_SETTING,APEX_AUTHENTICATION,'
        || 'APEX_AUTHORIZATION,APEX_AUTOMATION,APEX_COLLECTION,APEX_CREDENTIAL,APEX_CSS,'
        || 'APEX_CUSTOM_AUTH,APEX_DATA_PARSER,APEX_ESCAPE,APEX_EXEC,APEX_EXPORT,APEX_IG,APEX_IR,APEX_ITEM,'
        || 'APEX_JAVASCRIPT,APEX_JSON,APEX_LANG,APEX_LDAP,APEX_MAIL,APEX_PAGE,APEX_PKG_APP_INSTALL,APEX_PLUGIN_UTIL,'
        || 'APEX_REGION,APEX_REST_SOURCE_SYNC,APEX_SESSION,APEX_SPATIAL,APEX_STRING,APEX_STRING_UTIL,APEX_THEME,'
        || 'APEX_UI_DEFAULT_UPDATE,APEX_UTIL,APEX_WEB_SERVICE,APEX_ZIP';
    begin   
        for cur in (
            select 
                SYN.OWNER           Synonym_Owner, 
                SYN.SYNONYM_NAME    Synonym_Name,
                SYN.TABLE_OWNER     Package_Owner,
                SYN.TABLE_NAME      Package_Name
            from SYS.All_Synonyms SYN
            where SYN.SYNONYM_NAME IN (
                SELECT column_value FROM TABLE(in_list(c_APEX_Packages, ','))
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
			select /*+ RESULT_CACHE */
                SYN.OWNER           Synonym_Owner, 
                SYN.SYNONYM_NAME    Synonym_Name,
                SYN.TABLE_OWNER     Package_Owner,
                SYN.TABLE_NAME      Package_Name
            from SYS.All_Synonyms SYN
            join SYS.All_Objects OBJ on SYN.TABLE_NAME = OBJ.OBJECT_NAME and SYN.TABLE_OWNER = OBJ.OWNER
            where Syn.OWNER IN ('PUBLIC', SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') )
            and SYN.SYNONYM_NAME LIKE p_Search_Name
            and OBJ.OBJECT_TYPE = 'PACKAGE'
			and NOT EXISTS (
            	select * from SYS.ALL_ARGUMENTS A
				where (A.DATA_TYPE IN ('UNDEFINED')
					OR A.TYPE_SUBNAME LIKE'<%>') 
				and A.PACKAGE_NAME = SYN.TABLE_NAME
				and A.OWNER = SYN.TABLE_OWNER
            )
            and exists ( -- package has procedures
                select 1 
                from SYS.ALL_PROCEDURES PRO
                where PRO.OWNER = SYN.TABLE_OWNER
                and PRO.OBJECT_NAME = SYN.TABLE_NAME
                and PRO.OBJECT_TYPE = 'PACKAGE'
                and PRO.PROCEDURE_NAME IS NOT NULL
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
            and not (SYN.TABLE_OWNER = 'SYS' -- package defines nested record types for function arguments
            	and SYN.TABLE_NAME IN (
					'DBMS_DEBUG',		-- PLS-00307: Zu viele Deklarationen von 'GET_ENCODED_STACK_FOR_CLIENT' entsprechen diesem Aufruf
					'DBMS_TF',			-- because argument name <V2_TABLE_1> must be declared
					'DBMS_UTILITY'		-- because of conditional compilation condition in function header
            	)
            )
            and SYN.SYNONYM_NAME NOT IN (
            	'API_TRACE',				-- because package_tracer is dependent on this object 
            	'DBMS_OUTPUT',				-- because package_tracer is dependent on this object
            	'PACKAGE_TRACER',			-- because package_tracer is dependent on this object
            	'APEX_DEBUG', 				-- because package_tracer is dependent on this synonyms
            	'APEX_APPLICATION',			-- because global variables are defined
            	'APEX_PLUGIN',				-- because the second synonym WWV_FLOW_PLUGIN_API is used in other packages
                'DBMS_DIMENSION', 			-- PLS-00307: Zu viele Deklarationen von 'VALIDATE_DIMENSION' entsprechen diesem Aufruf
                'DBMS_SODA_USER_ADMIN', 	-- PLS-00201
                'DBMS_LOB'  				-- PLS-00452: Unterprogramm 'DBFS_LINK_GENERATE_PATH' verstößt gegen sein zugeordnetes Pragma
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
            WITH SYNONYMS_Q AS (
				SELECT Object_Owner, Object_Name,
					STATEMENT_AGG(SYNONYM_STAT) SYNONYM_STATS
				FROM (
					SELECT DISTINCT 
						DA.Owner Object_Owner, DA.Name Object_Name,
						'CREATE OR REPLACE SYNONYM ' || p_Dest_Schema || '.' || DA.referenced_Name
						|| ' FOR ' || DA.referenced_Owner || '.' || DA.referenced_Name 
						SYNONYM_STAT
					FROM SYS.ALL_DEPENDENCIES DA
					WHERE NOT EXISTS (SELECT 1 
						FROM SYS.ALL_SYNONYMS SYN 
						WHERE SYN.OWNER IN (p_Dest_Schema, 'PUBLIC')
						AND Syn.Synonym_Name = DA.referenced_Name
					)
					AND NOT EXISTS (SELECT 1 -- no VIEW OR SYNONYM with this name already exists
						FROM SYS.ALL_DEPENDENCIES DB 
						WHERE DB.OWNER = p_Dest_Schema
						AND DB.NAME = DB.REFERENCED_NAME
						AND DB.TYPE IN ('SYNONYM', 'VIEW')
						AND DB.REFERENCED_NAME = DA.REFERENCED_NAME and DB.REFERENCED_OWNER = DA.OWNER
					)
					AND NOT(DA.REFERENCED_OWNER = 'SYS' AND DA.REFERENCED_NAME IN ('STANDARD','DBMS_STANDARD'))
				) GROUP BY Object_Owner, Object_Name
            ), PRIVS_Q AS (
				SELECT Object_Owner, Object_Name,
					STATEMENT_AGG(GRANT_STAT) GRANT_STATS,
					STATEMENT_AGG(REVOKE_STAT) REVOKE_STATS
			   FROM (
					SELECT DISTINCT DA.Owner Object_Owner, DA.Name Object_Name,
						case when PRI.Privilege IS NULL and DA.referenced_Owner != 'PUBLIC' then 
							'GRANT ' || case when OBJ.OBJECT_TYPE IN ('TABLE', 'VIEW') then 'SELECT' else 'EXECUTE' end 
							|| ' ON ' || DA.referenced_Owner || '.' || DA.referenced_Name 
							|| ' TO ' || p_Dest_Schema  
						end GRANT_STAT,
						case when PRI.Privilege IS NOT NULL and PRI.Grantee = p_Dest_Schema then 
							'REVOKE ' || PRI.Privilege
							|| ' ON ' || DA.referenced_Owner || '.' || DA.referenced_Name 
							|| ' FROM ' || p_Dest_Schema 
						end REVOKE_STAT,
						PRI.Grantable,
						PRI.Privilege
					FROM SYS.ALL_DEPENDENCIES DA
					LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI 
						ON Pri.table_Schema = DA.referenced_Owner 
						AND Pri.table_Name = DA.referenced_Name
						AND Pri.type = DA.referenced_Type
						AND PRI.Grantee IN (p_Dest_Schema, 'PUBLIC')
						AND PRI.privilege IN ('EXECUTE', 'SELECT')
					LEFT OUTER JOIN SYS.ALL_OBJECTS OBJ 
						ON OBJ.OWNER = DA.OWNER and OBJ.OBJECT_NAME = DA.REFERENCED_NAME
					WHERE (PRI.PRIVILEGE IS NULL and DA.referenced_Owner != 'PUBLIC'
						OR PRI.Privilege IS NOT NULL and PRI.Grantee = p_Dest_Schema)
					AND NOT(DA.REFERENCED_OWNER = 'SYS' AND DA.REFERENCED_NAME IN ('STANDARD','DBMS_STANDARD'))
				) GROUP BY Object_Owner, Object_Name
            ) , DEPS AS (
                SELECT PL.SYNONYM_OWNER, PL.SYNONYM_NAME, PL.PACKAGE_OWNER, PL.PACKAGE_NAME,
                    P.GRANT_STATS,
                    P.REVOKE_STATS,
                    S.SYNONYM_STATS
                FROM table(get_Packages_List) PL
                LEFT OUTER JOIN SYNONYMS_Q S ON S.Object_Owner = PL.PACKAGE_OWNER AND S.Object_Name = PL.PACKAGE_NAME
                LEFT OUTER JOIN PRIVS_Q P ON P.Object_Owner = PL.PACKAGE_OWNER AND P.Object_Name = PL.PACKAGE_NAME
             ), CONFLICTING_Q AS (
					-- package defines types that are used for arguments in other packages
				select A.OWNER, A.TYPE_NAME, 
					LISTAGG(A.PACKAGE_NAME, ', ') WITHIN GROUP (ORDER BY A.PACKAGE_NAME) AFFECTED_OBJECTS
				from (  -- record types are used in Dependent packages for arguments
					select distinct A.OWNER, A.TYPE_NAME, A.PACKAGE_NAME 
					from SYS.ALL_ARGUMENTS A
					where A.TYPE_OBJECT_TYPE = 'PACKAGE'
					and A.DATA_TYPE IN ('PL/SQL TABLE', 'PL/SQL RECORD', 'TABLE')
					and not(A.TYPE_OWNER = A.OWNER
					    and A.TYPE_NAME = A.PACKAGE_NAME)
					union  -- record types are used in Dependent packages for own types
					select distinct DA.REFERENCED_OWNER OWNER, DA.REFERENCED_NAME TYPE_NAME, DA.NAME PACKAGE_NAME
					from SYS.All_Dependencies DA 
					join MV_PACKAGE_RECORD_TYPES RT 
						on DA.NAME = RT.PACKAGE_NAME 
						and DA.OWNER = RT.PACKAGE_OWNER 
						and Rt.Item_Type LIKE DA.REFERENCED_NAME ||'.%'
					where DA.TYPE = 'PACKAGE'
					and DA.OWNER = DA.REFERENCED_OWNER
					and DA.REFERENCED_TYPE = 'PACKAGE'
					and NOT(DA.REFERENCED_OWNER = 'SYS' AND DA.REFERENCED_NAME IN ('STANDARD','DBMS_STANDARD')) 
				) A 
				group by A.OWNER, A.TYPE_NAME
            )
            SELECT SYNONYM_OWNER, SYNONYM_NAME, PACKAGE_OWNER, PACKAGE_NAME,
                APEX_ITEM.HIDDEN (p_idx => 1, p_value => SYNONYM_NAME, p_item_id => 'f01_'||ROWNUM, p_item_label => 'ROW_SELECTOR$') ||
                APEX_ITEM.SWITCH (p_idx => 2, 
                  p_value => IS_ENABLED, 
                  p_item_id => 'f02_'||ROWNUM, p_item_label => 'SWITCH_ENABLED') 
                || APEX_ITEM.HIDDEN (p_idx => 3, p_value => IS_ENABLED, p_item_id => 'f03_' || ROWNUM , p_item_label => 'IS_ENABLED') IS_ENABLED_SWITCH,
                IS_ENABLED,
                GRANT_STATS,
                REVOKE_STATS, 
                SYNONYM_STATS,
                AFFECTED_OBJECTS,
				(SELECT COUNT(*)
					from SYS.ALL_IDENTIFIERS AI
					where not(AI.owner = 'SYS' and AI.object_name in ('STANDARD','DBMS_STANDARD'))
					and AI.Object_Type = 'PACKAGE'
					and AI.Usage = 'DECLARATION'
					and AI.Type = 'VARIABLE'
					and AI.owner = p_Dest_Schema
					and AI.object_name = MAIN.SYNONYM_NAME
				) Global_Variables_Count,
				(SELECT COUNT(*) 
				 FROM SYS.ALL_ERRORS ERR
				 WHERE ERR.NAME = MAIN.SYNONYM_NAME
				 AND ERR.OWNER = p_Dest_Schema
				 AND ERR.TYPE LIKE 'PACKAGE%'
				) ERROR_COUNT
            FROM (
                SELECT D.SYNONYM_OWNER, D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME,
                    CASE WHEN EXISTS (
                        SELECT 1 
                        FROM SYS.USER_OBJECTS OBJ
                        WHERE OBJ.OBJECT_NAME = D.SYNONYM_NAME
                        AND OBJECT_TYPE = 'PACKAGE'
                    ) THEN 'Y' ELSE 'N' END IS_ENABLED,
                    GRANT_STATS, REVOKE_STATS, SYNONYM_STATS
                FROM DEPS D
                UNION ALL -- enabled local synonym packages
                SELECT D.SYNONYM_OWNER, D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME, 'Y' IS_ENABLED,
                    TO_CLOB(NULL) GRANT_STATS, 
                    TO_CLOB(NULL) REVOKE_STATS, 
                    TO_CLOB('CREATE OR REPLACE ' || SYNONYM_STATS || ';') SYNONYM_STATS
                FROM (
                    SELECT  DEP.OWNER SYNONYM_OWNER,
                    		DEP.NAME SYNONYM_NAME, 
                            DEP.REFERENCED_NAME PACKAGE_NAME,
                            DEP.REFERENCED_OWNER PACKAGE_OWNER,
                            Get_Package_Synonym_Text(DEP.REFERENCED_NAME) SYNONYM_STATS
                    FROM SYS.ALL_DEPENDENCIES DEP
                    where DEP.TYPE = 'PACKAGE BODY'
                    and DEP.REFERENCED_TYPE = 'PACKAGE'
                    and DEP.REFERENCED_NAME = DEP.NAME
                    and DEP.REFERENCED_OWNER != p_Dest_Schema
                    and DEP.OWNER = p_Dest_Schema
                ) D
                WHERE SYNONYM_STATS IS NOT NULL
                AND INSTR(SYNONYM_STATS,'PUBLIC') != 1

          ) MAIN
		  LEFT OUTER JOIN CONFLICTING_Q CF ON CF.OWNER = MAIN.PACKAGE_OWNER AND CF.TYPE_NAME = MAIN.PACKAGE_NAME
        ) loop 
            pipe row (cur);
        end loop;
        return;
    end get_Packages_Control_List;

    FUNCTION get_APEX_Control_List 
    RETURN tab_Packages_Control PIPELINED
    IS 
    	v_Dest_Schema CONSTANT VARCHAR2(128) := SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA');
    begin   
        for cur in (
            WITH SYNONYMS_Q AS (
				SELECT Object_Owner, Object_Name,
					STATEMENT_AGG(SYNONYM_STAT) SYNONYM_STATS
				FROM (
					SELECT DISTINCT 
						DA.Owner Object_Owner, DA.Name Object_Name,
						'CREATE OR REPLACE SYNONYM ' || v_Dest_Schema || '.' || DA.referenced_Name
						|| ' FOR ' || DA.referenced_Owner || '.' || DA.referenced_Name 
						SYNONYM_STAT
					FROM SYS.ALL_DEPENDENCIES DA
					WHERE NOT EXISTS (SELECT 1 
						FROM SYS.ALL_SYNONYMS SYN 
						WHERE SYN.OWNER IN (v_Dest_Schema, 'PUBLIC')
						AND Syn.Synonym_Name = DA.referenced_Name
					)
					AND NOT EXISTS (SELECT 1 -- no VIEW OR SYNONYM with this name already exists
						FROM SYS.ALL_DEPENDENCIES DB 
						WHERE DB.OWNER = v_Dest_Schema
						AND DB.NAME = DB.REFERENCED_NAME
						AND DB.TYPE IN ('SYNONYM', 'VIEW')
						AND DB.REFERENCED_NAME = DA.REFERENCED_NAME and DB.REFERENCED_OWNER = DA.OWNER
					)
					AND NOT(DA.REFERENCED_OWNER = 'SYS' AND DA.REFERENCED_NAME IN ('STANDARD','DBMS_STANDARD'))
				) GROUP BY Object_Owner, Object_Name
            ), PRIVS_Q AS (
				SELECT Object_Owner, Object_Name,
					STATEMENT_AGG(GRANT_STAT) GRANT_STATS,
					STATEMENT_AGG(REVOKE_STAT) REVOKE_STATS
			   FROM (
					SELECT DISTINCT DA.Owner Object_Owner, DA.Name Object_Name,
						case when PRI.Privilege IS NULL and DA.referenced_Owner != 'PUBLIC' then 
							'GRANT ' || case when OBJ.OBJECT_TYPE IN ('TABLE', 'VIEW') then 'SELECT' else 'EXECUTE' end 
							|| ' ON ' || DA.referenced_Owner || '.' || DA.referenced_Name 
							|| ' TO ' || v_Dest_Schema  
						end GRANT_STAT,
						case when PRI.Privilege IS NOT NULL and PRI.Grantee = v_Dest_Schema then 
							'REVOKE ' || PRI.Privilege
							|| ' ON ' || DA.referenced_Owner || '.' || DA.referenced_Name 
							|| ' FROM ' || v_Dest_Schema 
						end REVOKE_STAT,
						PRI.Grantable,
						PRI.Privilege
					FROM SYS.ALL_DEPENDENCIES DA
					LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI 
						ON Pri.table_Schema = DA.referenced_Owner 
						AND Pri.table_Name = DA.referenced_Name
						AND Pri.type = DA.referenced_Type
						AND PRI.Grantee IN (v_Dest_Schema, 'PUBLIC')
						AND PRI.privilege IN ('EXECUTE', 'SELECT')
					LEFT OUTER JOIN SYS.ALL_OBJECTS OBJ 
						ON OBJ.OWNER = DA.OWNER and OBJ.OBJECT_NAME = DA.REFERENCED_NAME
					WHERE (PRI.PRIVILEGE IS NULL and DA.referenced_Owner != 'PUBLIC'
						OR PRI.Privilege IS NOT NULL and PRI.Grantee = v_Dest_Schema)
					AND NOT(DA.REFERENCED_OWNER = 'SYS' AND DA.REFERENCED_NAME IN ('STANDARD','DBMS_STANDARD'))
				) GROUP BY Object_Owner, Object_Name
            ), CONFLICTING_Q AS (
					-- package defines types that are used for arguments in other packages
				select A.OWNER, A.TYPE_NAME,
					LISTAGG(A.PACKAGE_NAME, ', ') WITHIN GROUP (ORDER BY A.PACKAGE_NAME) AFFECTED_OBJECTS
				from ( -- record types are used in Dependent packages for arguments
					select distinct A.OWNER, A.TYPE_NAME, A.PACKAGE_NAME 
					from SYS.ALL_ARGUMENTS A
					where A.TYPE_OBJECT_TYPE = 'PACKAGE'
					and A.DATA_TYPE IN ('PL/SQL TABLE', 'PL/SQL RECORD', 'TABLE')
					and not(A.TYPE_OWNER = A.OWNER
						and A.TYPE_NAME = A.PACKAGE_NAME)
					union  -- record types are used in Dependent packages for own types
					select distinct DA.REFERENCED_OWNER OWNER, DA.REFERENCED_NAME TYPE_NAME, DA.NAME PACKAGE_NAME
					from SYS.All_Dependencies DA 
					join MV_PACKAGE_RECORD_TYPES RT 
						on DA.NAME = RT.PACKAGE_NAME 
						and DA.OWNER = RT.PACKAGE_OWNER 
						and Rt.Item_Type LIKE DA.REFERENCED_NAME ||'.%'
					where DA.TYPE = 'PACKAGE'
					and DA.OWNER = DA.REFERENCED_OWNER
					and DA.REFERENCED_TYPE = 'PACKAGE'
					and NOT(DA.REFERENCED_OWNER = 'SYS' AND DA.REFERENCED_NAME IN ('STANDARD','DBMS_STANDARD')) 
				) A
				group by A.OWNER, A.TYPE_NAME
            )
            SELECT SYNONYM_OWNER, SYNONYM_NAME, PACKAGE_OWNER, PACKAGE_NAME,
                APEX_ITEM.HIDDEN (p_idx => 1, p_value => SYNONYM_NAME, p_item_id => 'f01_'||ROWNUM, p_item_label => 'ROW_SELECTOR$') ||
                APEX_ITEM.SWITCH (p_idx => 2, 
                  p_value => IS_ENABLED, 
                  p_item_id => 'f02_'||ROWNUM, p_item_label => 'SWITCH_ENABLED') 
                || APEX_ITEM.HIDDEN (p_idx => 3, p_value => IS_ENABLED, p_item_id => 'f03_' || ROWNUM , p_item_label => 'IS_ENABLED') IS_ENABLED_SWITCH,
                IS_ENABLED,
                GRANT_STATS, REVOKE_STATS, SYNONYM_STATS,
                AFFECTED_OBJECTS,                
				(SELECT COUNT(*)
					from SYS.ALL_IDENTIFIERS AI
					where not(AI.owner = 'SYS' and AI.object_name in ('STANDARD','DBMS_STANDARD'))
					and AI.Object_Type = 'PACKAGE'
					and AI.Usage = 'DECLARATION'
					and AI.Type = 'VARIABLE'
					and AI.owner = v_Dest_Schema
					and AI.object_name = MAIN.SYNONYM_NAME
				) Global_Variables_Count,
				(SELECT COUNT(*) 
				 FROM SYS.ALL_ERRORS ERR
				 WHERE ERR.NAME = MAIN.SYNONYM_NAME
				 AND ERR.OWNER = v_Dest_Schema
				 AND ERR.TYPE LIKE 'PACKAGE%'
				) ERROR_COUNT
            FROM (
                SELECT PL.SYNONYM_OWNER, PL.SYNONYM_NAME, PL.PACKAGE_OWNER, PL.PACKAGE_NAME,
                    P.GRANT_STATS, P.REVOKE_STATS, S.SYNONYM_STATS, CF.AFFECTED_OBJECTS,
                    CASE WHEN EXISTS (
                        SELECT 1 
                        FROM SYS.USER_OBJECTS OBJ
                        WHERE OBJ.OBJECT_NAME = PL.SYNONYM_NAME
                        AND OBJECT_TYPE = 'PACKAGE'
                    ) THEN 'Y' ELSE 'N' END IS_ENABLED
                FROM table(get_APEX_Packages_List) PL
                LEFT OUTER JOIN SYNONYMS_Q S ON S.Object_Owner = PL.PACKAGE_OWNER AND S.Object_Name = PL.PACKAGE_NAME
                LEFT OUTER JOIN PRIVS_Q P ON P.Object_Owner = PL.PACKAGE_OWNER AND P.Object_Name = PL.PACKAGE_NAME
			    LEFT OUTER JOIN CONFLICTING_Q CF ON CF.OWNER = PL.PACKAGE_OWNER AND CF.TYPE_NAME = PL.PACKAGE_NAME
            ) MAIN
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
            WITH PA AS ( -- Parameters
                SELECT p_Target_Schema GRANTEE,
                    SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') OWNER
                FROM DUAL 
            ),
            PKEY_Q AS ( 
            	-- Add primary key constraints to views. This will enable to APEX Builder to detect the Primary key for forms and reports
                SELECT 
                    C.TABLE_NAME, C.OWNER TABLE_OWNER, 
                    ', CONSTRAINT ' || Enquote_Name(C.CONSTRAINT_NAME) || ' PRIMARY KEY ('
                    || LISTAGG(Enquote_Name(C.COLUMN_NAME), ',') WITHIN GROUP (ORDER BY C.POSITION) 
                    || ') RELY DISABLE' PKEY_CONS
                FROM SYS.USER_CONSTRAINTS B
                JOIN SYS.USER_CONS_COLUMNS C ON C.TABLE_NAME = B.TABLE_NAME AND C.CONSTRAINT_NAME = B.CONSTRAINT_NAME AND C.OWNER = B.OWNER
                WHERE B.CONSTRAINT_TYPE = 'P'
                AND B.OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
                AND B.TABLE_NAME NOT LIKE 'DR$%$_'  -- skip fulltext index
                AND B.TABLE_NAME NOT LIKE 'BIN$%'  -- this table is in the recyclebin
                GROUP BY C.TABLE_NAME, C.OWNER, C.CONSTRAINT_NAME
            ),
            COLS_Q AS (
            	-- List of Column alias names for views 
                SELECT TABLE_NAME, LISTAGG(Enquote_Name(COLUMN_NAME), ', ') WITHIN GROUP (ORDER BY COLUMN_ID) TAB_COLUMNS
                FROM SYS.USER_TAB_COLUMNS
                GROUP BY TABLE_NAME
            ),
            STATS_Q AS (
                -- views
                -------------------------
                SELECT 'GRANT ' || PRIVS || ' ON ' || S.OWNER || '.' || S.VIEW_NAME || ' TO ' || PA.GRANTEE GRANT_STAT,
                    'CREATE OR REPLACE VIEW ' || PA.GRANTEE || '.' || S.VIEW_NAME 
                    || ' (' || S.TAB_COLUMNS || S.PKEY_CONS || ')'
                    || ' AS SELECT * FROM ' || S.OWNER || '.' || S.VIEW_NAME CREATE_STAT,
                    'REVOKE ' || PRIVS || ' ON ' || S.OWNER || '.' || S.VIEW_NAME || ' FROM ' || PA.GRANTEE REVOKE_STAT, 
                    'DROP VIEW ' || PA.GRANTEE || '.' || S.VIEW_NAME DROP_STAT,
                    S.OWNER, S.VIEW_NAME OBJECT_NAME, 
                    'VIEW' OBJECT_TYPE, 
                    'VIEW' DEST_OBJECT_TYPE,
                    ADMIN_GRANT_STAT
                FROM (
                    SELECT CASE WHEN DG.FOREIGN_DEPS_CNT > 0 
                    	THEN NVL(DG.PRIVILEGE, 'READ')
                    	ELSE 
                    		'SELECT' ||
							CASE WHEN TR.PRIVS IS NOT NULL 
								THEN ', ' || TR.PRIVS
								ELSE T.UPDATABLE || T.INSERTABLE || T.DELETABLE
							END
                        END PRIVS,
                        NG.ADMIN_GRANT_STAT,
                        T.VIEW_NAME, T.OWNER, 
                        P.PKEY_CONS, C.TAB_COLUMNS
                    FROM (
                        SELECT V.VIEW_NAME, T.OWNER,
                            MAX(CASE WHEN UPDATABLE = 'YES' THEN ', UPDATE' END) UPDATABLE,
                            MAX(CASE WHEN INSERTABLE = 'YES' THEN ', INSERT' END) INSERTABLE,
                            MAX(CASE WHEN DELETABLE = 'YES' THEN ', DELETE' END) DELETABLE
                        FROM SYS.USER_UPDATABLE_COLUMNS T
                        JOIN SYS.USER_VIEWS V ON V.VIEW_NAME = T.TABLE_NAME
                        GROUP BY V.VIEW_NAME, T.OWNER
                    ) T LEFT OUTER JOIN ( -- grantable dependent object privileges
                     -- when a view is accessing other foreign schema view, then is view has READ-only access
                       SELECT NAME, COUNT(*) FOREIGN_DEPS_CNT,
                        	LISTAGG(PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) PRIVILEGE
                        FROM (
                            SELECT DISTINCT D.NAME, PRI.PRIVILEGE
                            FROM SYS.USER_DEPENDENCIES D
                            JOIN SYS.ALL_TAB_PRIVS PRI 
                                ON PRI.table_Schema = D.REFERENCED_OWNER 
                                AND PRI.table_Name = D.REFERENCED_NAME
                                AND PRI.grantee IN ('PUBLIC', SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'))
                            WHERE D.TYPE = 'VIEW'
                            AND D.REFERENCED_TYPE IN ('VIEW', 'TABLE', 'SYNONYM')
                            AND D.REFERENCED_OWNER NOT IN ('PUBLIC', SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')) -- dependent on object in foreign schema 
                            AND PRI.GRANTABLE = 'YES'
                        )
                        GROUP BY NAME
                    ) DG ON T.VIEW_NAME = DG.NAME
                    LEFT OUTER JOIN ( -- not grantable dependent object privileges
                        SELECT NAME, COUNT(*) FOREIGN_DEPS_CNT,
                            LISTAGG(CASE WHEN NOT_GRANTABLE > 0
                                    THEN 'GRANT ' || PRIVILEGE || ' ON ' || REFERENCED_OWNER || '.' || REFERENCED_NAME 
                                        || ' TO ' || SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') || ' WITH GRANT OPTION;'
                                    END, chr(10)) WITHIN GROUP (ORDER BY PRIVILEGE) ADMIN_GRANT_STAT
                        FROM (
                            SELECT D.NAME, D.REFERENCED_OWNER, D.REFERENCED_NAME,
                                LISTAGG(PRI.PRIVILEGE, ', ') WITHIN GROUP (ORDER BY PRIVILEGE) PRIVILEGE,
                                COUNT(*) NOT_GRANTABLE
                            FROM SYS.USER_DEPENDENCIES D
                            JOIN SYS.ALL_TAB_PRIVS PRI 
                                ON PRI.table_Schema = D.REFERENCED_OWNER 
                                AND PRI.table_Name = D.REFERENCED_NAME
                                AND PRI.grantee IN ('PUBLIC', SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'))
                            WHERE D.TYPE = 'VIEW'
                            AND D.REFERENCED_TYPE IN ('VIEW', 'TABLE', 'SYNONYM')
                            AND D.REFERENCED_OWNER NOT IN ('PUBLIC', SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')) -- dependent on object in foreign schema 
                            AND PRI.GRANTABLE = 'NO'
                            GROUP BY D.NAME, D.REFERENCED_OWNER, D.REFERENCED_NAME
                        )
                        GROUP BY NAME
                    ) NG ON T.VIEW_NAME = NG.NAME
                    LEFT OUTER JOIN ( -- updatable views with INSTEAD OF trigger
                        SELECT REGEXP_REPLACE(
                            LISTAGG(TRIGGERING_EVENT, ', ') WITHIN GROUP (ORDER BY TRIGGERING_EVENT), 
                            '\sOR\s', ', ') PRIVS,
                            T.TABLE_NAME VIEW_NAME
                        FROM SYS.USER_TRIGGERS T
                        WHERE TRIGGER_TYPE = 'INSTEAD OF'
                        AND BASE_OBJECT_TYPE = 'VIEW'
                        GROUP BY TABLE_NAME
                    ) TR ON T.VIEW_NAME = TR.VIEW_NAME
                    LEFT OUTER JOIN PKEY_Q P ON T.VIEW_NAME = P.TABLE_NAME
                    LEFT OUTER JOIN COLS_Q C ON T.VIEW_NAME = C.TABLE_NAME
                ) S, PA
                WHERE PA.GRANTEE IS NOT NULL
                UNION ALL   
                -- normal tables 
                ----------------
                SELECT 
                    'GRANT ' || PRIVS || ' ON ' 
                    || PA.OWNER || '.' || TABLE_NAME || ' TO ' || PA.GRANTEE GRANT_STAT,
                    'CREATE OR REPLACE VIEW ' || PA.GRANTEE || '.' || T.TABLE_NAME 
                    || ' (' || T.TAB_COLUMNS || T.PKEY_CONS || ')'
                    || ' AS SELECT * FROM ' || PA.OWNER || '.' || T.TABLE_NAME CREATE_STAT,
                    'REVOKE ' || PRIVS || ' ON ' 
                     || PA.OWNER || '.' || TABLE_NAME || ' FROM ' || PA.GRANTEE REVOKE_STAT, 
                    'DROP VIEW ' || PA.GRANTEE || '.' || T.TABLE_NAME DROP_STAT,
                    PA.OWNER, T.TABLE_NAME OBJECT_NAME, 
                    'TABLE' OBJECT_TYPE, 
                    'VIEW' DEST_OBJECT_TYPE,
                    '' ADMIN_GRANT_STAT
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
                        END PRIVS,
                        P.PKEY_CONS, C.TAB_COLUMNS
                    FROM SYS.USER_TABLES T
                    LEFT OUTER JOIN PKEY_Q P ON T.TABLE_NAME = P.TABLE_NAME
                    LEFT OUTER JOIN COLS_Q C ON T.TABLE_NAME = C.TABLE_NAME
                    WHERE T.IOT_NAME IS NULL    -- skip overflow tables of index organized tables
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
                    '' ADMIN_GRANT_STAT
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
                    '' ADMIN_GRANT_STAT
                FROM SYS.USER_SEQUENCES T, PA
                WHERE PA.GRANTEE IS NOT NULL
            ), MAIN_Q AS (
                SELECT S.OWNER, S.OBJECT_NAME, S.OBJECT_TYPE, S.DEST_OBJECT_TYPE,
                    S.ADMIN_GRANT_STAT, 
                    case when EXISTS (
                            SELECT 1 
                            FROM SYS.ALL_DEPENDENCIES D
                            WHERE D.OWNER = PA.GRANTEE
                            AND D.NAME = S.OBJECT_NAME
                            and D.REFERENCED_OWNER= S.OWNER
                            and D.REFERENCED_NAME = S.OBJECT_NAME
                            AND D.REFERENCED_TYPE = S.OBJECT_TYPE
                        ) or EXISTS (
                            SELECT 1 
                            FROM SYS.ALL_OBJECTS OBJ 
							WHERE OBJ.OWNER = PA.GRANTEE
							AND OBJ.OBJECT_NAME = S.OBJECT_NAME
							AND OBJ.OBJECT_TYPE = S.DEST_OBJECT_TYPE
                        ) then 'Y' else 'N'
                    end DEST_OBJECT_EXISTS,
                    case when EXISTS (
                            SELECT 1 
                            FROM SYS.ALL_SYNONYMS SYN
                            WHERE SYN.SYNONYM_NAME = S.OBJECT_NAME
                            AND SYN.OWNER = 'PUBLIC'
                        ) then 'Y' else 'N'
                    end CONFLICTING_OBJECT_EXISTS,
                    PA.GRANTEE DEST_SCHEMA,
                    S.GRANT_STAT, S.CREATE_STAT, S.REVOKE_STAT, S.DROP_STAT
                FROM STATS_Q S, PA
            )
            SELECT S.OWNER, S.OBJECT_NAME, S.OBJECT_TYPE, S.DEST_OBJECT_TYPE, S.ADMIN_GRANT_STAT, 
                S.DEST_OBJECT_EXISTS, S.CONFLICTING_OBJECT_EXISTS, S.DEST_SCHEMA, 
                S.GRANT_STAT, S.CREATE_STAT, S.REVOKE_STAT, S.DROP_STAT,
                case when CONFLICTING_OBJECT_EXISTS = 'N' AND ADMIN_GRANT_STAT IS NULL then 
                    APEX_ITEM.HIDDEN (p_idx => 1, p_value => OBJECT_NAME, p_item_id => 'f01_'||ROWNUM, p_item_label => 'ROW_SELECTOR$')
                    || APEX_ITEM.SWITCH (p_idx => 2,  p_value => DEST_OBJECT_EXISTS, p_item_id => 'f02_'||ROWNUM, p_item_label => 'SWITCH_ENABLED') 
                    || APEX_ITEM.HIDDEN (p_idx => 3, p_value => DEST_OBJECT_EXISTS, p_item_id => 'f03_' || ROWNUM) 
                    || APEX_ITEM.HIDDEN (p_idx => 4, p_value => GRANT_STAT, p_item_id => 'f04_' || ROWNUM) 
                    || APEX_ITEM.HIDDEN (p_idx => 5, p_value => CREATE_STAT, p_item_id => 'f05_' || ROWNUM) 
                    || APEX_ITEM.HIDDEN (p_idx => 6, p_value => REVOKE_STAT, p_item_id => 'f06_' || ROWNUM) 
                    || APEX_ITEM.HIDDEN (p_idx => 7, p_value => DROP_STAT, p_item_id => 'f07_' || ROWNUM) 
                end IS_ENABLED_SWITCH
            FROM MAIN_Q S
        ) loop 
            pipe row (cur);
        end loop;
        return;
    END get_publish_schema;

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

    FUNCTION Is_Printable_DATA_Type (
        p_Data_Type IN VARCHAR2
    ) RETURN VARCHAR2 DETERMINISTIC 
    IS 
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
    BEGIN 
        RETURN case when p_Data_Type IN ('BINARY_DOUBLE', 'BINARY_FLOAT', 'BINARY_INTEGER', 'BLOB', 'BOOLEAN',
                'CHAR', 'CLOB', 'DATE', 'FLOAT', 'INTERVAL DAY TO SECOND', 'INTERVAL YEAR TO MONTH', 
                'NCHAR', 'NCLOB', 'NUMBER', 'NVARCHAR2', 'RAW', 'REAL', 'PLS_INTEGER',
                'PL/SQL BOOLEAN', 'ROWID', 'TIME', 'TIME WITH TIME ZONE', 'TIMESTAMP', 'TIMESTAMP WITH LOCAL TIME ZONE', 
                'TIMESTAMP WITH TIME ZONE', 'UROWID', 'VARCHAR2') then 'YES' else 'NO' end;
    END Is_Printable_DATA_Type;
	
	FUNCTION Literal_Call (
		p_Argument_Name VARCHAR2, 
		p_Formatted_Name VARCHAR2,
		p_Data_Type VARCHAR2,
		p_Record_Conversion VARCHAR2 DEFAULT NULL,
		p_value_max_length INTEGER DEFAULT api_trace.c_value_max_length
	) RETURN VARCHAR2 
	IS 
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
	BEGIN 
		RETURN case 
			when p_Data_Type IN ('TABLE', 'PL/SQL TABLE', 'VARRAY') then -- Nested table type, Index-by (PL/SQL) table type
				p_Formatted_Name 
				|| '.COUNT || '
				|| Enquote_Literal(' rows') 
			when p_Data_Type IN ('RECORD', 'PL/SQL RECORD')
			and p_Record_Conversion IS NOT NULL then 
				p_Record_Conversion || '(' || p_Formatted_Name || ')'
			when Is_Printable_DATA_Type(p_Data_Type) = 'YES' then
				'api_trace.'
				|| case when p_Argument_Name MEMBER OF g_Hidden_Arguments_Array
					then 'Literal_PWD'
				when p_Data_Type = 'RAW'
					then 'Literal_RAW' 
					else 'Literal' 
				end
				|| '(' || p_Formatted_Name 
				|| case when p_value_max_length != api_trace.c_value_max_length then ', ' || api_trace.c_value_max_length end
				|| ')'
			else 
				Enquote_Literal('<datatype '||p_Data_Type||'>')
		end;
	END Literal_Call;

   /* build an expression that captures the parameters of an package procedure for logging.
       execute with output: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call(NULL) USING OUT v_log_message, IN <param...>
       execute with apex_debug: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call USING <param...>
       the count of the arguments will be checked at runtime.
    */
    FUNCTION Format_Call_Parameter (
        p_Object_Name IN VARCHAR2,
        p_Object_Owner IN VARCHAR2,
        p_Procedure_Name IN VARCHAR2,
        p_Subprogram_ID IN NUMBER,
        p_calling_subprog VARCHAR2,
        p_synonym_name VARCHAR2 DEFAULT NULL,
        p_value_max_length INTEGER DEFAULT api_trace.c_value_max_length,
        p_bind_char VARCHAR2 DEFAULT ':',
        p_overload INTEGER DEFAULT 0,
        p_in_out VARCHAR2 DEFAULT 'IN/OUT', -- IN, OUT, IN/OUT
        p_return_variable VARCHAR2 DEFAULT NULL -- optional name of the variable containing the function result. Usually 'lv_result'
    ) RETURN VARCHAR2
    IS
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
        c_newline CONSTANT VARCHAR2(10) := 'chr(10)'||chr(10);
        v_argument_per_line CONSTANT NUMBER := 7;
        c_conop CONSTANT VARCHAR2(10) := ' || ';
        v_argument_name VARCHAR2(200);
        v_offset NUMBER;
        v_result_str VARCHAR2(32767);
        v_returns_str VARCHAR2(32767);
        v_subprog VARCHAR2(32767);
        v_count   INTEGER := 0;

   BEGIN 
        for c_cur in (
           SELECT PACKAGE_NAME, OWNER, OBJECT_NAME PROCEDURE_NAME, SUBPROGRAM_ID,
                    IN_OUT, ARGUMENT_NAME, POSITION, PLS_TYPE, DATA_TYPE,
                    case when DATA_TYPE = 'PL/SQL RECORD' 
                    	and TYPE_OBJECT_TYPE = 'PACKAGE' 
                    then 'Log_' || TYPE_SUBNAME
                    end RECORD_CONVERSION
            FROM SYS.ALL_ARGUMENTS  
            WHERE OWNER = p_Object_Owner
            AND PACKAGE_NAME = p_Object_Name
            AND OBJECT_NAME = p_Procedure_Name
            AND SUBPROGRAM_ID = p_Subprogram_ID
            AND DATA_LEVEL = 0 
            ORDER BY POSITION
        ) 
        loop 
            exit when length(v_result_str) > 32000; 
            if (c_cur.IN_OUT != 'IN' or p_in_out IN ('IN', 'IN/OUT')) 
            and c_cur.ARGUMENT_NAME IS NOT NULL then
                v_count := v_count + 1;
                v_argument_name := api_trace.Formatted_Name(c_cur.ARGUMENT_NAME);
                if v_result_str IS NOT NULL then 
                    v_result_str := v_result_str 
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
                    || Literal_Call (
						p_Argument_Name => c_cur.ARGUMENT_NAME, 
						p_Formatted_Name => p_bind_char || v_argument_name,
						p_Data_Type => c_cur.DATA_TYPE,
						p_Record_Conversion => c_cur.RECORD_CONVERSION,
						p_value_max_length => p_value_max_length
					);
                end if;
            elsif c_cur.ARGUMENT_NAME IS NULL 
            and p_return_variable IS NOT NULL then 
            	v_returns_str := chr(10)
				|| '    ' || c_conop
				|| Enquote_Literal(' Returns ') 
				|| c_conop
				|| Literal_Call (
					p_Argument_Name => p_return_variable, 
					p_Formatted_Name => p_bind_char || api_trace.Formatted_Name(p_return_variable),
					p_Data_Type => c_cur.DATA_TYPE,
					p_Record_Conversion => c_cur.RECORD_CONVERSION,
					p_value_max_length => p_value_max_length
				);            
            end if;
        end loop;
        v_subprog := lower(case when p_Synonym_Name IS NOT NULL then p_Synonym_Name else p_calling_subprog end);
        if v_result_str IS NOT NULL then 
            v_result_str := Enquote_Literal(v_subprog || '(') || chr(10)
            || '    ' || c_conop || v_result_str || c_conop || Enquote_Literal(')');
        else 
            v_result_str := Enquote_Literal(v_subprog);
        end if;
        RETURN v_result_str || v_returns_str;
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

	FUNCTION NL(p_Indent PLS_INTEGER) RETURN VARCHAR2
	is
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
	begin
		return chr(10) || RPAD(' ', p_Indent);
	end NL;
    FUNCTION INDENT(p_Text VARCHAR2, p_Indent PLS_INTEGER) RETURN VARCHAR2
	is
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
	begin
		return replace(chr(10)||replace(p_Text, chr(9), '    '), chr(10), NL(p_Indent));
	end INDENT;
    
    FUNCTION Replace_Substitution (
    	p_String IN VARCHAR2,
    	p_Procedure_Name IN VARCHAR2,
    	p_Package_Name IN VARCHAR2,
    	p_Return_Type IN VARCHAR2
    ) return VARCHAR2 
    is
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
    	p_Result VARCHAR2(32767);
    begin
    	p_Result := REPLACE(p_String, '#PROCEDURE_NAME#', INITCAP(p_Procedure_Name));
    	p_Result := REPLACE(p_Result, '#PACKAGE_NAME#', INITCAP(p_Package_Name));
    	p_Result := REPLACE(p_Result, '#SUBPROGRAM#', INITCAP(p_Package_Name) || '.' || INITCAP(p_Procedure_Name));
    	p_Result := REPLACE(p_Result, '#RETURN_TYPE#', p_Return_Type);
    	p_Result := REPLACE(p_Result, '#PROCEDURE_TYPE#', case when p_Return_Type IS NULL then 'Procedure' else 'Function' end);
    	p_Result := REPLACE(p_Result, '#SYSDATE#', TO_CHAR(SYSDATE, 'YYYYMMDD'));
    	return p_Result;
    end Replace_Substitution;
    
    FUNCTION Logging_Call_Parameter (
    	p_Logging_Call IN VARCHAR2,
    	p_Default_Call IN VARCHAR2,
    	p_Overload IN INTEGER
    ) return VARCHAR2
    is
        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN
            PRAGMA UDF;
        $END
    	p_Result VARCHAR2(32767);
    begin
    	if p_Overload IS NOT NULL or p_Logging_Call != p_Default_Call then 
    		if p_Logging_Call != p_Default_Call then 
    			p_Result := 'p_Logging_Call => ' || Enquote_Literal( p_Logging_Call ); 
    		end if;
    		if p_Overload is not null then 
    			p_Result := p_Result || case when p_Result IS NOT NULL then ', ' end
    			|| 'p_Overload => ' || p_Overload; 
    		end if;
    		p_Result := '(' || p_Result || ')';
    	end if;
    	return p_Result;
    end Logging_Call_Parameter;
    
    FUNCTION Dyn_Log_Call_List (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
        p_Compact IN VARCHAR2 DEFAULT 'Y', --Y/N
        p_Logging_Start_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,
        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,
        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,
        p_Logging_Exception_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Logging_API_Exception IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Exception,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_result',
        p_Condition_Start IN VARCHAR2 DEFAULT c_APEX_Condition_Start,
        p_Condition_End IN VARCHAR2 DEFAULT c_APEX_Condition_End,
        p_Condition_Enabled VARCHAR2 DEFAULT 'N', --Y/N
        p_Before_Each_Procedure VARCHAR2 DEFAULT NULL,
        p_After_Each_Procedure VARCHAR2 DEFAULT NULL,
        p_Indent IN NUMBER DEFAULT 8
    )
    RETURN tab_logging_calls PIPELINED
    IS
        v_Package_Name VARCHAR2(128) := UPPER(p_Package_Name);
        v_Package_Owner VARCHAR2(128) := p_Package_Owner;
        v_Condition_Start CONSTANT VARCHAR2(1000) := case when p_Condition_Start IS NOT NULL and p_Condition_Enabled = 'Y' then NL(p_Indent + 4) || p_Condition_Start end;
        v_Condition_End CONSTANT VARCHAR2(1000) := case when p_Condition_End IS NOT NULL and p_Condition_Enabled = 'Y' then NL(p_Indent + 4) || p_Condition_End end;
		v_Indent NUMBER := case when v_Condition_End IS NOT NULL then p_Indent + 8 ELSE p_Indent + 4 end;
        v_Header CLOB;
        
        CURSOR all_proc_cur
        IS
        WITH RETURN_Q AS (
        	SELECT A.PACKAGE_NAME, A.OWNER, A.OBJECT_NAME PROCEDURE_NAME, A.SUBPROGRAM_ID, A.IN_OUT,
                PLS_TYPE RETURN_PLS_TYPE,
                DATA_TYPE RETURN_DATA_TYPE,
				CASE WHEN A.TYPE_NAME IS NOT NULL THEN 
					CASE WHEN A.DATA_TYPE = 'REF' THEN ' ref ' END
					|| CASE WHEN (S.SYNONYM_NAME IS NULL OR A.TYPE_OBJECT_TYPE = 'PACKAGE')
						AND TYPE_OWNER NOT IN (v_Package_Owner, 'PUBLIC') THEN TYPE_OWNER||'.' END 
					|| A.TYPE_NAME 
					|| CASE WHEN A.TYPE_SUBNAME IS NOT NULL THEN '.'||A.TYPE_SUBNAME END 
				WHEN A.DATA_TYPE = 'REF CURSOR' THEN 'SYS_REFCURSOR' 
				ELSE 
					A.PLS_TYPE 
				END 
				|| case when A.CHAR_USED != '0' or A.PLS_TYPE = 'RAW' 
					then '(32767)' 
				end RETURN_TYPE
        	FROM SYS.ALL_ARGUMENTS A
			LEFT OUTER JOIN SYS.All_Synonyms S 
				ON S.SYNONYM_NAME = A.TYPE_NAME
				AND S.OWNER IN (v_Package_Owner, 'PUBLIC') -- important
				AND S.TABLE_NAME = A.TYPE_NAME
            WHERE DATA_LEVEL = 0              
            AND POSITION = 0
        	AND ARGUMENT_NAME IS NULL
        ), ARGUMENTS_Q AS (
            SELECT PACKAGE_NAME, OWNER, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD,
                LISTAGG(CASE WHEN POSITION > 0 then PRINT_ARGUMENT_NAME END, ',') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST,
                LISTAGG(PRINT_ARGUMENT_NAME, ',') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST_FN,
                LISTAGG(CASE WHEN IN_OUT IN ('IN') THEN PRINT_ARGUMENT_NAME END, ',') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST_IN,
                LISTAGG(CASE WHEN IN_OUT IN ('IN/OUT', 'OUT') THEN PRINT_ARGUMENT_NAME END, ',') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST_OUT,
                COUNT(DISTINCT CASE WHEN IN_OUT IN ('IN/OUT', 'OUT') THEN PRINT_ARGUMENT_NAME END) OUT_COUNT,
                COUNT(*) ARGS_COUNT
            FROM (
            	SELECT PACKAGE_NAME, OWNER, OBJECT_NAME, SUBPROGRAM_ID, POSITION,
            		OVERLOAD, IN_OUT, 
            		case when ARGUMENT_NAME IS NULL then 1000+SEQUENCE -- return type in last position
            			else SEQUENCE 
            		end SEQUENCE, 
            		ARGUMENT_NAME,
            		CASE WHEN package_tracer.Is_Printable_DATA_Type(A.DATA_TYPE) = 'YES' THEN 
						LOWER(NVL(ARGUMENT_NAME, p_Variable_Name))
					WHEN A.DATA_TYPE IN ('TABLE', 'PL/SQL TABLE', 'VARRAY') AND ARGUMENT_NAME IS NULL THEN 
						p_Variable_Name || '.COUNT'
            		END PRINT_ARGUMENT_NAME
				FROM SYS.ALL_ARGUMENTS A
				WHERE DATA_LEVEL = 0 
			)
            GROUP BY PACKAGE_NAME, OWNER, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD
        )
        SELECT PRO.OBJECT_NAME PACKAGE_NAME, 
        	PRO.PROCEDURE_NAME OBJECT_NAME, 
        	PRO.SUBPROGRAM_ID, PRO.OVERLOAD,
            INITCAP(PRO.PROCEDURE_NAME) PROCEDURE_NAME, 
			TO_CLOB(INDENT(HEADER||chr(10), p_Indent))
			|| 'is' 
            || CASE WHEN p_Compact = 'Y' and p_Logging_Start_Enabled = 'Y' THEN 
            	PRO_BEGIN
                || v_Condition_Start
                || NL(v_Indent)
                || 'EXECUTE IMMEDIATE api_trace.Dyn_Log_Start'
                || case when PRO.OVERLOAD is not null then '(p_overload => ' || PRO.OVERLOAD || ')' end
                || case when PARAM_LIST_IN IS NOT NULL then 
                    NL(v_Indent)
                    || 'USING '
                    || PARAM_LIST_IN
                end
                || ';' 
                || v_Condition_End
                || NL(p_Indent + 4) || '----' 
                || v_Condition_Start
                || NL(v_Indent)
                || 'EXECUTE IMMEDIATE api_trace.Dyn_Log_Exit'
                || case when PRO.OVERLOAD is not null then '(p_overload => ' || PRO.OVERLOAD || ')' end
                || case when PARAM_LIST_OUT IS NOT NULL then 
                    NL(v_Indent)
                    || 'USING '
                    || PARAM_LIST_OUT
                end
                || ';' 
                || v_Condition_End
                || PRO_RETURN
                || case when p_Logging_Exception_Enabled = 'Y' then 
					PRO_EXCEPTION
					|| NL(p_Indent + 4)
					|| 'EXECUTE IMMEDIATE api_trace.Dyn_Log_Exception'
					|| case when PRO.OVERLOAD is not null then '(p_overload => ' || PRO.OVERLOAD || ')' end
					|| case when PARAM_LIST IS NOT NULL then 
						NL(p_Indent + 4)
						|| 'USING '
						|| PARAM_LIST
					end
					|| ';' 
					|| NL(p_Indent + 4) || 'RAISE;'
                end
                || PRO_END
            WHEN p_Compact = 'Y' and p_Logging_Start_Enabled = 'N' THEN 
            	PRO_BEGIN
                || NL(p_Indent + 4) || '----' 
                || v_Condition_Start
                || NL(v_Indent)
            	|| case when PRO.RETURN_TYPE IS NOT NULL then 
 					'EXECUTE IMMEDIATE api_trace.Dyn_Log_Function_Call'
 				else 
                	'EXECUTE IMMEDIATE api_trace.Dyn_Log_Call'
            	end
                || case when PRO.OVERLOAD is not null then '(p_overload => ' || PRO.OVERLOAD || ')' end
            	|| case when PRO.RETURN_TYPE IS NOT NULL then 
                    NL(v_Indent)
                    || 'USING '
                    || PARAM_LIST_FN
            	when PARAM_LIST IS NOT NULL then 
                    NL(v_Indent)
                    || 'USING '
                    || PARAM_LIST
                end
                || ';' 
                || v_Condition_End
                || PRO_RETURN
                || case when p_Logging_Exception_Enabled = 'Y' then 
					PRO_EXCEPTION
					|| NL(p_Indent + 4)
					|| 'EXECUTE IMMEDIATE api_trace.Dyn_Log_Exception'
					|| case when PRO.OVERLOAD is not null then '(p_overload => ' || PRO.OVERLOAD || ')' end
					|| case when PARAM_LIST IS NOT NULL then 
						NL(p_Indent + 4)
						|| 'USING '
						|| PARAM_LIST
					end
					|| ';' 
					|| NL(p_Indent + 4) || 'RAISE;'
                end
                || PRO_END
            WHEN p_Compact = 'N' and p_Logging_Start_Enabled = 'Y' THEN 
            	PRO_BEGIN
                || v_Condition_Start
                || INDENT(replace(
                	Logging_Start_Call, '%s',
                    Format_Call_Parameter(
						p_Object_Name => v_Package_Name,
						p_Object_Owner => v_Package_Owner,
						p_Procedure_Name => PROCEDURE_NAME,
						p_Subprogram_ID => SUBPROGRAM_ID,
                        p_calling_subprog => CALLING_SUBPROG,
                        p_synonym_name => PACKAGE_PROCEDURE_NAME,
                        p_bind_char => null,
                        p_overload => PRO.OVERLOAD,
                        p_in_out => 'IN'
                    )
                ), v_Indent)
                || v_Condition_End
                || NL(p_Indent + 4) || '----' 
                || v_Condition_Start
                || INDENT(replace(
                    Logging_Finish_Call, '%s',
					Format_Call_Parameter(
						p_Object_Name => v_Package_Name,
						p_Object_Owner => v_Package_Owner,
						p_Procedure_Name => PROCEDURE_NAME,
						p_Subprogram_ID => SUBPROGRAM_ID,
						p_calling_subprog => CALLING_SUBPROG,
                        p_synonym_name => PACKAGE_PROCEDURE_NAME,
						p_bind_char => null,
						p_overload => PRO.OVERLOAD,
						p_in_out => 'OUT', 
						p_return_variable => 
							case when RETURN_TYPE IS NOT NULL
							then p_Variable_Name end
					)
                ), v_Indent)
                || v_Condition_End 
            	|| PRO_RETURN
                || case when p_Logging_Exception_Enabled = 'Y' then 
                	PRO_EXCEPTION
					|| INDENT(replace(
							Logging_API_Exception, '%s',
							Format_Call_Parameter(
								p_Object_Name => v_Package_Name,
								p_Object_Owner => v_Package_Owner,
								p_Procedure_Name => PROCEDURE_NAME,
								p_Subprogram_ID => SUBPROGRAM_ID,
								p_calling_subprog => CALLING_SUBPROG,
								p_synonym_name => PACKAGE_PROCEDURE_NAME,
								p_bind_char => null,
								p_overload => PRO.OVERLOAD,
								p_in_out => 'IN/OUT'
							) || chr(10) || '     || ' || c_format_error_function
						), p_Indent + 4
					)
					|| NL(p_Indent + 4) || 'RAISE;'
                end
                || PRO_END
            WHEN p_Compact = 'N' and p_Logging_Start_Enabled = 'N' THEN 
            	PRO_BEGIN
                || NL(p_Indent + 4) || '----' 
                || v_Condition_Start
                || INDENT(replace(
                    Logging_API_Call, '%s',
                    Format_Call_Parameter(
						p_Object_Name => v_Package_Name,
						p_Object_Owner => v_Package_Owner,
						p_Procedure_Name => PROCEDURE_NAME,
						p_Subprogram_ID => SUBPROGRAM_ID,
                        p_calling_subprog => CALLING_SUBPROG,
                        p_synonym_name => PACKAGE_PROCEDURE_NAME,
                        p_bind_char => null,
                        p_overload => PRO.OVERLOAD,
                        p_in_out => 'IN/OUT', 
                        p_return_variable => 
                        	case when RETURN_TYPE IS NOT NULL
							then p_Variable_Name end
                    )
                ), v_Indent)
                || v_Condition_End 
             	|| PRO_RETURN
                || case when p_Logging_Exception_Enabled = 'Y' then 
               		PRO_EXCEPTION
					|| INDENT(replace(
							Logging_API_Exception, '%s',
							Format_Call_Parameter(
								p_Object_Name => v_Package_Name,
								p_Object_Owner => v_Package_Owner,
								p_Procedure_Name => PROCEDURE_NAME,
								p_Subprogram_ID => SUBPROGRAM_ID,
								p_calling_subprog => CALLING_SUBPROG,
								p_synonym_name => PACKAGE_PROCEDURE_NAME,
								p_bind_char => null,
								p_overload => PRO.OVERLOAD,
								p_in_out => 'IN/OUT'
							) || chr(10) || '     || ' || c_format_error_function
						), p_Indent + 4
					)
					|| NL(p_Indent + 4) || 'RAISE;'
                end
                || PRO_END
            END LOGGING_CALL
		FROM (
			SELECT PRO.OBJECT_NAME, 
				PRO.OWNER, 
				PRO.PROCEDURE_NAME, 
				PRO.SUBPROGRAM_ID,
				PRO.OVERLOAD,
				PRO.PIPELINED, PRO.AGGREGATE,
				Replace_Substitution(
                	p_String => p_Before_Each_Procedure,
					p_Procedure_Name => PRO.PROCEDURE_NAME,
					p_Package_Name => PRO.OBJECT_NAME,
					p_Return_Type => RET.RETURN_TYPE
                )
                || NVL(REGEXP_SUBSTR (v_Header,  
					'('
                    || case when RET.IN_OUT = 'OUT' then 
                        'FUNCTION' 
                        || '\s+'||PRO.PROCEDURE_NAME
                        || case when ARG.ARGS_COUNT > 1 then '\s*\(.+?\)' end
                        || '\s*RETURN\s+.*?'
                      else 
                        'PROCEDURE' 
                        || '\s+'||PRO.PROCEDURE_NAME
                        || case when ARG.ARGS_COUNT > 0 then '\s*\(.+?\)' end
                        || '\s*'
                    end
                    || ');',
					1, 
					DENSE_RANK() OVER (PARTITION BY PRO.PROCEDURE_NAME, RET.IN_OUT, SIGN(ARG.ARGS_COUNT) ORDER BY PRO.SUBPROGRAM_ID),
					'in', 1
					),
					case when RET.IN_OUT = 'OUT' then 
						'FUNCTION' 
						|| ' ' || PRO.PROCEDURE_NAME
						|| case when ARG.ARGS_COUNT > 1 then '(' || PARAM_LIST || ')' end
						|| ' RETURN ' || RET.RETURN_TYPE
					else 
						'PROCEDURE' 
						|| ' ' || PRO.PROCEDURE_NAME
						|| case when ARG.ARGS_COUNT > 0 then '(' || PARAM_LIST || ')' end
					end
					|| '; '
				) AS HEADER, -- find original procedure header with parameter default values
            	case when RET.RETURN_TYPE IS NOT NULL then 
            		NL(p_Indent + 4) || p_Variable_Name || ' ' || LOWER(RET.RETURN_TYPE) || ';'
            	end
            	|| NL(p_Indent) || 'begin'
				AS PRO_BEGIN,
				case when RETURN_TYPE IS NOT NULL
            		and PRO.PIPELINED = 'NO'
            		and PRO.AGGREGATE = 'NO' then 
            			NL(p_Indent + 4) || 'return ' || p_Variable_Name || ';'
            	end AS PRO_RETURN,
				INDENT('end ' || LOWER(PRO.PROCEDURE_NAME) || ';' || chr(10)
					|| Replace_Substitution(
						p_String => p_After_Each_Procedure,
						p_Procedure_Name => PRO.PROCEDURE_NAME,
						p_Package_Name => PRO.OBJECT_NAME,
						p_Return_Type => RET.RETURN_TYPE
					), p_Indent
                ) AS PRO_END,
                NL(p_Indent) 
                || 'exception ' 
                || case when PIPELINED = 'YES' then 
                	NL(p_Indent + 2)
                	|| 'when NO_DATA_NEEDED then' || NL(p_Indent + 4)
     				|| 'NULL;'
                end
                || NL(p_Indent + 2) || 'when OTHERS then '
                AS PRO_EXCEPTION,
				PRO.OWNER || '.' || PRO.OBJECT_NAME || '.' || PRO.PROCEDURE_NAME CALLING_SUBPROG,
				INITCAP(PRO.OBJECT_NAME) || '.' || INITCAP(PRO.PROCEDURE_NAME) PACKAGE_PROCEDURE_NAME,
                ARG.PARAM_LIST, ARG.PARAM_LIST_FN, ARG.PARAM_LIST_IN, ARG.PARAM_LIST_OUT, ARG.OUT_COUNT, 
                RET.RETURN_PLS_TYPE, RET.RETURN_DATA_TYPE, 
                RET.RETURN_TYPE,
                Replace_Substitution(
                	p_String => p_Logging_API_Call,
					p_Procedure_Name => PRO.PROCEDURE_NAME,
					p_Package_Name => PRO.OBJECT_NAME,
					p_Return_Type => RET.RETURN_TYPE
                ) Logging_API_Call,
                Replace_Substitution(
                	p_String => p_Logging_Start_Call,
					p_Procedure_Name => PRO.PROCEDURE_NAME,
					p_Package_Name => PRO.OBJECT_NAME,
					p_Return_Type => RET.RETURN_TYPE
                ) Logging_Start_Call,
                Replace_Substitution(
                	p_String => p_Logging_Finish_Call,
					p_Procedure_Name => PRO.PROCEDURE_NAME,
					p_Package_Name => PRO.OBJECT_NAME,
					p_Return_Type => RET.RETURN_TYPE
                ) Logging_Finish_Call,
                Replace_Substitution(
                	p_String => p_Logging_API_Exception,
					p_Procedure_Name => PRO.PROCEDURE_NAME,
					p_Package_Name => PRO.OBJECT_NAME,
					p_Return_Type => RET.RETURN_TYPE
                ) Logging_API_Exception
			FROM SYS.ALL_PROCEDURES PRO
			LEFT OUTER JOIN ARGUMENTS_Q ARG 
					ON PRO.OBJECT_NAME = ARG.PACKAGE_NAME
					AND PRO.OWNER = ARG.OWNER
					AND PRO.PROCEDURE_NAME = ARG.OBJECT_NAME
					AND PRO.SUBPROGRAM_ID = ARG.SUBPROGRAM_ID
			LEFT OUTER JOIN RETURN_Q RET -- get return type of functions 
					ON PRO.OBJECT_NAME = RET.PACKAGE_NAME
					AND PRO.OWNER = RET.OWNER
					AND PRO.PROCEDURE_NAME = RET.PROCEDURE_NAME
					AND PRO.SUBPROGRAM_ID = RET.SUBPROGRAM_ID
			WHERE PRO.OBJECT_NAME = v_Package_Name
			AND PRO.OWNER = v_Package_Owner
			AND PRO.OBJECT_TYPE = 'PACKAGE'
			AND PRO.PROCEDURE_NAME IS NOT NULL
		) PRO
        ORDER BY PRO.SUBPROGRAM_ID, PRO.OVERLOAD;

        v_row rec_logging_calls;
    BEGIN
        dbms_lob.createtemporary(v_Header, true, dbms_lob.call);

        v_Header := Get_Package_Source(
            p_Package_Name => v_Package_Name,
            p_Package_Owner => v_Package_Owner
        );
        -- remove PRAGMA clauses
        v_Header := REGEXP_REPLACE(v_Header, 'PRAGMA\s+\w+\s*\(.+?\);', '', 1, 0, 'i');
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
        p_Type IN VARCHAR2 DEFAULT 'PACKAGE',
        p_Strip_Comments IN VARCHAR2 DEFAULT 'Y'
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
        	select TEXT, LINE 
        	from (
				SELECT TEXT, LINE, ORIGIN_CON_ID, MIN(ORIGIN_CON_ID) OVER (PARTITION BY Owner, Name, type) MIN_ORIGIN_CON_ID
				FROM SYS.All_Source 
				where Owner = p_Package_Owner
				and Name = p_Package_Name
				and type = p_Type
			) where ORIGIN_CON_ID = MIN_ORIGIN_CON_ID -- important !!
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
		if p_Strip_Comments = 'Y' then
			-- remove leading blanks
			v_Clob := LTRIM(v_Clob, chr(10)||chr(32));
			-- remove comments
			v_Clob := REGEXP_REPLACE(v_Clob, '^--.*$', '', 1, 0, 'm');
			v_Clob := REGEXP_REPLACE(v_Clob, '/\*.+?\*/', '', 1, 0, 'n');
			v_Clob := REGEXP_REPLACE(v_Clob, '\s*--.*$', '', 1, 0, 'm');
			-- remove empty lines
			v_Clob := REGEXP_REPLACE(v_Clob, chr(10)||'{2,}', chr(10), 1, 0, 'm');
		end if;
        return v_Clob; 
    END Get_Package_Source;

    FUNCTION Get_Package_Spec  (
        p_Object_Name IN VARCHAR2,
        p_Object_Owner IN VARCHAR2,
        p_Editionable  IN VARCHAR2,
        p_Package_Name IN VARCHAR2,
        p_Package_Owner  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
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
            Log_Elapsed_Time(v_Timemark, '-- Get_Package_Spec: get package source');    
        end if;
        if p_Object_Owner != p_Package_Owner then 
          v_Clob := REPLACE(v_Clob, Enquote_Name(p_Object_Owner), Enquote_Name(p_Package_Owner));
        end if;
        if p_Object_Name != p_Package_Name then 
          v_Clob := REPLACE(v_Clob, Enquote_Name(p_Object_Name), Enquote_Name(p_Package_Name));
          v_Clob := REGEXP_REPLACE(v_Clob, 'end\s+'||p_Object_Name, 'end '||p_Package_Name, 1, 0, 'i');
        end if;    
        -- remove PRAGMA clauses
        v_Clob := REGEXP_REPLACE(v_Clob, 'PRAGMA\s+\w+\s*\(.+?\);', '', 1, 0, 'i');
        
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Get_Package_Spec: normalize source');      
        end if;
        -- add comment
      v_Clob := REGEXP_REPLACE(v_Clob, 
        '(package\s+'||Enquote_Name(p_Package_Owner) || '\.' || Enquote_Name(p_Package_Name) || '.*?\s(is|as)\s)',
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
            p_Package_Owner => p_Package_Owner,
            p_Strip_Comments => 'N'
        );

        v_Comment := REGEXP_SUBSTR(v_Clob, '^-- It replaces : (.+)$', 1, 1, 'im', 1);
        return v_Comment;
    END Get_Package_Synonym_Text;

	-- list record and table types of a package
    FUNCTION Pipe_Record_types (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ) RETURN tab_record_fields PIPELINED
    IS 
        v_Clob CLOB;
        v_Subtypes_Pattern CONSTANT VARCHAR2(100) := '\s+SUBTYPE\s+(\w+)\s+IS\s+(.+?);';
        v_Types_Pattern CONSTANT VARCHAR2(100) := '\s+TYPE\s+(\w+)\s+IS\s+';
        v_Record_Pattern CONSTANT VARCHAR2(100) := '\s+TYPE\s+(\w+)\s+IS\s+RECORD\s*\((.+?)\);';
        v_Record_Type VARCHAR2(1000);
        v_Record_Text VARCHAR2(32767);
        TYPE t_Record_Type IS TABLE OF VARCHAR2(1) INDEX BY VARCHAR2(1024);
        v_Types_List t_Record_Type :=  t_Record_Type();
        TYPE t_Sub_Type IS TABLE OF VARCHAR2(1024) INDEX BY VARCHAR2(1024);
        v_Subtypes_List t_Sub_Type :=  t_Sub_Type();
        TYPE t_Type_Object_Type IS TABLE OF VARCHAR2(20) INDEX BY VARCHAR2(1024);
        v_Object_Type_List t_Type_Object_Type :=  t_Type_Object_Type();
        v_Item_Pattern CONSTANT VARCHAR2(100) := '(\S+)\s+(.+?(\(\S+?\))?)\s*(,|$)'; 
		v_Item_Name VARCHAR2(1000);
		v_Item_Type VARCHAR2(1000);
		v_Index_by VARCHAR2(1000);
        v_Data_Type VARCHAR2(1000);
		v_Item_Sequence PLS_INTEGER;
        v_Table_Pattern CONSTANT VARCHAR2(100) := '\s+TYPE\s+(\w+)\s+IS\s+TABLE\s+OF\s*(\S+)\s*;';
        v_Varray_Pattern CONSTANT VARCHAR2(100) := '\s+TYPE\s+(\w+)\s+IS\s+VARRAY\s*\((\S+)\)\s*OF\s+(\S+);';
        v_PL_Table_Pattern CONSTANT VARCHAR2(100) := '\s+TYPE\s+(\w+)\s+IS\s+TABLE\s+OF\s*(\S+)\s+INDEX BY\s+(\S+);';
        v_Data_Type_Pattern CONSTANT VARCHAR2(100) := '(\(\S+\))?(\s+(DEFAULT|RANGE|:=).*)?';
		v_out_row rec_record_fields;
        v_Timemark NUMBER := dbms_utility.get_time;
        v_Offset PLS_INTEGER;
        v_Offset2 PLS_INTEGER;
    BEGIN 
 		dbms_lob.createtemporary(v_Clob, true, dbms_lob.call);
        v_Clob := Get_Package_Source(
            p_Package_Name => p_Package_Name,
            p_Package_Owner => p_Package_Owner
        );
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Pipe_Record_types Get_Package_Source ');       
        end if;
		-- load depended object types 
		for cur in (
			select lower(Da.referenced_Name) Type_Name
			from SYS.ALL_DEPENDENCIES DA 
			where DA.owner = p_Package_Owner
			and DA.name = p_Package_Name
			and DA.type = 'PACKAGE'
			and DA.referenced_Type = 'TYPE'
		) loop 
			v_Types_List(cur.Type_Name) := 'Y';
			v_Object_Type_List(cur.Type_Name) := 'TYPE';
		end loop;
		-- parse source for all subtypes
		v_Offset := 1;
		for ind in 1..1000 loop
			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_Subtypes_Pattern, v_Offset, 1, 'in', 1);
			exit when v_Record_Type IS NULL;
			v_Record_Text := REGEXP_SUBSTR(v_Clob, v_Subtypes_Pattern, v_Offset, 1, 'in', 2);
			v_Data_Type := REGEXP_REPLACE(upper(v_Record_Text), v_Data_Type_Pattern);
			v_Subtypes_List(lower(v_Record_Type)) := v_Data_Type;
			v_Offset := REGEXP_INSTR(v_Clob, v_Subtypes_Pattern, v_Offset, 1, 1, 'in');
		end loop;
		-- parse source for all types
		v_Offset := 1;
		for ind in 1..1000 loop
			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_Types_Pattern, v_Offset, 1, 'in', 1);
			exit when v_Record_Type IS NULL;
			v_Types_List(lower(v_Record_Type)) := 'N';
			v_Object_Type_List(lower(v_Record_Type)) := 'PACKAGE';
			v_Offset := REGEXP_INSTR(v_Clob, v_Types_Pattern, v_Offset, 1, 1, 'in');
		end loop;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Pipe_Record_types found '||v_Types_List.count||' types');       
        end if;
        if v_Types_List.count = 0 then 
        	return;
        end if;
		-- record types
		v_Offset := 1;
		for ind in 1..1000 loop
			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_Record_Pattern, v_Offset, 1, 'in', 1);
			exit when v_Record_Type IS NULL;
			v_Record_Text := REGEXP_SUBSTR(v_Clob, v_Record_Pattern, v_Offset, 1, 'in', 2);
			v_Offset2 := 1;
			v_Item_Sequence := 1;
			for ind2 in 1..1000 loop
				v_Item_Name := REGEXP_SUBSTR(v_Record_Text, v_Item_Pattern, v_Offset2, 1, 'im', 1);
				exit when v_Item_Name IS NULL;
				v_Item_Name := SUBSTR(v_Item_Name, 1, 128);
				v_Item_Type := REGEXP_SUBSTR(v_Record_Text, v_Item_Pattern, v_Offset2, 1, 'im', 2);
				v_Item_Type := SUBSTR(v_Item_Type, 1, 512);
				v_out_row.Type_name	:= v_Record_Type;
				v_out_row.Item_Name	:= v_Item_Name;
				v_out_row.Item_Type	:= v_Item_Type;
				v_out_row.Item_Sequence := v_Item_Sequence;
				v_out_row.Index_by  := null;
				v_out_row.Table_Type := 'RECORD';
				v_Item_Type := lower(v_Item_Type);
				if v_Subtypes_List.EXISTS(v_Item_Type) then 
					v_out_row.Data_type := v_Subtypes_List(v_Item_Type);
				else
					v_out_row.Data_type := REGEXP_REPLACE(upper(v_Item_Type), v_Data_Type_Pattern);
				end if;
				if v_Types_List.EXISTS(v_Item_Type) then 
					v_out_row.Type_Object_Type := v_Object_Type_List(v_Item_Type);
					if v_out_row.Type_Object_Type = 'TYPE' then
						v_out_row.Nested_Table := 'N';				
					else 
						v_out_row.Nested_Table := 'Y';
						v_Types_List(lower(v_Record_Type)) := 'Y';
					end if;
				else 
					v_out_row.Type_Object_Type := 'PACKAGE';
					v_out_row.Nested_Table := 'N';
				end if;
				PIPE ROW(v_out_row);
				v_Offset2 := REGEXP_INSTR(v_Record_Text, v_Item_Pattern, v_Offset2, 1, 1, 'im');
				v_Item_Sequence := v_Item_Sequence + 1;
			end loop;
			v_Offset := REGEXP_INSTR(v_Clob, v_Record_Pattern, v_Offset, 1, 1, 'in');
		end loop;
        -- table types
		v_Offset := 1;
		for ind in 1..1000 loop
			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_Table_Pattern, v_Offset, 1, 'in', 1);
			exit when v_Record_Type IS NULL;
			v_Types_List(lower(v_Record_Type)) := 'Y';
			v_Item_Type := REGEXP_SUBSTR(v_Clob, v_Table_Pattern, v_Offset, 1, 'in', 2);
			v_out_row.Type_name	:= v_Record_Type;
			v_out_row.Item_Name	:= null;
			v_out_row.Item_Type	:= v_Item_Type;
			v_out_row.Item_Sequence := 1;
			v_out_row.Index_by  := null;
			v_out_row.Table_Type := 'TABLE';
			v_Item_Type := lower(v_Item_Type);
			if v_Subtypes_List.EXISTS(v_Item_Type) then 
				v_out_row.Data_type := v_Subtypes_List(v_Item_Type);
			else
				v_out_row.Data_type := REGEXP_REPLACE(upper(v_Item_Type), v_Data_Type_Pattern);
			end if;
			if v_Types_List.EXISTS(v_Item_Type) then 
				v_out_row.Type_Object_Type := v_Object_Type_List(v_Item_Type);
				v_out_row.Nested_Table := v_Types_List(v_Item_Type);
			else 
				v_out_row.Type_Object_Type := 'PACKAGE';
				v_out_row.Nested_Table := 'N';
			end if;
			PIPE ROW(v_out_row);
			v_Offset := REGEXP_INSTR(v_Clob, v_Table_Pattern, v_Offset, 1, 1, 'in');
		end loop;
        -- varray types
		v_Offset := 1;
		for ind in 1..1000 loop
			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_Varray_Pattern, v_Offset, 1, 'in', 1);
			exit when v_Record_Type IS NULL;
			v_Types_List(lower(v_Record_Type)) := 'Y';
			v_Index_by := REGEXP_SUBSTR(v_Clob, v_Varray_Pattern, v_Offset, 1, 'in', 2);
			v_Item_Type := REGEXP_SUBSTR(v_Clob, v_Varray_Pattern, v_Offset, 1, 'in', 3);
			v_out_row.Type_name	:= v_Record_Type;
			v_out_row.Item_Name	:= null;
			v_out_row.Item_Type	:= v_Item_Type ;
			v_out_row.Item_Sequence := 1;
			v_out_row.Index_by  := v_Index_by;
			v_out_row.Table_Type := 'VARRAY';
			v_Item_Type := lower(v_Item_Type);
			if v_Subtypes_List.EXISTS(v_Item_Type) then 
				v_out_row.Data_type := v_Subtypes_List(v_Item_Type);
			else
				v_out_row.Data_type := REGEXP_REPLACE(upper(v_Item_Type), v_Data_Type_Pattern);
			end if;
			if v_Types_List.EXISTS(v_Item_Type) then 
				v_out_row.Type_Object_Type := v_Object_Type_List(v_Item_Type);
				v_out_row.Nested_Table := v_Types_List(v_Item_Type);
			else 
				v_out_row.Type_Object_Type := 'PACKAGE';
				v_out_row.Nested_Table := 'N';
			end if;
			PIPE ROW(v_out_row);
			v_Offset := REGEXP_INSTR(v_Clob, v_Varray_Pattern, v_Offset, 1, 1, 'in');
		end loop;
		-- pl/sql table types
		v_Offset := 1;
		for ind in 1..1000 loop
			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_PL_Table_Pattern,  v_Offset, 1, 'in', 1);
			exit when v_Record_Type IS NULL;
			v_Types_List(lower(v_Record_Type)) := 'Y';
			v_Item_Type := REGEXP_SUBSTR(v_Clob, v_PL_Table_Pattern,  v_Offset, 1, 'in', 2);
			v_Index_by := REGEXP_SUBSTR(v_Clob, v_PL_Table_Pattern,  v_Offset, 1, 'in', 3);
			v_out_row.Type_name	:= v_Record_Type;
			v_out_row.Item_Name	:= null;
			v_out_row.Item_Type	:= v_Item_Type;
			v_out_row.Item_Sequence := 1;
			v_out_row.Index_by	:= v_Index_by;
			v_out_row.Table_Type := 'PL/SQL TABLE';
			v_Item_Type := lower(v_Item_Type);
			if v_Subtypes_List.EXISTS(v_Item_Type) then 
				v_out_row.Data_type := v_Subtypes_List(v_Item_Type);
			else
				v_out_row.Data_type := REGEXP_REPLACE(upper(v_Item_Type), v_Data_Type_Pattern);
			end if;
			if v_Types_List.EXISTS(v_Item_Type) then 
				v_out_row.Type_Object_Type := v_Object_Type_List(v_Item_Type);
				-- when the Item type was found in this package, conversion is required.
				v_out_row.Nested_Table := v_Types_List(v_Item_Type);
			else 
				v_out_row.Type_Object_Type := 'PACKAGE';
				-- when the Item type was not found in this package, no conversion is required.
				v_out_row.Nested_Table := 'N';
			end if;
			PIPE ROW(v_out_row);
			v_Offset := REGEXP_INSTR(v_Clob, v_PL_Table_Pattern, v_Offset, 1, 1, 'in');
		end loop;
        if g_debug then
            Log_Elapsed_Time(v_Timemark, '-- Pipe_Record_types finish ');       
        end if;
		
    END Pipe_Record_types;

    FUNCTION Get_Record_Fields (
        p_Package_Head IN CLOB,
        p_Type_Subname IN VARCHAR2,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_temp'
    ) RETURN VARCHAR2 
    IS 
        v_Record_Text VARCHAR2(32767);
        v_pattern CONSTANT VARCHAR2(100) := 'TYPE\s+'||p_Type_Subname||'\s+IS\s+RECORD\s*\((.+?)\);';
        v_Item_Pattern CONSTANT VARCHAR2(100) := '(\S+)\s+(.+?(\(\S+?\))?)\s*(,|$)'; 
        v_Offset2 PLS_INTEGER;
		v_Item_Name VARCHAR2(32767);
		v_Result VARCHAR2(32767);
    BEGIN 
        v_Record_Text := REGEXP_SUBSTR(p_Package_Head, v_pattern, 1, 1, 'in', 1);
		v_Offset2 := 1;
		for ind in 1..1000 loop
			v_Item_Name := REGEXP_SUBSTR(v_Record_Text, v_Item_Pattern, v_Offset2, 1, 'im', 1);
			exit when v_Item_Name IS NULL;
			v_Result := v_Result 
			|| case when ind > 1 then ',' end
			|| p_Variable_Name || '.' || v_Item_Name;
			v_Offset2 := REGEXP_INSTR(v_Record_Text, v_Item_Pattern, v_Offset2, 1, 1, 'im');
		end loop;
        return v_Result;
    END Get_Record_Fields;

    FUNCTION Get_Record_Fields (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Type_Name IN VARCHAR2,
        p_Type_Owner IN VARCHAR2, 
        p_Type_Subname IN VARCHAR2,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_temp',
        p_Owner IN VARCHAR2 DEFAULT NULL,
        p_In_Out IN VARCHAR2 DEFAULT 'IN'
    ) RETURN VARCHAR2
    IS 
		v_Result VARCHAR2(32767);
		v_function_name VARCHAR2(512);
		v_Variable_Name VARCHAR2(512);
		v_Item_Type VARCHAR2(512);
		v_Item_Count PLS_INTEGER := 0;
    BEGIN 
		for cur in (
			-- get the details of S.Item_type in T.*
			select DISTINCT S.Item_Name, S.Item_Sequence, 
				S.Item_Type, S.Table_Type, 
				T.TABLE_TYPE SUB_Table_Type,
				T.Package_Owner, T.Package_Name, T.Type_Name SUB_Type_Name
			from MV_PACKAGE_RECORD_TYPES S 
			left outer join MV_PACKAGE_RECORD_TYPES T 
				on (S.Item_type = T.Package_Owner||'.'||T.Package_Name||'.'||T.Type_Name
				or S.Item_type = T.Package_Name||'.' ||T.Type_Name and S.Package_Owner = T.Package_Owner
				or S.Item_type = T.Type_Name and S.Package_Name = T.Package_Name and S.Package_Owner = T.Package_Owner)
			where S.Package_Name = p_Type_Name
			and S.Package_Owner = p_Type_Owner
			and S.Type_Name = UPPER(p_Type_Subname)
			order by S.Item_Sequence
		) loop
			v_Item_Type := cur.SUB_Table_Type;
			v_Item_Count := v_Item_Count + 1;
			v_Variable_Name := p_Variable_Name 
			|| case when cur.Item_Name IS NOT NULL 
				then '.' || cur.Item_Name 
			end;
			if cur.SUB_Table_Type = 'RECORD'
			and cur.SUB_Type_Name IS NOT NULL then 
				v_Result := v_Result 
				|| case when cur.Item_Sequence > 1 then ',' end
				|| case when p_Owner IS NOT NULL then p_Owner || '.' || cur.Package_Name || '.' 
						when p_Package_Owner != cur.Package_Owner then cur.Package_Owner || '.' || cur.Package_Name || '.' 
					    when p_Package_Name != cur.Package_Name then cur.Package_Name || '.'
				end
				|| cur.SUB_Type_Name 
				|| '(' || Get_Record_Fields(
					p_Package_Name => p_Package_Name,
					p_Package_Owner => p_Package_Owner,
					p_Type_Name => cur.Package_Name,
					p_Type_Owner => cur.Package_Owner,
					p_Type_Subname => cur.SUB_Type_Name,
					p_Variable_Name => v_Variable_Name,
					p_Owner => p_Owner,
					p_In_Out => p_In_Out
				) || ')';
			elsif cur.SUB_Table_Type IN ('PL/SQL TABLE', 'TABLE', 'VARRAY')
			and cur.Package_Name = p_Package_Name -- only local types need conversion
			then 
				v_function_name := case when p_In_Out IN ('IN', 'IN/OUT') 
					then 'In_' || cur.SUB_Type_Name 
					else 'Out_' || cur.SUB_Type_Name 
				end;
				v_Result := v_Result 
				|| case when cur.Item_Sequence > 1 then ',' end
				|| v_function_name
				|| '(' || v_Variable_Name || ')';
			elsif cur.Item_Name IS NOT NULL then
				v_Result := v_Result 
				|| case when cur.Item_Sequence > 1 then ',' end
				|| v_Variable_Name;
			end if;
		end loop;
		if  v_Result IS NULL then 
			v_Result := p_Variable_Name;
		end if;
		return v_Result;
    END Get_Record_Fields;

    FUNCTION Get_Table_Conversion (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Type_Name IN VARCHAR2,
        p_Type_Owner IN VARCHAR2, 
        p_Type_Subname IN VARCHAR2,
        p_Object_Name IN VARCHAR2,
        p_In_Out IN VARCHAR2
    ) RETURN VARCHAR2
    IS 
		v_Result VARCHAR2(32767);
		v_in_out VARCHAR2(10) := case when p_in_out IN ('IN', 'IN/OUT') then 'IN' else 'OUT' end;
		v_type_in VARCHAR2(512);
		v_type_out VARCHAR2(512);
		v_function_name VARCHAR2(512);
		v_Sequence PLS_INTEGER := 0;
    BEGIN 
		for cur in (
			-- get the details of S.Item_type in T.*
			select DISTINCT S.Type_Name, S.Item_Sequence, 
				S.Package_Name, S.Package_Owner,
				S.Item_Type, S.Table_Type, 
				case when S.Table_Type = 'PL/SQL TABLE' and S.Index_By IS NOT NULL 
					then S.Index_By else 'PLS_INTEGER' 
				end Index_By, 
				T.Package_Name SUB_Package_Name, 
				T.Package_Owner SUB_Package_Owner,
				T.Type_Name SUB_Type_Name, 
				T.Table_Type SUB_Table_Type
			from MV_PACKAGE_RECORD_TYPES S 
			left outer join MV_PACKAGE_RECORD_TYPES T 
				on (S.Item_type = T.Package_Owner||'.'||T.Package_Name||'.'||T.Type_Name
				or S.Item_type = T.Package_Name||'.' ||T.Type_Name and S.Package_Owner = T.Package_Owner
				or S.Item_type = T.Type_Name and S.Package_Name = T.Package_Name and S.Package_Owner = T.Package_Owner)
			where S.Package_Name = p_Type_Name
			and S.Package_Owner = p_Type_Owner
			and S.Type_Name = p_Type_Subname
			and S.Table_Type IN ('PL/SQL TABLE', 'TABLE', 'VARRAY')
			order by S.Item_Sequence
		) loop
			if (cur.Package_Owner = p_Package_Owner -- types of same schema and package can be converted with a function
			and cur.Package_Name = p_Package_Name) -- only local types need conversion
			then
				if v_in_out = 'IN' then
					v_type_in := p_Object_Name || '.';
					v_type_out := p_Type_Owner || '.' || p_Type_Name || '.';
				else 
					v_type_in := p_Type_Owner || '.' || p_Type_Name || '.';
					v_type_out := p_Object_Name || '.';
				end if;
				v_function_name := v_in_out || '_' || cur.Type_Name;
				v_Result := v_Result || chr(10)
				|| 'function ' || v_function_name || '(p_list ' || v_type_in || cur.Type_Name 
				|| ' ) return ' || v_type_out || cur.Type_Name || ' IS ' || NL(4)
				|| 		'lv_list ' || v_type_out || cur.Type_Name || ' := ' || v_type_out || cur.Type_Name || '();' || NL(4)
				|| 		'lv_idx ' || cur.Index_By || ' := p_list.FIRST;' || chr(10)
				|| 'begin' || NL(4)
				|| 		'while lv_idx IS NOT NULL loop' || NL(8)
				|| 			'lv_list(lv_idx) := ' 
				|| Get_Record_Fields(
					p_Package_Name => p_Package_Name,
					p_Package_Owner => p_Package_Owner,
					p_Type_Name => cur.SUB_Package_Name,
					p_Type_Owner => cur.SUB_Package_Owner,
					p_Type_Subname => cur.Type_Name, 
					p_Variable_Name => 'p_list(lv_idx)',
					p_Owner => case when v_in_out = 'IN' then cur.SUB_Package_Owner end,
					p_In_Out => v_in_out
				) 
				|| ';' || NL(8)
				|| 			'lv_idx := p_list.NEXT(lv_idx);' || NL(4)
				|| 		'end loop;' || NL(4)
				|| 		'return lv_list;' || chr(10)
				|| 	'end ' || v_function_name || ';'
				|| chr(10);
			end if;
		end loop;			
		return v_Result;
    END Get_Table_Conversion;

    FUNCTION Get_Record_Conversion (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Type_Name IN VARCHAR2,
        p_Type_Owner IN VARCHAR2, 
        p_Type_Subname IN VARCHAR2,
        p_Object_Name IN VARCHAR2,
        p_In_Out IN VARCHAR2 DEFAULT 'IN'
    ) RETURN VARCHAR2
    IS 
		v_Result VARCHAR2(32767);
		v_in_out VARCHAR2(10) := case when p_in_out IN ('IN', 'IN/OUT') then 'IN' else 'OUT' end;
		v_type_in VARCHAR2(512);
		v_type_out VARCHAR2(512);
		v_function_name VARCHAR2(512);
		v_Sequence PLS_INTEGER := 0;
    BEGIN 
		for cur in (
			WITH TYPES_Q AS (
				select DISTINCT S.Package_Owner, S.Package_Name, S.Type_Name, S.Item_Sequence, S.Item_Name,
					S.Item_Type, 
					NVL(T.Table_Type, S.Data_Type) Data_Type,
					S.Table_Type,
                    case when T.Table_Type = 'RECORD' then
                    	'Log_' || T.Type_Name
                    end RECORD_CONVERSION
				FROM MV_PACKAGE_RECORD_TYPES S
				LEFT OUTER JOIN MV_PACKAGE_RECORD_TYPES T 
					on (S.Item_type = T.Package_Owner||'.'||T.Package_Name||'.'||T.Type_Name
					or S.Item_type = T.Package_Name||'.' ||T.Type_Name and S.Package_Owner = T.Package_Owner
					or S.Item_type = T.Type_Name and S.Package_Name = T.Package_Name and S.Package_Owner = T.Package_Owner)
			)
			SELECT 
				T.Item_Sequence, T.Item_Name, T.Data_Type, 
				package_tracer.Literal_Call (
					p_Argument_Name => UPPER(T.Item_Name), 
					p_Formatted_Name => 'p_rec.'||T.Item_Name,
					p_Data_Type => T.Data_Type,
					p_Record_Conversion => T.RECORD_CONVERSION
				) Literal
			FROM TYPES_Q T
			WHERE T.PACKAGE_NAME = p_Type_Name
			AND T.PACKAGE_OWNER = p_Type_Owner
			AND T.TYPE_NAME = p_Type_Subname
			AND T.Table_Type = 'RECORD'
			order by T.Item_Sequence
		) loop
			v_Result := v_Result 
			|| case when cur.Item_Sequence > 1 then NL(4) || '|| ' || Enquote_Literal(',') || ' || ' end
			|| cur.Literal;
		end loop;	

		v_type_in := case 
			when p_Package_Owner != p_Type_Owner then p_Type_Owner || '.' || p_Type_Name || '.' 
			when p_Package_Name != p_Type_Name then p_Type_Name || '.'
		end;

		v_function_name := 'Log_' || p_Type_Subname;
		return chr(10)
		|| 'function ' || v_function_name || '(p_rec ' || v_type_in || p_Type_Subname 
		|| ' ) return VARCHAR2 IS ' || chr(10)
		|| 'begin' || NL(4)
		|| 		'return ' 
		|| Enquote_Literal(p_Type_Subname || '(') 
		|| ' || '
		|| v_Result 
		|| ' || ' 
		|| Enquote_Literal(')') || ';' || chr(10)
		|| 'end ' || v_function_name || ';' || chr(10);
    END Get_Record_Conversion;

    FUNCTION Get_Package_Body (
        p_Object_Name IN VARCHAR2,
        p_Object_Owner IN VARCHAR2,
        p_Editionable  IN VARCHAR2,
        p_Package_Name IN VARCHAR2,
        p_Package_Owner  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'),
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
            WITH TYPES_Q AS (
				SELECT S.Package_Name, S.Package_Owner, S.Type_Name, 
					S.Index_By, 
					S.Table_Type,
					COUNT(*) Sub_Item_Degree
				FROM MV_PACKAGE_RECORD_TYPES S
				LEFT OUTER JOIN MV_PACKAGE_RECORD_TYPES T 
					on (S.Item_type = T.Package_Owner||'.'||T.Package_Name||'.'||T.Type_Name
					or S.Item_type = T.Package_Name||'.' ||T.Type_Name and S.Package_Owner = T.Package_Owner
					or S.Item_type = T.Type_Name and S.Package_Name = T.Package_Name and S.Package_Owner = T.Package_Owner)
				WHERE (S.Table_Type != 'RECORD' or S.Nested_Table = 'Y' ) --  Important
				GROUP BY S.Package_Name, S.Package_Owner, S.Type_Name, 
					S.Index_By, S.Table_Type
            ), RETURN_Q AS (
                SELECT A.PACKAGE_NAME, A.OWNER, A.OBJECT_NAME PROCEDURE_NAME, A.SUBPROGRAM_ID, 
                        A.IN_OUT, 
                        A.DATA_TYPE RETURN_DATA_TYPE,
                        A.TYPE_NAME RETURN_TYPE_NAME,
                        A.TYPE_OWNER RETURN_TYPE_OWNER,
                        A.TYPE_SUBNAME RETURN_TYPE_SUBNAME,
						case when T.TABLE_TYPE = 'PL/SQL TABLE' AND T.INDEX_BY IS NOT NULL 
							then T.INDEX_BY 
							else 'PLS_INTEGER' 
						end RETURN_INDEX_BY,
                        A.CHAR_USED,
                        CASE WHEN A.TYPE_NAME IS NOT NULL THEN 
                            CASE WHEN A.DATA_TYPE = 'REF' THEN ' ref ' END
                            || CASE WHEN (S.SYNONYM_NAME IS NULL OR A.TYPE_OBJECT_TYPE = 'PACKAGE')
                            	AND TYPE_OWNER NOT IN (p_Package_Owner, 'PUBLIC') THEN TYPE_OWNER||'.' END 
                            || A.TYPE_NAME 
                            || CASE WHEN A.TYPE_SUBNAME IS NOT NULL THEN '.'||A.TYPE_SUBNAME END 
                        WHEN A.DATA_TYPE = 'REF CURSOR' THEN 'SYS_REFCURSOR' 
                        ELSE 
                            A.PLS_TYPE 
                        END RETURN_TYPE,
                        A.TYPE_OBJECT_TYPE,
                        A.ORIGIN_CON_ID
                FROM SYS.ALL_ARGUMENTS A
                LEFT OUTER JOIN SYS.All_Synonyms S 
                	ON S.SYNONYM_NAME = A.TYPE_NAME
					AND S.OWNER IN (p_Package_Owner, 'PUBLIC') -- important
					AND S.TABLE_NAME = A.TYPE_NAME
				LEFT OUTER JOIN TYPES_Q T 
					ON A.TYPE_OWNER = T.PACKAGE_OWNER
                    AND A.TYPE_NAME = T.PACKAGE_NAME
					AND A.TYPE_SUBNAME = T.TYPE_NAME
                WHERE DATA_LEVEL = 0 
                AND POSITION = 0
                AND ARGUMENT_NAME IS NULL
            ), ARGUMENTS_Q AS (
                SELECT PACKAGE_NAME, OWNER, PROCEDURE_NAME, SUBPROGRAM_ID, ORIGIN_CON_ID,
                        COUNT(*) ARGS_COUNT,
                        SUM(CASE WHEN IN_OUT IN ('IN/OUT', 'OUT') THEN 1 ELSE 0 END) OUT_COUNT,
                        LISTAGG(ARG_PREFIX||ARGUMENT_NAME, ',') WITHIN GROUP (ORDER BY POSITION) ARGUMENT_NAMES,
                        LISTAGG(ARGUMENT_NAME||'=>'||ARG_PREFIX||ARGUMENT_NAME, ',') WITHIN GROUP (ORDER BY POSITION) CALL_PARAMETER,
                        LISTAGG(case when ARG_PREFIX IS NOT NULL
                        		then NL(4) || ARG_PREFIX
                        			|| ARGUMENT_NAME 
                        			|| ' ' || ARGUMENT_TYPE 
                        			|| ' := '
									|| case when DATA_TYPE = 'PL/SQL TABLE'
                        					and PACKAGE_NAME = TYPE_NAME 
                        					and IN_OUT IN ('IN/OUT', 'IN')
                        				then 
                        					'IN_' || TYPE_SUBNAME 
											|| '(' || ARGUMENT_NAME || ');'
                        				else
											ARGUMENT_TYPE || '();'
										end
                        		end
                        		|| case when DATA_TYPE = 'PL/SQL TABLE'
                        				and PACKAGE_NAME != TYPE_NAME then 
                        			NL(4) || 'idx' || A.POSITION || ' ' || INDEX_BY || ';'
                        		end
                       		, ' ') WITHIN GROUP (ORDER BY POSITION) 
                        AS ARG_DECLARE_IN,
                        LISTAGG(case when ARG_PREFIX IS NOT NULL and IN_OUT IN ('IN/OUT', 'IN') then 
                         			case 
									when DATA_TYPE = 'PL/SQL RECORD' 
									then NL(4) || ARG_PREFIX
										|| ARGUMENT_NAME 
										|| ' := '
										|| ARGUMENT_TYPE || '('
										|| Get_Record_Fields (
												p_Package_Name => PACKAGE_NAME,
												p_Package_Owner => OWNER,
												p_Type_Name => TYPE_NAME,
												p_Type_Owner => TYPE_OWNER,
												p_Type_Subname => TYPE_SUBNAME,
												p_Variable_Name => ARGUMENT_NAME,
												p_Owner => TYPE_OWNER, -- input is converted to original type
												p_In_Out => IN_OUT
											)
										|| ');'
                         			when DATA_TYPE = 'TABLE' and SUB_ITEM_DEGREE > 1
                         				or DATA_TYPE = 'VARRAY'
                         			then  
										'FOR idx IN 1 .. ' || ARGUMENT_NAME || '.COUNT LOOP' || NL(8)
										|| ARG_PREFIX || ARGUMENT_NAME || '(idx) := '
										|| Get_Record_Fields (
											p_Package_Name => PACKAGE_NAME,
											p_Package_Owner => OWNER,
											p_Type_Name => TYPE_NAME,
											p_Type_Owner => TYPE_OWNER,
											p_Type_Subname => TYPE_SUBNAME,
											p_Variable_Name => ARGUMENT_NAME|| '(idx)',
											p_Owner => TYPE_OWNER, -- input is converted to original type
											p_In_Out => 'IN'
										)
										|| ';' || NL(4)
										|| 'END LOOP;'
									when DATA_TYPE = 'PL/SQL TABLE' 
									then 
										case when PACKAGE_NAME != TYPE_NAME then 
											'idx' || A.POSITION || ' := ' || ARGUMENT_NAME || '.FIRST;' || NL(4)
											|| 'WHILE idx' || A.POSITION || ' IS NOT NULL LOOP' || NL(8)
											|| ARG_PREFIX || ARGUMENT_NAME || '(idx' || A.POSITION || ') := '
											|| Get_Record_Fields (
												p_Package_Name => PACKAGE_NAME,
												p_Package_Owner => OWNER,
												p_Type_Name => TYPE_NAME,
												p_Type_Owner => TYPE_OWNER,
												p_Type_Subname => TYPE_SUBNAME,
												p_Variable_Name => ARGUMENT_NAME|| '(idx' || A.POSITION || ')',
												p_Owner => TYPE_OWNER,
												p_In_Out => 'IN'
											)
											|| ';' || NL(8)
											|| 'idx' || A.POSITION || ' := ' || ARGUMENT_NAME 
											|| '.NEXT(idx' || A.POSITION || ');' || NL(4)
											|| 'END LOOP;' 
										end
									when DATA_TYPE IN ('TABLE', 'OBJECT', 'VARRAY') then
										'select * bulk collect into ' || ARG_PREFIX || ARGUMENT_NAME
										||' from table (' || ARGUMENT_NAME || ');' 
									end
                        		end, ' '||NL(4)) WITHIN GROUP (ORDER BY POSITION) 
                    	AS ARG_CONVERT_IN,
                       	LISTAGG(case when ARG_PREFIX IS NOT NULL and IN_OUT IN ('IN/OUT', 'OUT')
                        		then 
                        			case when DATA_TYPE = 'PL/SQL RECORD' then 
										ARGUMENT_NAME || ' := '
										|| LOWER(p_Package_Name || '.' || TYPE_SUBNAME) || '('
										|| Get_Record_Fields (
												p_Package_Name => PACKAGE_NAME,
												p_Package_Owner => OWNER,
												p_Type_Name => TYPE_NAME,
												p_Type_Owner => TYPE_OWNER,
												p_Type_Subname => TYPE_SUBNAME,
												p_Variable_Name => ARG_PREFIX|| ARGUMENT_NAME,
												p_In_Out => 'OUT'
											)
										|| ');'
									when DATA_TYPE = 'TABLE' and SUB_ITEM_DEGREE > 1
										or DATA_TYPE = 'VARRAY'
									then
										'FOR idx IN 1 .. ' || ARGUMENT_NAME || '.COUNT LOOP' || NL(8)
										|| ARGUMENT_NAME || '(idx) := '
										|| Get_Record_Fields (
											p_Package_Name => PACKAGE_NAME,
											p_Package_Owner => OWNER,
											p_Type_Name => TYPE_NAME,
											p_Type_Owner => TYPE_OWNER,
											p_Type_Subname => TYPE_SUBNAME,
											p_Variable_Name => ARG_PREFIX || ARGUMENT_NAME|| '(idx)',
											p_In_Out => 'OUT'
										)
										|| ';' || NL(4)
										|| 'END LOOP;'
									when DATA_TYPE = 'PL/SQL TABLE' 
									then 
										case when PACKAGE_NAME != TYPE_NAME then 
											'idx' || A.POSITION || ' := ' || ARG_PREFIX || ARGUMENT_NAME || '.FIRST;' || NL(4)
											|| 'WHILE idx' || A.POSITION || ' IS NOT NULL LOOP' || NL(8)
											|| ARGUMENT_NAME || '(' || 'idx' || A.POSITION || ') := '
											|| Get_Record_Fields (
												p_Package_Name => PACKAGE_NAME,
												p_Package_Owner => OWNER,
												p_Type_Name => TYPE_NAME,
												p_Type_Owner => TYPE_OWNER,
												p_Type_Subname => TYPE_SUBNAME,
												p_Variable_Name => ARG_PREFIX || ARGUMENT_NAME|| '(' || 'idx' || A.POSITION || ')',
												p_In_Out => 'OUT'
											)
											|| ';' || NL(8)
											|| 'idx' || A.POSITION || ' := ' || ARG_PREFIX || ARGUMENT_NAME || '.NEXT(idx' || A.POSITION || ');' || NL(4)
											|| 'END LOOP;'
										else 
											ARGUMENT_NAME || ' := OUT_' || TYPE_SUBNAME 
											|| '(' || ARG_PREFIX || ARGUMENT_NAME || ');'
										end
									when DATA_TYPE IN ('TABLE', 'OBJECT', 'VARRAY') then
										'select * bulk collect into ' || ARGUMENT_NAME
										||' from table (' || ARG_PREFIX || ARGUMENT_NAME || ');' 
									end
                        		end, ' '||NL(4)) WITHIN GROUP (ORDER BY POSITION) 
                        AS ARG_CONVERT_OUT
				FROM (
					SELECT A.PACKAGE_NAME, A.OWNER, A.PROCEDURE_NAME, A.SUBPROGRAM_ID, A.ORIGIN_CON_ID,
						A.ARGUMENT_NAME, A.DATA_TYPE, A.POSITION, A.TYPE_OWNER, A.TYPE_NAME, A.TYPE_SUBNAME, 
						A.IN_OUT, A.ARGUMENT_TYPE, A.ARG_PREFIX, 
						T.SUB_ITEM_DEGREE, 
						case when T.TABLE_TYPE = 'PL/SQL TABLE' AND T.INDEX_BY IS NOT NULL 
							then T.INDEX_BY 
							else 'PLS_INTEGER' 
						end INDEX_BY
					FROM (SELECT PACKAGE_NAME, OWNER, OBJECT_NAME PROCEDURE_NAME, SUBPROGRAM_ID, 
								ORIGIN_CON_ID, MIN(ORIGIN_CON_ID) OVER (PARTITION BY PACKAGE_NAME, OWNER) MIN_ORIGIN_CON_ID,
								LOWER(ARGUMENT_NAME) ARGUMENT_NAME,
								DATA_TYPE, POSITION, TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, IN_OUT, 
								lower(TYPE_OWNER || '.' || TYPE_NAME || '.' || TYPE_SUBNAME) ARGUMENT_TYPE,
								case when TYPE_OBJECT_TYPE = 'PACKAGE' 
								and DATA_TYPE IN ('PL/SQL TABLE', 'PL/SQL RECORD', 'TABLE', 'VARRAY')
								and (TYPE_NAME = PACKAGE_NAME -- only local types need conversion function
								or TYPE_OWNER = OWNER) -- also convert types of the same schema.
									then 'l'
								end ARG_PREFIX
						FROM SYS.ALL_ARGUMENTS 
						WHERE DATA_LEVEL = 0 
						AND POSITION > 0
						AND ARGUMENT_NAME IS NOT NULL
					) A
					LEFT OUTER JOIN TYPES_Q T
							ON A.TYPE_NAME = T.PACKAGE_NAME
							AND A.TYPE_OWNER = T.PACKAGE_OWNER
							AND A.TYPE_SUBNAME = T.TYPE_NAME
					WHERE A.ORIGIN_CON_ID = A.MIN_ORIGIN_CON_ID
				) A
                GROUP BY PACKAGE_NAME, OWNER, PROCEDURE_NAME, SUBPROGRAM_ID, ORIGIN_CON_ID
            )
            SELECT PRO.OBJECT_NAME, PRO.OWNER, PRO.PROCEDURE_NAME, 
                PRO.SUBPROGRAM_ID, PRO.OVERLOAD,
                PRO.AGGREGATE, PRO.PIPELINED, PRO.IMPLTYPEOWNER, PRO.IMPLTYPENAME,
                RET.RETURN_TYPE,
                RET.TYPE_OBJECT_TYPE, 
                RET.RETURN_TYPE_NAME, RET.RETURN_TYPE_OWNER, RET.RETURN_TYPE_SUBNAME, 
                RET.RETURN_INDEX_BY, 
                RET.RETURN_DATA_TYPE, RET.CHAR_USED,
                RD.RETURN_TYPE DEST_RETURN_TYPE,
                NVL(ARG.ARGS_COUNT,0) ARGS_COUNT,
                NVL(ARG.OUT_COUNT,0) OUT_COUNT,
                case when RET.IN_OUT = 'OUT' then 'FUNCTION' else 'PROCEDURE' end PROC_TYPE,
                case when PRO.OVERLOAD IS NULL then ARG.ARGUMENT_NAMES else ARG.CALL_PARAMETER end CALL_PARAMETER,
                ARG_DECLARE_IN,
                case when ARG_CONVERT_IN IS NOT NULL then chr(9)||ARG_CONVERT_IN||chr(10) end ARG_CONVERT_IN,
                case when ARG_CONVERT_OUT IS NOT NULL then chr(9)||ARG_CONVERT_OUT||chr(10) end ARG_CONVERT_OUT,
                REGEXP_SUBSTR(v_Header,  
                        '('
                        || case when RET.IN_OUT = 'OUT' then 'FUNCTION' else 'PROCEDURE' end
                        || '\s+'||PRO.PROCEDURE_NAME
                        || case when ARG.ARGS_COUNT > 0 then '\s*\(.+?\)' end
                        || case when RET.IN_OUT = 'OUT' then '\s*RETURN\s+.*?' else '\s*' end -- ?? '\s*' '.*?'
                        || '(\s+as\s+language\s+java.*)?'
                        || ');',
                        1, 
                        DENSE_RANK() OVER (PARTITION BY PRO.PROCEDURE_NAME, RET.IN_OUT, SIGN(ARG.ARGS_COUNT) ORDER BY PRO.SUBPROGRAM_ID),
                        'in', 1) HEADER -- find original procedure header with parameter default values
            FROM SYS.ALL_PROCEDURES PRO
            LEFT OUTER JOIN RETURN_Q RET -- get return type of functions in source schema.
                    ON PRO.OBJECT_NAME = RET.PACKAGE_NAME
                    AND PRO.OWNER = RET.OWNER
                    AND PRO.PROCEDURE_NAME = RET.PROCEDURE_NAME
                    AND PRO.SUBPROGRAM_ID = RET.SUBPROGRAM_ID
                    AND PRO.ORIGIN_CON_ID = RET.ORIGIN_CON_ID
            LEFT OUTER JOIN RETURN_Q RD -- get return type of functions in destination schema.
                    ON RD.PACKAGE_NAME = p_Package_Name
                    AND RD.OWNER = p_Package_Owner
                    AND PRO.PROCEDURE_NAME = RD.PROCEDURE_NAME
                    AND PRO.SUBPROGRAM_ID = RD.SUBPROGRAM_ID
                    AND PRO.ORIGIN_CON_ID = RD.ORIGIN_CON_ID
            LEFT OUTER JOIN ARGUMENTS_Q ARG 
                    ON PRO.OBJECT_NAME = ARG.PACKAGE_NAME
                    AND PRO.OWNER = ARG.OWNER
                    AND PRO.PROCEDURE_NAME = ARG.PROCEDURE_NAME
                    AND PRO.SUBPROGRAM_ID = ARG.SUBPROGRAM_ID
                    AND PRO.ORIGIN_CON_ID = ARG.ORIGIN_CON_ID
            WHERE PRO.OBJECT_NAME = p_Object_Name
            AND PRO.OWNER = p_Object_Owner
            AND PRO.OBJECT_TYPE = 'PACKAGE'
            AND PRO.PROCEDURE_NAME IS NOT NULL
            AND NOT(PRO.PIPELINED = 'YES' and IMPLTYPENAME IS NOT NULL)
            ORDER BY PRO.SUBPROGRAM_ID, PRO.OVERLOAD;
        TYPE proc_tbl IS TABLE OF all_proc_cur%ROWTYPE;
        v_proc_tbl        proc_tbl;

        CURSOR rec_conv_cur
        IS
			with records_q (TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, Table_Type,
				P_TYPE_OWNER, P_TYPE_NAME, P_TYPE_SUBNAME, P_Table_Type) 
			as (
				select distinct 
					A.TYPE_OWNER, A.TYPE_NAME, A.TYPE_SUBNAME, A.DATA_TYPE Table_Type, 
					'' P_TYPE_OWNER, '' P_TYPE_NAME, '' P_TYPE_SUBNAME, '' P_Table_Type
				FROM SYS.ALL_ARGUMENTS A
				WHERE A.DATA_LEVEL = 0 
				AND A.TYPE_OBJECT_TYPE = 'PACKAGE' 
				AND A.DATA_TYPE = 'PL/SQL RECORD'
				AND A.OWNER = p_Object_Owner
				AND A.PACKAGE_NAME = p_Object_Name
				UNION ALL 
				select distinct T.Package_Owner TYPE_OWNER, T.Package_Name TYPE_NAME, T.Type_Name TYPE_SUBNAME, T.Table_Type,
					S.Package_Owner P_TYPE_OWNER, S.Package_Name P_TYPE_NAME, S.Type_Name P_TYPE_SUBNAME, S.Table_Type P_Table_Type
				FROM MV_PACKAGE_RECORD_TYPES S
				join MV_PACKAGE_RECORD_TYPES T 
					on (S.Item_type = T.Package_Owner||'.'||T.Package_Name||'.'||T.Type_Name
					or S.Item_type = T.Package_Name||'.' ||T.Type_Name and S.Package_Owner = T.Package_Owner
					or S.Item_type = T.Type_Name and S.Package_Name = T.Package_Name and S.Package_Owner = T.Package_Owner)
				where S.Table_Type = 'RECORD'
				and T.Table_Type = 'RECORD'
			), tree_q as (
				SELECT TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, level lv
				FROM records_q r
				START WITH p_type_owner IS NULL
				CONNECT BY PRIOR type_owner = p_type_owner
					AND PRIOR TYPE_NAME = P_TYPE_NAME
					AND PRIOR TYPE_SUBNAME = P_TYPE_SUBNAME
			)
			SELECT TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, MAX(lv) lv
			FROM tree_q
			GROUP BY TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME
			ORDER BY lv DESC, TYPE_SUBNAME;
        TYPE rec_conv_tbl IS TABLE OF rec_conv_cur%ROWTYPE;
        v_rec_conv_tbl        rec_conv_tbl;

        CURSOR tab_conv_cur
        IS
			with records_q (TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, Table_Type,
				IN_OUT,
				P_TYPE_OWNER, P_TYPE_NAME, P_TYPE_SUBNAME, P_Table_Type) 
			as (
				select distinct 
					A.TYPE_OWNER, A.TYPE_NAME, A.TYPE_SUBNAME, A.DATA_TYPE TABLE_TYPE, 
					CASE WHEN A.IN_OUT IN ('IN', 'IN/OUT') THEN 'IN' ELSE 'OUT' END IN_OUT,
					'' P_TYPE_OWNER, '' P_TYPE_NAME, '' P_TYPE_SUBNAME, '' P_TABLE_TYPE
				FROM SYS.ALL_ARGUMENTS A
				WHERE A.DATA_LEVEL = 0 
				AND A.TYPE_OBJECT_TYPE = 'PACKAGE' 
				AND A.OWNER = p_Object_Owner
				AND A.PACKAGE_NAME = p_Object_Name
				AND (A.OWNER = A.TYPE_OWNER				-- only local types need conversion 
				 OR A.PACKAGE_NAME = A.TYPE_NAME)		-- also convert types of the same schema
				UNION ALL 
				select distinct 
					A.TYPE_OWNER, A.TYPE_NAME, A.TYPE_SUBNAME, A.DATA_TYPE TABLE_TYPE, 
					'OUT' IN_OUT,
					'' P_TYPE_OWNER, '' P_TYPE_NAME, '' P_TYPE_SUBNAME, '' P_TABLE_TYPE
				FROM SYS.ALL_ARGUMENTS A
				WHERE A.DATA_LEVEL = 0 
				AND A.TYPE_OBJECT_TYPE = 'PACKAGE' 
				AND A.IN_OUT = 'IN/OUT'
				AND A.OWNER = p_Object_Owner
				AND A.PACKAGE_NAME = p_Object_Name
				AND (A.OWNER = A.TYPE_OWNER				-- only local types need conversion 
				 OR A.PACKAGE_NAME = A.TYPE_NAME)		-- also convert types of the same schema
				UNION ALL 
				select DISTINCT T.Package_Owner TYPE_OWNER, T.Package_Name TYPE_NAME, T.Type_Name TYPE_SUBNAME, T.Table_Type,
					'' IN_OUT,
					S.Package_Owner P_TYPE_OWNER, S.Package_Name P_TYPE_NAME, S.Type_Name P_TYPE_SUBNAME, S.Table_Type P_Table_Type
				FROM MV_PACKAGE_RECORD_TYPES S
				join MV_PACKAGE_RECORD_TYPES T 
					on (S.Item_type = T.Package_Owner||'.'||T.Package_Name||'.'||T.Type_Name
					or S.Item_type = T.Package_Name||'.' ||T.Type_Name and S.Package_Owner = T.Package_Owner
					or S.Item_type = T.Type_Name and S.Package_Name = T.Package_Name and S.Package_Owner = T.Package_Owner)
			) , tree_q as (
				SELECT TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, TABLE_TYPE, 
					CONNECT_BY_ROOT IN_OUT IN_OUT, LEVEL lv
				FROM records_q r
				START WITH p_type_owner IS NULL
				CONNECT BY PRIOR type_owner = p_type_owner
					AND PRIOR TYPE_NAME = P_TYPE_NAME
					AND PRIOR TYPE_SUBNAME = P_TYPE_SUBNAME
			)
			SELECT TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, IN_OUT, MAX(lv) lv
			FROM tree_q
			WHERE TABLE_TYPE IN ('TABLE', 'PL/SQL TABLE', 'VARRAY')
			GROUP BY TYPE_OWNER, TYPE_NAME, TYPE_SUBNAME, IN_OUT
			ORDER BY lv DESC, TYPE_SUBNAME;
        TYPE tab_conv_tbl IS TABLE OF tab_conv_cur%ROWTYPE;
        v_tab_conv_tbl        tab_conv_tbl;

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
        -- remove PRAGMA clauses
        v_Header := REGEXP_REPLACE(v_Header, 'PRAGMA\s+\w+\s*\(.+?\);', '', 1, 0, 'i');
        OPEN rec_conv_cur;
        FETCH rec_conv_cur BULK COLLECT INTO v_rec_conv_tbl;
        CLOSE rec_conv_cur;

        OPEN tab_conv_cur;
        FETCH tab_conv_cur BULK COLLECT INTO v_tab_conv_tbl;
        CLOSE tab_conv_cur;

        OPEN all_proc_cur;
        FETCH all_proc_cur BULK COLLECT INTO v_proc_tbl;
        CLOSE all_proc_cur;

        IF v_proc_tbl.FIRST IS NOT NULL THEN
            v_sqltext := chr(10)  
            || 'CREATE OR REPLACE '
            || CASE WHEN p_Editionable = 'Y' THEN 'EDITIONABLE' ELSE 'NONEDITIONABLE' END
            || ' PACKAGE BODY '
            || Enquote_Name(p_Package_Owner) || '.'
            || Enquote_Name(p_Package_Name) || chr(10) 
            || 'IS ' || chr(10);
            dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);
         
            FOR ind IN 1 .. v_rec_conv_tbl.COUNT
            LOOP
            	v_sqltext := package_tracer.Get_Record_Conversion (
					p_Package_Name => p_Object_Name,
					p_Package_Owner => p_Object_Owner,
					p_Type_Name => v_rec_conv_tbl(ind).TYPE_NAME,
					p_Type_Owner => v_rec_conv_tbl(ind).TYPE_OWNER,
					p_Type_Subname => v_rec_conv_tbl(ind).TYPE_SUBNAME,
					p_Object_Name => p_Package_Name
				);
            	dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);
       		END LOOP; 
       		
            FOR ind IN 1 .. v_tab_conv_tbl.COUNT
            LOOP
            	v_sqltext := package_tracer.Get_Table_Conversion (
					p_Package_Name => p_Object_Name,
					p_Package_Owner => p_Object_Owner,
					p_Type_Name => v_tab_conv_tbl(ind).TYPE_NAME,
					p_Type_Owner => v_tab_conv_tbl(ind).TYPE_OWNER,
					p_Type_Subname => v_tab_conv_tbl(ind).TYPE_SUBNAME,
					p_Object_Name => p_Package_Name,
					p_In_Out => v_tab_conv_tbl(ind).IN_OUT
				);
				if length(v_sqltext) > 0 then 
            		dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);
            	end if;
       		END LOOP; 
       		v_sqltext := chr(10) || RPAD('-- Main package functions ', 40, '-') || chr(10);
       		dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);
            FOR ind IN 1 .. v_proc_tbl.COUNT
            LOOP
                v_calling_subprog := v_object_owner || '.' || LOWER(p_Object_Name) || '.' || LOWER(v_proc_tbl(ind).PROCEDURE_NAME);
                v_procedure_name := lower(p_Package_Name||'.'|| v_proc_tbl(ind).PROCEDURE_NAME);
                IF p_Logging_Start_Enabled = 'Y' THEN 
                    v_trace_call := chr(9) 
                    || replace(
                        p_Logging_Start_Call, '%s',
                        Format_Call_Parameter( 
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
                        )
                    ) || chr(10)
                    || v_proc_tbl(ind).ARG_CONVERT_IN;
                    v_trace_output := chr(9) 
                    || replace(
                        p_Logging_Finish_Call, '%s',
						Format_Call_Parameter( 
							p_Object_Name => p_Object_Name,
							p_Object_Owner => p_Object_Owner,
							p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,
							p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,
							p_calling_subprog => v_calling_subprog,
							p_synonym_name => v_procedure_name,
							p_value_max_length => p_value_max_length,
							p_bind_char => null,
							p_overload => v_proc_tbl(ind).OVERLOAD,
							p_in_out => 'OUT',
							p_return_variable => 
								case when v_proc_tbl(ind).RETURN_TYPE IS NOT NULL
								then p_Variable_Name end
						)
                     ) || chr(10)
                    || v_proc_tbl(ind).ARG_CONVERT_OUT;
                ELSE 
                    v_trace_call := v_proc_tbl(ind).ARG_CONVERT_IN;
                    v_trace_output := chr(9) 
                    || replace(
                        p_Logging_API_Call, '%s',
                        Format_Call_Parameter( 
                            p_Object_Name => p_Object_Name,
                            p_Object_Owner => p_Object_Owner,
                            p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,
                            p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,
                            p_calling_subprog => v_calling_subprog,
                            p_synonym_name => v_procedure_name,
                            p_value_max_length => p_value_max_length,
                            p_bind_char => null,
                            p_overload => v_proc_tbl(ind).OVERLOAD,
                            p_in_out => 'IN/OUT',
							p_return_variable => 
								case when v_proc_tbl(ind).RETURN_TYPE IS NOT NULL
								then p_Variable_Name end
                        )
                    ) || chr(10)
                    || v_proc_tbl(ind).ARG_CONVERT_OUT;                   
                END IF;
                v_sqltext := v_proc_tbl(ind).HEADER;
                if length(v_sqltext) > 0 
                and REGEXP_INSTR(v_sqltext, '\s+as\s+language\s+java\s+', 1, 1, 1, 'in') = 0 then 
                    if v_proc_tbl(ind).PROC_TYPE = 'FUNCTION'
                    and v_proc_tbl(ind).AGGREGATE = 'NO'
                    and v_proc_tbl(ind).PIPELINED = 'NO'
                    and (v_proc_tbl(ind).RETURN_TYPE = v_proc_tbl(ind).DEST_RETURN_TYPE 
                     or v_proc_tbl(ind).DEST_RETURN_TYPE IS NULL)
                    then -- normal function with return value; return value is printed.
                        v_sqltext := v_sqltext || chr(10) 
						|| 'is' 
						|| NL(4) || p_Variable_Name||' ' || v_proc_tbl(ind).RETURN_TYPE 
                        || case when v_proc_tbl(ind).CHAR_USED != '0' or v_proc_tbl(ind).RETURN_TYPE = 'RAW' 
                            then '(32767)' 
                        end 
                        || ';' 
						|| v_proc_tbl(ind).ARG_DECLARE_IN
						|| chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call
                        || '    '||p_Variable_Name||' := ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end 
                        || ';' || chr(10) 
                        || v_trace_output
                        || '    return '||p_Variable_Name||';' || chr(10);
                    elsif v_proc_tbl(ind).PROC_TYPE = 'FUNCTION'
                    and v_proc_tbl(ind).PIPELINED = 'NO'
                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = 'PACKAGE'
                    and v_proc_tbl(ind).RETURN_TYPE != v_proc_tbl(ind).DEST_RETURN_TYPE
                    and v_proc_tbl(ind).RETURN_DATA_TYPE = 'PL/SQL TABLE'
                    then
                        v_sqltext := v_sqltext || chr(10) 
						|| 'is' 
                        || NL(4)|| 'lv_temp ' || v_proc_tbl(ind).RETURN_TYPE || ';' 
                        || case when p_Object_Name != v_proc_tbl(ind).RETURN_TYPE_NAME then 
                        	NL(4)|| 'lv_idx ' || v_proc_tbl(ind).RETURN_INDEX_BY || ';' 
                        end
                        || NL(4)|| p_Variable_Name||' ' || v_proc_tbl(ind).DEST_RETURN_TYPE || ';'
						|| v_proc_tbl(ind).ARG_DECLARE_IN
						|| chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call
                        || '    lv_temp := ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end 
                        || ';' || chr(10) || NL(4)
                        || case when p_Object_Name != v_proc_tbl(ind).RETURN_TYPE_NAME then 
							'lv_idx := lv_temp.FIRST;' || NL(4)
							|| 'WHILE lv_idx IS NOT NULL LOOP' || NL(8)
							|| p_Variable_Name || '(lv_idx) := '
							|| Get_Record_Fields (
								p_Package_Name => p_Object_Name,
								p_Package_Owner => p_Object_Owner,
								p_Type_Name => v_proc_tbl(ind).RETURN_TYPE_NAME,
								p_Type_Owner => v_proc_tbl(ind).RETURN_TYPE_OWNER,
								p_Type_Subname => v_proc_tbl(ind).RETURN_TYPE_SUBNAME,
								p_Variable_Name => 'lv_temp(lv_idx)',
								p_In_Out => 'OUT'
							)
							|| ';' || NL(8)
							|| 'lv_idx := lv_temp.NEXT(lv_idx);' || NL(4)
							|| 'END LOOP;' || chr(10)
						else 
							p_Variable_Name || ' := OUT_' || v_proc_tbl(ind).RETURN_TYPE_SUBNAME 
							|| '(lv_temp);' || chr(10)
						end
                        || v_trace_output
                        || '    return '||p_Variable_Name||';' || chr(10);                    
                    elsif v_proc_tbl(ind).PROC_TYPE = 'FUNCTION'
                    and v_proc_tbl(ind).PIPELINED = 'NO'
                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = 'PACKAGE'
                    and v_proc_tbl(ind).RETURN_TYPE != v_proc_tbl(ind).DEST_RETURN_TYPE
                    and v_proc_tbl(ind).RETURN_DATA_TYPE IN ('TABLE', 'OBJECT', 'VARRAY')
                    then
                        v_sqltext := v_sqltext || chr(10) 
						|| 'is' 
                        || NL(4) || 'lv_temp ' || v_proc_tbl(ind).RETURN_TYPE || ';' 
                        || NL(4) ||p_Variable_Name||' ' || v_proc_tbl(ind).DEST_RETURN_TYPE || ';' 
						|| v_proc_tbl(ind).ARG_DECLARE_IN
						|| chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call
                        || '    lv_temp := ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end 
                        || ';' || chr(10) 
                        || '    select * bulk collect into '||p_Variable_Name||' from table (lv_temp);' || chr(10) 
                        || v_trace_output
                        || '    return '||p_Variable_Name||';' || chr(10);                    
                    elsif v_proc_tbl(ind).PROC_TYPE = 'FUNCTION'
                    and v_proc_tbl(ind).PIPELINED = 'NO'
                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = 'PACKAGE'
                    and v_proc_tbl(ind).RETURN_TYPE != v_proc_tbl(ind).DEST_RETURN_TYPE
                    and v_proc_tbl(ind).RETURN_DATA_TYPE = 'PL/SQL RECORD'
                    then
                        v_sqltext := v_sqltext || chr(10) 
						|| 'is' 
						|| NL(4) || 'lv_temp ' || v_proc_tbl(ind).RETURN_TYPE || ';' 
                        || NL(4) ||p_Variable_Name||' ' || v_proc_tbl(ind).DEST_RETURN_TYPE || ';' 
						|| v_proc_tbl(ind).ARG_DECLARE_IN
						|| chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call
                        || '    lv_temp := ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end 
                        || ';' || chr(10) 
                        || '    '||p_Variable_Name||' := ' || v_proc_tbl(ind).DEST_RETURN_TYPE 
                        || '(' 
                        || Get_Record_Fields (
                        	p_Package_Name => p_Object_Name,
                        	p_Package_Owner => p_Object_Owner,
							p_Type_Name => v_proc_tbl(ind).RETURN_TYPE_NAME,
							p_Type_Owner => v_proc_tbl(ind).RETURN_TYPE_OWNER,
							p_Type_Subname => v_proc_tbl(ind).RETURN_TYPE_SUBNAME,
							p_Variable_Name => 'lv_temp',
							p_In_Out => 'OUT'
						)
                        || ');'|| chr(10) 
                        || v_trace_output
                        || '    return '||p_Variable_Name||';' || chr(10);                    
                    elsif v_proc_tbl(ind).PROC_TYPE = 'FUNCTION'
                    and v_proc_tbl(ind).PIPELINED = 'YES'
                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = 'TYPE'
                    then
                        v_sqltext := v_sqltext || chr(10) 
						|| 'is' 
						|| NL(4) || p_Variable_Name||' ' || v_proc_tbl(ind).RETURN_TYPE || ';' 
						|| v_proc_tbl(ind).ARG_DECLARE_IN
						|| chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call
                        || '    select cast(multiset(select * from table (' || chr(10) 
                        || '        ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end || chr(10) 
                        || '    )) as ' || v_proc_tbl(ind).RETURN_TYPE || ')' || chr(10) 
                        || '    into '||p_Variable_Name||'' || chr(10) 
                        || '    from dual;' || chr(10) 
                        || '    IF '||p_Variable_Name||'.FIRST IS NOT NULL THEN' || chr(10) 
                        || '        FOR ind IN 1 .. '||p_Variable_Name||'.COUNT LOOP' || chr(10) 
                        || '            pipe row ('||p_Variable_Name||'(ind));' || chr(10) 
                        || '        END LOOP;' || chr(10) 
                        || '    END IF;' || chr(10) 
                        || v_trace_output;
                    elsif v_proc_tbl(ind).PROC_TYPE = 'FUNCTION'
                    and v_proc_tbl(ind).PIPELINED = 'YES'
                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = 'PACKAGE'
                    then
                        v_sqltext := v_sqltext || chr(10) 
						|| 'is' 
						|| NL(4) || p_Variable_Name||' ' || v_proc_tbl(ind).DEST_RETURN_TYPE || ';' 
						|| v_proc_tbl(ind).ARG_DECLARE_IN
						|| chr(10) 
                        || 'begin' || chr(10) 
                        || v_trace_call
                        || '    select * bulk collect into '||p_Variable_Name || chr(10) 
                        || '    from table (' || chr(10) 
                        || '        ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end || chr(10) 
                        || '    );' || chr(10) 
                        || '    IF '||p_Variable_Name||'.FIRST IS NOT NULL THEN' || chr(10) 
                        || '        FOR ind IN 1 .. '||p_Variable_Name||'.COUNT LOOP' || chr(10) 
                        || '            pipe row ('||p_Variable_Name||'(ind));' || chr(10) 
                        || '        END LOOP;' || chr(10) 
                        || '    END IF;' || chr(10) 
                        || v_trace_output;                    
                    else -- procedures and special function without return value.
                        v_sqltext := v_sqltext || chr(10) 
						|| 'is' 
						|| v_proc_tbl(ind).ARG_DECLARE_IN
						|| chr(10)
                        || 'begin' || chr(10) 
                        || v_trace_call 
                        || '    ' || v_calling_subprog
                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then '(' || v_proc_tbl(ind).CALL_PARAMETER || ')' end 
                        || ';' || chr(10) 
                        || v_trace_output;
                    end if;
                    v_sqltext := v_sqltext 
                    || 'end ' || lower(v_proc_tbl(ind).PROCEDURE_NAME) || ';' || chr(10) || chr(10);
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
            AND NOT(DA.referenced_Owner = 'SYS' AND DA.referenced_Name IN ('STANDARD','DBMS_STANDARD'))
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
            p_Package_Owner => p_Dest_Schema,
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
        	$IF package_tracer.g_Use_Plscope_Settings $THEN
				-- enable the collection of global variables declared in the package into ALL_IDENTIFIERS
				EXECUTE IMMEDIATE q'[ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:PUBLIC, STATEMENTS:NONE']';
				-- compile the package header
				EXECUTE IMMEDIATE v_Clob;
				-- disable the collection of global variables declared in the package into ALL_IDENTIFIERS
				EXECUTE IMMEDIATE q'[ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE']';
			$ELSE
				-- compile the package header
				EXECUTE IMMEDIATE v_Clob;
			$END
        end if;
        -- create package body
        v_Clob := Get_Package_Body (
            p_Object_Name => v_Package_Name_Out,
            p_Object_Owner => v_Package_Owner_Out,
            p_Editionable => v_Editionable_Out,
            p_Package_Name => p_Package_Name,
            p_Package_Owner => p_Dest_Schema,
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

    PROCEDURE Refresh_After_DDL_Job
	IS
        v_Dest_Schema  CONSTANT VARCHAR2(128) := SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA');
	BEGIN
		DBMS_MVIEW.REFRESH(v_Dest_Schema||'.MV_PACKAGE_RECORD_TYPES');
		DBMS_STATS.GATHER_TABLE_STATS(v_Dest_Schema, 'MV_PACKAGE_RECORD_TYPES');
	END Refresh_After_DDL_Job;

    PROCEDURE Launch_Refresh_Job
	IS
	BEGIN
		dbms_scheduler.create_job(
			job_name => 'RF_MV_PACKAGE_RECORD_TYPES',
			job_type => 'PLSQL_BLOCK',
			job_action => 'begin package_tracer.Refresh_After_DDL_Job; end;',
			comments => 'Refresh MV_PACKAGE_RECORD_TYPES after DDL operation',
			enabled => true 
		);
		COMMIT;
	END Launch_Refresh_Job;
END package_tracer;
/

/*
-- Examples:
exec package_tracer.Launch_Refresh_Job;

GRANT EXECUTE ON APEX_190100.WWV_FLOW_SECURITY TO HR_DATA;

set serveroutput on size unlimited
call package_tracer.Enable('APEX_LANG');
call package_tracer.Enable('APEX_UTIL');

call package_tracer.Disable('APEX_LANG');
call package_tracer.Disable('APEX_UTIL');

select * from table(package_tracer.Dyn_Log_Call_List ('APEX_LANG'));

*/