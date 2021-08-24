/*
Package_Tracer enables the tracing of calls to package procedures or functions without manual programming.
This program can generate a package for tracing automatically when the following conditions apply:

  1. the package is accessible to the schema user via a synonym.
  2. the procedure or function is listed in the package header.
  3. the package header is not wrapped.

The ENABLE procedure will generate a package with the same name as the synonym in your local schema.

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
GRANT MERGE ANY VIEW TO <schema_name>;

*/
create or replace type STATEMENT_AGG_TYPE
AUTHID CURRENT_USER
AS OBJECT
(
   total clob,

   static function
		ODCIAggregateInitialize(sctx IN OUT STATEMENT_AGG_TYPE )
		return number,

   member function
		ODCIAggregateIterate(self IN OUT STATEMENT_AGG_TYPE ,
							 value IN clob )
		return number,

   member function
		ODCIAggregateTerminate(self IN STATEMENT_AGG_TYPE,
							   returnValue OUT  clob,
							   flags IN number)
		return number,

   member function
		ODCIAggregateMerge(self IN OUT STATEMENT_AGG_TYPE,
						   ctx2 IN STATEMENT_AGG_TYPE)
		return number
);
/

create or replace type body STATEMENT_AGG_TYPE
is

	static function ODCIAggregateInitialize(sctx IN OUT STATEMENT_AGG_TYPE)
	return number
	is
	begin
	    sctx := STATEMENT_AGG_TYPE( null );
	    return ODCIConst.Success;
	end;

	member function ODCIAggregateIterate(self IN OUT STATEMENT_AGG_TYPE,
	                                     value IN clob )
	return number
	is
	begin
	    self.total := self.total || value || ';';
	    return ODCIConst.Success;
	end;

	member function ODCIAggregateTerminate(self IN STATEMENT_AGG_TYPE,
	                                       returnValue OUT clob,
	                                       flags IN number)
	return number
	is
	begin
	    returnValue := self.total;
	    return ODCIConst.Success;
	end;

	member function ODCIAggregateMerge(self IN OUT STATEMENT_AGG_TYPE,
	                                   ctx2 IN STATEMENT_AGG_TYPE)
	return number
	is
	begin
	    self.total := self.total || ctx2.total;
	    return ODCIConst.Success;
	end;
end;
/


CREATE or REPLACE FUNCTION STATEMENT_AGG(input clob )
RETURN clob
AUTHID CURRENT_USER
PARALLEL_ENABLE AGGREGATE USING STATEMENT_AGG_TYPE;
/


CREATE OR REPLACE PACKAGE package_tracer
AUTHID CURRENT_USER 
IS
    c_APEX_Condition_Start     CONSTANT VARCHAR2(1000) := 'if apex_application.g_debug then';
    c_APEX_Condition_End       CONSTANT VARCHAR2(1000) := 'end if;';
    c_Package_Name             CONSTANT VARCHAR2(128) := lower($$plsql_unit);
    g_debug                    CONSTANT BOOLEAN := FALSE;
    /* when the constant g_Use_Plscope_Settings is set to TRUE,  
    	information about the public variables of the package headers is collected.
    	The Global_Variables_Count of the packages list is calculated 
    	by assessing the view ALL_IDENTIFIERS. A package should have no Global Variables
    	that your application is accessing.
    */
    g_Use_Plscope_Settings     CONSTANT BOOLEAN := FALSE;
    
    TYPE rec_logging_calls IS RECORD (
        Package_Name    SYS.ALL_ARGUMENTS.PACKAGE_NAME%TYPE, 
        Object_Name     SYS.ALL_ARGUMENTS.OBJECT_NAME%TYPE, 
        Subprogram_Id   SYS.ALL_ARGUMENTS.SUBPROGRAM_ID%TYPE, 
        Overload        SYS.ALL_ARGUMENTS.OVERLOAD%TYPE,
        Procedure_Name  VARCHAR2(512),
        Logging_Call    CLOB
    );
    TYPE tab_logging_calls IS TABLE OF rec_logging_calls;
    
    TYPE rec_dependent_grants IS RECORD (
        Owner           VARCHAR2(128),
        Name            VARCHAR2(128),
        Grant_Stat      VARCHAR2(1000),
        Synonym_Stat    VARCHAR2(1000),
        Grantable       VARCHAR2(3),
        Privilege       VARCHAR2(1000),
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
        Is_Enabled      VARCHAR2(1),
        Grant_Stats     CLOB,
        Revoke_Stats    CLOB,
        Synonym_Stats   CLOB,
        Affected_Objects VARCHAR2(32767),
        Global_Variables_Count NUMBER,
        Error_Count     NUMBER
    );
    TYPE tab_Packages_Control IS TABLE OF rec_Packages_Control;
    
    FUNCTION in_list(
        p_string in clob,
        p_delimiter in varchar2 DEFAULT ';'
    )
    RETURN sys.odciVarchar2List PIPELINED DETERMINISTIC;

    FUNCTION Enquote_Name ( p_Text VARCHAR2 )
    RETURN VARCHAR2 DETERMINISTIC;

    FUNCTION get_Packages_Control_List (
        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')    
    )
    RETURN tab_Packages_Control PIPELINED;
    
    FUNCTION get_APEX_Control_List 
    RETURN tab_Packages_Control PIPELINED;

    TYPE rec_publish_schema IS RECORD (
        OWNER           VARCHAR2(128),
        OBJECT_NAME     VARCHAR2(128), 
        OBJECT_TYPE     VARCHAR2(128), 
        DEST_OBJECT_TYPE VARCHAR2(128),
        FOREIGN_DEPS_CNT        NUMBER,
        DEST_OBJECT_EXISTS VARCHAR2(3),
        CONFLICTING_OBJECT_EXISTS  VARCHAR2(3),
        DEST_SCHEMA     VARCHAR2(128),
        GRANT_STAT      VARCHAR2(4000), 
        CREATE_STAT     VARCHAR2(4000), 
        REVOKE_STAT     VARCHAR2(4000), 
        DROP_STAT       VARCHAR2(4000),
        IS_ENABLED_SWITCH VARCHAR2(32767)
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

    FUNCTION Is_Printable_DATA_Type (
        p_Data_Type IN VARCHAR2
    ) RETURN VARCHAR2 DETERMINISTIC;
    
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
        p_in_out VARCHAR2 DEFAULT 'IN/OUT', -- IN, OUT, IN/OUT
        p_return_variable VARCHAR2 DEFAULT NULL -- optional name of the variable containing the function result. Usually 'lv_result'
    ) RETURN VARCHAR2;

	FUNCTION NL(p_Indent PLS_INTEGER) RETURN VARCHAR2 DETERMINISTIC;
	FUNCTION INDENT(p_Text VARCHAR2, p_Indent PLS_INTEGER) RETURN VARCHAR2 DETERMINISTIC;
    FUNCTION Replace_Substitution (
    	p_String IN VARCHAR2,
    	p_Procedure_Name IN VARCHAR2,
    	p_Package_Name IN VARCHAR2,
    	p_Return_Type IN VARCHAR2
    ) return VARCHAR2;
    -- helper query for listing the procedures with parameters of a package
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
    ) RETURN tab_logging_calls PIPELINED;

    FUNCTION Get_Package_Source  (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Editionable  IN VARCHAR2 DEFAULT 'N',
        p_Type IN VARCHAR2 DEFAULT 'PACKAGE',
        p_Strip_Comments IN VARCHAR2 DEFAULT 'Y'
    ) RETURN CLOB;

    FUNCTION Get_Package_Synonym_Text (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ) RETURN VARCHAR2;

    TYPE rec_record_fields IS RECORD (
    	Type_name 		VARCHAR2(128 BYTE),
    	Item_Name		VARCHAR2(128 BYTE),
    	Item_Type		VARCHAR2(512 BYTE),
    	Item_Sequence	INTEGER,
    	Index_by		VARCHAR2(128 BYTE),
    	Nested_Table	VARCHAR2(1 BYTE),
    	Table_Type 		VARCHAR2(20 BYTE),
    	Type_Object_Type VARCHAR2(20 BYTE), -- PACKAGE, TYPE, TABLE
    	Data_type 		VARCHAR2(512 BYTE)
    );
    TYPE tab_record_fields IS TABLE OF rec_record_fields;
    -- list record and table types of a package
    FUNCTION Pipe_Record_types (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    ) RETURN tab_record_fields PIPELINED;
    
    FUNCTION Get_Record_Fields (
        p_Package_Head IN CLOB,
        p_Type_Subname IN VARCHAR2,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_temp'
    ) RETURN VARCHAR2;

    FUNCTION Get_Record_Fields (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Type_Name IN VARCHAR2,
        p_Type_Owner IN VARCHAR2, 
        p_Type_Subname IN VARCHAR2,
        p_Variable_Name IN VARCHAR2 DEFAULT 'lv_temp',
        p_Owner IN VARCHAR2 DEFAULT NULL,
        p_Nested_Table IN VARCHAR2 DEFAULT 'N',
        p_In_Out IN VARCHAR2 DEFAULT 'IN'
    ) RETURN VARCHAR2;

    FUNCTION Get_Table_Conversion (
        p_Package_Name IN VARCHAR2,
        p_Package_Owner IN VARCHAR2,
        p_Type_Name IN VARCHAR2,
        p_Type_Owner IN VARCHAR2, 
        p_Type_Subname IN VARCHAR2,
        p_Object_Name IN VARCHAR2,
        p_In_Out IN VARCHAR2
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

    PROCEDURE Refresh_After_DDL_Job;
    PROCEDURE Launch_Refresh_Job;
END package_tracer;
/

DECLARE
	PROCEDURE DROP_MVIEW( p_MView_Name VARCHAR2) IS
		time_limit_exceeded EXCEPTION;
		PRAGMA EXCEPTION_INIT (time_limit_exceeded, -4021); -- ORA-04021: timeout occurred while waiting to lock object 
		mview_does_not_exist EXCEPTION;
		PRAGMA EXCEPTION_INIT (mview_does_not_exist, -12003); -- ORA-12003: materialized view does not exist
		v_count NUMBER := 0;
	BEGIN		
		LOOP 
			BEGIN 
				EXECUTE IMMEDIATE 'DROP MATERIALIZED VIEW ' || p_MView_Name;
        		-- DBMS_OUTPUT.PUT_LINE('DROP MATERIALIZED VIEW ' || p_MView_Name || ';');
        		EXIT;
			EXCEPTION
				WHEN time_limit_exceeded THEN 
					APEX_UTIL.PAUSE(1/2);
					v_count := v_count + 1;
					EXIT WHEN v_count > 10;
				WHEN mview_does_not_exist THEN
					EXIT;
			END;
		END LOOP;
	END;
BEGIN
    NULL;
	DROP_MVIEW('MV_PACKAGE_RECORD_TYPES');
END;
/

CREATE MATERIALIZED VIEW MV_PACKAGE_RECORD_TYPES (
	Package_Owner, Package_Name,
	Type_Name, Item_Name, Item_Type, Item_Sequence, Index_By, 
	Nested_Table, Table_Type, Type_Object_Type, Data_type
)
	NOLOGGING
	BUILD DEFERRED
    REFRESH COMPLETE
    ON DEMAND
AS
SELECT 
    A.Package_Owner, A.Package_Name, 
    UPPER(T.Type_Name) Type_Name, 
    T.Item_Name, 
    UPPER(T.Item_Type) Item_Type, 
    T.Item_Sequence, T.Index_By, T.Nested_Table, T.Table_Type, T.Type_Object_Type, T.Data_type
FROM (        
    select distinct
        SYN.TABLE_OWNER     Package_Owner,
        SYN.TABLE_NAME      Package_Name
    from SYS.All_Synonyms SYN
    join SYS.All_Objects OBJ on SYN.TABLE_NAME = OBJ.OBJECT_NAME and SYN.TABLE_OWNER = OBJ.OWNER
    where Syn.OWNER IN ('PUBLIC', SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') )
    and OBJ.OBJECT_TYPE = 'PACKAGE'
/*    UNION -- local packages
	-- currently not used
    select distinct
        OBJ.OWNER     		 Package_Owner,
        OBJ.OBJECT_NAME      Package_Name
    from SYS.All_Objects OBJ 
    where OBJ.OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    and OBJ.OBJECT_TYPE = 'PACKAGE' */
) A, table(package_tracer.Pipe_Record_types(p_Package_Name=>A.PACKAGE_NAME, p_Package_Owner=>A.PACKAGE_OWNER)) T
;

CREATE INDEX MV_PACKAGE_RECORD_TYPES_IND1 ON MV_PACKAGE_RECORD_TYPES(Package_Owner, Package_Name, Item_Type, Nested_Table) COMPRESS;

COMMENT ON MATERIALIZED VIEW MV_PACKAGE_RECORD_TYPES IS 'Package Record and pls/table definitions for package_tracer';

