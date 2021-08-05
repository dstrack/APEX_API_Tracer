# Generate APEX_DEBUG Calls to Trace Parameter Values for whole packages

APEX_API_Tracer enables the tracing of calls to package procedures or functions into the APEX Debug Log without manual programming.

This program can generate a package for tracing automatically when the following conditions apply:

  1. the package is accessible to the schema user via a synonym.
  2. the procedure or function is listed in the package header.
  3. the package defines no pl/sql table types.
  4. the package header is not wrapped.

The enable - procedure will generate a tracing-package with the same name as the synonym in your local schema.

The link from your local applications to the synonym will be intercepted by the generated package.

The package will contain the same functions and procedures as the original package.

When the Option 'Logging of Procedure Start' is set to Yes, then each function and procedure consists of:  

 1. A call to APEX_DEBUG.LOG_LOG_MESSAGE to produce log entries with text for valid PL/SQL procedure calls with enquoted parameters, that you can copy and paste into the sql console for testing. Arguments of type IN and IN/OUT are logged.
 2. A call to invocate the original procedure or functions.
 3. A call to APEX_DEBUG.LOG_LONG_MESSAGE to produce log entries for the output values and return values of the invocation. Arguments of type OUT and IN/OUT are logged.

When the Option 'Logging of Procedure Start' is set to No, then each function and procedure consists of:  

1. A call to invocate the original procedure or functions. 
2. A call to APEX_DEBUG.LOG_LONG_MESSAGE to produce log entries for all argument values and function return values of the invocation. Arguments of type IN, OUT, and IN/OUT are logged.

For other packages where the above-mentioned conditions do not apply, you can manually add generated code with invocations to the api_trace package to support logging for prepared functions or procedures in your own packages.

# Usage

Install the APEX application with supporting objects.

Start the Application and use the Switch in the column 'Tracing is Enabled' to start and stop the tracing of a package. 
The app will list for some packages the grant statements that you have to execute as an admin. 

For some APEX APIs you have to grant access to the following objects:

GRANT EXECUTE ON APEX_<version>.WWV_FLOW_SECURITY TO <schema_name>;

GRANT EXECUTE ON APEX_<version>.WWV_FLOW_THEMES TO <schema_name>;

GRANT EXECUTE ON APEX_<version>.WWV_FLOW_THEME_STYLES TO <schema_name>;

Start an APEX application that you want to trace and execute a page with debugging enabled. 
The debug log will now contain entries that list the invocations with input and output parameters for the prepared packages.

In the section 'Trace Code for LOCAL packages' 
  you can list invocations to the package api_trace for your own local packages.
  The switches 'Compact' and 'Logging of Procedure Start' control the code generation for your need.
  Copy the listed code into your package to enable tracing of your procedures and functions.
  The generated code uses the api_trace.Literal function to convert the passed values to quoted literals.
  The function api_trace.Literal is overloaded to support many data types. Datatypes that can not be 
  converted like records are logged with a <datatype x> placeholder. The logged values are truncated to a maximum length (1024 by default).
  There is no upper limit for the number of arguments the you can pass the the api_trace logging functions.
  The compact form of the generated code executed directly with the simple passing of the function arguments list.
  The number of arguments will be checked at runtime to match the count of arguments of the current calling function.
  
In the section 'Publish Application Objects in other Schema' 
  you can produce a copy of a schema.
  The target schema name should be a new empty schema, that was created in the APEX Admin / Workspace to Schema Assignment page.
  In the copied schema, tables and views are present as views that access the original tables and views.
  Other objects like packages, functions, procedures, and types are represented as synonyms.
  An application that can run in the original schema will be able to run in the copied schema too.
  
In an sql-worksheet or sqlplus
Use the package_tracer.Enable procedure to start tracing of a package.

Use the package_tracer.Disable procedure to stop tracing of a package.

# What these procedures do:
1. enable: 
    detect local packages with the same name that may be overwritten.
    support local synonyms. 
        local synonym is dropped before the package is created.
        The origial synonym definition is captured in a comment of the generated package header.
    produce synonyms and grants for dependent objects.
    In the case that additional privileges are required, print grant statements and then stop.
    create a package header as a slimmed copy of the target package.
    create a package body that for each procedure or function
        prints the call parameter in the APEX debug log.
        then execute the target function or procedure 
        print return values and output parameter after function call in the APEX debug log.

3. disable: 
    execute drop statements for synonyms that are no longer required 
    execute drop statement for the local package 
    recreate the local synonym when no PUBLIC synonym exists.

3. Dyn_Log_Call_List:
    For a given package_name generate invocations to the api_trace logging functions. 
    The parameters p_Compact and p_Logging_Start_Enabled control the code generation for you needs.
  
For the publish-app-schema functionality you need the following privileges:
GRANT CREATE ANY SYNONYM TO <schema_name>;
GRANT DROP ANY SYNONYM TO <schema_name>;
GRANT CREATE ANY VIEW TO <schema_name>;
GRANT DROP ANY VIEW TO <schema_name>;

A demo of the app can be found here:

https://yboieokpjit8ejk-strackdev02.adb.eu-frankfurt-1.oraclecloudapps.com/ords/f?p=104:9999

User/Password: demo/simple2021

