prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>1293931922049787
,p_default_application_id=>103
,p_default_owner=>'STRACK_DEV'
);
end;
/
 
prompt APPLICATION 103 - APEX API Tracer
--
-- Application Export:
--   Application:     103
--   Name:            APEX API Tracer
--   Date and Time:   01:00 Thursday August 5, 2021
--   Exported By:     DIRK
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         19.1.0.00.15
--   Instance ID:     250161874321153
--

-- Application Statistics:
--   Pages:                      4
--     Items:                   27
--     Computations:            13
--     Processes:               16
--     Regions:                 12
--     Buttons:                 12
--     Dynamic Actions:          6
--   Shared Components:
--     Logic:
--       Items:                  1
--       Build Options:          1
--     Navigation:
--       Lists:                  3
--       Breadcrumbs:            1
--         Entries:              1
--     Security:
--       Authentication:         1
--       Authorization:          2
--     User Interface:
--       Themes:                 1
--       Templates:
--         Page:                 9
--         Region:              16
--         Label:                7
--         List:                12
--         Popup LOV:            1
--         Calendar:             1
--         Breadcrumb:           1
--         Button:               3
--         Report:              10
--       LOVs:                   1
--       Shortcuts:              1
--     Globalization:
--     Reports:
--     E-Mail:
--   Supporting Objects:  Included
--     Install scripts:          2

prompt --application/delete_application
begin
wwv_flow_api.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_api.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'STRACK_DEV')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'APEX API Tracer')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'103')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'8FBDA42CFE0B0CDEC210B1F722DCC57B2E65F3CC0F14EE45027E91A5FFFB7653'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'19.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_documentation_banner=>'Application created from create application wizard 2021.06.19.'
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_api.id(261796453618419187)
,p_application_tab_set=>1
,p_logo_image=>'TEXT:APEX API Tracer'
,p_app_builder_icon_name=>'tools_report_bug.png'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.1.3'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_vpd=>'apex_util.set_parsing_schema_for_request (p_schema => NVL(:APP_PARSING_SCHEMA, :OWNER));'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'APEX API Tracer'
,p_last_updated_by=>'DIRK'
,p_last_upd_yyyymmddhh24miss=>'20210805010048'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>9
,p_ui_type_name => null
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(261797258521419191)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(261935654776419331)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(261925381539419278)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(262826438351757353)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'About'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(261937104934419340)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(261937624606419340)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_api.id(261937104934419340)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(261938079978419341)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(261937104934419340)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/p1_sections_list
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(261961755284108369)
,p_name=>'P1_SECTIONS_LIST'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(261961984077108375)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'APEX API Packages'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::P1_SECTION:APEX:'
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P1_SECTION = ''APEX'''
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(261962325346108376)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'All Traceable Packages'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::P1_SECTION:PUBLIC:'
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P1_SECTION = ''PUBLIC'''
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(261962716640108376)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Tracing Code for LOCAL Packages'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::P1_SECTION:LOCALE:'
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P1_SECTION = ''LOCALE'''
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(262304238207075009)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Publish Application Objects in other Schema'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::P1_SECTION:PUBLISH_SCHEMA:'
,p_security_scheme=>wwv_flow_api.id(262423557066074213)
,p_list_item_current_type=>'PLSQL_EXPRESSION'
,p_list_item_current_for_pages=>':P1_SECTION = ''PUBLISH_SCHEMA'''
);
end;
/
prompt --application/shared_components/files/tools_report_bug_png
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000040000000400806000000AA6971DE0000000473424954080808087C0864880000000970485973000006EC000006EC011E7538350000001974455874536F667477617265007777772E696E6B73636170652E';
wwv_flow_api.g_varchar2_table(2) := '6F72679BEE3C1A0000128F4944415478DAED5B09705DD579FEEEBDEFDDB73FED96E44D36F222C9183B051B0C31C6409C29C14DA10E6096923490D009998440A184D21012C8B8E34229D026EC0526C46537B15B021832401DB31963111B5BC8962C4B9625';
wwv_flow_api.g_varchar2_table(3) := '3DE9EDDB7DF7F6FB9F4EDEBCD14C5AE345D60C39339FEE7B7739F7FCDFBF9E739E34C771F0796E3A3EE7CD85A3D4344D3315A159E7189915DF21E335891C5F614D180BE0C0421E8F67792010580DA05E633B06C2BBD9E685C3E19B4CD36C95EF13820025';
wwv_flow_api.g_varchar2_table(4) := '6C1D0958ED72B99602F0E0D83483D00CC3B89804B401084D080294B91FE4E117C16050066511067911984748AE2E8072D77C3E6F555656F62412893701C42704018A84443C1EEFE2004334D13BC5226A80398B81F32840E0704DBE19F8C27440CCDD4BEB';
wwv_flow_api.g_varchar2_table(5) := '3AA9AAAA6AC3E0E0E02600237C677EA26581443A9DDEC6815E4A5F9DB2103873167033800A1C5E0BB08FEF7E01F826804A9FCF773EFB6DB02CEBB700B213310D26B3D9EC1375757523D3A64D3BE71DE07503A8399196400DFA3F6BB4F7007575C0D24E60';
wwv_flow_api.g_varchar2_table(6) := '2300B3A6A6E69CEAEAEA6748F22E6ABF30E1089041E572B9FD0C500F4F9F3E7D611C4890842BCF00AE5FD5D6B68C42D513E621F87CB8D6E369BE67D5AA1FF702776C073E14FFA7EFCF4EA552FF26E68FA3D88E6A2528027ABDDED356AD5A75DDBA75EB6E';
wwv_flow_api.g_varchar2_table(7) := '634CE8A805A67E05B8D8EDF73BEDA9D4E6DF019F00C811832A6338449EA80851EB5F02BED218084CEDF07A37BC3C34F49E5C677ABD80AE757E341AFD01C7DB3D910908D0056E659F37D11DD63030FE14408AA821C26703A7770257EF051EA9ADADDDCBAC';
wwv_flow_api.g_varchar2_table(8) := 'B18CF726878787DF442C76E93212F23A706F02880B41BC96629F53A9FD8D3CCECF64325FA40B6CE6797BC25582AA79FD7EFF6C062A10CD004CC9102A13DCF186AEBF55190EBE3BD91FBC04C0B97419036C24225DD5187EEFB57D036B52A9ECB700F4100F';
wwv_flow_api.g_varchar2_table(9) := 'A83E4D46FFA642A100DBB6DB4880584576C212C0368B828103FD6F006995C72DC68613E6B54EB9F88273D2854A336BFCFC690B7D111DD216CFC9FBEEBE3EB9F4DAB5DE33B6EEAED269117F0FC051455682046DD0757D35C96CA11BB8266A1690E6634538';
wwv_flow_api.g_varchar2_table(10) := '9BD5DA9648242204E489C9EB1E5E72EFA285B50786225174F5870C9F0FD8D79F034DBA88ADBB2DBCBFBF06FB8627EB7C16DFBE2454F1E83F37AF05504F4463B1D87D15151569D618B3E51D389A8DAC1E15B01953A74E3DEBE4934F76264F9E2C261E24A6';
wwv_flow_api.g_varchar2_table(11) := 'BDFADCD2F678E719CEFE2D739D8D0F57380D0D931CBA89434B7168154590B42216B44E7236AED19CD40EBF93EC9CEDDCF7B39647013410752B57AE7C68D1A2451F0AA1F2BEA305D7D1E492DA8CD36A077B7B7BB748545FFFD8DC754B1747E699661C41FF';
wwv_flow_api.g_varchar2_table(12) := '30B6FF3E4F1FA982CF1728BE5CFC5AC50B3063A0A33B89FE410D85740AC1AA83B8F42FEBAE1C1A98DCFFA3BB7AEF1D1818789331A0054061424E87253253F891193366A4E8B35FBEE766FBF2B3971C58621A166065F0EB974CDC767F23162D3A058CEA38';
wwv_flow_api.g_varchar2_table(13) := '70E000DADBDBE5B91219F4735CF70B13BD83595C7E4514D35B92DA3756056EDCB23538B3B36F6427FB3F286E3591D360637373F36D434343576D5A1BD5EA1A1DEDFE67FD78EDDD200EC67C58BC783156AC5801BA4851F8575E7905BB77EF86044DB180F2';
wwv_flow_api.g_varchar2_table(14) := 'A310D2540F3CBF06884561DFFACCD2213EF33D06C817253D4ED42C30D2DFDFDF4E01FAAEB8C33DA579B20BFFF3891FA6E922B4A2E667CD9A5524824152D21FFE8FC68009ACBA1908FAA0F7C6765814FE030069021395802CA7AA9B00ACEDE8F5A07BD0A0';
wwv_flow_api.g_varchar2_table(15) := 'E0A580839E9E1E6CDBB60DF4677474748064FDF1A0AA5A671F541B8C0048396C1399004963F3E8CB2603160831E552B0DBB1630758CF9762804015380211BC742C6FEC0F2C85A5BEF04CC8354155EC84884AA6B3DC09A6F956C1E73B23A1EB5AA14CAB42';
wwv_flow_api.g_varchar2_table(16) := 'C29E3D7B204D092BE74A24B089A045303D82D35F78F9B9921793A9D4DD9DB95C565595CA1226401054D55A038B94BFA5A62E5B64D9D3EE4ADABAA93986CFB1F05EC08D2DA1107A6B833869450843090D91A481E1A886A1B80343775049EA6A4236AA0336';
wwv_flow_api.g_varchar2_table(17) := '3CB6858F5F8E626E3289B39229CCCF5848C1400C5AEEB2A0BBBDD3293C914C269F05D0CFB1E7260201D5A150E81BD4DADA19051B0FC66CC7D01C2D8C1CBC4E1E061C024584362D876B4915A49DFF17FB91C879C149132637EA78F2917AF8BC1A326B3A90';
wwv_flow_api.g_varchar2_table(18) := 'BEBD7DD47D00D8D0D89349125C88699AB3BA21AC6575ED0DC691EFD025646DC03A6E04C84207DBB934FBA700F89F1EC967C28EEEAD44067EE44A82BB08DD1F80312904F3EEC558BB2D8B67D70F401AA7BAC5B8D03CC38B9FCD7161D2C33B61A7D328A492';
wwv_flow_api.g_varchar2_table(19) := 'A3F1032822090FE24497CF155F73D2EC505F5FDF2BDDDDDD5701D82F6B11E34E80ACDAC83235676A2F9280A6BF8B6646E6C7ACCA06241150C2BB1474AF0F46305024E13FE90EF7B8E42A4A04D0A4216D01F1EFB1386C12524824602713B080226CD3C448';
wwv_flow_api.g_varchar2_table(20) := '4E47045E6C9A56FDDE7355C153586FACDBBF7FFF0D007A0F778AAC1F86E05EA201C04CB6DB18AC9A26B95CC95931AB22840C7C145E938E1534C380EEF1144948F8FCB85F4379092C9F4BD84AB33FC07B74AFB708CDF4A87E08D60C15151E78DC1ABEB86F';
wwv_flow_api.g_varchar2_table(21) := '681E678577D2ED2EE652D9E500821ADB312540CC5D041793E7CCEC3FE6CD9BB78DDA9B4F5F7DFAFBDD835BA13BDA3BF561B45755216D9A42C22818C98D796D70AF5E8DAAABAFC2890B178E155CBE97D06DBAA17944789370AB7E14911515A80F1B28B84D';
wwv_flow_api.g_varchar2_table(22) := 'DF4D5DFD36ABC6C78484B6B6B68D73E6CC79ACB1B171F167DD30711DCAAE0F8030ABB6957CD9D70034D1DC7ECBE5E99FB2E8D9A02593B4F79A0FEF9F5DCBC19BF0528BFFC002E794E161B8A5BE0F87612C580863D999D04F3F1D97FEBA0E9D5D5DC51A80';
wwv_flow_api.g_varchar2_table(23) := 'AD44827A176ADC2649B3A0B95CA3D07568EC732D89FC74E64C84694DDFDDB6039983B9AB38E95A2E75075DF054E24C2AE4CDA6A6A64DAC33AEA5857401B0C5350E9B00D9DCA09FB752EBB771FADA44587CE95F91F95EBE2005C0F957F86FD955E935F772';
wwv_flow_api.g_varchar2_table(24) := 'B00E058973B0EFD37C4FE4807DFCAED1C74593A076D1BD0F2D14A8C6E7C37E5E2B2740843F2F14448BC784CDCC201A17E1F9079BBC263652FB1A2B4899477435D6C04C38F55F4F26A73D56B07EC360B815C053BCF655A6E20BB984FE028F4F324B7CC87E';
wwv_flow_api.g_varchar2_table(25) := '7FE3B01DAE0518B20FC7CE16707DEFAB393659E894C98822A82A08D7D9BFF76A2244A9B8E9E6C0DD4A40676808CEBE1ED8DB3F067AFB5077A00FB7E432581F0A6037039D97C780D7833F0F87B082DA473C39460B7C4CD74B2431FA63737D3D2EAB49688B';
wwv_flow_api.g_varchar2_table(26) := 'D3DE0B1EB3136FF3BD9D129BA89C0480F5B48065B48C7FA44BAD5632E60F97803C23F4EB006E60AADA4B8C8CC9BB7E1FD0D8170C9408100C139E7C1E8E1020F9FCA38FA08956C315C80EF46312D3DC6A3EF9522C8629E1202E62DC402A0324D340C1E633';
wwv_flow_api.g_varchar2_table(27) := '05C22E02C43CDEEFD0826C1221FD6FE6F7AB2A7C080D064F452AE155956186247400A8E672DC4E8EE72212B01B8075D82EE0B0B1D37D24E14500D9B1F9D603F80206EA4628803D3050226059342AC28FC2A23014B4B07327100A232F5D182AF6F29A99CD';
wwv_flow_api.g_varchar2_table(28) := '8F0A9FC902D91C9C1C21E409AC5122E603B888FD3FC5AD12694391080EF29D95BE582D52F08E19EF088BABDFA9535139774459C0196D29A230363E5C02CF5CAFCFF07391AF34A13169095F4E244A048820B608451498DF9D4C0EA0D022ACC40533670189';
wwv_flow_api.g_varchar2_table(29) := '5489043B938193CDF2B9DC28D420AF89C711CEE74B59A3074085DF5D0DC01CBB41430C2BD8C7725154AF86565B69EAB2F755D4D4720AFE686F2F4262BE006CA2879FBA28885477565A08C8084609C817E0926382E793ACFC882E56801FF0DE0CC910226C';
wwv_flow_api.g_varchar2_table(30) := '45A4B49353A912D153E90E1E8FCB0D80383EB3419D708151FB066AE5DAEE6EF8696D9A127C1BB3C043CC006FAA9A6065DEC2320A77AA313ADBB385346AD4954953AB0ECD3D8F8758F9FD849622C1CEC718B1DC656025C9384D11B18204C5796D21EF699A';
wwv_flow_api.g_varchar2_table(31) := '360D033A5C26E092D9A8687BBC09804315E6C056C3B454E66A3FE07CFF2DD31C8D096A7EFFBCAEE17D9AEE0A0A7DB5619000BD48804ED32FE4B218E0E73B7914623422096003497C8D78963E3F89242FA6E52C22C0346BF31D5C5131E6C2EDDF8EFC71D9';
wwv_flow_api.g_varchar2_table(32) := '17E0D2B61B59D11809C8CA0985080510332D87AEB2C41B4437B56A13A275239DC40106C9EFD03D32EADEF2459234EFBF3514927E4BB0590B14E802CCC9A8F1BBB5E3B53152487BBD91B4F825EBF41C356EA901B69294B104B809288B6817012970D105F8';
wwv_flow_api.g_varchar2_table(33) := '7C3C11C75B2A8394AD0C95B04B57C32C2320CF73D97C3EFD462A1511F31F770224DA6ECEE7BBD212DD69D2796A29AD06982913C051821965DF411444101E759E6B20214699F06349C8A9A02A48132001722E9ECD0EC8EB8E9705E09D647228A3E9C36946';
wwv_flow_api.g_varchar2_table(34) := 'FF3C4BD51450845F09502E84A1BE6BC402B1002590A18ED32D6BACF0A53E82F259499AE37B2CBF1F599E8BC613FD00B2C7736F30CB99DF81C4C8082C5A80089F242E62D45E49940BA1ABCFE752D0F01F2C400DC022CEB4ACB1C297701A5D25A3FACE5557';
wwv_flow_api.g_varchar2_table(35) := '23CB7B53243DA11B07E5D4F15C14B5A2BAFE713C126975532B697532C041DFC0685D699A789C29AF96DFE752A8B3A8F9F3641BAC2CB7BB141197F1FC3E4DC3CB74271F8F72EE249E6BE3B35FA39B25947569CC00521FC438DB1C76B9DA157FE34F005395';
wwv_flow_api.g_varchar2_table(36) := '4C941A7FE972D5DEC834C5455124CB227581F83A077E0DE155737A8B82A94059825B11308982DEC57BBFC7B47725897A8D449CC9630B8913ED2794FFBB79DD120222C3780E18515DA48F87055473DA79DD5E38F3460E0E168253A618091146C122F26530';
wwv_flow_api.g_varchar2_table(37) := '15098E608C059417EB6BD4244AEA8A7A22AE7C3FADE02331600AED4CA5F7EF31B46B003C476524C66B49AC7C9DE0044E39FF3A6F593F8E0C0E6FCFEA3A523E1F7AA8E583840C5C102B3B261432CA710B65913DA9EE49A963258597A36098D84CC13751FB';
wwv_flow_api.g_varchar2_table(38) := '49F63D128DE2835CEE20DFDFC45F8E5D0A2034DE1610A0C95F48123EE51EDFC6615F55D3E64F3E59F8FAECD9D8D9D1510C62B368BED7D0871B2888251A2D8BF8962220AF08B1CADCC652C8AB7B3A48ECBDA689088F24BE68EF730787ED64AEF0B8EE3517';
wwv_flow_api.g_varchar2_table(39) := 'F2DC6A008F10D1F1CC0201AE0E2D654DFFA9C8F0407AF8C1917D7D315F2854DAD6DAC5C1DE43AD8D945901510A6602A9E6A292CE801262651822D632880EAA9D24BE0F51F6498BDBF16A3AF612857F9756309BAED82856399E04E81C4C2557648B961C03';
wwv_flow_api.g_varchar2_table(40) := '062A13D6DBB9484496B94BE96B0F80D74844B9F04985B1040851D131D824D795F08206AE074CE9EDC76022BD01804C77DFD1755DE37AE56900CCF124C020E34165A536115BEF647E38BF635FAC86850AB502A881BF2A42941170A08C80DC1881C75AC266';
wwv_flow_api.g_varchar2_table(41) := '4D2B09CF75492C2059DA40ACF33E3BF92FF23885B7D5C669ABB8F378C6005992B6B9311106E056BF0ED9BD34EFFE554B77CFB7862BC3E06666F10750117107E204A5A2E72994D4097522248F517E1752A406F8923A6F29A495F022E41406D829FD43851D';
wwv_flow_api.g_varchar2_table(42) := 'B9CC3F0188A8F427D70419E17B5CD3A0AC8FF2C56D007C4ADB499270FBB7F3FEF3E60E45A66ED1004DCD0A0D15E9F384478DDE5273867689EA6AF42E6529B602540BB2F8691B1A462283F75E44F669BE4B76893DB434BF10507A6C3C0850DBD3CD0C3CBD';
wwv_flow_api.g_varchar2_table(43) := '5C295EC24C50CB733D2A0F1FDC8CDC9527DBEE171A9009EDE4E0249D89D05915E5CFE0F7BD2AB515F8B992040883CB55796C9511F067AA0E688CC5E1733C7D4F237D897A549A8FA63FD71C5D77881FAE05E887F13F3B331A1A1AE4DF63DAA8DD57398016';
wwv_flow_api.g_varchar2_table(44) := '658E3290FC47B036EF41E146173C796E1B61068510E1053985C92214E1256A8885EA7C660CEAF8EC0C593875DCF12DC85F320208D10E14017C772557AAFF0B401B3FCF14E51C330B902D27D904E56F7C6E077001578AB77173E41695AD0A65D3E434EFFD';
wwv_flow_api.g_varchar2_table(45) := 'E532B82657C1BCC98DBC69A0B4540683D08880407C9E169052023B845D76B4A0210F77B20FD6353B5078877D5B6A2C3A1510A21B3ECC71E82C86EE68696959CECF37F1DACBB2207A34B7C674D1B030CC9FC1FF9C2F6D62705BCFADAD3B006C1FBB3FAF48';
wwv_flow_api.g_varchar2_table(46) := '88F1B9B50B61744E828BFBA105BF0E1B4E190150AC95841F831C0C428FEC41EE82DD80089F19F393BCBD14F809191B6B9210DD6109D3F283FC7C2DAFAD071097B11DF1F6383B138B0DD5D7D75F2FA527B5BE962FFE00404282D1FFF3ACAF0938AD19FA03';
wwv_flow_api.g_varchar2_table(47) := '6168CD61CDD6CCD1F345F4B15AF487C348C76265828B45E8059B427F8CC21551A04B0439849FE7045B5B5B7F48CB98CB7DCBB5DC41EAE0FE408F1077A404CCE46EF05D12E028FC4F0044649FE0B3B88EB8FA49C085F5D07E14308C5A8F6333833B88B8DD';
wwv_flow_api.g_varchar2_table(48) := '4ED2E3859D886BF951932F00CEA71138DFEF2201EA5DCEA1CE4F0054B1449F49377D9C1BB777EFDAB5EB4919EB91C680A865592FFCA1F0F92CC2430546A97FF8FC23FCF67C6DC16A9C0DFC8DA969AD898AF05D0383833E76FC4D4AFEC627707EA5A27C5A';
wwv_flow_api.g_varchar2_table(49) := '9EFBAC4B746A56E8E6EF099FE14F68DE06903D52172899B21CCAB7C78E641DA16C6E9421A0BEE70F41E8431DAB4E640E65AC7FFAE769E24F047C9EDBFF02B5928A969F8BC64F0000000049454E44AE426082';
wwv_flow_api.create_app_static_file(
 p_id=>wwv_flow_api.id(262735324361757491)
,p_file_name=>'tools_report_bug.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(261794309216419184)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(261794668594419185)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(261794944064419185)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'modern'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(261795239992419185)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(261795527652419185)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(261795854521419185)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
wwv_flow_api.create_plugin_setting(
 p_id=>wwv_flow_api.id(261796162392419186)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(261928254484419302)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/can_create_any_synonym_and_view
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(262423557066074213)
,p_name=>'Can_Create_Any_Synonym_and_View'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from dual ',
'where 4 = (select count(*) from sys.USER_SYS_PRIVS where Privilege IN (''CREATE ANY VIEW'',''DROP ANY VIEW'',''CREATE ANY SYNONYM'',''DROP ANY SYNONYM''))',
''))
,p_error_message=>'Privilege to Create and Drop any View and Synonym is required.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items
begin
wwv_flow_api.create_flow_item(
 p_id=>wwv_flow_api.id(262565729782150108)
,p_name=>'APP_PARSING_SCHEMA'
,p_protection_level=>'I'
);
end;
/
prompt --application/shared_components/logic/application_computations
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(261930804590419317)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(261930804590419317)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(261931236290419318)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Remember username'
,p_lov_return_value=>'Y'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_api.create_page_group(
 p_id=>wwv_flow_api.id(261928866947419303)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(261796707306419188)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(261796910462419189)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261797504049419192)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-info" id="t_Body_info">#REGION_POSITION_02#</div>',
'        <div class="t-Body-contentInner" role="main">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261797838290419198)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261798177704419198)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261798454839419198)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261798709597419198)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261799045708419198)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261799381707419198)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261799687958419198)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261799958143419199)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261800217046419199)
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261800679091419202)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261800924971419202)
,p_page_template_id=>wwv_flow_api.id(261800679091419202)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261801262762419202)
,p_page_template_id=>wwv_flow_api.id(261800679091419202)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261801538488419202)
,p_page_template_id=>wwv_flow_api.id(261800679091419202)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261802133692419203)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #REGION_POSITION_01#',
'  #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'  <div class="t-Body-wrap">',
'    <div class="t-Body-col t-Body-col--main">',
'      <div class="t-Login-container" role="main">#BODY#</div>',
'    </div>',
'  </div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261802452386419203)
,p_page_template_id=>wwv_flow_api.id(261802133692419203)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261802745781419203)
,p_page_template_id=>wwv_flow_api.id(261802133692419203)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261802935884419203)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261803270605419203)
,p_page_template_id=>wwv_flow_api.id(261802935884419203)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261803539298419203)
,p_page_template_id=>wwv_flow_api.id(261802935884419203)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261803856480419204)
,p_page_template_id=>wwv_flow_api.id(261802935884419203)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261804437407419204)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261804776481419204)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261805068138419204)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261805340610419204)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261805687050419204)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261805962906419204)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261806253459419204)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261806501116419205)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261806827668419205)
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261807287869419205)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" aria-label="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button'
||'>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261807559929419205)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261807824064419205)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261808151105419205)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261808419664419205)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261808721953419205)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261809035247419205)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261809343940419206)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261809669441419206)
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261810029528419206)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'#SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261810345861419206)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261810618894419206)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261810902371419206)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261811282485419206)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261811528728419207)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261811816562419207)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261812142223419207)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261812449154419207)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261812776105419207)
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261813110513419207)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"'
||'></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">',
'      #NAVIGATION_BAR#',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261813494504419207)
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261813779889419207)
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261814052130419208)
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261814309474419208)
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261814658330419208)
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261814961214419208)
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261815233178419208)
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_api.create_template(
 p_id=>wwv_flow_api.id(261815602741419208)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding" role="banner">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Header-controlsIcon" aria-hidden="t'
||'rue"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'    </div>',
'    <div class="t-Header-navBar">#NAVIGATION_BAR#</div>',
'  </div>',
'  <div class="t-Header-nav">',
'    #TOP_GLOBAL_NAVIGATION_LIST#',
'    #REGION_POSITION_06#',
'  </div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'alpha'
,p_grid_last_column_attributes=>'omega'
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
,p_translate_this_template=>'N'
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261815969233419208)
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261816289377419208)
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261816590169419208)
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_name=>'Inline Dialogs'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261816896652419209)
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261817117119419209)
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_name=>'Page Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261817487510419209)
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_name=>'Page Header'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_page_tmpl_display_point(
 p_id=>wwv_flow_api.id(261817754341419209)
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_name=>'Before Content Body'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(261902435378419253)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"><'
||'/span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL#" aria-label="#LABEL#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-h'
||'idden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(261903106003419254)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_api.create_button_templates(
 p_id=>wwv_flow_api.id(261903279712419254)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconRight'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261818164330419209)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261818484591419212)
,p_plug_template_id=>wwv_flow_api.id(261818164330419209)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261821862335419215)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261822006324419215)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#"> ',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261822394577419216)
,p_plug_template_id=>wwv_flow_api.id(261822006324419215)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261822625191419216)
,p_plug_template_id=>wwv_flow_api.id(261822006324419215)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261822899961419216)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'   <div class="t-Region-carouselRegions">',
'     #SUB_REGIONS#',
'   </div>',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#IMAGE_PREFIX#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261823126746419216)
,p_plug_template_id=>wwv_flow_api.id(261822899961419216)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261823472219419216)
,p_plug_template_id=>wwv_flow_api.id(261822899961419216)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261830240753419219)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h1 class="t-HeroRegion-title">#TITLE#</h1>',
'      #BODY#',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261830523652419219)
,p_plug_template_id=>wwv_flow_api.id(261830240753419219)
,p_name=>'Region Body'
,p_placeholder=>'#BODY#'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261832370926419220)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      <h2 class="t-ButtonRegion-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261832675255419220)
,p_plug_template_id=>wwv_flow_api.id(261832370926419220)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261832972463419220)
,p_plug_template_id=>wwv_flow_api.id(261832370926419220)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261834326352419221)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems  t-Region-headerItems--controls"><button class="t-Button t-Button--icon t-Button--hideShow" type="button"></button></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
,p_template_comment=>'Red Theme'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261834640035419221)
,p_plug_template_id=>wwv_flow_api.id(261834326352419221)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261834934111419221)
,p_plug_template_id=>wwv_flow_api.id(261834326352419221)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261839727756419222)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header">',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--title">',
'      <span class="t-ContentBlock-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h1 class="t-ContentBlock-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'      #EDIT#',
'    </div>',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--buttons">#CHANGE#</div>',
'  </div>',
'  <div class="t-ContentBlock-body">#BODY#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261841739293419223)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261842076433419223)
,p_plug_template_id=>wwv_flow_api.id(261841739293419223)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_popup
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261844094751419224)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#"  class="t-DialogRegion #REGION_CSS_CLASSES# js-regionPopup" #REGION_ATTRIBUTES# style="display:none" title="#TITLE#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Popup'
,p_internal_name=>'INLINE_POPUP'
,p_theme_id=>42
,p_theme_class_id=>24
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1483922538999385230
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261844387338419224)
,p_plug_template_id=>wwv_flow_api.id(261844094751419224)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261845905561419224)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">',
'  <h2 class="u-VisuallyHidden" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'#PREVIOUS##BODY##SUB_REGIONS##NEXT#',
'</div>'))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261846540878419225)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">',
'    #BODY#',
'  </div>',
'  <div class="t-Login-buttons">',
'    #NEXT#',
'  </div>',
'  <div class="t-Login-links">',
'    #EDIT##CREATE#',
'  </div>',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261846888957419225)
,p_plug_template_id=>wwv_flow_api.id(261846540878419225)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261847088185419225)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading">#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261847349795419225)
,p_plug_template_id=>wwv_flow_api.id(261847088185419225)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261847628495419225)
,p_plug_template_id=>wwv_flow_api.id(261847088185419225)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261853814774419227)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261854171468419227)
,p_plug_template_id=>wwv_flow_api.id(261853814774419227)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261854403072419227)
,p_plug_template_id=>wwv_flow_api.id(261853814774419227)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261856479912419228)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#"> ',
'  <div class="t-BreadcrumbRegion-body">',
'    <div class="t-BreadcrumbRegion-breadcrumb">',
'      #BODY#',
'    </div>',
'    <div class="t-BreadcrumbRegion-title">',
'      <h1 class="t-BreadcrumbRegion-titleText">#TITLE#</h1>',
'    </div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'</div>'))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_api.create_plug_template(
 p_id=>wwv_flow_api.id(261857448790419228)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title">#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">',
'        #BODY#',
'      </div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">',
'    #SUB_REGIONS#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_api.create_plug_tmpl_display_point(
 p_id=>wwv_flow_api.id(261857718677419228)
,p_plug_template_id=>wwv_flow_api.id(261857448790419228)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261879502600419240)
,p_list_template_current=>'<li class="t-NavTabs-item #A03# is-active" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class'
||'="t-NavTabs-badge #A05#">#A02#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-NavTabs-item #A03#" id="#A01#"><a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-NavTabs-label">#TEXT_ESC_SC#</span><span class="t-NavTab'
||'s-badge #A05#">#A02#</span></a></li>'
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261881173301419242)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step is-active" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></'
||'div></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#"><div class="t-WizardSteps-wrap" data-link="#LINK#"><span class="t-WizardSteps-marker"></span><span class="t-WizardSteps-label">#TEXT# <span class="t-WizardSteps-labelState"></span></span></div></li>',
''))
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h2 class="u-VisuallyHidden">#CURRENT_PROGRESS#</h2>',
'<ul class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'))
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261882552995419243)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261883599770419243)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'  <span class="t-BadgeList-label">#TEXT#</span>',
'  <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261887581563419245)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#TEXT#</h3>',
'            <p class="t-MediaList-desc">#A01#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#A02#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261890522128419246)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_preset_template_options=>'t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&APP_TITLE!ATTR.">',
'<div class="t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&APP_TITLE!ATTR."><ul style="display:none">'))
,p_list_template_after_rows=>'</ul></div></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True/False'
,p_a04_label=>'Title'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261891589238419246)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  if ( apex.actions ) {',
'    apex.actions.addFromMarkup( e );',
'  } else {',
'    apex.debug.warn("Include actions.js to support menu shortcuts");',
'  }',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  slide: e.hasClass("js-slide"),',
'  menubar: true,',
'  menubarOverflow: true',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul style="display:none">'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled True / False'
,p_a03_label=>'Hide'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut Key'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261892578357419247)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261892782192419247)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#TEXT#</h3><h4 class="t-Card-subtitle">#A07#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261898116155419249)
,p_list_template_current=>'<li class="t-Tabs-item is-active"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-Tabs-item"><a href="#LINK#" class="t-Tabs-link"><span class="t-Icon #ICON_CSS_CLASSES#"></span><span class="t-Tabs-label">#TEXT#</span></a></li>'
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261899762604419250)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ slide: e.hasClass("js-slide"), iconType: ''fa''});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Data ID'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute'
,p_a05_label=>'Shortcut'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_api.create_list_template(
 p_id=>wwv_flow_api.id(261900110250419250)
,p_list_template_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_list_template_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="t-LinksList-item is-current #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-b'
||'adge">#A01#</span></a></li>'
,p_sub_list_item_noncurrent=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_item_templ_curr_w_child=>'<li class="t-LinksList-item is-current is-expanded #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t'
||'-LinksList-badge">#A01#</span></a>#SUB_LISTS#</li>'
,p_item_templ_noncurr_w_child=>'<li class="t-LinksList-item #A03#"><a href="#LINK#" class="t-LinksList-link" #A02#><span class="t-LinksList-icon"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span><span class="t-LinksList-label">#TEXT#</span><span class="t-LinksList-badge">#A01#'
||'</span></a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261858787869419229)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261859386646419231)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'    <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'        <div class="t-MediaList-iconWrap">',
'            <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'        </div>',
'        <div class="t-MediaList-body">',
'            <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'            <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'        </div>',
'        <div class="t-MediaList-badgeWrap">',
'            <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'        </div>',
'    </a>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261862705058419233)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261864771332419233)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261866553362419234)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
' <span class="t-BadgeList-wrap u-color">',
'  <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'  <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
' </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261870136694419236)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
begin
wwv_flow_api.create_row_template_patch(
 p_id=>wwv_flow_api.id(261870136694419236)
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
);
exception when others then null;
end;
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261872721900419237)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'    <div class="t-Comments-icon">',
'        <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'    </div>',
'    <div class="t-Comments-body">',
'        <div class="t-Comments-info">',
'            #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'        </div>',
'        <div class="t-Comments-comment">',
'            #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'        </div>',
'    </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261873930320419237)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261874172078419237)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_api.create_row_template(
 p_id=>wwv_flow_api.id(261879329572419239)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(261901755938419251)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(261901871487419252)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(261901929257419252)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(261902054420419252)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(261902133079419252)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(261902274758419252)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_api.create_field_template(
 p_id=>wwv_flow_api.id(261902383878419252)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_api.create_menu_template(
 p_id=>wwv_flow_api.id(261904524754419255)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_api.create_popup_lov_template(
 p_id=>wwv_flow_api.id(261904719063419258)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_api.create_calendar_template(
 p_id=>wwv_flow_api.id(261904631499419256)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_api.create_theme(
 p_id=>wwv_flow_api.id(261905970723419263)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_api.id(261815602741419208)
,p_default_dialog_template=>wwv_flow_api.id(261800679091419202)
,p_error_template=>wwv_flow_api.id(261802133692419203)
,p_printer_friendly_template=>wwv_flow_api.id(261815602741419208)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_api.id(261802133692419203)
,p_default_button_template=>wwv_flow_api.id(261903106003419254)
,p_default_region_template=>wwv_flow_api.id(261847088185419225)
,p_default_chart_template=>wwv_flow_api.id(261847088185419225)
,p_default_form_template=>wwv_flow_api.id(261847088185419225)
,p_default_reportr_template=>wwv_flow_api.id(261847088185419225)
,p_default_tabform_template=>wwv_flow_api.id(261847088185419225)
,p_default_wizard_template=>wwv_flow_api.id(261847088185419225)
,p_default_menur_template=>wwv_flow_api.id(261856479912419228)
,p_default_listr_template=>wwv_flow_api.id(261847088185419225)
,p_default_irr_template=>wwv_flow_api.id(261845905561419224)
,p_default_report_template=>wwv_flow_api.id(261870136694419236)
,p_default_label_template=>wwv_flow_api.id(261902054420419252)
,p_default_menu_template=>wwv_flow_api.id(261904524754419255)
,p_default_calendar_template=>wwv_flow_api.id(261904631499419256)
,p_default_list_template=>wwv_flow_api.id(261900110250419250)
,p_default_nav_list_template=>wwv_flow_api.id(261891589238419246)
,p_default_top_nav_list_temp=>wwv_flow_api.id(261891589238419246)
,p_default_side_nav_list_temp=>wwv_flow_api.id(261890522128419246)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_api.id(261832370926419220)
,p_default_dialogr_template=>wwv_flow_api.id(261821862335419215)
,p_default_option_label=>wwv_flow_api.id(261902054420419252)
,p_default_required_label=>wwv_flow_api.id(261902383878419252)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_api.id(261892578357419247)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#IMAGE_PREFIX#themes/theme_42/1.3/')
,p_files_version=>62
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_IMAGES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_IMAGES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(261904969053419259)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(261905114124419260)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(261905368080419260)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(261905546450419260)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(261905755097419260)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_display_points
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261818778804419213)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261819398521419214)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261819787761419214)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261820137505419215)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261823793802419216)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261824759922419217)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261826110604419218)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261827331588419218)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261827937528419218)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261828354545419218)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261828796818419219)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261831298848419220)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261831651396419220)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261833489606419220)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261836013223419221)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261837891817419222)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261838406194419222)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261840055958419222)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261840882074419223)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261842588300419223)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Dialog Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261854933588419228)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261855354326419228)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261855721846419228)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261858076737419229)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261859050255419231)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261859608178419231)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261860852089419232)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261861401292419232)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261863054848419233)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261868692021419235)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261870484454419236)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261870843212419236)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261871693268419236)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261873042709419237)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261875048900419237)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261876257013419238)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261877005891419238)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261879809208419241)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261880215770419242)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261881671541419242)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261883862664419244)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261884273670419244)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261886082655419244)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261888845561419245)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261889420657419245)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261893689606419248)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261894865898419248)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261895613299419248)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261901246450419250)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261902616576419254)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261903863774419254)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261906164757419269)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261906557619419269)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261908191748419270)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261908596798419270)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261910150405419270)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261910532150419271)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261912153593419271)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261912534748419271)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261914151799419272)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261914525732419272)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261914935981419272)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261915339160419272)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261915759739419272)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261916133874419272)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261916586179419273)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261917994545419273)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261919345027419273)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261920378052419274)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261920720996419274)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261921135176419274)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261921570203419274)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Padding'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261922182232419274)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261922772355419274)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261923111681419274)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261923563928419274)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261923995001419275)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_api.create_template_opt_group(
 p_id=>wwv_flow_api.id(261924799893419275)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261800563198419201)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(261797504049419192)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261801859529419202)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(261800679091419202)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261802082699419203)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_api.id(261800679091419202)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261804165385419204)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_api.id(261802935884419203)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261804384773419204)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_api.id(261802935884419203)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261807107424419205)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(261804437407419204)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261809929958419206)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(261807287869419205)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261813015498419207)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(261810029528419206)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261815553239419208)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(261813110513419207)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261818033851419209)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_api.id(261815602741419208)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261818943943419214)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_api.id(261818778804419213)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261819109229419214)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261819527536419214)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_api.id(261819398521419214)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261819994219419214)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_api.id(261819787761419214)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261820337197419215)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_api.id(261820137505419215)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261820561213419215)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_api.id(261819398521419214)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261820794971419215)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_api.id(261818778804419213)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261820940161419215)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_api.id(261819398521419214)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261821132171419215)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_api.id(261819398521419214)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261821336581419215)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_api.id(261820137505419215)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261821572773419215)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_api.id(261819787761419214)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261821753367419215)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261818164330419209)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_api.id(261819787761419214)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261823988958419216)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261824131895419217)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261824331002419217)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261824528489419217)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261824952370419217)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_api.id(261824759922419217)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261825140569419217)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_api.id(261824759922419217)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261825358203419217)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_api.id(261824759922419217)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261825586958419218)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_api.id(261824759922419217)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261825778452419218)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261825984319419218)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261826376422419218)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261826508961419218)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261826780090419218)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261826915259419218)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261827180754419218)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261827545307419218)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_api.id(261827331588419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261827721377419218)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_api.id(261827331588419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261828147571419218)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(261827937528419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261828531985419219)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(261828354545419218)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261828923857419219)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261829119910419219)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261829352401419219)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(261828354545419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261829502617419219)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(261827937528419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261829718227419219)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261829924918419219)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261830177527419219)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261822899961419216)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261830857830419219)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261830240753419219)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261831059358419219)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261830240753419219)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261831474529419220)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261830240753419219)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_api.id(261831298848419220)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261831831777419220)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261830240753419219)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_api.id(261831651396419220)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261832020083419220)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261830240753419219)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_api.id(261831651396419220)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261832231336419220)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261830240753419219)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261833240787419220)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261832370926419220)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261833617709419220)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_api.id(261832370926419220)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_api.id(261833489606419220)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261833880452419220)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_api.id(261832370926419220)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261834054240419220)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(261832370926419220)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_api.id(261833489606419220)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261834274397419221)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261832370926419220)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261835280203419221)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261835453822419221)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261835634164419221)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261835868086419221)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261836272972419221)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_api.id(261836013223419221)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261836493487419221)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_api.id(261836013223419221)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261836666793419221)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261836872299419221)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261837028721419221)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261837235859419221)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261837445049419222)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261837672358419222)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261838050054419222)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_api.id(261837891817419222)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261838261673419222)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(261827937528419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261838696118419222)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_api.id(261838406194419222)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261838893361419222)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261839004058419222)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261839237518419222)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261839470637419222)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(261827937528419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261839634462419222)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261834326352419221)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261840208828419222)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261839727756419222)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_api.id(261840055958419222)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261840440695419223)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261839727756419222)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_api.id(261840055958419222)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261840687929419223)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261839727756419222)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_api.id(261840055958419222)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261841028074419223)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261839727756419222)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_api.id(261840882074419223)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261841221852419223)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261839727756419222)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261841477416419223)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261839727756419222)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_api.id(261840882074419223)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261841680932419223)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261839727756419222)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261842343315419223)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261842747726419223)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(261842588300419223)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261842962503419223)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(261842588300419223)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261843105965419223)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(261842588300419223)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261843398645419223)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261843540564419224)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261843705996419224)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261843995127419224)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_api.id(261841739293419223)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261844666353419224)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261844094751419224)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261844808523419224)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261844094751419224)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_api.id(261842588300419223)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261845072120419224)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261844094751419224)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_api.id(261842588300419223)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261845247909419224)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261844094751419224)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_api.id(261842588300419223)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261845426930419224)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261844094751419224)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_api.id(261842588300419223)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261845647717419224)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261844094751419224)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261845893964419224)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261844094751419224)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261846255540419225)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261845905561419224)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261846417062419225)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261845905561419224)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261847988939419225)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261848141344419226)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261848351552419226)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261848530910419226)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_api.id(261823793802419216)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261848771020419226)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261848992329419226)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261849108781419226)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261849394041419226)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261849582897419226)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261849731920419226)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261849976078419226)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261850103412419226)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261850351669419226)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261850584248419226)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261850701284419226)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261850927077419226)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261851187777419226)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261851363828419226)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261851583639419227)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261851767716419227)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_api.id(261826110604419218)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261851980734419227)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_api.id(261827937528419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261852163818419227)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_api.id(261828354545419218)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261852377151419227)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261852526281419227)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261852771983419227)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261852912752419227)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_api.id(261828354545419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261853124541419227)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_api.id(261827937528419218)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261853308932419227)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261853577853419227)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261853702095419227)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_api.id(261847088185419225)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_api.id(261828796818419219)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261854706755419227)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261853814774419227)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261855111315419228)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261853814774419227)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_api.id(261854933588419228)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261855503427419228)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261853814774419227)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_api.id(261855354326419228)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261855941199419228)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261853814774419227)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_api.id(261855721846419228)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261856172795419228)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261853814774419227)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_api.id(261855721846419228)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261856393887419228)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261853814774419227)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_api.id(261855354326419228)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261856760269419228)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261856479912419228)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261856909836419228)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261856479912419228)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261857161166419228)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261856479912419228)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_api.id(261840055958419222)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261857315568419228)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_api.id(261856479912419228)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_api.id(261840055958419222)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261858248101419229)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_api.id(261857448790419228)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_api.id(261858076737419229)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261858493480419229)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261857448790419228)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_api.id(261858076737419229)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261858683354419229)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_api.id(261857448790419228)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261859280258419231)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_api.id(261858787869419229)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_api.id(261859050255419231)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261859886779419231)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261860027545419232)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261860249788419232)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261860486086419232)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261860668556419232)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261861043751419232)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(261860852089419232)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261861247950419232)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(261860852089419232)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261861668572419232)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(261861401292419232)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261861820703419232)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261862010802419232)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261862295796419232)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261862441998419233)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261862637497419233)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261859386646419231)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261863274523419233)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261863421454419233)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261863629344419233)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261863896263419233)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261864095188419233)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261864261526419233)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261864440776419233)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261864605275419233)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261862705058419233)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261865024413419234)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261865286557419234)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261865439556419234)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261865674666419234)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261865873383419234)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261866006694419234)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261866299446419234)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261866442535419234)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261864771332419233)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_api.id(261863054848419233)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261866891119419234)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(261859050255419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261867001288419234)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261867259807419234)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261867412930419234)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261867668099419235)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261867815721419235)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(261859050255419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261868048344419235)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261868239713419235)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261868430561419235)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261868835086419235)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(261868692021419235)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261869050377419235)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(261868692021419235)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261869258660419235)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(261868692021419235)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261869435254419235)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261869688777419235)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(261868692021419235)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261869889908419235)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(261868692021419235)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261870056495419236)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261866553362419234)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261870615424419236)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_api.id(261870484454419236)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261871078394419236)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_api.id(261870843212419236)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261871298244419236)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_api.id(261870843212419236)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261871403639419236)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_api.id(261870843212419236)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261871855023419236)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_api.id(261871693268419236)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261872050653419236)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_api.id(261871693268419236)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261872269177419236)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_api.id(261870484454419236)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261872461196419236)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261872685555419237)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261870136694419236)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_api.id(261870843212419236)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261873249376419237)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261872721900419237)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_api.id(261873042709419237)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261873472472419237)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261872721900419237)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_api.id(261873042709419237)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261873633629419237)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261872721900419237)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_api.id(261860852089419232)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261873891023419237)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261872721900419237)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_api.id(261860852089419232)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261874459078419237)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261874676238419237)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261874818983419237)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261875271175419238)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(261875048900419237)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261875439081419238)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(261875048900419237)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261875624638419238)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(261859050255419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261875839173419238)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261876093748419238)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(261859050255419231)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261876431008419238)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(261876257013419238)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261876670999419238)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(261876257013419238)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261876895832419238)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(261876257013419238)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261877243242419238)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(261877005891419238)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261877419405419238)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(261877005891419238)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261877637723419238)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261877851372419238)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(261859050255419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261878041417419238)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(261859050255419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261878251613419238)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261878402279419239)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(261876257013419238)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261878634146419239)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(261860852089419232)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261878854439419239)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(261860852089419232)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261879038786419239)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(261859608178419231)
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261879257966419239)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_api.id(261874172078419237)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261880058764419241)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261879502600419240)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_api.id(261879809208419241)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261880450775419242)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261879502600419240)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_api.id(261880215770419242)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261880647865419242)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(261879502600419240)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_api.id(261879809208419241)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261880877101419242)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261879502600419240)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_api.id(261880215770419242)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261881067080419242)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261879502600419240)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_api.id(261880215770419242)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261881497010419242)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261881173301419242)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261881899227419242)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261881173301419242)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_api.id(261881671541419242)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261882007652419242)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261881173301419242)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_api.id(261881671541419242)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261882270028419242)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261881173301419242)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_api.id(261881671541419242)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261882417708419243)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261881173301419242)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261882897105419243)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261882552995419243)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261883093897419243)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261882552995419243)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261883285499419243)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261882552995419243)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261883461686419243)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261882552995419243)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261884007070419244)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261884492667419244)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261884668677419244)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261884812128419244)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261885050618419244)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261885289542419244)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261885467221419244)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261885658908419244)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261885882875419244)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261886259355419244)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_api.id(261886082655419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261886433958419245)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_api.id(261886082655419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261886657270419245)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_api.id(261886082655419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261886828410419245)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261887004769419245)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_api.id(261886082655419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261887270264419245)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_api.id(261886082655419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261887427088419245)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261883599770419243)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261887821644419245)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261888054902419245)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261888268481419245)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261888406920419245)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261888636965419245)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261889010787419245)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_api.id(261888845561419245)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261889254339419245)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_api.id(261888845561419245)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261889697663419246)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_api.id(261889420657419245)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261889877589419246)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261890053942419246)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261890290053419246)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261890439720419246)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261887581563419245)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261890819158419246)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261890522128419246)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261891042774419246)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261890522128419246)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261891274523419246)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261890522128419246)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261891469742419246)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261890522128419246)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261891829083419247)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(261891589238419246)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261892068682419247)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(261891589238419246)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261892278228419247)
,p_theme_id=>42
,p_name=>'ENABLE_SLIDE_ANIMATION'
,p_display_name=>'Enable Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(261891589238419246)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261892446274419247)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(261891589238419246)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261893017127419247)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261893234627419247)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261893424381419247)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261893879447419248)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_api.id(261893689606419248)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261894084109419248)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_api.id(261893689606419248)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261894296526419248)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261894471063419248)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261894632911419248)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261895095018419248)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_api.id(261894865898419248)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261895250819419248)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_api.id(261894865898419248)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261895476742419248)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_api.id(261894865898419248)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261895854645419248)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_api.id(261895613299419248)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261896080155419248)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_api.id(261895613299419248)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261896291580419248)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261896495900419249)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261896655682419249)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261896807486419249)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261897077022419249)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_api.id(261894865898419248)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261897215135419249)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_api.id(261888845561419245)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261897462003419249)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_api.id(261888845561419245)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261897662475419249)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261897808539419249)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261898040878419249)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261892782192419247)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261898423643419249)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_api.id(261884273670419244)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261898604601419249)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_api.id(261895613299419248)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261898866779419249)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_api.id(261895613299419248)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261899068883419249)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_api.id(261889420657419245)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261899202228419249)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261899433766419250)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261899694920419250)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_api.id(261889420657419245)
,p_template_types=>'LIST'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261900022182419250)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261899762604419250)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261900411383419250)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261900110250419250)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_api.id(261883862664419244)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261900674762419250)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_api.id(261900110250419250)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261900836211419250)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261900110250419250)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261901010448419250)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261900110250419250)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261901467588419250)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_api.id(261900110250419250)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_api.id(261901246450419250)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261901653712419250)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_api.id(261900110250419250)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_api.id(261901246450419250)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261902808422419254)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(261902435378419253)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(261902616576419254)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261903050850419254)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(261902435378419253)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(261902616576419254)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261903427429419254)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(261903279712419254)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_api.id(261902616576419254)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261903661822419254)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(261903279712419254)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_api.id(261902616576419254)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261904078578419254)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(261903279712419254)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_api.id(261903863774419254)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261904211816419254)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_api.id(261903279712419254)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_api.id(261903863774419254)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261904438581419254)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_api.id(261903279712419254)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261906336590419269)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(261906164757419269)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261906755483419269)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_api.id(261906557619419269)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261906993804419270)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(261906164757419269)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261907193926419270)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_api.id(261906557619419269)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261907377122419270)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(261906164757419269)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261907503304419270)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_api.id(261906557619419269)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261907706108419270)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(261906164757419269)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261907969707419270)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_api.id(261906557619419269)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261908384519419270)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(261908191748419270)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261908766740419270)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_api.id(261908596798419270)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261908999892419270)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(261908191748419270)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261909119191419270)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_api.id(261908596798419270)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261909334609419270)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(261908191748419270)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261909591247419270)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_api.id(261908596798419270)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261909763863419270)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(261908191748419270)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261909989242419270)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_api.id(261908596798419270)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261910375182419271)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(261910150405419270)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261910751777419271)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_api.id(261910532150419271)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261910973917419271)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(261910150405419270)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261911141822419271)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_api.id(261910532150419271)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
end;
/
begin
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261911308632419271)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(261910150405419270)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261911571557419271)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_api.id(261910532150419271)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261911776488419271)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(261910150405419270)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261911913697419271)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_api.id(261910532150419271)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261912388366419271)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(261912153593419271)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261912797955419271)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_api.id(261912534748419271)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261912943910419271)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(261912153593419271)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261913184916419271)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_api.id(261912534748419271)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261913389021419271)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(261912153593419271)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261913590113419271)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_api.id(261912534748419271)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261913793133419271)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(261912153593419271)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261913974420419272)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_api.id(261912534748419271)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261914384527419272)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_api.id(261914151799419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261914717368419272)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_api.id(261914525732419272)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261915194183419272)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_api.id(261914935981419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261915578799419272)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_api.id(261915339160419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261915908611419272)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_api.id(261915759739419272)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261916315534419273)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_api.id(261916133874419272)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261916762950419273)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_api.id(261916586179419273)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261916936985419273)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_api.id(261916586179419273)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261917171407419273)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_api.id(261914525732419272)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261917306480419273)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_api.id(261914935981419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261917542578419273)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_api.id(261915339160419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261917756553419273)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_api.id(261915759739419272)
,p_template_types=>'BUTTON'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261918178475419273)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_api.id(261917994545419273)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261918335739419273)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_api.id(261917994545419273)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261918572439419273)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_api.id(261917994545419273)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261918774614419273)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_api.id(261914151799419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261918955086419273)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_api.id(261916586179419273)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261919129891419273)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_api.id(261916133874419272)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261919568585419273)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_api.id(261919345027419273)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261919761531419273)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_api.id(261914151799419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261919919895419273)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_api.id(261916133874419272)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261920177740419274)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_api.id(261914151799419272)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261920521221419274)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_api.id(261920378052419274)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261920945997419274)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_api.id(261920720996419274)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261921383478419274)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_api.id(261921135176419274)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261921720678419274)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_api.id(261921570203419274)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261921937514419274)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_api.id(261921570203419274)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261922332424419274)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_api.id(261922182232419274)
,p_template_types=>'REGION'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261922590496419274)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_api.id(261920720996419274)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261922907485419274)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_api.id(261922772355419274)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261923315842419274)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_api.id(261923111681419274)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261923779069419275)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_api.id(261923563928419274)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261924168781419275)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_api.id(261923995001419275)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261924371506419275)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261924549519419275)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_api.id(261922772355419274)
,p_template_types=>'FIELD'
);
wwv_flow_api.create_template_option(
 p_id=>wwv_flow_api.id(261924980824419275)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_api.id(261924799893419275)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(262568980476246581)
,p_build_option_name=>'Under Construction'
,p_build_option_status=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_api.create_shortcut(
 p_id=>wwv_flow_api.id(261928654969419303)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/security/authentications/application_express_authentication
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(261796453618419187)
,p_name=>'Application Express Authentication'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_api.create_user_interface(
 p_id=>wwv_flow_api.id(261925670901419279)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_api.id(261797258521419191)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>wwv_flow_api.id(261890522128419246)
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_api.id(261925381539419278)
,p_nav_bar_list_template_id=>wwv_flow_api.id(261892578357419247)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_api.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_api.id(261925670901419279)
,p_name=>'Global Page - Desktop'
,p_step_title=>'Global Page - Desktop'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_last_updated_by=>'DIRK'
,p_last_upd_yyyymmddhh24miss=>'20210619153637'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(261925670901419279)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'APEX API Tracer (&OWNER.)'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'$(''input[id$=_HIDDENVALUE]'').addClass(''js-ignoreChange'');'
,p_step_template=>wwv_flow_api.id(261813110513419207)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>'MUST_NOT_BE_PUBLIC_USER'
,p_last_updated_by=>'DIRK'
,p_last_upd_yyyymmddhh24miss=>'20210729160800'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261514034487997802)
,p_plug_name=>'APEX API Packages'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(261845905561419224)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Synonym_Name,Package_Owner,Package_Name,Is_Enabled_Switch,Is_Enabled,Grant_Stats,Revoke_Stats,Synonym_Stats,Error_Count ',
'from table(package_tracer.get_APEX_Control_List)',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_SECTION'
,p_plug_display_when_cond2=>'APEX'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(262086577451116230)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DIRK'
,p_internal_uid=>262086577451116230
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262086670826116231)
,p_db_column_name=>'SYNONYM_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Synonym Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262086780504116232)
,p_db_column_name=>'PACKAGE_OWNER'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Package Owner'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262086871413116233)
,p_db_column_name=>'PACKAGE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Package Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262086959693116234)
,p_db_column_name=>'IS_ENABLED_SWITCH'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Tracing Is Enabled'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262087000905116235)
,p_db_column_name=>'IS_ENABLED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Is Enabled'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262087141160116236)
,p_db_column_name=>'GRANT_STATS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Grant Statments (that you have to execute as dba)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262087293203116237)
,p_db_column_name=>'SYNONYM_STATS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Synonym Statments (that will be executed automatically)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262087398085116238)
,p_db_column_name=>'ERROR_COUNT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Error Count'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(263065197465062002)
,p_db_column_name=>'REVOKE_STATS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Revoke Stats'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(262213207945514511)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2622133'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SYNONYM_NAME:IS_ENABLED_SWITCH:GRANT_STATS:REVOKE_STATS:SYNONYM_STATS:ERROR_COUNT:'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261516484971997826)
,p_plug_name=>'Sections List'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_component_template_options=>'#DEFAULT#:t-Tabs--simple'
,p_plug_template=>wwv_flow_api.id(261853814774419227)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_08'
,p_list_id=>wwv_flow_api.id(261961755284108369)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(261898116155419249)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(261517272078997834)
,p_name=>'Tracing Code for LOCAL Packages'
,p_template=>wwv_flow_api.id(261847088185419225)
,p_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Subprogram_Id, Procedure_Name, Logging_Call ',
'from table(package_tracer.Dyn_Log_Call_List (',
'    p_Package_Name=>:P1_PACKAGE_NAME, ',
'    p_Dest_Schema=>:P1_SOURCE_SCHEMA,',
'    p_Compact=>:P1_COMPACT,',
'    p_Logging_Start_Enabled=>:P1_LOGGING_START,',
'    p_Logging_Start_Call=>:P1_LOGGING_START_CALL,',
'    p_Logging_Finish_Call=>:P1_LOGGING_FINISH_CALL,',
'    p_Logging_API_Call=>:P1_LOGGING_API_CALL,',
'    p_Variable_Name=>:P1_VARIABLE_NAME,',
'    p_Condition_Start=>:P1_CONDITION_START,',
'    p_Condition_End=>:P1_CONDITION_END,',
'    p_Condition_Enabled=>:P1_USE_CONDITION,',
'    p_Indent=>:P1_INDENT',
'))',
'order by Subprogram_Id'))
,p_display_when_condition=>'P1_SECTION'
,p_display_when_cond2=>'LOCALE'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P1_PACKAGE_NAME,P1_COMPACT,P1_LOGGING_START,P1_LOGGING_START_CALL,P1_LOGGING_FINISH_CALL,P1_LOGGING_API_CALL,P1_VARIABLE_NAME,P1_CONDITION_START,P1_CONDITION_END,P1_USE_CONDITION,P1_INDENT'
,p_query_row_template=>wwv_flow_api.id(261870136694419236)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_LEFT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(261518077219997842)
,p_query_column_id=>1
,p_column_alias=>'SUBPROGRAM_ID'
,p_column_display_sequence=>3
,p_column_heading=>'Subprogram Id'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(261517724692997839)
,p_query_column_id=>2
,p_column_alias=>'PROCEDURE_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Procedure Name'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(261517827553997840)
,p_query_column_id=>3
,p_column_alias=>'LOGGING_CALL'
,p_column_display_sequence=>2
,p_column_heading=>'Logging Call'
,p_use_as_row_header=>'N'
,p_column_html_expression=>'<pre>#LOGGING_CALL#</pre>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261518834760997850)
,p_plug_name=>'All Traceable Packages'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(261845905561419224)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Synonym_Name,Package_Owner,Package_Name,Is_Enabled_Switch,Is_Enabled,Grant_Stats,Revoke_Stats,Synonym_Stats,Error_Count ',
'from table(package_tracer.get_Packages_Control_List )',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_SECTION'
,p_plug_display_when_cond2=>'PUBLIC'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(262084764638116212)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'DIRK'
,p_internal_uid=>262084764638116212
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262084869916116213)
,p_db_column_name=>'SYNONYM_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Synonym Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262084962803116214)
,p_db_column_name=>'PACKAGE_OWNER'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Package Owner'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262085063059116215)
,p_db_column_name=>'PACKAGE_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Package Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262086185661116226)
,p_db_column_name=>'IS_ENABLED_SWITCH'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'Tracing Is Enabled'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262085165405116216)
,p_db_column_name=>'IS_ENABLED'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Is Enabled'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262085232949116217)
,p_db_column_name=>'GRANT_STATS'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Grant Statments (that you have to execute as dba)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262085369322116218)
,p_db_column_name=>'SYNONYM_STATS'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Synonym Statments (that will be executed automatically)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262085468183116219)
,p_db_column_name=>'ERROR_COUNT'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Error Count'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(263065025203062001)
,p_db_column_name=>'REVOKE_STATS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Revoke Stats'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(262099305494125632)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2620994'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SYNONYM_NAME:IS_ENABLED_SWITCH:PACKAGE_OWNER:PACKAGE_NAME:GRANT_STATS:REVOKE_STATS:SYNONYM_STATS:ERROR_COUNT'
);
wwv_flow_api.create_worksheet_condition(
 p_id=>wwv_flow_api.id(263071072845180698)
,p_report_id=>wwv_flow_api.id(262099305494125632)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'IS_ENABLED'
,p_operator=>'='
,p_expr=>'Y'
,p_condition_sql=>'"IS_ENABLED" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Y''  '
,p_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261936504958419333)
,p_plug_name=>'APEX API Tracer'
,p_icon_css_classes=>'fa-crosshairs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(261830240753419219)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(262088376889116248)
,p_plug_name=>'Publish Application Objects in other Schema'
,p_icon_css_classes=>'fa-copy'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(261845905561419224)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select S.OWNER, S.OBJECT_NAME, S.OBJECT_TYPE, S.DEST_OBJECT_TYPE, ',
'    S.DEST_OBJECT_EXISTS, S.CONFLICTING_OBJECT_EXISTS, S.FOREIGN_DEPS_CNT,',
'    S.DEST_SCHEMA, S.GRANT_STAT, S.CREATE_STAT, S.REVOKE_STAT, S.DROP_STAT,',
'    S.IS_ENABLED_SWITCH',
'from table(package_tracer.get_publish_schema(p_Target_Schema=>:P1_TARGET_SCHEMA)) S '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P1_TARGET_SCHEMA'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_required_role=>wwv_flow_api.id(262423557066074213)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P1_SECTION'
,p_plug_display_when_cond2=>'PUBLISH_SCHEMA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(262088421359116249)
,p_max_row_count=>'1000000'
,p_base_pk1=>'OBJECT_NAME'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_owner=>'DIRK'
,p_internal_uid=>262088421359116249
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262296415042064503)
,p_db_column_name=>'OBJECT_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Object Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262296533696064504)
,p_db_column_name=>'OBJECT_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Object Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262296759491064506)
,p_db_column_name=>'OWNER'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262296884935064507)
,p_db_column_name=>'DEST_OBJECT_TYPE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dest Object Type'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262296931459064508)
,p_db_column_name=>'DEST_OBJECT_EXISTS'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Dest Object Exists'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262298678370064525)
,p_db_column_name=>'FOREIGN_DEPS_CNT'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Foreign Deps Cnt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262297066291064509)
,p_db_column_name=>'DEST_SCHEMA'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Dest Schema'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262297129961064510)
,p_db_column_name=>'GRANT_STAT'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'Grant Stat'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262297257985064511)
,p_db_column_name=>'CREATE_STAT'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Create Stat'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262297359769064512)
,p_db_column_name=>'REVOKE_STAT'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Revoke Stat'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262297466719064513)
,p_db_column_name=>'DROP_STAT'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'Drop Stat'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262297535905064514)
,p_db_column_name=>'CONFLICTING_OBJECT_EXISTS'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'Conflicting Object Exists'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(262297938866064518)
,p_db_column_name=>'IS_ENABLED_SWITCH'
,p_display_order=>180
,p_column_identifier=>'P'
,p_column_label=>'Is Enabled'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(262304684348078869)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2623047'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>1000
,p_report_columns=>'OBJECT_TYPE:OBJECT_NAME:IS_ENABLED_SWITCH:DEST_OBJECT_TYPE:CONFLICTING_OBJECT_EXISTS:DEST_OBJECT_EXISTS:FOREIGN_DEPS_CNT:GRANT_STAT:CREATE_STAT:'
,p_sort_column_1=>'OBJECT_TYPE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'OBJECT_NAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'OBJECT_TYPE:0:0:0:0:0'
,p_break_enabled_on=>'OBJECT_TYPE:0:0:0:0:0'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(262298888436064527)
,p_plug_name=>'Parameter'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(261847088185419225)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(525974396928751506)
,p_plug_name=>'Logging Calls'
,p_parent_plug_id=>wwv_flow_api.id(262298888436064527)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(261834326352419221)
,p_plug_display_sequence=>70
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(262299908458064538)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(525974396928751506)
,p_button_name=>'RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_image_alt=>'Reset Defaults'
,p_button_position=>'REGION_TEMPLATE_EDIT'
,p_button_execute_validations=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261517989165997841)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(261517272078997834)
,p_button_name=>'SUBMIT_LOCALE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261515056654997812)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(261514034487997802)
,p_button_name=>'SUBMIT_APEX'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Changes'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261515523484997817)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(261518834760997850)
,p_button_name=>'SUBMIT_PUBLIC'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Changes'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(262298097773064519)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(262088376889116248)
,p_button_name=>'SUBMIT_PUBLISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Changes'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261514693538997808)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(261514034487997802)
,p_button_name=>'ENABLE_APEX'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_image_alt=>'Enable All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(262298142402064520)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(262088376889116248)
,p_button_name=>'ENABLE_PUBLISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_image_alt=>'Enable All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261518186473997843)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(261518834760997850)
,p_button_name=>'ENABLE_PUBLIC'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_image_alt=>'Enable All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(262298249288064521)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(262088376889116248)
,p_button_name=>'DISABLE_PUBLISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_image_alt=>'DIsable All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261514772390997809)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(261514034487997802)
,p_button_name=>'DISABLE_APEX'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_image_alt=>'DIsable All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261518297579997844)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(261518834760997850)
,p_button_name=>'DISABLE_PUBLIC'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_image_alt=>'DIsable All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261516131812997823)
,p_name=>'P1_SECTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(261516484971997826)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261517315562997835)
,p_name=>'P1_PACKAGE_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(261517272078997834)
,p_prompt=>'Package Name'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT OBJ.OBJECT_NAME D, OBJ.OBJECT_NAME R',
'FROM SYS.USER_OBJECTS OBJ',
'WHERE OBJECT_TYPE = ''PACKAGE''',
'AND NOT EXISTS (',
'    SELECT 1 ',
'    FROM SYS.ALL_SYNONYMS SYN ',
'    WHERE SYN.SYNONYM_NAME = OBJ.OBJECT_NAME',
'    AND SYN.OWNER  = ''PUBLIC''',
')',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261518764592997849)
,p_name=>'P1_MESSAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(261516484971997826)
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262085774222116222)
,p_name=>'P1_COMPACT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(262298888436064527)
,p_prompt=>'Compact'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P1_SECTION'
,p_display_when2=>'LOCALE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262087455482116239)
,p_name=>'P1_LOGGING_START'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(262298888436064527)
,p_prompt=>'Logging of Procedure Start'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262297686068064515)
,p_name=>'P1_TARGET_SCHEMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(262088376889116248)
,p_prompt=>'Target Schema'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT A.SCHEMA d, A.SCHEMA r',
'FROM APEX_WORKSPACE_SCHEMAS A ',
'JOIN APEX_APPLICATIONS B ON A.WORKSPACE_NAME = B.WORKSPACE',
'WHERE B.APPLICATION_ID = :APP_ID',
'AND A.SCHEMA != :OWNER',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262298678370064525)
,p_name=>'P1_SOURCE_SCHEMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(262298888436064527)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Source Schema'
,p_source=>'APP_PARSING_SCHEMA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT A.SCHEMA d, A.SCHEMA r',
'FROM APEX_WORKSPACE_SCHEMAS A ',
'JOIN APEX_APPLICATIONS B ON A.WORKSPACE_NAME = B.WORKSPACE',
'WHERE B.APPLICATION_ID = :APP_ID'))
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262300162270064540)
,p_name=>'P1_CONDITION_START'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(525974396928751506)
,p_prompt=>'Condition Start'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262300240228064541)
,p_name=>'P1_CONDITION_END'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(525974396928751506)
,p_prompt=>'Condition End'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262300345620064542)
,p_name=>'P1_INDENT'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(525974396928751506)
,p_prompt=>'Indent'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'0'
,p_attribute_02=>'24'
,p_attribute_03=>'right'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262300874609064547)
,p_name=>'P1_USE_CONDITION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(262298888436064527)
,p_prompt=>'Use Condition'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'P1_SECTION'
,p_display_when2=>'LOCALE'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262991421429391729)
,p_name=>'P1_LOGGING_START_CALL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(525974396928751506)
,p_prompt=>'Logging Start Call'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262991816508391729)
,p_name=>'P1_LOGGING_FINISH_CALL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(525974396928751506)
,p_prompt=>'Logging Finish Call'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262992290552391730)
,p_name=>'P1_LOGGING_API_CALL'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(525974396928751506)
,p_prompt=>'Logging Api Call'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262992675854391730)
,p_name=>'P1_VARIABLE_NAME'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(525974396928751506)
,p_prompt=>'Variable Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
,p_field_template=>wwv_flow_api.id(261902054420419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(261516984012997831)
,p_computation_sequence=>20
,p_computation_item=>'P1_SECTION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'APEX'
,p_compute_when=>'P1_SECTION'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262087813143116243)
,p_computation_sequence=>30
,p_computation_item=>'P1_COMPACT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'P1_COMPACT'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262300976361064548)
,p_computation_sequence=>40
,p_computation_item=>'P1_USE_CONDITION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'Y'
,p_compute_when=>'P1_USE_CONDITION'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262087946734116244)
,p_computation_sequence=>50
,p_computation_item=>'P1_LOGGING_START'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'N'
,p_compute_when=>'P1_LOGGING_START'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262298712212064526)
,p_computation_sequence=>60
,p_computation_item=>'APP_PARSING_SCHEMA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'OWNER'
,p_compute_when=>'SELECT USERNAME FROM ALL_USERS WHERE USERNAME = :APP_PARSING_SCHEMA'
,p_compute_when_type=>'NOT_EXISTS'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262299348683064532)
,p_computation_sequence=>70
,p_computation_item=>'P1_LOGGING_START_CALL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NVL(APEX_UTIL.GET_PREFERENCE(''LOGGING_START_CALL'',:APP_USER), api_trace.c_APEX_Logging_Start_Call)',
''))
,p_compute_when=>'P1_LOGGING_START_CALL'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262299492320064533)
,p_computation_sequence=>80
,p_computation_item=>'P1_LOGGING_FINISH_CALL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NVL(APEX_UTIL.GET_PREFERENCE(''LOGGING_FINISH_CALL'',:APP_USER), api_trace.c_APEX_Logging_Exit_Call)',
''))
,p_compute_when=>'P1_LOGGING_FINISH_CALL'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262299636347064535)
,p_computation_sequence=>90
,p_computation_item=>'P1_VARIABLE_NAME'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NVL(APEX_UTIL.GET_PREFERENCE(''VARIABLE_NAME'',:APP_USER), ''lv_result'')',
''))
,p_compute_when=>'P1_VARIABLE_NAME'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262299504843064534)
,p_computation_sequence=>100
,p_computation_item=>'P1_LOGGING_API_CALL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NVL(APEX_UTIL.GET_PREFERENCE(''LOGGING_API_CALL'',:APP_USER), api_trace.c_APEX_Logging_API_Call)',
''))
,p_compute_when=>'P1_LOGGING_API_CALL'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262300449329064543)
,p_computation_sequence=>110
,p_computation_item=>'P1_CONDITION_START'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NVL(APEX_UTIL.GET_PREFERENCE(''CONDITION_START'',:APP_USER), package_tracer.c_APEX_Condition_Start)',
''))
,p_compute_when=>'P1_CONDITION_START'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262300577716064544)
,p_computation_sequence=>120
,p_computation_item=>'P1_CONDITION_END'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NVL(APEX_UTIL.GET_PREFERENCE(''CONDITION_END'',:APP_USER), package_tracer.c_APEX_Condition_End)',
''))
,p_compute_when=>'P1_CONDITION_END'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262300617127064545)
,p_computation_sequence=>130
,p_computation_item=>'P1_INDENT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'NVL(APEX_UTIL.GET_PREFERENCE(''INDENT'',:APP_USER), 8)',
''))
,p_compute_when=>'P1_INDENT'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(262085588904116220)
,p_name=>'P1_PACKAGE_NAME - Changed'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_PACKAGE_NAME'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(262085669608116221)
,p_event_id=>wwv_flow_api.id(262085588904116220)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261517272078997834)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(262085812471116223)
,p_name=>'P1_COMPACT - Changed'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_COMPACT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(262085961675116224)
,p_event_id=>wwv_flow_api.id(262085812471116223)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261517272078997834)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(262301076537064549)
,p_name=>'P1_USE_CONDITION - Changed'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_USE_CONDITION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(262301135283064550)
,p_event_id=>wwv_flow_api.id(262301076537064549)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261517272078997834)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(262087575215116240)
,p_name=>'P1_LOGGING_START - Changed'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_LOGGING_START'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(262087664738116241)
,p_event_id=>wwv_flow_api.id(262087575215116240)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261517272078997834)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(262297728134064516)
,p_name=>'P1_DEST_SCHEMA - Changed'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_TARGET_SCHEMA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(262297819107064517)
,p_event_id=>wwv_flow_api.id(262297728134064516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(262088376889116248)
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(262298996831064528)
,p_name=>'P1_SOURCE_SCHEMA - Changed'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_SOURCE_SCHEMA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(262299029274064529)
,p_event_id=>wwv_flow_api.id(262298996831064528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'P1_SOURCE_SCHEMA'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(262299872521064537)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save Prefs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX_UTIL.SET_PREFERENCE(''LOGGING_START_CALL'', :P1_LOGGING_START_CALL, :APP_USER);',
'APEX_UTIL.SET_PREFERENCE(''LOGGING_FINISH_CALL'', :P1_LOGGING_FINISH_CALL, :APP_USER);',
'APEX_UTIL.SET_PREFERENCE(''LOGGING_API_CALL'', :P1_LOGGING_API_CALL, :APP_USER);',
'APEX_UTIL.SET_PREFERENCE(''VARIABLE_NAME'', :P1_VARIABLE_NAME, :APP_USER);',
'APEX_UTIL.SET_PREFERENCE(''CONDITION_START'', :P1_CONDITION_START, :APP_USER);',
'APEX_UTIL.SET_PREFERENCE(''CONDITION_END'', :P1_CONDITION_END, :APP_USER);',
'APEX_UTIL.SET_PREFERENCE(''INDENT'', :P1_INDENT, :APP_USER);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESET'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(262299740550064536)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_USER_PREFERENCES'
,p_process_name=>'Reset Prefs'
,p_attribute_01=>'RESET_USER_PREFERENCES'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESET'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(262300743175064546)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Items'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_LOGGING_START_CALL := api_trace.c_APEX_Logging_Start_Call;',
':P1_LOGGING_FINISH_CALL := api_trace.c_APEX_Logging_Exit_Call;',
':P1_LOGGING_API_CALL := api_trace.c_APEX_Logging_API_Call;',
':P1_VARIABLE_NAME := ''lv_result'';',
':P1_CONDITION_START := package_tracer.c_APEX_Condition_Start;',
':P1_CONDITION_END := package_tracer.c_APEX_Condition_End;',
':P1_INDENT := 8;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESET'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261514889183997810)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enable_APEX'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'package_tracer.Enable_APEX(',
'    p_Dest_Schema=>:P1_SOURCE_SCHEMA,',
'    p_Logging_Start_Enabled=>:P1_LOGGING_START,',
'    p_Logging_Start_Call=>:P1_LOGGING_START_CALL,',
'    p_Logging_Finish_Call=>:P1_LOGGING_FINISH_CALL,',
'    p_Logging_API_Call=>:P1_LOGGING_API_CALL,',
'    p_Variable_Name=>:P1_VARIABLE_NAME',
');'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(261514693538997808)
,p_process_success_message=>'Tracing of API-Calls has been enabled.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261514975772997811)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Disable_APEX'
,p_process_sql_clob=>'package_tracer.Disable_APEX;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(261514772390997809)
,p_process_success_message=>'Tracing of API-Calls has been disabled.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261515191491997813)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit Changes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_MESSAGE := NULL;',
'FOR I in 1..APEX_APPLICATION.G_F01.COUNT LOOP',
'    begin ',
'    if APEX_APPLICATION.G_F02(i) != APEX_APPLICATION.G_F03(i) then ',
'        if APEX_APPLICATION.G_F02(i) = ''Y'' then ',
'            package_tracer.Enable (',
'                p_Package_Name=>APEX_APPLICATION.G_F01(i),',
'                p_Logging_Start_Enabled=>:P1_LOGGING_START',
'            );',
'        else ',
'            package_tracer.Disable(p_Package_Name=>APEX_APPLICATION.G_F01(i));',
'        end if;',
'    end if;',
'    exception when others then ',
'        :P1_MESSAGE := SQLERRM;',
'    end;',
'END LOOP;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':REQUEST IN (''SUBMIT_APEX'', ''SUBMIT_PUBLIC'')'
,p_process_when_type=>'PLSQL_EXPRESSION'
,p_process_success_message=>'Changes have been processed. &P1_MESSAGE.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261518351149997845)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enable Public'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_MESSAGE := NULL;',
'FOR I in 1..APEX_APPLICATION.G_F01.COUNT LOOP',
'    begin ',
'        if APEX_APPLICATION.G_F03(i) = ''N'' then ',
'            package_tracer.Enable(',
'                p_Package_Name=>APEX_APPLICATION.G_F01(i),',
'                p_Dest_Schema=>:P1_SOURCE_SCHEMA,',
'                p_Logging_Start_Enabled=>:P1_LOGGING_START,',
'                p_Logging_Start_Call=>:P1_LOGGING_START_CALL,',
'                p_Logging_Finish_Call=>:P1_LOGGING_FINISH_CALL,',
'                p_Logging_API_Call=>:P1_LOGGING_API_CALL,',
'                p_Variable_Name=>:P1_VARIABLE_NAME                              ',
'            );',
'        end if;',
'    exception when others then ',
'        :P1_MESSAGE := SQLERRM;',
'    end;',
'END LOOP;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(261518186473997843)
,p_process_success_message=>'Tracing of API-Calls has been enabled.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261518428852997846)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Disable Public'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_MESSAGE := NULL;',
'FOR I in 1..APEX_APPLICATION.G_F01.COUNT LOOP',
'    begin',
'        if APEX_APPLICATION.G_F03(i) = ''Y'' then ',
'            package_tracer.Disable(p_Package_Name=>APEX_APPLICATION.G_F01(i));',
'        end if;',
'    exception when others then ',
'        :P1_MESSAGE := SQLERRM;',
'    end;',
'END LOOP;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(261518297579997844)
,p_process_success_message=>'Tracing of API-Calls has been disabled.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(262298318096064522)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enable Publish'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_MESSAGE := NULL;',
'FOR I in 1..APEX_APPLICATION.G_F01.COUNT LOOP',
'    begin ',
'        if APEX_APPLICATION.G_F03(i) = ''N'' then ',
'            if APEX_APPLICATION.G_F08(i) = ''0'' then',
'                EXECUTE IMMEDIATE APEX_APPLICATION.G_F04(i); -- GRANT_STAT',
'                EXECUTE IMMEDIATE APEX_APPLICATION.G_F05(i); -- CREATE_STAT',
'            else ',
'                package_tracer.Copy_View (',
'                    p_View_Name   => APEX_APPLICATION.G_F01(i), -- OBJECT_NAME',
'                    p_Dest_Schema => :P1_TARGET_SCHEMA',
'                );',
'            end if;',
'        end if;',
'    exception when others then ',
'        :P1_MESSAGE := SQLERRM;',
'    end;',
'END LOOP;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(262298142402064520)
,p_process_success_message=>'Objects have been published'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(262298418820064523)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Disable Publish'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_MESSAGE := NULL;',
'FOR I in 1..APEX_APPLICATION.G_F01.COUNT LOOP',
'    begin ',
'        if APEX_APPLICATION.G_F03(i) = ''Y'' then ',
'            EXECUTE IMMEDIATE APEX_APPLICATION.G_F07(i); -- DROP_STAT',
'            EXECUTE IMMEDIATE APEX_APPLICATION.G_F06(i); -- REVOKE_STAT',
'        end if;',
'    exception when others then ',
'        :P1_MESSAGE := SQLERRM;',
'    end;',
'END LOOP;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(262298249288064521)
,p_process_success_message=>'Objects have been de-published'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(262298508168064524)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Submit Publish'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P1_MESSAGE := NULL;',
'FOR I in 1..APEX_APPLICATION.G_F01.COUNT LOOP',
'    begin ',
'    if APEX_APPLICATION.G_F02(i) != APEX_APPLICATION.G_F03(i) then ',
'        if APEX_APPLICATION.G_F02(i) = ''Y'' then ',
'            if APEX_APPLICATION.G_F08(i) = ''0'' then',
'                EXECUTE IMMEDIATE APEX_APPLICATION.G_F04(i); -- GRANT_STAT',
'                EXECUTE IMMEDIATE APEX_APPLICATION.G_F05(i); -- CREATE_STAT',
'            else ',
'                package_tracer.Copy_View (',
'                    p_View_Name   => APEX_APPLICATION.G_F01(i), -- OBJECT_NAME',
'                    p_Dest_Schema => :P1_TARGET_SCHEMA',
'                );',
'            end if;',
'        else ',
'            EXECUTE IMMEDIATE APEX_APPLICATION.G_F07(i); -- DROP_STAT',
'            EXECUTE IMMEDIATE APEX_APPLICATION.G_F06(i); -- REVOKE_STAT',
'        end if;',
'    end if;',
'    exception when others then ',
'        :P1_MESSAGE := SQLERRM;',
'    end;',
'END LOOP;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(262298097773064519)
,p_process_success_message=>'Changes have been processed. &P1_MESSAGE.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(262299167736064530)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Parsing Schema'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':APP_PARSING_SCHEMA := :P1_SOURCE_SCHEMA;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
prompt --application/pages/page_00012
begin
wwv_flow_api.create_page(
 p_id=>12
,p_user_interface_id=>wwv_flow_api.id(261925670901419279)
,p_name=>'About'
,p_page_mode=>'MODAL'
,p_step_title=>'About'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'DIRK'
,p_last_upd_yyyymmddhh24miss=>'20210703142924'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(439125347650624900)
,p_name=>'Plug-ins'
,p_template=>wwv_flow_api.id(261847088185419225)
,p_display_sequence=>25
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'BODY'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISPLAY_NAME,ABOUT_URL,VERSION_IDENTIFIER',
'  from APEX_APPL_PLUGINS',
' where APPLICATION_ID = :APP_ID'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_query_row_template=>wwv_flow_api.id(261870136694419236)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(262816692924701511)
,p_query_column_id=>1
,p_column_alias=>'DISPLAY_NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Display Name'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(262817003166701512)
,p_query_column_id=>2
,p_column_alias=>'ABOUT_URL'
,p_column_display_sequence=>2
,p_column_heading=>'About Url'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(262817468437701513)
,p_query_column_id=>3
,p_column_alias=>'VERSION_IDENTIFIER'
,p_column_display_sequence=>3
,p_column_heading=>'Version Identifier'
,p_use_as_row_header=>'N'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(476392711406529681)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(261847088185419225)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262818146278701517)
,p_name=>'P12_APPLICATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'Application'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select APPLICATION_NAME',
'  from APEX_APPLICATIONS',
' where APPLICATION_ID = :APP_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262818517878701519)
,p_name=>'P12_APPLICATION_VERSION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'Application Version'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select VERSION',
'  from APEX_APPLICATIONS',
' where APPLICATION_ID = :APP_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262818996543701520)
,p_name=>'P12_APEX_VERSION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'APEX Version'
,p_source=>'SELECT VERSION_NO FROM APEX_RELEASE;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262819338726701520)
,p_name=>'P12_DB_VERSION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'Oracle Database Version'
,p_source=>'SELECT SUBSTR(BANNER_FULL, INSTR(BANNER_FULL, ''Version'')+8) FROM V$VERSION'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262819768527701520)
,p_name=>'P12_AUTHOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'Author'
,p_source=>'Dirk Strack'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262820144429701520)
,p_name=>'P12_EMAIL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'E-Mail'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_source=>'<a href="mailto:Strack.Software@t-online.de">Strack.Software@t-online.de</a>'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262820507661701521)
,p_name=>'P12_MODUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'Licence Modus'
,p_source=>unistr('BSD 2; Copyright \24B8 2021 Strack Software Development, Berlin, Germany')
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262820965457701521)
,p_name=>'P12_CURRENT_URL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(262821346656701521)
,p_name=>'P12_BOOKMARK_URL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(476392711406529681)
,p_prompt=>'Bookmark Url'
,p_source=>'<a href="&P12_CURRENT_URL.">&P12_CURRENT_URL.</a>'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(261901871487419252)
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(262821892305701530)
,p_computation_sequence=>10
,p_computation_item=>'P12_CURRENT_URL'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'apex_util.host_url(''SCRIPT'') || ''/f?p='' || V(''APP_ID'') || '':'' || V(''APP_RETURN_PAGE'') || '':0'''
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_api.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_api.id(261925670901419279)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'APEX API Tracer - Sign In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_api.id(261802133692419203)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'DIRK'
,p_last_upd_yyyymmddhh24miss=>'20210725130435'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261929701873419313)
,p_plug_name=>'APEX API Tracer'
,p_icon_css_classes=>'fa-bug'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(261846540878419225)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261934498020419327)
,p_plug_name=>'Language Selector'
,p_parent_plug_id=>wwv_flow_api.id(261929701873419313)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(261821862335419215)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_num_rows=>15
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261932577601419322)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(261929701873419313)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(261903106003419254)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261930134088419315)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(261929701873419313)
,p_prompt=>'username'
,p_placeholder=>'username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(261901755938419251)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261930557578419316)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(261929701873419313)
,p_prompt=>'password'
,p_placeholder=>'password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(261901755938419251)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261931607278419319)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(261929701873419313)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'LOGIN_REMEMBER_USERNAME'
,p_lov=>'.'||wwv_flow_api.id(261930804590419317)||'.'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_api.id(261901755938419251)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'If you select this checkbox, the application will save your username in a persistent browser cookie named "LOGIN_USERNAME_COOKIE".',
'When you go to the login page the next time,',
'the username field will be automatically populated with this value.',
'</p>',
'<p>',
'If you deselect this checkbox and your username is already saved in the cookie,',
'the application will overwrite it with an empty value.',
'You can also use your browser''s developer tools to completely remove the cookie.',
'</p>'))
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261933318524419325)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261932992475419324)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261934102226419326)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(261933785950419326)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_api.create_install(
 p_id=>wwv_flow_api.id(261939340346429622)
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DROP PACKAGE package_tracer;',
'/'))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SYNONYM:CREATE TABLE'
);
end;
/
prompt --application/deployment/install/install_api_trace
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(262454589715753160)
,p_install_id=>wwv_flow_api.id(261939340346429622)
,p_name=>'api_trace'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'Copyright 2019 Dirk Strack, Strack Software Development',
'',
'All Rights Reserved',
'Unauthorized copying of this file, via any medium is strictly prohibited',
'Proprietary and confidential',
'Written by Dirk Strack <dirk_strack@yahoo.de>, Feb 2019',
'*/',
'/*',
'api_trace enables tracing of calls to prepared packages ',
'*/',
'',
'CREATE OR REPLACE PACKAGE api_trace',
'AUTHID CURRENT_USER ',
'IS',
'    c_APEX_Logging_Start_Call  CONSTANT VARCHAR2(1000) := ''apex_debug.log_long_message(p_message=>''''API call: '''' || %s, p_level=>5);'';',
'    c_APEX_Logging_Exit_Call CONSTANT VARCHAR2(1000) := ''apex_debug.log_long_message(p_message=>''''API exit: '''' || %s, p_level=>5);'';',
'    c_APEX_Logging_API_Call    CONSTANT VARCHAR2(1000) := ''apex_debug.log_long_message(p_message=>''''API: '''' || %s, p_level=>5);'';',
'    c_APEX_Logging_API_Exception CONSTANT VARCHAR2(1000) := ''apex_debug.log_long_message(p_message=>''''API Exception: '''' || %s, p_level=>5);'';',
'    -- p_level=>4; -- default level if debugging is enabled (for example, used by apex_application.debug)',
'    -- p_level=>5; -- application: messages when procedures/functions are entered',
'    -- p_level=>6; -- application: other messages within procedures/functions',
'    c_format_max_length CONSTANT NUMBER := 32700;',
'	c_Package_Name             CONSTANT VARCHAR2(128) := lower($$plsql_unit);',
'    FUNCTION Literal ( p_Text VARCHAR2, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'    FUNCTION Literal ( p_Value BLOB, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'    FUNCTION Literal ( p_Value CLOB, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'    FUNCTION Literal ( p_Value BOOLEAN, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'    FUNCTION Literal ( p_Value NUMBER, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'    FUNCTION Literal_RAW ( p_Value RAW, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'    FUNCTION Literal_PWD ( p_Value VARCHAR2, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'',
'    FUNCTION Format_Call_Parameter(',
'        p_calling_subprog VARCHAR2,             -- name of the called procedure or function in a package format: package_name.procedure_name',
'        p_synonym_name VARCHAR2 DEFAULT NULL,   -- optional name of the procedure in the log message',
'        p_value_max_length INTEGER DEFAULT 1000,-- maximum length of an single procedure argument value in the log message',
'        p_bind_char VARCHAR2 DEFAULT '':'',       -- optional bind char that will help to produce bind variables for use with EXECUTE IMMEDIATE',
'        p_overload INTEGER DEFAULT 0,           -- identifier of a overloded funtion in order of occurence.',
'        p_in_out VARCHAR2 DEFAULT ''IN/OUT''      -- IN, OUT, IN/OUT. Used to filter the set of procedure arguments that are logged in the message.',
'    ) RETURN VARCHAR2;',
'',
'    /* build an pl/sql programm that captures the parameters of an package procedure or function for logging.',
'       execute with output: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call(NULL) USING OUT v_log_message, IN <param...>',
'       execute with apex_debug: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call USING <param...>',
'       the count of the arguments will be checked at runtime.',
'    */',
'    FUNCTION Dyn_Log_Call(',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_API_Call,	-- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                 -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0                             -- identifier of a overloded funtion in order of occurence.',
'    ) RETURN VARCHAR2; ',
'    FUNCTION Dyn_Log_Start (',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_Start_Call,-- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                 -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0                             -- identifier of a overloded funtion in order of occurence.',
'    ) RETURN VARCHAR2;',
'    FUNCTION Dyn_Log_Exit (',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_Exit_Call,-- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                 -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0                             -- identifier of a overloded funtion in order of occurence.',
'    ) RETURN VARCHAR2;',
'    FUNCTION Dyn_Log_Exception (',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_API_Exception,-- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                 -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0,                             -- identifier of a overloded funtion in order of occurence.',
'        p_format_error_function IN VARCHAR2 DEFAULT ''DBMS_UTILITY.FORMAT_ERROR_STACK'' -- function for formating for the current error. The output is concatinated to the message.',
'    ) RETURN VARCHAR2;',
'END api_trace;',
'/',
'',
'',
'CREATE OR REPLACE PACKAGE BODY api_trace',
'IS',
'    c_Quote CONSTANT VARCHAR2(1) := chr(39);	-- Quote Character',
'',
'    FUNCTION Literal ( p_Text VARCHAR2, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN c_Quote || replace(substr(p_Text, 1, p_value_max_length), c_Quote, c_Quote||c_Quote) || c_Quote ;',
'    END Literal;',
'    ',
'    FUNCTION Literal ( p_Value BLOB, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN case when p_Value IS NULL then ''null''',
'        else c_Quote || dbms_lob.getlength(p_Value) || '' bytes'' || c_Quote ',
'        end;',
'    END Literal;',
'    ',
'    FUNCTION Literal ( p_Value CLOB, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN case when p_Value IS NULL then ''null''',
'        else c_Quote || dbms_lob.substr(p_Value, p_value_max_length, 1) || c_Quote ',
'        end;',
'    END Literal;',
'',
'    FUNCTION Literal ( p_Value BOOLEAN, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN case when p_Value IS NULL then ''null''',
'          when p_Value then ''true'' else ''false'' end ;',
'    END Literal;',
'',
'    FUNCTION Literal ( p_Value NUMBER, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN case when p_Value IS NULL then ''null'' ',
'        else substr(to_char(p_Value), 1, p_value_max_length) ',
'        end;',
'    END Literal;',
'',
'    FUNCTION Literal_RAW ( p_Value RAW, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN case when p_Value IS NULL then ''null''',
'        else ''HEXTORAW('' || c_Quote || substr(rawtohex(p_Value), 1, p_value_max_length) || c_Quote || '')''',
'        end;',
'    END Literal_RAW;',
'',
'    FUNCTION Literal_PWD ( p_Value VARCHAR2, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN c_Quote || substr(rpad(''X'', LENGTH(p_Value), ''X''), 1, p_value_max_length) || c_Quote;',
'    END Literal_PWD;',
'',
'    -- build an expression that captures the parameters of an package procedure for logging.',
'    -- the procedure or function must be listed in the package header.',
'    -- when a procedure or function is overloaded then used the p_overload=>1 for the first and p_overload=>2 for the second variant.',
'    -- invoke with: EXECUTE IMMEDIATE api_trace.Format_Call_Parameter USING OUT v_char_Result;',
'    -- the count of the arguments will be checked at runtime.',
'    FUNCTION Format_Call_Parameter(',
'        p_calling_subprog VARCHAR2,             -- name of the called procedure or function in a package format: package_name.procedure_name',
'        p_synonym_name VARCHAR2 DEFAULT NULL,   -- optional name of the procedure in the log message',
'        p_value_max_length INTEGER DEFAULT 1000,-- maximum length of an single procedure argument value in the log message',
'        p_bind_char VARCHAR2 DEFAULT '':'',       -- optional bind char that will help to produce bind variables for use with EXECUTE IMMEDIATE',
'        p_overload INTEGER DEFAULT 0,           -- identifier of a overloded funtion in order of occurence.',
'        p_in_out VARCHAR2 DEFAULT ''IN/OUT''      -- IN, OUT, IN/OUT. Used to filter the set of procedure arguments that are logged in the message.',
'    ) RETURN VARCHAR2',
'    IS',
'		$IF DBMS_DB_VERSION.VERSION >= 12 $THEN',
'			PRAGMA UDF;',
'		$END',
'        c_newline VARCHAR2(10) := ''chr(10)''||chr(10);',
'        c_argument_per_line CONSTANT PLS_INTEGER := 7;',
'        c_conop VARCHAR2(10) := '' || '';',
'        v_argument_name VARCHAR2(200);',
'        v_offset NUMBER;',
'        v_result_str VARCHAR2(32767);',
'        v_subprog VARCHAR2(32767);',
'        v_over  dbms_describe.number_table;',
'        v_posn  dbms_describe.number_table;',
'        v_levl  dbms_describe.number_table;',
'        v_arg_name dbms_describe.varchar2_table;',
'        v_dtyp  dbms_describe.number_table;',
'        v_defv  dbms_describe.number_table;',
'        v_inout dbms_describe.number_table;',
'        v_len   dbms_describe.number_table;',
'        v_prec  dbms_describe.number_table;',
'        v_scal  dbms_describe.number_table;',
'        v_n     dbms_describe.number_table;',
'        v_spare dbms_describe.number_table;',
'        v_idx   INTEGER := 0;',
'        v_count INTEGER := 0;',
'    BEGIN ',
'        dbms_describe.describe_procedure(',
'            object_name => p_calling_subprog, ',
'            reserved1 => NULL, ',
'            reserved2 => NULL,',
'            overload => v_over, ',
'            position => v_posn, ',
'            level => v_levl, ',
'            argument_name => v_arg_name, ',
'            datatype => v_dtyp, ',
'            default_value => v_defv, ',
'            in_out => v_inout,      -- 0 IN, 1 OUT, 2 IN/OUT ',
'            length => v_len, ',
'            precision => v_prec, ',
'            scale => v_scal, ',
'            radix => v_n, ',
'            spare => v_spare',
'        );',
'        loop ',
'            v_idx := v_idx + 1;',
'            exit when v_idx > v_arg_name.count;',
'            exit when length(v_result_str) > 32000; ',
'            if v_posn(v_idx) != 0  -- Position 0 returns the values for the return type of a function. ',
'            and v_over(v_idx) = NVL(p_overload, 0)',
'            and v_arg_name(v_idx) IS NOT NULL ',
'            and (v_inout(v_idx) != 0 or p_in_out IN (''IN'', ''IN/OUT'')) then',
'            	v_count := v_count + 1;',
'            	v_offset := INSTR(v_arg_name(v_idx), ''_'');',
'            	if v_offset > 0 then ',
'                	v_argument_name := lower(substr(v_arg_name(v_idx), 1, v_offset)) || initcap(substr(v_arg_name(v_idx), v_offset+1));',
'                else ',
'                	v_argument_name := lower(v_arg_name(v_idx));',
'                end if;',
'                if v_result_str IS NOT NULL then ',
'                    v_result_str := v_result_str ',
'                    || case when mod(v_idx-1, c_argument_per_line) = 0 then c_conop || c_newline else chr(10) end',
'                    || ''    '' || c_conop;',
'                end if;',
'                if v_inout(v_idx) != 0 and p_in_out = ''IN'' then -- OUT parameters are not converted to a literal for logging at start of procedure',
'                    v_result_str := v_result_str ',
'                    || Literal(',
'                    	case when v_count > 1 then '', '' end',
'                    	|| v_argument_name || ''=>'' || v_argument_name);',
'                else ',
'                    v_result_str := v_result_str ',
'                    || Literal(case when v_count > 1 then '', '' end',
'                    	|| v_argument_name || ''=>'') ',
'                    || c_conop',
'                    || case when v_dtyp(v_idx) IN (			-- Is_Printable_Type:',
'                            2,3, 1, 8, 11, 12, 23,          -- number, varchar,long,rowid,date, raw',
'                            96, 178,179,180,181,231,252,    -- char,timestamp, time, boolean',
'                            112, 113)                       -- clob, blob',
'                        then ',
'                            c_Package_Name || ''.''',
'                            || case when v_arg_name(v_idx) in (''P_PASSWORD'', ''P_PASS'', ''P_WALLET_PWD'', ''P_WEB_PASSWORD'', ''P_OLD_PASSWORD'', ''P_NEW_PASSWORD'')',
'                            	then ''Literal_PWD''',
'                            when v_dtyp(v_idx) = 23 ',
'                            	then ''Literal_RAW'' ',
'                            	else ''Literal'' ',
'                            end',
'                            || ''('' || p_bind_char || v_argument_name ',
'                            || case when p_value_max_length != 1000 then '', '' || p_value_max_length end',
'                            || '')''',
'                        else ',
'                            Literal(''<datatype ''||v_dtyp(v_idx)||''>'')',
'                    end;',
'                end if;',
'            end if;',
'        end loop;',
'        v_subprog := NVL( p_Synonym_Name, p_calling_subprog );',
'        if v_result_str IS NOT NULL then ',
'            v_result_str := Literal(v_subprog || ''('') || chr(10)',
'            || ''    '' || c_conop || v_result_str || c_conop || Literal('')'');',
'        else ',
'            v_result_str := Literal(v_subprog);',
'        end if;',
'        RETURN v_result_str;',
'    END Format_Call_Parameter;',
'',
'    /* build an expression that captures the parameters of an package procedure for logging.',
'       execute with output: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call(NULL) USING OUT v_log_message, IN <param...>',
'       execute with apex_debug: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call USING <param...>',
'       the count of the arguments will be checked at runtime.',
'    */',
'    FUNCTION Format_Call(p_Logging_Call IN VARCHAR2, p_Call_Parameter IN VARCHAR2) ',
'    RETURN VARCHAR2',
'    IS',
'    BEGIN ',
'    	RETURN ''begin '' || replace(p_Logging_Call, ''%s'', p_Call_Parameter) || '' end;'';',
'    END Format_Call;',
'    ',
'    FUNCTION Dyn_Log_Call(',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_API_Call,   -- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                      -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0                                  -- identifier of a overloded funtion in order of occurence.',
'    ) RETURN VARCHAR2',
'    IS',
'        c_calling_subprog constant varchar2(512) := lower(utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(2))); ',
'        v_result_str VARCHAR2(32767);',
'    BEGIN',
'        v_result_str := Format_Call_Parameter( ',
'            p_calling_subprog => c_calling_subprog,',
'            p_value_max_length => p_value_max_length,',
'            p_bind_char => '':'',',
'            p_overload => p_overload,',
'            p_in_out => ''IN/OUT''',
'        );',
'        if p_Logging_Call IS NOT NULL then ',
'            return Format_Call(p_Logging_Call=>p_Logging_Call, p_Call_Parameter=>v_result_str);',
'        else',
'            return v_result_str;',
'        end if;',
'    END Dyn_Log_Call; ',
'',
'    FUNCTION Dyn_Log_Start (',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_Start_Call,-- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                 -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0                             -- identifier of a overloded funtion in order of occurence.',
'    ) RETURN VARCHAR2',
'    IS',
'        c_calling_subprog constant varchar2(512) := lower(utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(2))); ',
'        v_result_str VARCHAR2(32767);',
'    BEGIN',
'        v_result_str := Format_Call_Parameter( ',
'            p_calling_subprog => c_calling_subprog,',
'            p_value_max_length => p_value_max_length,',
'            p_bind_char => '':'',',
'            p_overload => p_overload,',
'            p_in_out => ''IN''',
'        );',
'        if p_Logging_Call IS NOT NULL then ',
'            return Format_Call(p_Logging_Call=>p_Logging_Call, p_Call_Parameter=>v_result_str);',
'        else',
'            return v_result_str;',
'        end if;',
'    END Dyn_Log_Start; ',
'',
'    FUNCTION Dyn_Log_Exit (',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_Exit_Call,-- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                 -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0                             -- identifier of a overloded funtion in order of occurence.',
'    ) RETURN VARCHAR2',
'    IS',
'        c_calling_subprog constant varchar2(512) := lower(utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(2))); ',
'        v_result_str VARCHAR2(32767);',
'    BEGIN',
'        v_result_str := Format_Call_Parameter( ',
'            p_calling_subprog => c_calling_subprog,',
'            p_value_max_length => p_value_max_length,',
'            p_bind_char => '':'',',
'            p_overload => p_overload,',
'            p_in_out => ''OUT''',
'        );',
'        if p_Logging_Call IS NOT NULL then ',
'            return Format_Call(p_Logging_Call=>p_Logging_Call, p_Call_Parameter=>v_result_str);',
'        else',
'            return v_result_str;',
'        end if;',
'    END Dyn_Log_Exit; ',
'    ',
'    FUNCTION Dyn_Log_Exception (',
'        p_Logging_Call IN VARCHAR2 DEFAULT c_APEX_Logging_API_Exception,-- string with a %s placeholder for the call arguments.',
'        p_value_max_length IN INTEGER DEFAULT 1000,                 -- maximum length of an single procedure argument value in the log message',
'        p_overload IN INTEGER DEFAULT 0,                             -- identifier of a overloded funtion in order of occurence.',
'        p_format_error_function IN VARCHAR2 DEFAULT ''DBMS_UTILITY.FORMAT_ERROR_STACK'' -- function for formating for the current error. The output is concatinated to the message.',
'    ) RETURN VARCHAR2',
'    IS',
'        c_calling_subprog constant varchar2(512) := lower(utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(2))); ',
'        v_result_str VARCHAR2(32767);',
'    BEGIN',
'        v_result_str := Format_Call_Parameter( ',
'            p_calling_subprog => c_calling_subprog,',
'            p_value_max_length => p_value_max_length,',
'            p_bind_char => '':'',',
'            p_overload => p_overload,',
'            p_in_out => ''IN/OUT''',
'        )',
'        || '' || '' || p_format_error_function;',
'        if p_Logging_Call IS NOT NULL then ',
'            return Format_Call(p_Logging_Call=>p_Logging_Call, p_Call_Parameter=>v_result_str);',
'        else',
'            return v_result_str;',
'        end if;',
'    END Dyn_Log_Exception; ',
'END api_trace;',
'/',
''))
);
end;
/
prompt --application/deployment/install/install_package_tracer_sql
begin
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(261939746109436819)
,p_install_id=>wwv_flow_api.id(261939340346429622)
,p_name=>'package_tracer.sql'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'Package_Tracer enables the tracing of calls to package procedures or functions without manual programming.',
'This program can generate a package for tracing automatically when the following conditions apply:',
'',
'  1. the package is accessible to the schema user via a synonym.',
'  2. the procedure or function is listed in the package header.',
'  3. the package defines no record or table types for function arguments',
'  4. the package header is not wrapped.',
'',
'The enable procedure will generate a package with the same name as the synonym in your local schema.',
'',
'The link from your local applications to the synonym will be intercepted by the generated package.',
'',
'The package will contain the same functions and procedures as the original package.',
'',
'In each function and procedure exists ',
'',
'1. A call to APEX_DEBUG.MESSAGE to produce log entries with text for valid PL/SQL procedure calls with enquoted parameters, that you can copy and paste into the sql console for testing.',
'2. A call to invocate the original procedure or functions.',
'3. A call to APEX_DEBUG.MESSAGE to produce log entries for the output values and return values of the invocation.',
'',
'For other packages where the above-mentioned conditions do not apply, you can manually add invocations to the api_trace package to support logging for prepared functions or procedures in your own packages.',
'',
'Use the package_tracer.Enable procedure to start tracing of a package.',
'',
'Use the package_tracer.Disable procedure to stop tracing of a package.',
'',
'',
'1. enable',
'    detect local packages with the same name that may be overwritten.',
'    support local synonyms. ',
'        local synonym is dropped before the package is created.',
'        The origial synonym definition is captured in a comment of the generated package header.',
'    produce synonyms and grants for dependent objects.',
'    In the case that additiona privileges are required, print grant statements and then stop-',
'    create a package header as a slimmed copy of the target package.',
'    create a package body that for each procedure or function',
'        prints the call parameter in the APEX debug log.',
'        then execute the target function or procedure ',
'        print return values and output parameter after function call in the APEX debug log.',
'',
'3. disable: ',
'    execute drop statements for synonyms that are no longer required ',
'    execute drop statement for the local package ',
'    recreate the local synonym when no PUBLIC synonym exists.',
'',
'-- for some APEX APIs you have to grant access to the following objects:',
'GRANT EXECUTE ON APEX_<version>.WWV_FLOW_SECURITY TO <schema_name>;',
'GRANT EXECUTE ON APEX_<version>.WWV_FLOW_THEMES TO <schema_name>;',
'GRANT EXECUTE ON APEX_<version>.WWV_FLOW_THEME_STYLES TO <schema_name>;',
'',
'-- for the publish app schema functionality you need the following privileges:',
'GRANT CREATE ANY SYNONYM TO <schema_name>;',
'GRANT DROP ANY SYNONYM TO <schema_name>;',
'GRANT CREATE ANY VIEW TO <schema_name>;',
'GRANT DROP ANY VIEW TO <schema_name>;',
'GRANT MERGE ANY VIEW TO <schema_name>;',
'',
'*/',
'',
'CREATE OR REPLACE PACKAGE package_tracer',
'AUTHID CURRENT_USER ',
'IS',
'    c_APEX_Condition_Start     CONSTANT VARCHAR2(1000) := ''if apex_application.g_debug then'';',
'    c_APEX_Condition_End       CONSTANT VARCHAR2(1000) := ''end if;'';',
'    c_Package_Name             CONSTANT VARCHAR2(128) := lower($$plsql_unit);',
'    g_debug                    CONSTANT BOOLEAN := FALSE;',
'    ',
'    TYPE rec_logging_calls IS RECORD (',
'        Package_Name    SYS.ALL_ARGUMENTS.PACKAGE_NAME%TYPE, ',
'        Object_Name     SYS.ALL_ARGUMENTS.OBJECT_NAME%TYPE, ',
'        Subprogram_Id   SYS.ALL_ARGUMENTS.SUBPROGRAM_ID%TYPE, ',
'        Overload        SYS.ALL_ARGUMENTS.OVERLOAD%TYPE,',
'        Procedure_Name  VARCHAR2(512),',
'        Logging_Call    VARCHAR2(32767)',
'    );',
'    TYPE tab_logging_calls IS TABLE OF rec_logging_calls;',
'    ',
'    TYPE rec_dependent_grants IS RECORD (',
'        Owner           VARCHAR2(128),',
'        Name            VARCHAR2(128),',
'        Grant_Stat      VARCHAR2(1000),',
'        Synonym_Stat    VARCHAR2(1000),',
'        Grantable       VARCHAR2(3),',
'        Privilege       VARCHAR2(1000),',
'        Synonym_Owner   VARCHAR2(128)',
'    );',
'    TYPE tab_dependent_grants IS TABLE OF rec_dependent_grants;',
'    ',
'    TYPE rec_synonyms IS RECORD (',
'        Synonym_Owner   VARCHAR2(128),',
'        Synonym_Name    VARCHAR2(128),',
'        Package_Owner   VARCHAR2(128),',
'        Package_Name    VARCHAR2(128)',
'    );',
'    TYPE tab_synonyms IS TABLE OF rec_synonyms;',
'',
'    FUNCTION get_APEX_Packages_List RETURN tab_synonyms PIPELINED;',
'    FUNCTION get_Packages_List (',
'        p_Search_Name VARCHAR2 DEFAULT ''%''',
'    ) RETURN tab_synonyms PIPELINED;',
'    ',
'    TYPE rec_Packages_Control IS RECORD (',
'        Synonym_Name    VARCHAR2(128),',
'        Package_Owner   VARCHAR2(128),',
'        Package_Name    VARCHAR2(128),',
'        Is_Enabled_Switch VARCHAR2(32767),',
'        Is_Enabled      VARCHAR2(1),',
'        Grant_Stats     VARCHAR2(32767),',
'        Revoke_Stats    VARCHAR2(32767),',
'        Synonym_Stats   VARCHAR2(32767),',
'        Error_Count     NUMBER',
'    );',
'    TYPE tab_Packages_Control IS TABLE OF rec_Packages_Control;',
'    ',
'    FUNCTION in_list(',
'        p_string in clob,',
'        p_delimiter in varchar2 DEFAULT '';''',
'    )',
'    RETURN sys.odciVarchar2List PIPELINED DETERMINISTIC;',
'',
'    FUNCTION Enquote_Name ( p_Text VARCHAR2 )',
'    RETURN VARCHAR2 DETERMINISTIC;',
'',
'    FUNCTION get_Packages_Control_List (',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')    ',
'    )',
'    RETURN tab_Packages_Control PIPELINED;',
'    ',
'    FUNCTION get_APEX_Control_List ',
'    RETURN tab_Packages_Control PIPELINED;',
'',
'    TYPE rec_publish_schema IS RECORD (',
'        OWNER           VARCHAR2(128),',
'        OBJECT_NAME     VARCHAR2(128), ',
'        OBJECT_TYPE     VARCHAR2(128), ',
'        DEST_OBJECT_TYPE VARCHAR2(128),',
'        FOREIGN_DEPS_CNT        NUMBER,',
'        DEST_OBJECT_EXISTS VARCHAR2(3),',
'        CONFLICTING_OBJECT_EXISTS  VARCHAR2(3),',
'        DEST_SCHEMA     VARCHAR2(128),',
'        GRANT_STAT      VARCHAR2(4000), ',
'        CREATE_STAT     VARCHAR2(4000), ',
'        REVOKE_STAT     VARCHAR2(4000), ',
'        DROP_STAT       VARCHAR2(4000),',
'        IS_ENABLED_SWITCH VARCHAR2(32767)',
'    );',
'    TYPE tab_publish_schema IS TABLE OF rec_publish_schema;',
'',
'    FUNCTION get_publish_schema (',
'        p_Target_Schema IN VARCHAR2 ',
'    )',
'    RETURN tab_publish_schema PIPELINED;',
'',
'    PROCEDURE Copy_View (',
'        p_View_Name IN VARCHAR2,',
'        p_Dest_Schema IN VARCHAR2 ',
'    );',
'',
'    FUNCTION Is_Printable_Type (',
'        p_PLS_Type IN VARCHAR2',
'    ) RETURN VARCHAR2 DETERMINISTIC;',
'',
'    FUNCTION Format_Call_Parameter(',
'        p_Object_Name IN VARCHAR2,',
'        p_Object_Owner IN VARCHAR2,',
'        p_Procedure_Name IN VARCHAR2,',
'        p_Subprogram_ID IN NUMBER,',
'        p_calling_subprog VARCHAR2,',
'        p_synonym_name VARCHAR2 DEFAULT NULL,',
'        p_value_max_length INTEGER DEFAULT 1000,',
'        p_bind_char VARCHAR2 DEFAULT '':'',',
'        p_overload INTEGER DEFAULT 0,',
'        p_in_out VARCHAR2 DEFAULT ''IN/OUT'' -- IN, OUT, IN/OUT',
'    ) RETURN VARCHAR2;',
'',
'    FUNCTION Format_Return_Value (',
'        p_Procedure_Name IN VARCHAR2,',
'        p_PLS_Type IN VARCHAR2,',
'        p_Data_Type IN VARCHAR2 DEFAULT NULL,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result''',
'    ) RETURN VARCHAR2;',
'',
'    -- helper query for listing the procedures with parameters of a package',
'    FUNCTION Dyn_Log_Call_List (',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Compact IN VARCHAR2 DEFAULT ''Y'', --Y/N',
'        p_Logging_Start_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,',
'        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,',
'        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result'',',
'        p_Condition_Start IN VARCHAR2 DEFAULT c_APEX_Condition_Start,',
'        p_Condition_End IN VARCHAR2 DEFAULT c_APEX_Condition_End,',
'        p_Condition_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Indent IN NUMBER DEFAULT 8',
'    ) RETURN tab_logging_calls PIPELINED;',
'',
'    FUNCTION Get_Package_Source  (',
'        p_Package_Name IN VARCHAR2,',
'        p_Package_Owner IN VARCHAR2,',
'        p_Editionable  IN VARCHAR2 DEFAULT ''N'',',
'        p_Type IN VARCHAR2 DEFAULT ''PACKAGE''',
'    ) RETURN CLOB;',
'',
'    FUNCTION Get_Package_Synonym_Text (',
'        p_Package_Name IN VARCHAR2,',
'        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')',
'    ) RETURN VARCHAR2;',
'',
'    TYPE rec_record_fields IS RECORD (',
'    	Type_name 		VARCHAR2(128),',
'    	Item_Name		VARCHAR2(128),',
'    	Item_Type		VARCHAR2(128),',
'    	Nested_Table	VARCHAR2(1)',
'    );',
'    TYPE tab_record_fields IS TABLE OF rec_record_fields;',
'    -- list record and table types of a package',
'    FUNCTION Pipe_Record_types (',
'        p_Package_Name IN VARCHAR2,',
'        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')',
'    ) RETURN tab_record_fields PIPELINED;',
'    ',
'    FUNCTION Get_Record_Fields (',
'        p_Package_Head IN CLOB,',
'        p_Type_Subname IN VARCHAR2,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_temp''',
'    ) RETURN VARCHAR2;',
'',
'    PROCEDURE Enable (',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Logging_Start_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,',
'        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,',
'        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result'',',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE,',
'        p_value_max_length INTEGER DEFAULT 1000',
'    );',
'',
'    PROCEDURE Enable_APEX (',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Logging_Start_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,',
'        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,',
'        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result'',',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE',
'    );',
'',
'    PROCEDURE Disable (',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE',
'    );',
'',
'    PROCEDURE Disable_APEX (',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE',
'    );',
'END package_tracer;',
'/',
'',
'',
'CREATE OR REPLACE PACKAGE BODY package_tracer',
'IS',
'    c_Quote CONSTANT VARCHAR2(1) := chr(39);    -- Quote Character',
'    c_DQuote CONSTANT VARCHAR2(1) := chr(34);   -- Double Quote Character',
'    ',
'    FUNCTION in_list(',
'        p_string in clob,',
'        p_delimiter in varchar2 DEFAULT '';''',
'    )',
'    RETURN sys.odciVarchar2List PIPELINED DETERMINISTIC',
'    IS',
'        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN',
'            PRAGMA UDF;',
'        $END',
'        l_string    varchar2(32767);',
'        n           number          := length(p_string);',
'        p           number          := 1;',
'        l_dlen      constant number := length(p_delimiter);',
'        l_limit     constant number := 4000;',
'        l_Trim_Set  constant varchar2(50)  := chr(9)||chr(10)||chr(13)||chr(32);',
'    begin',
'        if p_string IS NOT NULL then',
'            loop',
'                exit when n = 0;',
'                n := DBMS_LOB.INSTR( p_string, p_delimiter, p );',
'                l_string := case when n >= p',
'                    then DBMS_LOB.SUBSTR( p_string, least(n-p, l_limit), p )',
'                    else DBMS_LOB.SUBSTR( p_string, l_limit, p )',
'                    end;',
'                pipe row( ltrim( rtrim( l_string, l_Trim_Set ), l_Trim_Set ) );',
'                p := n + l_dlen;',
'            end loop;',
'        end if;',
'        return ;',
'    END in_list;',
'',
'    FUNCTION Enquote_Name ( p_Text VARCHAR2 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN',
'            PRAGMA UDF;',
'        $END',
'    BEGIN',
'        RETURN c_DQuote || REPLACE(UPPER(p_Text), c_DQuote) || c_DQuote ;',
'    END Enquote_Name;',
'',
'    FUNCTION Enquote_Literal ( p_Text VARCHAR2, p_value_max_length PLS_INTEGER DEFAULT 1000 )',
'    RETURN VARCHAR2 DETERMINISTIC',
'    IS',
'    BEGIN',
'        RETURN c_Quote || REPLACE(SUBSTR(p_Text, 1, p_value_max_length), c_Quote, c_Quote||c_Quote) || c_Quote ;',
'    END Enquote_Literal;',
'    ',
'    FUNCTION get_APEX_Packages_List ',
'    RETURN tab_synonyms PIPELINED',
'    IS ',
'        c_APEX_Packages CONSTANT VARCHAR2(2000) := ',
'        ''APEX_ACL,APEX_APPLICATION_INSTALL,APEX_APP_SETTING,APEX_AUTHENTICATION,''',
'        || ''APEX_AUTHORIZATION,APEX_AUTOMATION,APEX_COLLECTION,APEX_CREDENTIAL,APEX_CSS,''',
'        || ''APEX_CUSTOM_AUTH,APEX_ESCAPE,APEX_EXPORT,APEX_IR,APEX_ITEM,''',
'        || ''APEX_JAVASCRIPT,APEX_LANG,APEX_LDAP,APEX_MAIL,APEX_PAGE,APEX_PKG_APP_INSTALL,''',
'        || ''APEX_PLUGIN,APEX_REGION,APEX_SESSION,APEX_SPATIAL,APEX_STRING,APEX_THEME,''',
'        || ''APEX_UI_DEFAULT_UPDATE,APEX_UTIL,APEX_WEB_SERVICE,APEX_ZIP'';',
'    begin   ',
'        for cur in (',
'            select ',
'                SYN.OWNER           Synonym_Owner, ',
'                SYN.SYNONYM_NAME    Synonym_Name,',
'                SYN.TABLE_OWNER     Package_Owner,',
'                SYN.TABLE_NAME      Package_Name',
'            from SYS.All_Synonyms SYN',
'            where SYN.SYNONYM_NAME IN (',
'                SELECT column_value FROM TABLE(in_list(c_APEX_Packages, '',''))',
'            )',
'            and SYN.OWNER = ''PUBLIC''',
'            order by Syn.synonym_Name',
'        ) loop ',
'            pipe row (cur);',
'        end loop;',
'        return;',
'    end get_APEX_Packages_List;',
'',
'    FUNCTION get_Packages_List (',
'        p_Search_Name VARCHAR2 DEFAULT ''%''',
'    ) RETURN tab_synonyms PIPELINED',
'    IS ',
'    begin   ',
'        for cur in (',
'			with return_q as (',
'				-- function return values of type record or table',
'                select A.PACKAGE_NAME, A.OWNER, ',
'					UPPER(T.TYPE_NAME) TYPE_NAME, UPPER(T.ITEM_NAME) ITEM_NAME, UPPER(T.ITEM_TYPE) ITEM_TYPE, T.Nested_Table',
'				from (        ',
'                    select distinct ARG.PACKAGE_NAME, ARG.OWNER, ARG.TYPE_SUBNAME',
'                    from SYS.ALL_ARGUMENTS ARG',
'                    where ARG.TYPE_NAME = ARG.PACKAGE_NAME ',
'                    and ARG.TYPE_OWNER = ARG.OWNER',
'                    and ARG.ARGUMENT_NAME IS NULL -- return value',
'                    and ARG.TYPE_SUBNAME IS NOT NULL',
'                ) A, table(package_tracer.Pipe_Record_types(p_Package_Name=>A.PACKAGE_NAME, p_Package_Owner=>A.OWNER)) T',
'                where A.TYPE_SUBNAME = UPPER(T.TYPE_NAME)',
'			)',
'            select',
'                SYN.OWNER           Synonym_Owner, ',
'                SYN.SYNONYM_NAME    Synonym_Name,',
'                SYN.TABLE_OWNER     Package_Owner,',
'                SYN.TABLE_NAME      Package_Name',
'            from SYS.All_Synonyms SYN',
'            join SYS.All_Objects OBJ on SYN.TABLE_NAME = OBJ.OBJECT_NAME and SYN.TABLE_OWNER = OBJ.OWNER',
'            where Syn.OWNER IN (''PUBLIC'', SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'') )',
'            and SYN.SYNONYM_NAME LIKE p_Search_Name',
'            and OBJ.OBJECT_TYPE = ''PACKAGE''',
'            and NOT EXISTS ( -- package defines no new table types for function arguments',
'                select 1',
'                from SYS.All_Arguments ARG',
'                where ARG.TYPE_NAME = ARG.PACKAGE_NAME',
'                and ARG.TYPE_OWNER = ARG.OWNER',
'                and ARG.PACKAGE_NAME = SYN.TABLE_NAME',
'                and ARG.OWNER = SYN.TABLE_OWNER',
'				and ARG.ARGUMENT_NAME IS NOT NULL -- unsuported argument type',
'				and ARG.TYPE_OBJECT_TYPE = ''PACKAGE''',
'				and ARG.DATA_TYPE = ''PL/SQL TABLE''',
'            )',
'            and NOT EXISTS ( -- package defines no nested record types for function return values ',
'				select 1',
'				from return_q A',
'				left outer join SYS.All_Types S ',
'					on S.TYPE_NAME = A.ITEM_TYPE and S.OWNER = A.OWNER',
'				where A.PACKAGE_NAME = SYN.TABLE_NAME',
'				and A.OWNER = SYN.TABLE_OWNER',
'				and (A.Nested_Table = ''Y'' or S.TYPE_NAME IS NOT NULL)',
'            )',
'            and exists ( -- package has procedures',
'                select 1 ',
'                from SYS.ALL_PROCEDURES PRO',
'                where PRO.OWNER = SYN.TABLE_OWNER',
'                and PRO.OBJECT_NAME = SYN.TABLE_NAME',
'                and PRO.OBJECT_TYPE = ''PACKAGE''',
'                and PRO.PROCEDURE_NAME IS NOT NULL',
'            )',
'            and not exists ( -- package is not wrapped',
'                SELECT 1 ',
'                FROM SYS.All_Source SRC ',
'                WHERE SRC.OWNER = SYN.TABLE_OWNER',
'                and Name = SYN.TABLE_NAME',
'                and type = ''PACKAGE''',
'                and REGEXP_INSTR(SRC.text, ''\s+wrapped\s+'', 1, 1, 0, ''i'') > 0',
'                and line = 1',
'            )',
'            and SYN.SYNONYM_NAME NOT IN (',
'            	''API_TRACE'',',
'            	''APEX_DEBUG'', -- because package_tracer is dependent on this synonyms',
'                ''DBMS_DIMENSION'', -- PLS-00307: Zu viele Deklarationen von ''VALIDATE_DIMENSION'' entsprechen diesem Aufruf',
'                ''DBMS_SODA_USER_ADMIN'', -- PLS-00201',
'                ''APEX_APPLICATION'',	-- because the global variables will not be set',
'                ''APEX_PLUGIN'', 		-- package defines new record types for function arguments',
'                ''APEX_INSTANCE_ADMIN'',',
'                ''APEX_INSTANCE_REST_ADMIN''',
'            )',
'            order by SYN.SYNONYM_NAME',
'        ) loop ',
'            pipe row (cur);',
'        end loop;',
'        return;',
'    end get_Packages_List;',
'    ',
'    FUNCTION get_Packages_Control_List (',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')',
'    )',
'    RETURN tab_Packages_Control PIPELINED',
'    IS ',
'    begin   ',
'        for cur in (',
'            WITH DEPS AS (',
'                SELECT Syn.SYNONYM_NAME, Syn.PACKAGE_OWNER, Syn.PACKAGE_NAME,',
'                    LISTAGG(DEP.GRANT_STAT, ''; '') WITHIN GROUP (ORDER BY GRANT_STAT) GRANT_STATS,',
'                    LISTAGG(DEP.REVOKE_STAT, ''; '') WITHIN GROUP (ORDER BY REVOKE_STAT) REVOKE_STATS,',
'                    LISTAGG(DEP.SYNONYM_STAT, ''; '') WITHIN GROUP (ORDER BY SYNONYM_STAT) SYNONYM_STATS',
'                FROM table(get_Packages_List) SYN',
'                LEFT OUTER JOIN (',
'                    SELECT DA.Owner Object_Owner, DA.Name Object_Name,',
'                        case when PRI.Privilege IS NULL and DA.referenced_Owner != ''PUBLIC'' then ',
'                            ''GRANT '' || case when OBJ.OBJECT_TYPE IN (''TABLE'', ''VIEW'') then ''SELECT'' else ''EXECUTE'' end ',
'                            || '' ON '' || DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                            || '' TO '' || p_Dest_Schema  ',
'                        end GRANT_STAT,',
'                        case when PRI.Privilege IS NOT NULL and PRI.Grantee = p_Dest_Schema then ',
'                            ''REVOKE '' || PRI.Privilege',
'                            || '' ON '' || DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                            || '' FROM '' || p_Dest_Schema ',
'                        end REVOKE_STAT,',
'                        case when SYN.OWNER IS NULL AND DB.REFERENCED_OWNER IS NULL then ',
'                            ''CREATE OR REPLACE SYNONYM '' || p_Dest_Schema || ''.'' || DA.referenced_Name',
'                            || '' FOR '' || DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                        end SYNONYM_STAT,',
'                        PRI.Grantable,',
'                        PRI.Privilege,',
'                        SYN.OWNER SYNONYM_OWNER',
'                    FROM SYS.ALL_DEPENDENCIES DA',
'                    LEFT OUTER JOIN SYS.ALL_SYNONYMS SYN ',
'                        ON SYN.OWNER IN (p_Dest_Schema, ''PUBLIC'')',
'                        AND Syn.Synonym_Name = DA.referenced_Name',
'                    LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI ',
'                        ON Pri.table_Schema = DA.referenced_Owner ',
'                        AND Pri.table_Name = DA.referenced_Name',
'                        AND Pri.type = DA.referenced_Type',
'                        AND PRI.Grantee IN (p_Dest_Schema, ''PUBLIC'')',
'                        AND PRI.privilege IN (''EXECUTE'', ''SELECT'')',
'                    LEFT OUTER JOIN ( -- no VIEW OR SYNONYM with this name already exists',
'                        SELECT DB.REFERENCED_NAME, DB.REFERENCED_OWNER',
'                        FROM SYS.ALL_DEPENDENCIES DB ',
'                        WHERE DB.OWNER = p_Dest_Schema',
'                        AND DB.NAME = DB.REFERENCED_NAME',
'                    ) DB ON DB.REFERENCED_NAME = DA.REFERENCED_NAME and DB.REFERENCED_OWNER = DA.OWNER',
'                    LEFT OUTER JOIN SYS.ALL_OBJECTS OBJ ON OBJ.OWNER = DA.OWNER and OBJ.OBJECT_NAME = DA.REFERENCED_NAME',
'                    WHERE (SYN.OWNER IS NULL or Pri.Privilege IS NULL)',
'                    AND NOT(DA.referenced_Owner = ''SYS'' AND DA.referenced_Name = ''STANDARD'')',
'                ) DEP ON DEP.Object_Owner = SYN.PACKAGE_OWNER AND DEP.Object_Name = SYN.PACKAGE_NAME',
'                GROUP BY Syn.SYNONYM_NAME, Syn.PACKAGE_OWNER, Syn.PACKAGE_NAME',
'            )',
'            SELECT SYNONYM_NAME, PACKAGE_OWNER, PACKAGE_NAME,',
'                APEX_ITEM.HIDDEN (p_idx => 1, p_value => SYNONYM_NAME, p_item_id => ''f01_''||ROWNUM, p_item_label => ''ROW_SELECTOR$'') ||',
'                APEX_ITEM.SWITCH (p_idx => 2, ',
'                  p_value => IS_ENABLED, ',
'                  p_item_id => ''f02_''||ROWNUM, p_item_label => ''SWITCH_ENABLED'') ',
'                || APEX_ITEM.HIDDEN (p_idx => 3, p_value => IS_ENABLED, p_item_id => ''f03_'' || ROWNUM , p_item_label => ''IS_ENABLED'') IS_ENABLED_SWITCH,',
'                IS_ENABLED,',
'                GRANT_STATS,',
'                REVOKE_STATS, ',
'                SYNONYM_STATS,',
'                ERROR_COUNT',
'            FROM ( ',
'                SELECT D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME,',
'                    CASE WHEN EXISTS (',
'                        SELECT 1 ',
'                        FROM SYS.USER_OBJECTS OBJ',
'                        WHERE OBJ.OBJECT_NAME = D.SYNONYM_NAME',
'                        AND OBJECT_TYPE = ''PACKAGE''',
'                    ) THEN ''Y'' ELSE ''N'' END IS_ENABLED,',
'                    case when GRANT_STATS is not null then GRANT_STATS||'';'' end GRANT_STATS,',
'                    case when REVOKE_STATS is not null then REVOKE_STATS||'';'' end REVOKE_STATS,',
'                    case when SYNONYM_STATS is not null then SYNONYM_STATS||'';'' end SYNONYM_STATS,',
'                    (SELECT COUNT(*) ',
'                     FROM SYS.USER_ERRORS ERR',
'                     WHERE ERR.NAME = D.SYNONYM_NAME',
'                     AND ERR.TYPE LIKE ''PACKAGE%''',
'                    ) ERROR_COUNT',
'                FROM DEPS D',
'                UNION ALL -- enabled local synonym packages',
'                SELECT D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME, ''Y'' IS_ENABLED,',
'                    NULL GRANT_STATS, ',
'                    NULL REVOKE_STATS, ',
'                    ''CREATE OR REPLACE '' || SYNONYM_STATS || '';'' SYNONYM_STATS,',
'                    (SELECT COUNT(*) ',
'                     FROM SYS.USER_ERRORS ERR',
'                     WHERE ERR.NAME = D.SYNONYM_NAME',
'                     AND ERR.TYPE LIKE ''PACKAGE%''',
'                    ) ERROR_COUNT',
'                FROM (',
'                    SELECT DEP.NAME SYNONYM_NAME, ',
'                            DEP.REFERENCED_NAME PACKAGE_NAME,',
'                            DEP.REFERENCED_OWNER PACKAGE_OWNER,',
'                            package_tracer.Get_Package_Synonym_Text(DEP.REFERENCED_NAME) SYNONYM_STATS',
'                    FROM SYS.USER_DEPENDENCIES DEP',
'                    where DEP.TYPE = ''PACKAGE BODY''',
'                    and DEP.REFERENCED_TYPE = ''PACKAGE''',
'                    and DEP.REFERENCED_NAME = DEP.NAME',
'                    and DEP.REFERENCED_OWNER != p_Dest_Schema',
'                ) D',
'                WHERE SYNONYM_STATS IS NOT NULL',
'                AND INSTR(SYNONYM_STATS,''PUBLIC'') != 1',
'',
'          ) MAIN',
'            order by 1',
'        ) loop ',
'            pipe row (cur);',
'        end loop;',
'        return;',
'    end get_Packages_Control_List;',
'',
'    FUNCTION get_APEX_Control_List ',
'    RETURN tab_Packages_Control PIPELINED',
'    IS ',
'    	v_Dest_Schema CONSTANT VARCHAR2(128) := SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'');',
'    begin   ',
'        for cur in (',
'            WITH DEPS AS (',
'                SELECT Syn.SYNONYM_NAME, Syn.PACKAGE_OWNER, Syn.PACKAGE_NAME,',
'                    LISTAGG(DEP.GRANT_STAT, ''; '') WITHIN GROUP (ORDER BY GRANT_STAT) GRANT_STATS,',
'                    LISTAGG(DEP.REVOKE_STAT, ''; '') WITHIN GROUP (ORDER BY REVOKE_STAT) REVOKE_STATS,',
'                    LISTAGG(DEP.SYNONYM_STAT, ''; '') WITHIN GROUP (ORDER BY SYNONYM_STAT) SYNONYM_STATS',
'                FROM table(get_APEX_Packages_List) SYN',
'                LEFT OUTER JOIN (',
'                    SELECT DA.Owner Object_Owner, DA.Name Object_Name,',
'                        case when PRI.Privilege IS NULL and DA.referenced_Owner != ''PUBLIC'' then ',
'                            ''GRANT '' || case when OBJ.OBJECT_TYPE IN (''TABLE'', ''VIEW'') then ''SELECT'' else ''EXECUTE'' end ',
'                            || '' ON '' || DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                            || '' TO '' || v_Dest_Schema',
'                        end GRANT_STAT,',
'                        case when PRI.Privilege IS NOT NULL and PRI.Grantee = v_Dest_Schema then',
'                            ''REVOKE '' || PRI.Privilege',
'                            || '' ON ''|| DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                            || '' FROM '' || v_Dest_Schema ',
'                        end REVOKE_STAT,',
'                        case when Syn.Owner IS NULL AND DB.REFERENCED_OWNER IS NULL then ',
'                            ''CREATE OR REPLACE SYNONYM '' || v_Dest_Schema || ''.'' || DA.referenced_Name',
'                            || '' FOR '' || DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                        end SYNONYM_STAT,',
'                        PRI.Grantable,',
'                        PRI.Privilege,',
'                        SYN.OWNER SYNONYM_OWNER',
'                    FROM SYS.ALL_DEPENDENCIES DA',
'                    LEFT OUTER JOIN SYS.ALL_SYNONYMS SYN ',
'                        ON SYN.OWNER IN (v_Dest_Schema, ''PUBLIC'')',
'                        AND Syn.Synonym_Name = DA.referenced_Name',
'                    LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI ',
'                        ON Pri.table_Schema = DA.referenced_Owner ',
'                        AND Pri.table_Name = DA.referenced_Name',
'                        AND Pri.type = DA.referenced_Type',
'                        AND PRI.Grantee IN (v_Dest_Schema, ''PUBLIC'')',
'                        AND PRI.privilege IN (''EXECUTE'', ''SELECT'')',
'                    LEFT OUTER JOIN ( -- no VIEW OR SYNONYM with this name already exists',
'                        SELECT DB.REFERENCED_NAME, DB.REFERENCED_OWNER',
'                        FROM SYS.ALL_DEPENDENCIES DB',
'                        WHERE DB.OWNER = v_Dest_Schema',
'                        AND DB.NAME = DB.REFERENCED_NAME',
'                    ) DB ON DB.REFERENCED_NAME = DA.REFERENCED_NAME and DB.REFERENCED_OWNER = DA.OWNER',
'                    LEFT OUTER JOIN SYS.ALL_OBJECTS OBJ ON OBJ.OWNER = DA.OWNER and OBJ.OBJECT_NAME = DA.REFERENCED_NAME',
'                    WHERE (SYN.OWNER IS NULL OR PRI.PRIVILEGE IS NULL)',
'                    AND NOT(DA.REFERENCED_OWNER = ''SYS'' AND DA.REFERENCED_NAME = ''STANDARD'')',
'                ) DEP ON DEP.Object_Owner = SYN.PACKAGE_OWNER AND DEP.Object_Name = SYN.PACKAGE_NAME',
'                GROUP BY SYN.SYNONYM_NAME, SYN.PACKAGE_OWNER, SYN.PACKAGE_NAME',
'            )',
'            SELECT SYNONYM_NAME, PACKAGE_OWNER, PACKAGE_NAME,',
'                APEX_ITEM.HIDDEN (p_idx => 1, p_value => SYNONYM_NAME, p_item_id => ''f01_''||ROWNUM, p_item_label => ''ROW_SELECTOR$'') ||',
'                APEX_ITEM.SWITCH (p_idx => 2, ',
'                  p_value => IS_ENABLED, ',
'                  p_item_id => ''f02_''||ROWNUM, p_item_label => ''SWITCH_ENABLED'') ',
'                || APEX_ITEM.HIDDEN (p_idx => 3, p_value => IS_ENABLED, p_item_id => ''f03_'' || ROWNUM , p_item_label => ''IS_ENABLED'') IS_ENABLED_SWITCH,',
'                IS_ENABLED,',
'                GRANT_STATS,',
'                REVOKE_STATS,',
'                SYNONYM_STATS,',
'                ERROR_COUNT',
'            FROM ( ',
'                SELECT D.SYNONYM_NAME, D.PACKAGE_OWNER, D.PACKAGE_NAME,',
'                    CASE WHEN EXISTS (',
'                        SELECT 1 ',
'                        FROM SYS.USER_OBJECTS OBJ',
'                        WHERE OBJ.OBJECT_NAME = D.SYNONYM_NAME',
'                        AND OBJECT_TYPE = ''PACKAGE''',
'                    ) THEN ''Y'' ELSE ''N'' END IS_ENABLED,',
'                    case when GRANT_STATS is not null then GRANT_STATS||'';'' end GRANT_STATS,',
'                    case when REVOKE_STATS is not null then REVOKE_STATS||'';'' end REVOKE_STATS,',
'                    case when SYNONYM_STATS is not null then SYNONYM_STATS||'';'' end SYNONYM_STATS,',
'                    (SELECT COUNT(*) ',
'                     FROM SYS.USER_ERRORS ERR',
'                     WHERE ERR.NAME = D.SYNONYM_NAME',
'                     AND ERR.TYPE LIKE ''PACKAGE%''',
'                    ) ERROR_COUNT',
'                FROM DEPS D',
'            ) MAIN',
'            order by 1',
'        ) loop ',
'            pipe row (cur);',
'        end loop;',
'        return;',
'    end get_APEX_Control_List;',
'',
'    FUNCTION get_publish_schema (',
'        p_Target_Schema IN VARCHAR2 ',
'    )',
'    RETURN tab_publish_schema PIPELINED',
'    IS',
'    BEGIN',
'        for cur in (',
'            WITH PA AS (',
'                SELECT p_Target_Schema GRANTEE,',
'                    SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'') OWNER',
'                FRO'))
);
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(261939746109436819)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'M DUAL ',
'            ),',
'            PKEY_Q AS ( ',
'                SELECT ',
'                    C.TABLE_NAME, C.OWNER TABLE_OWNER, ',
'                    '', CONSTRAINT '' || Enquote_Name(C.CONSTRAINT_NAME) || '' PRIMARY KEY (''',
'                    || LISTAGG(Enquote_Name(C.COLUMN_NAME), '','') WITHIN GROUP (ORDER BY C.POSITION) ',
'                    || '') RELY DISABLE'' PKEY_CONS',
'                FROM SYS.USER_CONSTRAINTS B',
'                JOIN SYS.USER_CONS_COLUMNS C ON C.TABLE_NAME = B.TABLE_NAME AND C.CONSTRAINT_NAME = B.CONSTRAINT_NAME AND C.OWNER = B.OWNER',
'                WHERE B.CONSTRAINT_TYPE = ''P''',
'                AND B.OWNER = SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')',
'                AND B.TABLE_NAME NOT LIKE ''DR$%$_''  -- skip fulltext index',
'                AND B.TABLE_NAME NOT LIKE ''BIN$%''  -- this table is in the recyclebin',
'                GROUP BY C.TABLE_NAME, C.OWNER, C.CONSTRAINT_NAME',
'            ),',
'            COLS_Q AS (',
'                SELECT TABLE_NAME, LISTAGG(Enquote_Name(COLUMN_NAME), '', '') WITHIN GROUP (ORDER BY COLUMN_ID) TAB_COLUMNS',
'                FROM SYS.USER_TAB_COLUMNS',
'                GROUP BY TABLE_NAME',
'            ),',
'            STATS_Q AS (',
'                -- views',
'                -------------------------',
'                SELECT ''GRANT '' || PRIVS || '' ON '' || S.OWNER || ''.'' || S.TABLE_NAME || '' TO '' || PA.GRANTEE GRANT_STAT,',
'                    ''CREATE OR REPLACE VIEW '' || PA.GRANTEE || ''.'' || S.TABLE_NAME ',
'                    || '' ('' || S.TAB_COLUMNS || S.PKEY_CONS || '')''',
'                    || '' AS SELECT * FROM '' || S.OWNER || ''.'' || S.TABLE_NAME CREATE_STAT,',
'                    ''REVOKE '' || PRIVS || '' ON '' || S.OWNER || ''.'' || S.TABLE_NAME || '' FROM '' || PA.GRANTEE REVOKE_STAT, ',
'                    ''DROP VIEW '' || PA.GRANTEE || ''.'' || S.TABLE_NAME DROP_STAT,',
'                    S.OWNER, S.TABLE_NAME OBJECT_NAME, ',
'                    ''VIEW'' OBJECT_TYPE, ',
'                    ''VIEW'' DEST_OBJECT_TYPE,',
'                    FOREIGN_DEPS_CNT',
'                FROM (',
'                    SELECT CASE WHEN D.FOREIGN_DEPS_CNT > 0 THEN NVL(D.PRIVILEGE, ''READ'')',
'                    	ELSE ',
'                    		''SELECT'' ||',
'							CASE WHEN TR.PRIVS IS NOT NULL THEN '', '' || TR.PRIVS',
'								ELSE',
'									CASE WHEN UPDATABLE > 0     THEN '', UPDATE'' END',
'									|| CASE WHEN INSERTABLE > 0 THEN '', INSERT'' END',
'									|| CASE WHEN DELETABLE > 0  THEN '', DELETE'' END ',
'							END',
'                        END PRIVS,',
'                        T.TABLE_NAME, T.OWNER, ',
'                        NVL(D.NOT_GRANTABLE,0) FOREIGN_DEPS_CNT,',
'                        P.PKEY_CONS, C.TAB_COLUMNS',
'                    FROM (',
'                        SELECT T.TABLE_NAME, T.OWNER,',
'                            SUM(CASE WHEN UPDATABLE = ''YES'' THEN 1 ELSE 0 END) UPDATABLE,',
'                            SUM(CASE WHEN INSERTABLE = ''YES'' THEN 1 ELSE 0 END) INSERTABLE,',
'                            SUM(CASE WHEN DELETABLE = ''YES'' THEN 1 ELSE 0 END) DELETABLE',
'                        FROM SYS.USER_UPDATABLE_COLUMNS T',
'                        WHERE EXISTS (',
'                            SELECT ''X''',
'                            FROM USER_VIEWS V WHERE V.VIEW_NAME = T.TABLE_NAME',
'                        )',
'                        GROUP BY TABLE_NAME, OWNER',
'                    ) T LEFT OUTER JOIN (',
'                    -- when a view is accessing other foreign view, then is view has READ-only access',
'                        SELECT NAME, COUNT(*) FOREIGN_DEPS_CNT,',
'                        	LISTAGG(CASE WHEN GRANTABLE = ''YES'' THEN PRIVILEGE END, '', '') WITHIN GROUP (ORDER BY PRIVILEGE) PRIVILEGE,',
'                        	COUNT(CASE WHEN GRANTABLE = ''NO'' THEN 1 END) NOT_GRANTABLE',
'                        FROM (',
'                            SELECT DISTINCT D.NAME, PRI.PRIVILEGE, NVL(PRI.GRANTABLE, ''NO'') GRANTABLE',
'                            FROM SYS.USER_DEPENDENCIES D',
'                            LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI ',
'                                ON PRI.table_Schema = D.REFERENCED_OWNER ',
'                                AND PRI.table_Name = D.REFERENCED_NAME',
'                                AND PRI.grantee IN (''PUBLIC'', SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''))',
'                            WHERE D.TYPE = ''VIEW''',
'                            AND D.REFERENCED_TYPE IN (''VIEW'', ''TABLE'', ''SYNONYM'')',
'                            AND D.REFERENCED_OWNER NOT IN (''PUBLIC'', SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''))',
'                        )',
'                        GROUP BY NAME',
'                    ) D ON T.TABLE_NAME = D.NAME',
'                    LEFT OUTER JOIN (',
'                        -- updatable views with INSTEAD OF trigger',
'                        SELECT REGEXP_REPLACE(',
'                            LISTAGG(TRIGGERING_EVENT, '', '') WITHIN GROUP (ORDER BY TRIGGERING_EVENT), ',
'                            ''\sOR\s'', '', '') PRIVS,',
'                            T.TABLE_NAME',
'                        FROM SYS.USER_TRIGGERS T',
'                        WHERE TRIGGER_TYPE = ''INSTEAD OF''',
'                        AND BASE_OBJECT_TYPE = ''VIEW''',
'                        GROUP BY TABLE_NAME',
'                    ) TR ON T.TABLE_NAME = TR.TABLE_NAME',
'                    LEFT OUTER JOIN PKEY_Q P ON T.TABLE_NAME = P.TABLE_NAME',
'                    LEFT OUTER JOIN COLS_Q C ON T.TABLE_NAME = C.TABLE_NAME',
'                ) S, PA',
'                WHERE PA.GRANTEE IS NOT NULL',
'                UNION ALL   ',
'                -- normal tables ',
'                ----------------',
'                SELECT ',
'                    ''GRANT '' || PRIVS || '' ON '' ',
'                    || PA.OWNER || ''.'' || TABLE_NAME || '' TO '' || PA.GRANTEE GRANT_STAT,',
'                    ''CREATE OR REPLACE VIEW '' || PA.GRANTEE || ''.'' || T.TABLE_NAME ',
'                    || '' ('' || T.TAB_COLUMNS || T.PKEY_CONS || '')''',
'                    || '' AS SELECT * FROM '' || PA.OWNER || ''.'' || T.TABLE_NAME CREATE_STAT,',
'                    ''REVOKE '' || PRIVS || '' ON '' ',
'                     || PA.OWNER || ''.'' || TABLE_NAME || '' FROM '' || PA.GRANTEE REVOKE_STAT, ',
'                    ''DROP VIEW '' || PA.GRANTEE || ''.'' || T.TABLE_NAME DROP_STAT,',
'                    PA.OWNER, T.TABLE_NAME OBJECT_NAME, ',
'                    ''TABLE'' OBJECT_TYPE, ',
'                    ''VIEW'' DEST_OBJECT_TYPE,',
'                    0 FOREIGN_DEPS_CNT',
'                FROM (',
'                    SELECT T.TABLE_NAME,',
'                        CASE WHEN READ_ONLY = ''NO''',
'                            AND NOT EXISTS (    -- when this table is part of materialized view, then only SELECT allowed ',
'                                SELECT 1',
'                                FROM USER_OBJECTS MV',
'                                WHERE MV.OBJECT_NAME = T.TABLE_NAME',
'                                AND MV.OBJECT_TYPE = ''MATERIALIZED VIEW''',
'                            ) THEN ''SELECT, UPDATE, INSERT, DELETE '' ',
'                            ELSE ''SELECT '' ',
'                        END PRIVS,',
'                        P.PKEY_CONS, C.TAB_COLUMNS',
'                    FROM SYS.USER_TABLES T',
'                    LEFT OUTER JOIN PKEY_Q P ON T.TABLE_NAME = P.TABLE_NAME',
'                    LEFT OUTER JOIN COLS_Q C ON T.TABLE_NAME = C.TABLE_NAME',
'                    WHERE T.IOT_NAME IS NULL    -- skip overflow tables of index organized tables',
'                    AND T.TABLE_NAME NOT LIKE ''DR$%$_''  -- skip fulltext index',
'                ) T, PA',
'                WHERE PA.GRANTEE IS NOT NULL',
'                AND NOT EXISTS (    -- this table is not part of materialized view log ',
'                    SELECT --+ NO_UNNEST',
'                        1',
'                    FROM SYS.ALL_MVIEW_LOGS MV',
'                    WHERE MV.LOG_TABLE = T.TABLE_NAME',
'                    AND MV.LOG_OWNER = PA.OWNER',
'                )',
'                UNION ALL  ',
'                -- Function, Procedure, Package, Type',
'                -------------------------------',
'                SELECT ''GRANT EXECUTE ON '' || PA.OWNER || ''.'' || T.OBJECT_NAME || '' TO '' || PA.GRANTEE GRANT_STAT,',
'                    ''CREATE OR REPLACE SYNONYM ''  || PA.GRANTEE || ''.'' || OBJECT_NAME ',
'                    || '' FOR '' || PA.OWNER || ''.'' || OBJECT_NAME CREATE_STAT,',
'                    ''REVOKE EXECUTE ON '' || PA.OWNER || ''.'' || T.OBJECT_NAME || '' FROM '' || PA.GRANTEE REVOKE_STAT, ',
'                    ''DROP SYNONYM ''  || PA.GRANTEE || ''.'' || OBJECT_NAME DROP_STAT,',
'                    PA.OWNER, T.OBJECT_NAME, ',
'                    T.OBJECT_TYPE, ',
'                    ''SYNONYM'' DEST_OBJECT_TYPE,',
'                    0 FOREIGN_DEPS_CNT',
'                FROM SYS.USER_OBJECTS T, PA',
'                WHERE PA.GRANTEE IS NOT NULL',
'                AND T.OBJECT_TYPE IN (''FUNCTION'',''PROCEDURE'',''PACKAGE'',''TYPE'')',
'                UNION ALL -- Sequences',
'                SELECT ''GRANT SELECT ON '' || PA.OWNER || ''.'' || T.SEQUENCE_NAME || '' TO '' || PA.GRANTEE GRANT_STAT,',
'                    ''CREATE OR REPLACE SYNONYM ''  || PA.GRANTEE || ''.'' || SEQUENCE_NAME ',
'                    || '' FOR '' || PA.OWNER || ''.'' || SEQUENCE_NAME CREATE_STAT,',
'                    ''REVOKE SELECT ON '' || PA.OWNER || ''.'' || T.SEQUENCE_NAME || '' FROM '' || PA.GRANTEE REVOKE_STAT, ',
'                    ''DROP SYNONYM ''  || PA.GRANTEE || ''.'' || SEQUENCE_NAME DROP_STAT,',
'                    PA.OWNER, T.SEQUENCE_NAME OBJECT_NAME, ',
'                    ''SEQUENCE'' OBJECT_TYPE, ',
'                    ''SYNONYM'' DEST_OBJECT_TYPE,',
'                    0 FOREIGN_DEPS_CNT',
'                FROM SYS.USER_SEQUENCES T, PA',
'                WHERE PA.GRANTEE IS NOT NULL',
'            ), MAIN_Q AS (',
'                SELECT S.OWNER, S.OBJECT_NAME, S.OBJECT_TYPE, S.DEST_OBJECT_TYPE,',
'                    S.FOREIGN_DEPS_CNT, ',
'                    case when EXISTS (',
'                            SELECT 1 ',
'                            FROM SYS.ALL_DEPENDENCIES D',
'                            WHERE D.OWNER = p_Target_Schema',
'                            AND D.NAME = S.OBJECT_NAME',
'                            and D.REFERENCED_OWNER= S.OWNER',
'                            and D.REFERENCED_NAME = S.OBJECT_NAME',
'                            AND D.REFERENCED_TYPE = S.OBJECT_TYPE',
'                        ) or EXISTS (',
'                            SELECT 1 ',
'                            FROM SYS.ALL_OBJECTS OBJ ',
'							WHERE OBJ.OWNER = p_Target_Schema',
'							AND OBJ.OBJECT_NAME = S.OBJECT_NAME',
'							AND OBJ.OBJECT_TYPE = S.DEST_OBJECT_TYPE',
'                        ) then ''Y'' else ''N''',
'                    end DEST_OBJECT_EXISTS,',
'                    case when EXISTS (',
'                            SELECT 1 ',
'                            FROM SYS.ALL_SYNONYMS SYN',
'                            WHERE SYN.SYNONYM_NAME = S.OBJECT_NAME',
'                            AND SYN.OWNER = ''PUBLIC''',
'                        ) then ''Y'' else ''N''',
'                    end CONFLICTING_OBJECT_EXISTS,',
'                    p_Target_Schema DEST_SCHEMA,',
'                    S.GRANT_STAT, S.CREATE_STAT, S.REVOKE_STAT, S.DROP_STAT',
'                FROM STATS_Q S',
'            )',
'            SELECT S.OWNER, S.OBJECT_NAME, S.OBJECT_TYPE, S.DEST_OBJECT_TYPE, S.FOREIGN_DEPS_CNT, ',
'                S.DEST_OBJECT_EXISTS, S.CONFLICTING_OBJECT_EXISTS, S.DEST_SCHEMA, ',
'                S.GRANT_STAT, S.CREATE_STAT, S.REVOKE_STAT, S.DROP_STAT,',
'                case when CONFLICTING_OBJECT_EXISTS = ''N'' then ',
'                    APEX_ITEM.HIDDEN (p_idx => 1, p_value => OBJECT_NAME, p_item_id => ''f01_''||ROWNUM, p_item_label => ''ROW_SELECTOR$'')',
'                    || APEX_ITEM.SWITCH (p_idx => 2,  p_value => DEST_OBJECT_EXISTS, p_item_id => ''f02_''||ROWNUM, p_item_label => ''SWITCH_ENABLED'') ',
'                    || APEX_ITEM.HIDDEN (p_idx => 3, p_value => DEST_OBJECT_EXISTS, p_item_id => ''f03_'' || ROWNUM) ',
'                    || APEX_ITEM.HIDDEN (p_idx => 4, p_value => GRANT_STAT, p_item_id => ''f04_'' || ROWNUM) ',
'                    || APEX_ITEM.HIDDEN (p_idx => 5, p_value => CREATE_STAT, p_item_id => ''f05_'' || ROWNUM) ',
'                    || APEX_ITEM.HIDDEN (p_idx => 6, p_value => REVOKE_STAT, p_item_id => ''f06_'' || ROWNUM) ',
'                    || APEX_ITEM.HIDDEN (p_idx => 7, p_value => DROP_STAT, p_item_id => ''f07_'' || ROWNUM) ',
'                    || APEX_ITEM.HIDDEN (p_idx => 8, p_value => FOREIGN_DEPS_CNT, p_item_id => ''f08_'' || ROWNUM) ',
'                end IS_ENABLED_SWITCH',
'            FROM MAIN_Q S',
'        ) loop ',
'            pipe row (cur);',
'        end loop;',
'        return;',
'    END get_publish_schema;',
'',
'    PROCEDURE Copy_View (',
'        p_View_Name IN VARCHAR2,',
'        p_Dest_Schema IN VARCHAR2 ',
'    )',
'    is  ',
'        v_sql_text CLOB;',
'    begin',
'        for c in (',
'            SELECT TEXT,',
'                (SELECT LISTAGG( Enquote_Name(COLUMN_NAME), '', '') WITHIN GROUP (ORDER BY COLUMN_ID) COLS ',
'                FROM SYS.USER_TAB_COLS C',
'                WHERE C.TABLE_NAME = A.VIEW_NAME',
'                GROUP BY C.TABLE_NAME) COLS',
'            FROM SYS.USER_VIEWS A WHERE VIEW_NAME = p_View_Name',
'        ) loop',
'            v_sql_text := ''CREATE OR REPLACE VIEW '' ',
'            || Enquote_Name(p_Dest_Schema) || ''.'' || Enquote_Name(p_View_Name) ',
'            || '' ( '' || c.COLS || '' ) ''',
'            || chr(10) || ''AS '' ||  c.text;',
'            EXECUTE IMMEDIATE v_sql_text;',
'        end loop;',
'    end Copy_View;',
'',
'    PROCEDURE Log_Elapsed_Time (',
'        p_Timemark IN OUT NUMBER,',
'        p_Message IN VARCHAR2)',
'    is',
'        v_Timemark number := dbms_utility.get_time;',
'        v_TimeString VARCHAR2(40) := TO_CHAR((v_Timemark - p_Timemark)/100.0, ''9G990D00'');',
'    begin',
'        p_Timemark := v_Timemark;',
'        if apex_application.g_debug then',
'            APEX_DEBUG.Message(''%s %s'', p_Message, v_TimeString);',
'        else ',
'            DBMS_OUTPUT.PUT_LINE (p_Message||chr(9)||v_TimeString);',
'        end if;',
'    end Log_Elapsed_Time;',
'',
'    FUNCTION Is_Printable_Type (',
'        p_PLS_Type IN VARCHAR2',
'    ) RETURN VARCHAR2 DETERMINISTIC ',
'    IS ',
'        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN',
'            PRAGMA UDF;',
'        $END',
'    BEGIN ',
'        RETURN case when p_PLS_Type IN (''BINARY_DOUBLE'', ''BINARY_FLOAT'', ''BINARY_INTEGER'', ''BLOB'', ''BOOLEAN'',',
'                ''CHAR'', ''CLOB'', ''DATE'', ''DOUBLE PRECISION'', ''FLOAT'', ''INTEGER'', ''NUMBER'', ''PLS_INTEGER'', ''RAW'', ''REAL'', ',
'                ''ROWID'', ''SMALLINT'', ''TIME'', ''TIME WITH TIME ZONE'', ''TIMESTAMP'', ''TIMESTAMP WITH LOCAL TIME ZONE'', ',
'                ''TIMESTAMP WITH TIME ZONE'', ''UROWID'', ''VARCHAR2'') then ''YES'' else ''NO'' end;',
'    END Is_Printable_Type;',
'',
'    /* build an expression that captures the parameters of an package procedure for logging.',
'       execute with output: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call(NULL) USING OUT v_log_message, IN <param...>',
'       execute with apex_debug: EXECUTE IMMEDIATE api_trace.Dyn_Log_Call USING <param...>',
'       the count of the arguments will be checked at runtime.',
'    */',
'    FUNCTION Format_Call_Parameter(',
'        p_Object_Name IN VARCHAR2,',
'        p_Object_Owner IN VARCHAR2,',
'        p_Procedure_Name IN VARCHAR2,',
'        p_Subprogram_ID IN NUMBER,',
'        p_calling_subprog VARCHAR2,',
'        p_synonym_name VARCHAR2 DEFAULT NULL,',
'        p_value_max_length INTEGER DEFAULT 1000,',
'        p_bind_char VARCHAR2 DEFAULT '':'',',
'        p_overload INTEGER DEFAULT 0,',
'        p_in_out VARCHAR2 DEFAULT ''IN/OUT'' -- IN, OUT, IN/OUT',
'    ) RETURN VARCHAR2',
'    IS',
'        $IF DBMS_DB_VERSION.VERSION >= 12 $THEN',
'            PRAGMA UDF;',
'        $END',
'        c_newline VARCHAR2(10) := ''chr(10)''||chr(10);',
'        v_argument_per_line CONSTANT NUMBER := 7;',
'        c_conop VARCHAR2(10) := '' || '';',
'        v_argument_name VARCHAR2(200);',
'        v_offset NUMBER;',
'        v_result_str VARCHAR2(32767);',
'        v_subprog VARCHAR2(32767);',
'        v_count   INTEGER := 0;',
'   BEGIN ',
'        for c_cur in (',
'           SELECT PACKAGE_NAME, OWNER, OBJECT_NAME PROCEDURE_NAME, SUBPROGRAM_ID,',
'                    IN_OUT, ARGUMENT_NAME, POSITION, PLS_TYPE, DATA_TYPE',
'            FROM SYS.ALL_ARGUMENTS  ',
'            WHERE OWNER = p_Object_Owner',
'            AND PACKAGE_NAME = p_Object_Name',
'            AND OBJECT_NAME = p_Procedure_Name',
'            AND SUBPROGRAM_ID = p_Subprogram_ID',
'            AND DATA_LEVEL = 0 ',
'            AND POSITION > 0 -- Position 0 returns the values for the return type of a function. ',
'            AND ARGUMENT_NAME IS NOT NULL',
'            ORDER BY POSITION',
'        ) ',
'        loop ',
'            exit when length(v_result_str) > 32000; ',
'            if (c_cur.IN_OUT != ''IN'' or p_in_out IN (''IN'', ''IN/OUT'')) then',
'                v_count := v_count + 1;',
'                v_offset := INSTR(c_cur.ARGUMENT_NAME, ''_'');',
'                if v_offset > 0 then ',
'                    v_argument_name := lower(substr(c_cur.ARGUMENT_NAME, 1, v_offset)) || initcap(substr(c_cur.ARGUMENT_NAME, v_offset+1));',
'                else ',
'                    v_argument_name := lower(c_cur.ARGUMENT_NAME);',
'                end if;',
'                if v_result_str IS NOT NULL then ',
'                    v_result_str := v_result_str ',
'                    || case when mod(c_cur.POSITION-1, v_argument_per_line) = 0 then c_conop || c_newline else chr(10) end',
'                    || ''    '' || c_conop;',
'                end if;',
'                if c_cur.IN_OUT != ''IN'' and p_in_out = ''IN'' then -- OUT parameters are not converted to a literal.',
'                    v_result_str := v_result_str ',
'                    || Enquote_Literal(case when v_count > 1 then '', '' end',
'                        || v_argument_name || ''=>'' || v_argument_name);',
'                else ',
'                    v_result_str := v_result_str ',
'                    || Enquote_Literal(case when v_count > 1 then '', '' end',
'                        || v_argument_name || ''=>'') ',
'                    || c_conop',
'                    || case when Is_Printable_Type(c_cur.PLS_TYPE) = ''YES''',
'                        then ',
'                            ''api_trace.''',
'                            || case when c_cur.ARGUMENT_NAME in (''P_PASSWORD'', ''P_PASS'', ''P_WALLET_PWD'', ''P_WEB_PASSWORD'', ''P_OLD_PASSWORD'', ''P_NEW_PASSWORD'')',
'                            	then ''Literal_PWD''',
'                            when c_cur.PLS_TYPE = ''RAW'' ',
'                            	then ''Literal_RAW'' ',
'                            	else ''Literal'' ',
'                            end',
'                            || ''('' || p_bind_char || v_argument_name ',
'                            || case when p_value_max_length != 1000 then '', '' || p_value_max_length end',
'                            || '')''',
'                        else ',
'                            Enquote_Literal(''<datatype ''||NVL(c_cur.PLS_TYPE, c_cur.DATA_TYPE)||''>'')',
'                    end;',
'                end if;',
'            end if;',
'        end loop;',
'        v_subprog := lower(case when p_Synonym_Name IS NOT NULL then p_Synonym_Name else p_calling_subprog end);',
'        if v_result_str IS NOT NULL then ',
'            v_result_str := Enquote_Literal(v_subprog || ''('') || chr(10)',
'            || ''    '' || c_conop || v_result_str || c_conop || Enquote_Literal('')'');',
'        else ',
'            v_result_str := Enquote_Literal(v_subprog);',
'        end if;',
'        RETURN v_result_str;',
'    END Format_Call_Parameter;',
'',
'    PROCEDURE Resolve_Synonym (',
'        p_Synonym_Name IN SYS.ALL_SYNONYMS.SYNONYM_NAME%TYPE,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Dest_Object_Type  IN SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE DEFAULT ''PACKAGE'',',
'        p_Synonym_Owner OUT VARCHAR2,',
'        p_Package_Name OUT VARCHAR2,',
'        p_Package_Owner OUT VARCHAR2,',
'        p_DBLink OUT VARCHAR2,',
'        p_Object_Type_Out OUT SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE,',
'        p_Editionable OUT SYS.ALL_OBJECTS.EDITIONABLE%TYPE',
'    )',
'    IS ',
'        v_Synonym_Name VARCHAR2(128) := UPPER(p_Synonym_Name);',
'        CURSOR all_syn_cur',
'        IS  ',
'            SELECT SYN.TABLE_OWNER, SYN.TABLE_NAME, SYN.DB_LINK, OBJ.OBJECT_TYPE, SYN.OWNER, OBJ.EDITIONABLE',
'            FROM SYS.ALL_SYNONYMS SYN ',
'            JOIN SYS.ALL_OBJECTS OBJ ',
'              ON SYN.TABLE_OWNER = OBJ.OWNER AND SYN.TABLE_NAME = OBJ.OBJECT_NAME',
'            WHERE SYN.OWNER IN (''PUBLIC'', p_Dest_Schema)',
'            AND SYN.SYNONYM_NAME = v_Synonym_Name',
'            AND OBJ.OBJECT_TYPE IN (''SYNONYM'', p_Dest_Object_Type)',
'            ORDER BY CASE WHEN SYN.OWNER = p_Dest_Schema THEN 1 ELSE 2 END;',
'        CURSOR all_obj_cur',
'        IS  ',
'            SELECT OBJ.OWNER, OBJ.OBJECT_NAME, OBJ.OBJECT_TYPE, OBJ.OWNER SYN_OWNER, OBJ.EDITIONABLE',
'            FROM SYS.ALL_OBJECTS OBJ ',
'            WHERE OBJ.OWNER = p_Dest_Schema',
'            AND OBJ.OBJECT_TYPE = p_Dest_Object_Type',
'            AND OBJ.OBJECT_NAME = v_Synonym_Name;',
'    BEGIN',
'        p_Package_Owner := NULL;',
'        p_Package_Name := NULL;',
'        p_DBLink := NULL;',
'        p_Object_Type_Out := NULL;',
'        LOOP ',
'            OPEN all_syn_cur;',
'            FETCH all_syn_cur INTO p_Package_Owner, p_Package_Name, p_DBLink, p_Object_Type_Out, p_Synonym_Owner, p_Editionable;',
'            EXIT WHEN all_syn_cur%NOTFOUND;',
'            EXIT WHEN p_Object_Type_Out = p_Dest_Object_Type;',
'            CLOSE all_syn_cur;',
'            v_Synonym_Name := p_Package_Name;',
'        END LOOP;',
'        if all_syn_cur%ISOPEN then ',
'            CLOSE all_syn_cur;',
'        end if;',
'        if p_Package_Owner IS NULL then ',
'            OPEN all_obj_cur;',
'            FETCH all_obj_cur INTO p_Package_Owner, p_Package_Name, p_Object_Type_Out, p_Synonym_Owner, p_Editionable;',
'            CLOSE all_obj_cur;',
'        end if;',
'    END Resolve_Synonym;',
'',
'    FUNCTION Format_Return_Value (',
'        p_Procedure_Name IN VARCHAR2,',
'        p_PLS_Type IN VARCHAR2,',
'        p_Data_Type IN VARCHAR2 DEFAULT NULL,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result''',
'    ) RETURN VARCHAR2 ',
'    IS ',
'    BEGIN',
'        RETURN Enquote_Literal(p_Procedure_Name || '' returns '') ',
'        || case when Is_Printable_Type(p_PLS_Type) = ''YES'' then ',
'            '' || api_trace.''',
'            || case when p_PLS_Type= ''RAW'' then ''Literal_RAW'' else ''Literal'' end',
'            || ''('' || p_Variable_Name || '')''',
'        when p_Data_Type IN (''TABLE'', ''PL/SQL TABLE'') then ',
'            '' || '' || p_Variable_Name || ''.COUNT || ''',
'            || Enquote_Literal('' rows '') ',
'        end;',
'    END Format_Return_Value;',
'    ',
'    FUNCTION Dyn_Log_Call_List (',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Compact IN VARCHAR2 DEFAULT ''Y'', --Y/N',
'        p_Logging_Start_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,',
'        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,',
'        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result'',',
'        p_Condition_Start IN VARCHAR2 DEFAULT c_APEX_Condition_Start,',
'        p_Condition_End IN VARCHAR2 DEFAULT c_APEX_Condition_End,',
'        p_Condition_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Indent IN NUMBER DEFAULT 8',
'    )',
'    RETURN tab_logging_calls PIPELINED',
'    IS',
'        v_Synonym_Name VARCHAR2(128) := UPPER(p_Package_Name);',
'        v_Synonym_Owner VARCHAR2(128);',
'        v_Package_Name_Out VARCHAR2(128);',
'        v_Package_Owner_Out VARCHAR2(128);',
'        v_DBLink VARCHAR2(128);',
'        v_Object_Type_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;',
'        v_Editionable_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;',
'        v_Condition_Start CONSTANT VARCHAR2(1000) := case when p_Condition_Start IS NOT NULL and p_Condition_Enabled = ''Y'' then chr(10) || rpad('' '', p_Indent) || p_Condition_Start end;',
'        v_Condition_End CONSTANT VARCHAR2(1000) := case when p_Condition_End IS NOT NULL and p_Condition_Enabled = ''Y'' then chr(10) || rpad('' '', p_Indent) || p_Condition_End || chr(10) end;',
'        ',
'        CURSOR all_proc_cur',
'        IS',
'        WITH PARAM_Q AS (',
'            SELECT PACKAGE_NAME, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD,',
'                INITCAP(PACKAGE_NAME) || ''.'' || INITCAP(OBJECT_NAME) CALLING_SUBPROG, ',
'                LISTAGG(LOWER(ARGUMENT_NAME) , '','') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST,',
'                LISTAGG(CASE WHEN IN_OUT IN (''IN/OUT'', ''IN'') THEN LOWER(ARGUMENT_NAME) END, '','') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST_IN,',
'                LISTAGG(CASE WHEN IN_OUT IN (''IN/OUT'', ''OUT'') THEN LOWER(ARGUMENT_NAME) END, '','') WITHIN GROUP (ORDER BY SEQUENCE) PARAM_LIST_OUT,',
'                SUM(CASE WHEN IN_OUT IN (''IN/OUT'', ''OUT'') AND ARGUMENT_NAME IS NOT NULL THEN 1 ELSE 0 END) OUT_COUNT,',
'                MAX(CASE WHEN IN_OUT = ''OUT'' AND ARGUMENT_NAME IS NULL THEN PLS_TYPE END) RETURN_PLS_TYPE,',
'                MAX(CASE WHEN IN_OUT = ''OUT'' AND ARGUMENT_NAME IS NULL THEN DATA_TYPE END) RETURN_DATA_TYPE',
'            FROM SYS.ALL_ARGUMENTS ',
'            WHERE PACKAGE_NAME = v_Package_Name_Out',
'            AND OWNER = v_Package_Owner_Out',
'            AND (Is_Printable_Type(PLS_TYPE) = ''YES'' or ARGUMENT_NAME IS NULL)',
'            GROUP BY PACKAGE_NAME, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD',
'        )',
'        SELECT PACKAGE_NAME, OBJECT_NAME, SUBPROGRAM_ID, OVERLOAD,',
'            INITCAP(OBJECT_NAME) PROCEDURE_NAME, ',
'            CASE WHEN p_Compact = ''Y'' and p_Logging_Start_Enabled = ''Y'' THEN ',
'                v_Condition_Start',
'                || chr(10)',
'                || rpad('' '', p_Indent+4)',
'                || ''EXECUTE IMMEDIATE api_trace.Dyn_Log_Start''',
'                || case when OVERLOAD is not null then ''(p_overload => '' || OVERLOAD || '')'' end',
'                || case when PARAM_LIST_IN IS NOT NULL then -- ??',
'                    chr(10) ',
'                    || rpad('' '', p_Indent+4)',
'                    || ''USING ''',
'                    || PARAM_LIST_IN',
'                end',
'                || '';'' ',
'                || v_Condition_End',
'                || chr(10) || ''----'' || chr(10) ',
'                || v_Condition_Start',
'                || chr(10)',
'                || rpad('' '', p_Indent+4)',
'                || ''EXECUTE IMMEDIATE api_trace.Dyn_Log_Exit''',
'                || case when OVERLOAD is not null then ''(p_overload => '' || OVERLOAD || '')'' end',
'                || case when PARAM_LIST_OUT IS NOT NULL then ',
'                    chr(10) ',
'                    || rpad('' '', p_Indent+4)',
'                    || ''USING ''',
'                    || PARAM_LIST_OUT',
'                end',
'                || '';'' ',
'                || v_Condition_End',
'            WHEN p_Compact = ''Y'' and p_Logging_Start_Enabled = ''N'' THEN ',
'                v_Condition_Start',
'                || chr(10)',
'                || rpad('' '', p_Indent+4)',
'                || ''EXECUTE IMMEDIATE api_trace.Dyn_Log_Call''',
'                || case when OVERLOAD is not null then ''(p_overload => '' || OVERLOAD || '')'' end',
'                || case when PARAM_LIST IS NOT NULL then ',
'                    chr(10) ',
'                    || rpad('' '', p_Indent+4)',
'                    || ''USING ''',
'                    || PARAM_LIST',
'                end',
'                || '';'' ',
'                || v_Condition_End',
'            WHEN p_Compact = ''N'' and p_Logging_Start_Enabled = ''Y'' THEN ',
'                v_Condition_Start',
'                || chr(10)',
'                || rpad('' '', p_Indent+4)',
'                || replace(replace(',
'                    p_Logging_Start_Call, ''%s'',',
'                    api_trace.Format_Call_Parameter(',
'                        p_calling_subprog => CALLING_SUBPROG,',
'                        p_bind_char => null,',
'                        p_overload => OVERLOAD,',
'                        p_in_out => ''IN''',
'                    )',
'                ), chr(10), chr(10) || rpad('' '', p_Indent))',
'                || v_Condition_End',
'                || chr(10) || ''----'' || chr(10) ',
'                || v_Condition_Start',
'                || chr(10) || rpad('' '', p_Indent+4)',
'                || replace(replace(',
'                    p_Logging_Finish_Call, ''%s'',',
'                    case when OUT_COUNT > 0 then ',
'                        api_trace.Format_Call_Parameter(',
'                            p_calling_subprog => CALLING_SUBPROG,',
'                            p_synonym_name => INITCAP(OBJECT_NAME) || '' output '',',
'                            p_bind_char => null,',
'                            p_overload => OVERLOAD,',
'                            p_in_out => ''OUT''',
'                        )',
'                    end ',
'                    || case when RETURN_PLS_TYPE IS NOT NULL',
'                    or RETURN_DATA_TYPE IS NOT NULL then ',
'                        Format_Return_Value(',
'                            p_Procedure_Name => CALLING_SUBPROG,',
'                            p_PLS_Type => RETURN_PLS_TYPE, -- returning data type',
'                            p_Data_Type => RETURN_DATA_TYPE,',
'                            p_Variable_Name => p_Variable_Name',
'                        )',
'                    end',
'                    || case when OUT_COUNT = 0 and RETURN_PLS_TYPE IS NULL then',
'                        api_trace.Literal(CALLING_SUBPROG)',
'                    end',
'                ), chr(10), chr(10) || rpad('' '', p_Indent))',
'                || v_Condition_End',
'            WHEN p_Compact = ''N'' and p_Logging_Start_Enabled = ''N'' THEN ',
'                v_Condition_Start',
'                || chr(10) || rpad('' '', p_Indent+4)',
'                || replace(replace(',
'                    p_Logging_API_Call, ''%s'',',
'                    api_trace.Format_Call_Parameter(',
'                        p_calling_subprog => CALLING_SUBPROG,',
'                        p_bind_char => null,',
'                        p_overload => OVERLOAD,',
'                        p_in_out => ''IN/OUT''',
'                    )',
'                    || case when RETURN_PLS_TYPE IS NOT NULL ',
'                    or RETURN_DATA_TYPE IS NOT NULL then ',
'                        chr(10) || rpad('' '', 4) || '' || '' ',
'                        || Format_Return_Value(',
'                            p_Procedure_Name => null,',
'                            p_PLS_Type => RETURN_PLS_TYPE, -- returning data type',
'                            p_Data_Type => RETURN_DATA_TYPE,',
'                            p_Variable_Name => p_Variable_Name',
'                        )',
'                    end',
'                ), chr('))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(261939746109436819)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'10), chr(10) || rpad('' '', p_Indent))',
'                || v_Condition_End',
'            END LOGGING_CALL',
'        FROM PARAM_Q',
'        ORDER BY PACKAGE_NAME,SUBPROGRAM_ID, OVERLOAD;',
'',
'        v_row rec_logging_calls;',
'    BEGIN',
'        Resolve_Synonym (',
'            p_Synonym_Name => v_Synonym_Name,',
'            p_Dest_Schema => p_Dest_Schema,',
'            p_Dest_Object_Type => ''PACKAGE'',',
'            p_Synonym_Owner => v_Synonym_Owner,',
'            p_Package_Name => v_Package_Name_Out,',
'            p_Package_Owner => v_Package_Owner_Out,',
'            p_DBLink => v_DBLink,',
'            p_Object_Type_Out => v_Object_Type_Out,',
'            p_Editionable => v_Editionable_Out',
'        );',
'        OPEN all_proc_cur;',
'        LOOP',
'            FETCH all_proc_cur INTO v_row;',
'            EXIT WHEN all_proc_cur%NOTFOUND;',
'            PIPE ROW (v_row);',
'        END LOOP;',
'        CLOSE all_proc_cur;',
'    END Dyn_Log_Call_List;',
'',
'    PROCEDURE Output_Clob (p_Clob CLOB)',
'    is ',
'        v_Offset INTEGER;',
'        v_Linelen INTEGER;',
'    begin',
'        if p_Clob IS NOT NULL then ',
'            v_Offset := 1;',
'            loop ',
'                exit when v_offset >= dbms_lob.getlength(p_Clob);',
'                v_Linelen := dbms_lob.instr( p_Clob, chr(10), v_Offset);',
'                if v_Linelen = 0 then ',
'                    v_Linelen := dbms_lob.getlength(p_Clob) - v_Offset + 1; ',
'                else ',
'                    v_Linelen := v_Linelen - v_Offset + 1;',
'                end if;',
'                if v_Linelen-1 > 0 then ',
'                    DBMS_OUTPUT.PUT_LINE (dbms_lob.substr( p_Clob, v_Linelen-1, v_Offset));',
'                end if;',
'                v_Offset := v_Offset + v_Linelen;',
'            end loop;',
'        end if;',
'    end Output_Clob;',
'',
'    FUNCTION Get_Package_Source  (',
'        p_Package_Name IN VARCHAR2,',
'        p_Package_Owner IN VARCHAR2,',
'        p_Editionable  IN VARCHAR2 DEFAULT ''N'',',
'        p_Type IN VARCHAR2 DEFAULT ''PACKAGE''',
'    ) RETURN CLOB',
'    IS',
'        v_Clob CLOB;',
'        v_SQLText VARCHAR2(4000);',
'    BEGIN',
'        dbms_lob.createtemporary(v_Clob, true, dbms_lob.call);',
'        v_SQLText := ''CREATE OR REPLACE ''',
'        || CASE WHEN p_Editionable = ''Y'' THEN ''EDITIONABLE'' ELSE ''NONEDITIONABLE'' END',
'        || '' '' || p_Type ',
'        || '' '' || Enquote_Name(p_Package_Owner)',
'        || ''.'' || Enquote_Name(p_Package_Name)',
'        || chr(10);',
'        dbms_lob.writeappend (v_Clob, length(v_SQLText), v_SQLText);',
'        for cur in (',
'            SELECT TEXT, LINE',
'            FROM SYS.All_Source ',
'            where Owner = p_Package_Owner',
'            and Name = p_Package_Name',
'            and type = p_Type',
'            order by LINE',
'        ) loop ',
'            if cur.LINE = 1 then ',
'                v_SQLText := REGEXP_REPLACE(cur.TEXT, ''.*?package\s+.*?"{0,1}''||p_Package_Name||''"{0,1}'', '''',  1, 1, ''in'');',
'                if INSTR(v_SQLText, ''wrapped'') > 0 then ',
'                    return NULL;',
'                end if;',
'            else ',
'                v_SQLText := cur.TEXT;',
'            end if;',
'            if length(v_SQLText) > 0 then ',
'                dbms_lob.writeappend (v_Clob, length(v_SQLText), v_SQLText);',
'            end if;',
'        end loop;',
'        return v_Clob; ',
'    END Get_Package_Source;',
'',
'    FUNCTION Get_Package_Spec  (',
'        p_Object_Name IN VARCHAR2,',
'        p_Object_Owner IN VARCHAR2,',
'        p_Editionable  IN VARCHAR2,',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Synonym_Text IN VARCHAR2 DEFAULT NULL',
'    ) RETURN CLOB',
'    IS',
'        v_Clob CLOB;',
'        v_Comment VARCHAR2(500) := ''-- This package was generated by '' || c_Package_Name || '' from Strack Software Development, Berlin, Germany.''',
'        || chr(10) || ''-- It replaces : '' || p_Synonym_Text;',
'        v_Timemark NUMBER := dbms_utility.get_time;',
'    BEGIN',
'        v_Clob := Get_Package_Source(',
'            p_Package_Name => p_Object_Name,',
'            p_Package_Owner => p_Object_Owner,',
'            p_Editionable  => p_Editionable',
'        );',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- Get_Package_Spec: get package source'');    ',
'        end if;',
'        if p_Object_Owner != p_Dest_Schema then ',
'          v_Clob := REPLACE(v_Clob, Enquote_Name(p_Object_Owner), Enquote_Name(p_Dest_Schema));',
'        end if;',
'        if p_Object_Name != p_Package_Name then ',
'          v_Clob := REPLACE(v_Clob, Enquote_Name(p_Object_Name), Enquote_Name(p_Package_Name));',
'          v_Clob := REGEXP_REPLACE(v_Clob, ''end\s+''||p_Object_Name, ''end ''||p_Package_Name, 1, 0, ''i'');',
'        end if;    ',
'        -- remoce PRAGMA clauses',
'        v_Clob := REGEXP_REPLACE(v_Clob, ''PRAGMA\s+\w+\s*\(.+?\);'', '''', 1, 0, ''i'');',
'        ',
'        -- remove leading blanks',
'        v_Clob := LTRIM(v_Clob, chr(10)||chr(32));',
'        -- remove comments',
'        v_Clob := REGEXP_REPLACE(v_Clob, ''\s*--.*$'', '''', 1, 0, ''m'');',
'        v_Clob := REGEXP_REPLACE(v_Clob, ''/\*.+?\*/'', '''', 1, 0, ''n'');',
'        -- remove empty lines',
'        v_Clob := REGEXP_REPLACE(v_Clob, chr(10)||''{2,}'', chr(10), 1, 0, ''m'');',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- Get_Package_Spec: normalize source'');      ',
'        end if;',
'        -- add comment',
'      v_Clob := REGEXP_REPLACE(v_Clob, ',
'        ''(package\s+''||Enquote_Name(p_Dest_Schema) || ''\.'' || Enquote_Name(p_Package_Name) || ''.*?\s(is|as)\s)'',',
'        ''\1''||v_Comment||chr(10), ',
'        1, 1, ''in'');',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- Get_Package_Spec: added Comments'');    ',
'        end if;',
'        ',
'        return v_Clob; ',
'    END Get_Package_Spec;',
'',
'    FUNCTION Get_Package_Synonym_Text (',
'        p_Package_Name IN VARCHAR2,',
'        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')',
'    ) RETURN VARCHAR2 ',
'    IS ',
'        v_Clob CLOB;',
'        v_Comment VARCHAR2(32767);',
'    BEGIN ',
'        v_Clob := Get_Package_Source(',
'            p_Package_Name => p_Package_Name,',
'            p_Package_Owner => p_Package_Owner',
'        );',
'',
'        v_Comment := REGEXP_SUBSTR(v_Clob, ''^-- It replaces : (.+)$'', 1, 1, ''im'', 1);',
'        return v_Comment;',
'    END Get_Package_Synonym_Text;',
'',
'	-- list record and table types of a package',
'    FUNCTION Pipe_Record_types (',
'        p_Package_Name IN VARCHAR2,',
'        p_Package_Owner IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')',
'    ) RETURN tab_record_fields PIPELINED',
'    IS ',
'        v_Clob CLOB;',
'        v_Record_Pattern CONSTANT VARCHAR2(100) := ''TYPE\s+(\w+)\s+IS\s+RECORD\s*\((.+?)\);'';',
'        v_Record_Type VARCHAR2(1000);',
'        v_Record_Text VARCHAR2(32767);',
'        TYPE t_Record_Type IS TABLE OF VARCHAR2(1024);',
'        v_Types_List t_Record_Type :=  t_Record_Type(NULL);',
'        v_Item_Pattern CONSTANT VARCHAR2(100) := ''^\s*(\w+)\s+(.+?),*\s*$'';',
'		v_Item_Name VARCHAR2(1000);',
'		v_Item_Type VARCHAR2(1000);',
'        v_Table_Pattern CONSTANT VARCHAR2(100) := ''TYPE\s+(\w+)\s+IS\s+TABLE\s+OF\s*(\w+).*;'';',
'		v_out_row rec_record_fields;',
'    BEGIN ',
'        v_Clob := Get_Package_Source(',
'            p_Package_Name => p_Package_Name,',
'            p_Package_Owner => p_Package_Owner',
'        );',
'        -- remove comments',
'        v_Clob := REGEXP_REPLACE(v_Clob, ''\s*--.*$'', '''', 1, 0, ''m'');',
'        v_Clob := REGEXP_REPLACE(v_Clob, ''/\*.+?\*/'', '''', 1, 0, ''n'');',
'        -- remove empty lines',
'        v_Clob := REGEXP_REPLACE(v_Clob, chr(10)||''{2,}'', chr(10), 1, 0, ''m'');',
'		for ind in 1..100 loop',
'			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_Table_Pattern, 1, ind, ''in'', 1);',
'			exit when v_Record_Type IS NULL;',
'			v_Types_List.EXTEND;',
'			v_Types_List(v_Types_List.LAST) := v_Record_Type;',
'		end loop;',
'		for ind in 1..100 loop',
'			v_Record_Type := REGEXP_SUBSTR(v_Clob, v_Record_Pattern, 1, ind, ''in'', 1);',
'			exit when v_Record_Type IS NULL;',
'			v_Types_List.EXTEND;',
'			v_Types_List(v_Types_List.LAST) := v_Record_Type;',
'			v_Record_Text := REGEXP_SUBSTR(v_Clob, v_Record_Pattern, 1, ind, ''in'', 2);',
'			for ind2 in 1..100 loop',
'				v_Item_Name := REGEXP_SUBSTR(v_Record_Text, v_Item_Pattern, 1, ind2, ''im'', 1);',
'				exit when v_Item_Name IS NULL;',
'				v_Item_Type := REGEXP_SUBSTR(v_Record_Text, v_Item_Pattern, 1, ind2, ''im'', 2);',
'				v_out_row.Type_name	:= v_Record_Type;',
'				v_out_row.Item_Name	:= v_Item_Name;',
'				v_out_row.Item_Type	:= v_Item_Type;',
'				v_out_row.Nested_Table := case when v_Item_Type MEMBER OF v_Types_List then ''Y'' else ''N'' end;',
'				PIPE ROW(v_out_row);',
'			end loop;',
'		end loop;',
'    END Pipe_Record_types;',
'',
'    FUNCTION Get_Record_Fields (',
'        p_Package_Head IN CLOB,',
'        p_Type_Subname IN VARCHAR2,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_temp''',
'    ) RETURN VARCHAR2 ',
'    IS ',
'        v_Record_Text VARCHAR2(32767);',
'        v_pattern CONSTANT VARCHAR2(100) := ''TYPE\s+''||p_Type_Subname||''\s+IS\s+RECORD\s*\((.+?)\);'';',
'		v_Item VARCHAR2(32767);',
'		v_Result VARCHAR2(32767);',
'    BEGIN ',
'        v_Record_Text := REGEXP_SUBSTR(p_Package_Head, v_pattern, 1, 1, ''in'', 1);',
'		for ind in 1..200 loop',
'			v_Item := REGEXP_SUBSTR(v_Record_Text, ''^\s*(\w+)'', 1, ind, ''im'', 1);',
'			exit when v_Item IS NULL;',
'			v_Result := v_Result ',
'			|| case when ind > 1 then '','' end',
'			|| p_Variable_Name || ''.'' || v_Item;',
'		end loop;',
'        return v_Result;',
'    END Get_Record_Fields;',
'',
'    FUNCTION Get_Package_Body (',
'        p_Object_Name IN VARCHAR2,',
'        p_Object_Owner IN VARCHAR2,',
'        p_Editionable  IN VARCHAR2,',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Logging_Start_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,',
'        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,',
'        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result'',',
'        p_value_max_length INTEGER DEFAULT 1000',
'    ) RETURN CLOB',
'    IS',
'        v_Header CLOB;',
'',
'        CURSOR all_proc_cur',
'        IS',
'            WITH RETURN_Q AS (',
'                SELECT A.PACKAGE_NAME, A.OWNER, A.OBJECT_NAME PROCEDURE_NAME, A.SUBPROGRAM_ID, ',
'                        A.IN_OUT, ',
'                        A.PLS_TYPE RETURN_PLS_TYPE, ',
'                        A.DATA_TYPE RETURN_DATA_TYPE,',
'                        A.TYPE_SUBNAME RETURN_TYPE_NAME,',
'                        A.CHAR_USED,',
'                        CASE when A.TYPE_NAME IS NOT NULL THEN ',
'                            CASE WHEN A.DATA_TYPE = ''REF'' THEN '' ref '' END',
'                            || CASE WHEN S.SYNONYM_NAME IS NULL AND TYPE_OWNER != p_Dest_Schema THEN TYPE_OWNER||''.'' END ',
'                            || A.TYPE_NAME ',
'                            || CASE WHEN A.TYPE_SUBNAME IS NOT NULL THEN ''.''||A.TYPE_SUBNAME END ',
'                        ELSE ',
'                            A.PLS_TYPE ',
'                        END RETURN_TYPE,',
'                        A.TYPE_OBJECT_TYPE',
'                FROM SYS.ALL_ARGUMENTS A',
'                LEFT OUTER JOIN SYS.All_Synonyms S ',
'                	ON S.SYNONYM_NAME = A.TYPE_NAME',
'					AND S.OWNER IN (p_Dest_Schema, ''PUBLIC'')',
'					AND S.TABLE_NAME = A.TYPE_NAME',
'                WHERE DATA_LEVEL = 0 ',
'                AND POSITION = 0',
'                AND ARGUMENT_NAME IS NULL',
'            ), ARGUMENTS_Q AS (',
'                SELECT PACKAGE_NAME, OWNER, PROCEDURE_NAME, SUBPROGRAM_ID,',
'                        COUNT(*) ARGS_COUNT,',
'                        SUM(CASE WHEN IN_OUT IN (''IN/OUT'', ''OUT'') THEN 1 ELSE 0 END) OUT_COUNT,',
'                        LISTAGG(ARG_PREFIX||LOWER(ARGUMENT_NAME), '','') WITHIN GROUP (ORDER BY POSITION) ARGUMENT_NAMES,',
'                        LISTAGG(LOWER(ARGUMENT_NAME||''=>''||ARG_PREFIX||ARGUMENT_NAME), '','') WITHIN GROUP (ORDER BY POSITION) CALL_PARAMETER,',
'                        LISTAGG(case when ARG_PREFIX IS NOT NULL',
'                        		then ARG_PREFIX',
'                        			|| LOWER(ARGUMENT_NAME) ',
'                        			|| '' '' || ARGUMENT_TYPE ',
'                        			|| '' := ''',
'									|| ARGUMENT_TYPE || ''(''',
'                        			|| case when DATA_TYPE = ''PL/SQL RECORD'' then ',
'										package_tracer.Get_Record_Fields(',
'											p_Package_Head=>v_Header, ',
'											p_Type_Subname=>TYPE_SUBNAME, ',
'											p_Variable_Name=>LOWER(ARGUMENT_NAME)) ',
'									else ',
'										''null''',
'									end',
'										|| '')''',
'                        		end, '';''||chr(10)||chr(9)) WITHIN GROUP (ORDER BY POSITION) ARG_DECLARE_IN,',
'                         LISTAGG(case when ARG_PREFIX IS NOT NULL and DATA_TYPE = ''TABLE''',
'                        		then ',
'                        			''select * bulk collect into ''',
'                        			|| ARG_PREFIX || LOWER(ARGUMENT_NAME) ',
'                        			|| '' from table('' ',
'                        			|| LOWER(ARGUMENT_NAME) ',
'									|| '')''',
'                        		end, '';''||chr(10)||chr(9)) WITHIN GROUP (ORDER BY POSITION) ARG_CONVERT_IN,',
'                       LISTAGG(case when ARG_PREFIX IS NOT NULL and IN_OUT IN (''IN/OUT'', ''OUT'')',
'                        		then ',
'                        			case when DATA_TYPE = ''PL/SQL RECORD'' then ',
'										LOWER(ARGUMENT_NAME) || '' := ''',
'										|| LOWER(p_Package_Name || ''.'' || TYPE_SUBNAME) || ''(''',
'										|| package_tracer.Get_Record_Fields(',
'											p_Package_Head=>v_Header, ',
'											p_Type_Subname=>TYPE_SUBNAME, ',
'											p_Variable_Name=>ARG_PREFIX|| LOWER(ARGUMENT_NAME)) ',
'										|| '')''',
'									else ',
'										''select * bulk collect into '' || LOWER(ARGUMENT_NAME) ',
'										|| '' from table ('' ',
'										|| ARG_PREFIX|| LOWER(ARGUMENT_NAME)',
'										||'')''',
'									end',
'                        		end, '';''||chr(10)||chr(9)) WITHIN GROUP (ORDER BY POSITION) ARG_CONVERT_OUT',
'                FROM (SELECT PACKAGE_NAME, OWNER, OBJECT_NAME PROCEDURE_NAME, SUBPROGRAM_ID, ARGUMENT_NAME,',
'                			DATA_TYPE, POSITION, TYPE_SUBNAME, IN_OUT, ',
'                			lower(TYPE_OWNER || ''.'' || TYPE_NAME || ''.'' || TYPE_SUBNAME) ARGUMENT_TYPE,',
'                			case when TYPE_NAME = PACKAGE_NAME and TYPE_OBJECT_TYPE = ''PACKAGE'' ',
'                				then ''l''',
'                			end ARG_PREFIX',
'                	FROM SYS.ALL_ARGUMENTS  ',
'					WHERE DATA_LEVEL = 0 ',
'					AND POSITION > 0',
'					AND ARGUMENT_NAME IS NOT NULL',
'				)',
'                GROUP BY PACKAGE_NAME, OWNER, PROCEDURE_NAME, SUBPROGRAM_ID',
'            )',
'            SELECT PRO.PROCEDURE_NAME, ',
'                PRO.SUBPROGRAM_ID, PRO.OVERLOAD,',
'                PRO.AGGREGATE, PRO.PIPELINED, PRO.IMPLTYPEOWNER, PRO.IMPLTYPENAME,',
'                RET.RETURN_TYPE, RET.TYPE_OBJECT_TYPE, RET.RETURN_TYPE_NAME,',
'                RET.RETURN_PLS_TYPE, RET.RETURN_DATA_TYPE, RET.CHAR_USED,',
'                RD.RETURN_TYPE DEST_RETURN_TYPE,',
'                NVL(ARG.ARGS_COUNT,0) ARGS_COUNT,',
'                NVL(ARG.OUT_COUNT,0) OUT_COUNT,',
'                case when RET.IN_OUT = ''OUT'' then ''FUNCTION'' else ''PROCEDURE'' end PROC_TYPE,',
'                case when PRO.OVERLOAD IS NULL then ARG.ARGUMENT_NAMES else ARG.CALL_PARAMETER end CALL_PARAMETER,',
'                case when ARG_DECLARE_IN IS NOT NULL then chr(9)||ARG_DECLARE_IN||'';''||chr(10) end ARG_DECLARE_IN,',
'                case when ARG_CONVERT_IN IS NOT NULL then chr(9)||ARG_CONVERT_IN||'';''||chr(10) end ARG_CONVERT_IN,',
'                case when ARG_CONVERT_OUT IS NOT NULL then chr(9)||ARG_CONVERT_OUT||'';''||chr(10) end ARG_CONVERT_OUT,',
'                REGEXP_SUBSTR(v_Header,  ',
'                        ''(''',
'                        || case when RET.IN_OUT = ''OUT'' then ''FUNCTION'' else ''PROCEDURE'' end',
'                        || ''\s+''||PRO.PROCEDURE_NAME',
'                        || case when ARG.ARGS_COUNT > 0 then ''\s*\(.+?\)'' end',
'                        || case when RET.IN_OUT = ''OUT'' then ''\s+RETURN\s+.*?'' else ''\s*'' end',
'                        || '');'',',
'                        1, ',
'                        DENSE_RANK() OVER (PARTITION BY PRO.PROCEDURE_NAME, RET.IN_OUT, SIGN(ARG.ARGS_COUNT) ORDER BY PRO.SUBPROGRAM_ID),',
'                        ''in'', 1) HEADER -- find original procedure header with parameter default values',
'            FROM SYS.ALL_PROCEDURES PRO',
'            LEFT OUTER JOIN RETURN_Q RET -- get return type of functions in source schema.',
'                    ON PRO.OBJECT_NAME = RET.PACKAGE_NAME',
'                    AND PRO.OWNER = RET.OWNER',
'                    AND PRO.PROCEDURE_NAME = RET.PROCEDURE_NAME',
'                    AND PRO.SUBPROGRAM_ID = RET.SUBPROGRAM_ID',
'            LEFT OUTER JOIN RETURN_Q RD -- get return type of functions in destination schema.',
'                    ON RD.PACKAGE_NAME = p_Package_Name',
'                    AND RD.OWNER = p_Dest_Schema',
'                    AND PRO.PROCEDURE_NAME = RD.PROCEDURE_NAME',
'                    AND PRO.SUBPROGRAM_ID = RD.SUBPROGRAM_ID',
'            LEFT OUTER JOIN ARGUMENTS_Q ARG ',
'                    ON PRO.OBJECT_NAME = ARG.PACKAGE_NAME',
'                    AND PRO.OWNER = ARG.OWNER',
'                    AND PRO.PROCEDURE_NAME = ARG.PROCEDURE_NAME',
'                    AND PRO.SUBPROGRAM_ID = ARG.SUBPROGRAM_ID',
'            WHERE PRO.OBJECT_NAME = p_Object_Name',
'            AND PRO.OWNER = p_Object_Owner',
'            AND PRO.OBJECT_TYPE = ''PACKAGE''',
'            AND PRO.PROCEDURE_NAME IS NOT NULL',
'            ORDER BY PRO.SUBPROGRAM_ID, PRO.OVERLOAD;',
'        TYPE proc_tbl IS TABLE OF all_proc_cur%ROWTYPE;',
'        v_proc_tbl        proc_tbl;',
'        v_Clob            CLOB;',
'        v_procedure_name  SYS.ALL_PROCEDURES.PROCEDURE_NAME%TYPE;',
'        v_subprogram_id   SYS.ALL_PROCEDURES.SUBPROGRAM_ID%TYPE;',
'        v_overload        SYS.ALL_PROCEDURES.OVERLOAD%TYPE;',
'        v_object_owner    SYS.ALL_PROCEDURES.OWNER%TYPE;',
'        v_calling_subprog VARCHAR2(4000);',
'        v_attributes      VARCHAR2(32767);',
'        v_trace_call      VARCHAR2(32767);',
'        v_trace_output    VARCHAR2(32767);',
'        v_trace_return    VARCHAR2(32767);',
'        v_sqltext         VARCHAR2(32767);',
'    BEGIN',
'        dbms_lob.createtemporary(v_Header, true, dbms_lob.call);',
'        dbms_lob.createtemporary(v_Clob, true, dbms_lob.call);',
'        v_object_owner := LOWER(p_Object_Owner);',
'        v_Header := Get_Package_Source(',
'            p_Package_Name => p_Object_Name,',
'            p_Package_Owner => p_Object_Owner,',
'            p_Editionable  => p_Editionable',
'        );',
'        v_Header := LTRIM(v_Header, chr(10)||chr(32));',
'        -- remove comments',
'        v_Header := REGEXP_REPLACE(v_Header, ''\s*--.*$'', '''', 1, 0, ''m'');',
'        v_Header := REGEXP_REPLACE(v_Header, ''/\*.+?\*/'', '''', 1, 0, ''n'');',
'        -- remove PRAGMA clauses',
'        v_Header := REGEXP_REPLACE(v_Header, ''PRAGMA\s+\w+\s*\(.+?\);'', '''', 1, 0, ''i'');',
'        OPEN all_proc_cur;',
'        FETCH all_proc_cur BULK COLLECT INTO v_proc_tbl;',
'        CLOSE all_proc_cur;',
'        IF v_proc_tbl.FIRST IS NOT NULL THEN',
'            v_sqltext := chr(10)  ',
'            || ''CREATE OR REPLACE ''',
'            || CASE WHEN p_Editionable = ''Y'' THEN ''EDITIONABLE'' ELSE ''NONEDITIONABLE'' END',
'            || '' PACKAGE BODY ''',
'            || Enquote_Name(p_Dest_Schema) || ''.''',
'            || Enquote_Name(p_Package_Name) || chr(10) ',
'            || ''IS '' || chr(10);',
'            dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);',
'        ',
'            FOR ind IN 1 .. v_proc_tbl.COUNT',
'            LOOP',
'                v_calling_subprog := v_object_owner || ''.'' || LOWER(p_Object_Name) || ''.'' || LOWER(v_proc_tbl(ind).PROCEDURE_NAME);',
'                v_procedure_name := lower(p_Package_Name||''.''|| v_proc_tbl(ind).PROCEDURE_NAME);',
'                -- DBMS_OUTPUT.PUT_LINE (v_calling_subprog);',
'                IF p_Logging_Start_Enabled = ''Y'' THEN ',
'                    v_trace_call := chr(9) ',
'                    || replace(',
'                        p_Logging_Start_Call, ''%s'',',
'                        Format_Call_Parameter( ',
'                            p_Object_Name => p_Object_Name,',
'                            p_Object_Owner => p_Object_Owner,',
'                            p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,',
'                            p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,',
'                            p_calling_subprog => v_calling_subprog,',
'                            p_synonym_name => v_procedure_name,',
'                            p_value_max_length => p_value_max_length,',
'                            p_bind_char => null,',
'                            p_overload => v_proc_tbl(ind).OVERLOAD,',
'                            p_in_out => ''IN''',
'                        )',
'                    ) || chr(10)',
'                    || v_proc_tbl(ind).ARG_CONVERT_IN;',
'                    v_trace_output := chr(9) ',
'                    || replace(',
'                        p_Logging_Finish_Call, ''%s'',',
'                        case when v_proc_tbl(ind).OUT_COUNT > 0 then ',
'                            Format_Call_Parameter( ',
'                                p_Object_Name => p_Object_Name,',
'                                p_Object_Owner => p_Object_Owner,',
'                                p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,',
'                                p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,',
'                                p_calling_subprog => v_calling_subprog,',
'                                p_synonym_name => v_procedure_name || '' output '',',
'                                p_value_max_length => p_value_max_length,',
'                                p_bind_char => null,',
'                                p_overload => v_proc_tbl(ind).OVERLOAD,',
'                                p_in_out => ''OUT''',
'                            )',
'                        end',
'                        || case when v_proc_tbl(ind).RETURN_PLS_TYPE IS NOT NULL ',
'                        or v_proc_tbl(ind).TYPE_OBJECT_TYPE IS NOT NULL then ',
'                            Format_Return_Value(',
'                                p_Procedure_Name => v_Procedure_Name,',
'                                p_PLS_Type => v_proc_tbl(ind).RETURN_PLS_TYPE, -- returning data type',
'                                p_Data_Type => v_proc_tbl(ind).RETURN_DATA_TYPE,',
'                                p_Variable_Name => p_Variable_Name',
'                            )',
'                        end',
'                        || case when v_proc_tbl(ind).OUT_COUNT = 0 ',
'                        and v_proc_tbl(ind).RETURN_PLS_TYPE IS NULL ',
'                        and v_proc_tbl(ind).TYPE_OBJECT_TYPE IS NULL then',
'                            api_trace.Literal(v_Procedure_Name)',
'                        end',
'                    ) || chr(10)',
'                    || v_proc_tbl(ind).ARG_CONVERT_OUT;',
'                ELSE ',
'                    v_trace_call := v_proc_tbl(ind).ARG_CONVERT_IN;',
'                    v_trace_output := chr(9) ',
'                    || replace(',
'                        p_Logging_API_Call, ''%s'',',
'                        Format_Call_Parameter( ',
'                            p_Object_Name => p_Object_Name,',
'                            p_Object_Owner => p_Object_Owner,',
'                            p_Procedure_Name => v_proc_tbl(ind).PROCEDURE_NAME,',
'                            p_Subprogram_ID => v_proc_tbl(ind).SUBPROGRAM_ID,',
'                            p_calling_subprog => v_calling_subprog,',
'                            p_synonym_name => v_procedure_name,',
'                            p_value_max_length => p_value_max_length,',
'                            p_bind_char => null,',
'                            p_overload => v_proc_tbl(ind).OVERLOAD,',
'                            p_in_out => ''IN/OUT''',
'                        )',
'                        || case when v_proc_tbl(ind).RETURN_PLS_TYPE IS NOT NULL ',
'                        or v_proc_tbl(ind).TYPE_OBJECT_TYPE IS NOT NULL then ',
'                            chr(10) || rpad('' '', 4) || '' || '' ',
'                            || Format_Return_Value(',
'                                p_Procedure_Name => null,',
'                                p_PLS_Type => v_proc_tbl(ind).RETURN_PLS_TYPE, -- returning data type',
'                                p_Data_Type => v_proc_tbl(ind).RETURN_DATA_TYPE,',
'                                p_Variable_Name => p_Variable_Name',
'                            )',
'                        end',
'                    ) || chr(10)',
'                    || v_proc_tbl(ind).ARG_CONVERT_OUT;                   ',
'                END IF;',
'                v_sqltext := v_proc_tbl(ind).HEADER || chr(10) ',
'				|| ''is'' || chr(10)',
'				|| v_proc_tbl(ind).ARG_DECLARE_IN;',
'                if length(v_sqltext) > 0 then ',
'                    if v_proc_tbl(ind).PROC_TYPE = ''FUNCTION''',
'                    and v_proc_tbl(ind).AGGREGATE = ''NO''',
'                    and v_proc_tbl(ind).PIPELINED = ''NO''',
'                    and (v_proc_tbl(ind).RETURN_TYPE = v_proc_tbl(ind).DEST_RETURN_TYPE OR v_proc_tbl(ind).DEST_RETURN_TYPE IS NULL)',
'                    then -- normal function with return value; return value is printed.',
'                        v_sqltext := v_sqltext                        ',
'                        || chr(9)||p_Variable_Name||'' '' || v_proc_tbl(ind).RETURN_TYPE ',
'                        || case when v_proc_tbl(ind).CHAR_USED != ''0'' or v_proc_tbl(ind).RETURN_TYPE = ''RAW'' ',
'                            then ''(32767)'' end ',
'                        || '';'' || chr(10) ',
'                        || ''begin'' || chr(10) ',
'                        || v_trace_call',
'                        || ''    ''||p_Variable_Name||'' := '' || v_calling_subprog',
'                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then ''('' || v_proc_tbl(ind).CALL_PARAMETER || '')'' end ',
'                        || '';'' || chr(10) ',
'                        || v_trace_output',
'                        || ''    return ''||p_Variable_Name||'';'' || chr(10);',
'                    elsif v_proc_tbl(ind).PROC_TYPE = ''FUNCTION''',
'                    and v_proc_tbl(ind).PIPELINED = ''NO''',
'                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = ''PACKAGE''',
'                    and v_proc_tbl(ind).RETURN_TYPE != v_proc_tbl(ind).DEST_RETURN_TYPE',
'                    and v_proc_tbl(ind).RETURN_DATA_TYPE IN (''TABLE'', ''PL/SQL TABLE'')',
'                    then',
'                        v_sqltext := v_sqltext',
'                        || ''    lv_temp '' || v_proc_tbl(ind).RETURN_TYPE || '';'' || chr(10) ',
'                        || ''    ''||p_Variable_Name||'' '' || v_proc_tbl(ind).DEST_RETURN_TYPE || '';'' || chr(10) ',
'                        || ''begin'' || chr(10) ',
'                        || v_trace_call',
'                        || ''    lv_temp := '' || v_calling_subprog',
'                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then ''('' || v_proc_tbl(ind).CALL_PARAMETER || '')'' end ',
'                        || '';'' || chr(10) ',
'                        || ''    select * bulk collect into ''||p_Variable_Name||'' from table (lv_temp);'' || chr(10) ',
'                        || v_trace_output',
'                        || ''    return ''||p_Variable_Name||'';'' || chr(10);                    ',
'                    elsif v_proc_tbl(ind).PROC_TYPE = ''FUNCTION''',
'                    and v_proc_tbl(ind).PIPELINED = ''NO''',
'                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = ''PACKAGE''',
'                    and v_proc_tbl(ind).RETURN_TYPE != v_proc_tbl(ind).DEST_RETURN_TYPE',
'                    and v_proc_tbl(ind).RETURN_DATA_TYPE = ''PL/SQL RECORD''',
'                    then',
'                        v_sqltext := v_sqltext',
'                        || ''    lv_temp '' || v_proc_tbl(ind).RETURN_TYPE || '';'' || chr(10) ',
'                        || ''    ''||p_Variable_Name||'' '' || v_proc_tbl(ind).DEST_RETURN_TYPE || '';'' || chr(10) ',
'                        || ''begin'' || chr(10) ',
'                        || v_trace_call',
'                        || ''    lv_temp := '' || v_calling_subprog',
'                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then ''('' || v_proc_tbl(ind).CALL_PARAMETER || '')'' end ',
'                        || '';'' || chr(10) ',
'                        || ''    ''||p_Variable_Name||'' := '' || v_proc_tbl(ind).DEST_RETURN_TYPE ',
'                        || ''('' ',
'                        || Get_Record_Fields(',
'                        	p_Package_Head=>v_Header, ',
'                        	p_Type_Subname=>v_proc_tbl(ind).RETURN_TYPE_NAME, ',
'                        	p_Variable_Name=>''lv_temp'') ',
'                        || '');''|| chr(10) ',
'                        || v_trace_output',
'                        || ''    return ''||p_Variable_Name||'';'' || chr(10);                    ',
'                    elsif v_proc_tbl(ind).PROC_TYPE = ''FUNCTION''',
'                    and v_proc_tbl(ind).PIPELINED = ''YES''',
'                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = ''TYPE''',
'                    then',
'                        v_sqltext := v_sqltext',
'                        || chr(9)||p_Variable_Name||'' '' || v_proc_tbl(ind).RETURN_TYPE || '';'' || chr(10) ',
'                        || ''begin'' || chr(10) ',
'                        || v_trace_call',
'                        || ''    select cast(multiset(select * from table ('' || chr(10) ',
'                        || ''        '' || v_calling_subprog',
'                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then ''('' || v_proc_tbl(ind).CALL_PARAMETER || '')'' end || chr(10) ',
'                        || ''    )) as '' || v_proc_tbl(ind).RETURN_TYPE || '')'' || chr(10) ',
'                        || ''    into ''||p_Variable_Name||'''' || chr(10) ',
'                        || ''    from dual;'' || chr(10) ',
'                        || ''    IF ''||p_Variable_Name||''.FIRST IS NOT NULL THEN'' || chr(10) ',
'                        || ''        FOR ind IN 1 .. ''||p_Variable_Name||''.COUNT LOOP'' || chr(10) ',
'                        || ''            pipe row (''||p_Variable_Name||''(ind));'' || chr(10) ',
'                        || ''        END LOOP;'' || chr(10) ',
'                        || ''    END IF;'' || chr(10) ',
'                        || v_trace_output;',
'                    elsif v_proc_tbl(ind).PROC_TYPE = ''FUNCTION''',
'                    and v_proc_tbl(ind).PIPELINED = ''YES''',
'                    and v_proc_tbl(ind).TYPE_OBJECT_TYPE = ''PACKAGE''',
'                    then',
'                        v_sqltext := v_sqltext',
'                        || chr(9)||p'))
);
null;
end;
/
begin
wwv_flow_api.append_to_install_script(
 p_id=>wwv_flow_api.id(261939746109436819)
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'_Variable_Name||'' '' || v_proc_tbl(ind).RETURN_TYPE || '';'' || chr(10) ',
'                        || ''begin'' || chr(10) ',
'                        || v_trace_call',
'                        || ''    select *'' || chr(10) ',
'                        || ''    bulk collect into ''||p_Variable_Name||'''' || chr(10) ',
'                        || ''    from table ('' || chr(10) ',
'                        || ''        '' || v_calling_subprog',
'                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then ''('' || v_proc_tbl(ind).CALL_PARAMETER || '')'' end || chr(10) ',
'                        || ''    );'' || chr(10) ',
'                        || ''    IF ''||p_Variable_Name||''.FIRST IS NOT NULL THEN'' || chr(10) ',
'                        || ''        FOR ind IN 1 .. ''||p_Variable_Name||''.COUNT LOOP'' || chr(10) ',
'                        || ''            pipe row (''||p_Variable_Name||''(ind));'' || chr(10) ',
'                        || ''        END LOOP;'' || chr(10) ',
'                        || ''    END IF;'' || chr(10) ',
'                        || v_trace_output;                    ',
'                    else -- procedures and special function without return value.',
'                        v_sqltext := v_sqltext',
'                        || ''begin'' || chr(10) ',
'                        || v_trace_call ',
'                        || ''    '' || v_calling_subprog',
'                        || case when v_proc_tbl(ind).ARGS_COUNT > 0 then ''('' || v_proc_tbl(ind).CALL_PARAMETER || '')'' end ',
'                        || '';'' || chr(10) ',
'                        || v_trace_output;',
'                    end if;',
'                    v_sqltext := v_sqltext ',
'                    || ''end '' || lower(v_proc_tbl(ind).PROCEDURE_NAME) || '';'' || chr(10) || chr(10);',
'                    dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);',
'                end if;',
'            END LOOP;',
'            v_sqltext := ''END '' || p_Package_Name || '';'' || chr(10);',
'            dbms_lob.writeappend (v_Clob, length(v_sqltext), v_sqltext);',
'        END IF;',
'        return v_Clob;',
'    END Get_Package_Body;',
'',
'    PROCEDURE Enable (',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Logging_Start_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,',
'        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,',
'        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result'',',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE,',
'        p_value_max_length INTEGER DEFAULT 1000',
'    )',
'    IS ',
'        v_Synonym_Name VARCHAR2(128) := p_Package_Name;',
'        v_Synonym_Owner VARCHAR2(128);',
'        v_Package_Name_Out VARCHAR2(128);',
'        v_Package_Owner_Out VARCHAR2(128);',
'        v_Synonym_Text VARCHAR2(1000);',
'        v_Drop_Synonym_Stat VARCHAR2(1000);',
'        v_DBLink VARCHAR2(128);',
'        v_Object_Type_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;',
'        v_Editionable_Out SYS.ALL_OBJECTS.OBJECT_TYPE%TYPE;',
'        v_Grant_Stats VARCHAR2(32767);',
'        v_Clob CLOB;',
'        v_Count NUMBER;',
'        v_Timemark NUMBER := dbms_utility.get_time;',
'    BEGIN',
'        DBMS_OUTPUT.ENABLE(NULL);',
'        Resolve_Synonym (',
'            p_Synonym_Name => v_Synonym_Name,',
'            p_Dest_Schema => p_Dest_Schema,',
'            p_Dest_Object_Type => ''PACKAGE'',',
'            p_Synonym_Owner => v_Synonym_Owner,',
'            p_Package_Name => v_Package_Name_Out,',
'            p_Package_Owner => v_Package_Owner_Out,',
'            p_DBLink => v_DBLink,',
'            p_Object_Type_Out => v_Object_Type_Out,',
'            p_Editionable => v_Editionable_Out',
'        );',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- Resolve_Synonym '' || p_Dest_Schema || ''.'' || v_Synonym_Name || '' to '' || v_Package_Owner_Out || ''.'' || v_Package_Name_Out);    ',
'        end if;',
'        if v_Package_Name_Out IS NULL then ',
'            RAISE_APPLICATION_ERROR(-20001, ''The name '' || v_Synonym_Name || '' could not be found.'');',
'            return;',
'        end if;',
'        if v_Object_Type_Out = ''PACKAGE'' and v_Package_Owner_Out = p_Dest_Schema then ',
'              RAISE_APPLICATION_ERROR(-20002, ''The package '' || v_Synonym_Name || '' already exists is the current schema.'');',
'            -- option: the package is renamed and the tracing package takes it''s name.',
'        end if; ',
'        ',
'        select COUNT(*) into v_Count',
'        from SYS.All_Arguments ARG',
'        where ARG.Type_Name = ARG.Package_Name',
'        and ARG.Package_Name = v_Package_Name_Out ',
'        and ARG.owner = v_Package_Owner_Out',
'        and ARG.argument_name IS NOT NULL -- unsuported argument type',
'        and ARG.TYPE_OBJECT_TYPE = ''PACKAGE''',
'        and ARG.DATA_TYPE = ''PL/SQL TABLE''',
'        ;',
'        if v_Count > 0 then ',
unistr('            RAISE_APPLICATION_ERROR(-20003, ''The package '' || v_Synonym_Name || '' is defining table types for function arguments and can\00B4t be traced.'');'),
'            return;',
'        end if;',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- Checked for table or record types'');       ',
'        end if;',
'',
'        FOR c_cur IN (',
'            SELECT DISTINCT',
'                DA.Owner, DA.Name,',
'                case when Pri.Privilege IS NULL and DA.referenced_Owner != ''PUBLIC'' then ',
'                    ''GRANT EXECUTE ON ''',
'                    || DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                    || '' TO '' || p_Dest_Schema ',
'                end GRANT_STAT,',
'                case when Syn.Owner IS NULL AND DB.REFERENCED_OWNER IS NULL then ',
'                    ''CREATE OR REPLACE SYNONYM '' || p_Dest_Schema || ''.'' || DA.referenced_Name',
'                    || '' FOR '' || DA.referenced_Owner || ''.'' || DA.referenced_Name ',
'                end SYNONYM_STAT,',
'                PRI.Grantable,',
'                PRI.Privilege,',
'                Syn.Owner SYNONYM_OWNER',
'            FROM SYS.ALL_DEPENDENCIES DA',
'            LEFT OUTER JOIN SYS.ALL_SYNONYMS SYN ',
'                ON Syn.Owner IN (p_Dest_Schema, ''PUBLIC'')',
'                AND Syn.Synonym_Name = DA.referenced_Name',
'            LEFT OUTER JOIN SYS.ALL_TAB_PRIVS PRI ',
'                ON Pri.table_Schema = DA.referenced_Owner ',
'                AND Pri.table_Name = DA.referenced_Name',
'                AND Pri.type = DA.referenced_Type',
'                AND PRI.Grantee IN (p_Dest_Schema, ''PUBLIC'')',
'                AND PRI.privilege IN (''EXECUTE'', ''SELECT'')',
'            LEFT OUTER JOIN ( -- no object with this name already exists',
'                SELECT DB.REFERENCED_NAME, DB.REFERENCED_OWNER',
'                FROM SYS.ALL_DEPENDENCIES DB',
'                WHERE DB.OWNER = p_Dest_Schema',
'                AND DB.NAME = DB.REFERENCED_NAME',
'            ) DB ON DB.REFERENCED_NAME = DA.REFERENCED_NAME AND DB.REFERENCED_OWNER = DA.Owner ',
'            WHERE DA.Owner = v_Package_Owner_Out ',
'            AND DA.Name = v_Package_Name_Out ',
'            AND (Syn.Owner IS NULL or Pri.Privilege IS NULL)',
'            AND NOT(DA.referenced_Owner = ''SYS'' AND DA.referenced_Name = ''STANDARD'')',
'        ) LOOP ',
'            if p_Use_Dbms_Output and c_cur.SYNONYM_STAT IS NOT NULL then',
'                DBMS_OUTPUT.PUT_LINE (c_cur.SYNONYM_STAT||'';''); ',
'            end if;',
'            if p_Do_Execute and c_cur.SYNONYM_STAT IS NOT NULL then ',
'                EXECUTE  IMMEDIATE c_cur.SYNONYM_STAT;',
'            end if;',
'            if c_cur.GRANT_STAT IS NOT NULL then ',
'                v_Grant_Stats := v_Grant_Stats ',
'                || c_cur.GRANT_STAT || '';'' || chr(10);',
'            end if;',
'        END LOOP;',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- Created dependent synonyms'');      ',
'        end if;',
'        if v_Grant_Stats IS NOT NULL ',
'        then ',
'            DBMS_OUTPUT.PUT_LINE (''-- execute the following statements as user sys to enable the creation of the package:'');',
'            DBMS_OUTPUT.PUT_LINE (v_Grant_Stats);',
'            return;',
'        end if;',
'        -- When the synonym is in the local schema, it is dropped.',
'        if v_Synonym_Owner = p_Dest_Schema then',
'            v_Drop_Synonym_Stat := ''DROP SYNONYM '' || v_Synonym_Owner || ''.'' || v_Synonym_Name;',
'            if p_Use_Dbms_Output then',
'              output_clob (v_Drop_Synonym_Stat|| '';'');',
'              DBMS_OUTPUT.PUT_LINE (''/'');',
'            end if;',
'            if p_Do_Execute then ',
'                EXECUTE IMMEDIATE v_Drop_Synonym_Stat;',
'            end if;',
'        end if;',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- dropped local synonym'');       ',
'        end if;',
'        -- the package is in an different schema, so a tracing package can be created.',
'        -- create package header ',
'        v_Synonym_Text := case when v_Synonym_Owner = ''PUBLIC'' then ''PUBLIC'' end ',
'        || '' SYNONYM ''',
'        || case when v_Synonym_Owner != ''PUBLIC'' then Enquote_Name(v_Synonym_Owner)||''.'' end',
'        || Enquote_Name(p_Package_Name)',
'        || '' for '' || Enquote_Name(v_Package_Owner_Out) || ''.'' || Enquote_Name(v_Package_Name_Out);',
'        v_Clob := Get_Package_Spec (',
'            p_Object_Name => v_Package_Name_Out,',
'            p_Object_Owner => v_Package_Owner_Out,',
'            p_Editionable => v_Editionable_Out,',
'            p_Package_Name => p_Package_Name,',
'            p_Dest_Schema => p_Dest_Schema,',
'            p_Synonym_Text => v_Synonym_Text',
'        );',
'        if dbms_lob.getlength(v_Clob) = 0 or v_Clob IS NULL then ',
'            RAISE_APPLICATION_ERROR(-20003, ''The package header for '' || v_Synonym_Name || '' could not be generated.'');',
'            return;',
'        end if;',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- generated package header'');    ',
'        end if;',
'        if p_Use_Dbms_Output then',
'          output_clob (v_Clob|| '';'');',
'          DBMS_OUTPUT.PUT_LINE (''/'');',
'        end if;',
'        if p_Do_Execute then ',
'            EXECUTE IMMEDIATE v_Clob;',
'        end if;',
'        -- create package body',
'        v_Clob := Get_Package_Body (',
'            p_Object_Name => v_Package_Name_Out,',
'            p_Object_Owner => v_Package_Owner_Out,',
'            p_Editionable => v_Editionable_Out,',
'            p_Package_Name => p_Package_Name,',
'            p_Dest_Schema => p_Dest_Schema,',
'            p_Logging_Start_Enabled => p_Logging_Start_Enabled,',
'            p_Logging_Start_Call => p_Logging_Start_Call,',
'            p_Logging_Finish_Call => p_Logging_Finish_Call,',
'            p_Logging_API_Call => p_Logging_API_Call,',
'            p_Variable_Name => p_Variable_Name,',
'            p_value_max_length => p_value_max_length',
'        );',
'        if dbms_lob.getlength(v_Clob) = 0 or v_Clob IS NULL then ',
'            RAISE_APPLICATION_ERROR(-20004, ''The package body for '' || v_Synonym_Name || '' could not be generated.'');',
'            return;',
'        end if;',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- generated package body'');      ',
'        end if;',
'        if p_Use_Dbms_Output then',
'            output_clob (v_Clob);',
'            DBMS_OUTPUT.PUT_LINE (''/'');',
'        end if;',
'        if p_Do_Execute then ',
'            EXECUTE IMMEDIATE v_Clob;',
'        end if;',
'        if g_debug then',
'            Log_Elapsed_Time(v_Timemark, ''-- Enable completion'');       ',
'        end if;',
'    END Enable;',
'',
'    PROCEDURE Enable_APEX (',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Logging_Start_Enabled VARCHAR2 DEFAULT ''N'', --Y/N',
'        p_Logging_Start_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Start_Call,',
'        p_Logging_Finish_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_Exit_Call,',
'        p_Logging_API_Call IN VARCHAR2 DEFAULT api_trace.c_APEX_Logging_API_Call,',
'        p_Variable_Name IN VARCHAR2 DEFAULT ''lv_result'',',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE',
'    ) ',
'    is ',
'    begin ',
'        for c_cur in (',
'            SELECT SYNONYM_NAME from table(get_APEX_Packages_List)',
'            order by SYNONYM_NAME',
'        ) loop ',
'            DBMS_OUTPUT.PUT_LINE (''-- Enabled package '' || c_cur.SYNONYM_NAME);',
'            begin ',
'            Enable(',
'                p_Package_Name=>c_cur.SYNONYM_NAME, ',
'                p_Logging_Start_Enabled => p_Logging_Start_Enabled,',
'                p_Logging_Start_Call => p_Logging_Start_Call,',
'                p_Logging_Finish_Call => p_Logging_Finish_Call,',
'                p_Logging_API_Call => p_Logging_API_Call,',
'                p_Variable_Name => p_Variable_Name,',
'                p_Use_Dbms_Output=>p_Use_Dbms_Output,',
'                p_Do_Execute=>p_Do_Execute);',
'            exception',
'                when others then',
'                   DBMS_OUTPUT.PUT_LINE (''-- Errors with ''|| c_cur.SYNONYM_NAME || '' : '' || SQLERRM);',
'            end;',
'        end loop;',
'    end Enable_APEX;',
'  ',
'    PROCEDURE Disable (',
'        p_Package_Name IN VARCHAR2,',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE',
'    )',
'    IS ',
'        v_result_str VARCHAR2(32767);',
'        v_Synonym_Text VARCHAR2(32767);',
'        v_Count NUMBER;',
'    BEGIN',
'        DBMS_OUTPUT.ENABLE(NULL);',
'        -- test for existance ',
'        SELECT COUNT(*) ',
'        INTO v_Count ',
'        FROM SYS.ALL_OBJECTS',
'        WHERE OBJECT_TYPE = ''PACKAGE''',
'        AND OWNER = p_Dest_Schema',
'        AND OBJECT_NAME = p_Package_Name;',
'        if v_Count = 0 then ',
'              RAISE_APPLICATION_ERROR(-20002, ''The package '' || p_Package_Name || '' could not be found.'');',
'        end if;',
'        ',
'        v_Synonym_Text := Get_Package_Synonym_Text(p_Package_Name=>p_Package_Name);',
'',
'        -- produce revoke and drop for dependent objects',
'        v_result_str := ''DROP PACKAGE ''||p_Dest_Schema||''.''||p_Package_Name;',
'        if p_Use_Dbms_Output then',
'            DBMS_OUTPUT.PUT_LINE (v_result_str||'';'');',
'        end if;',
'        if p_Do_Execute then',
'            EXECUTE IMMEDIATE v_result_str;',
'        end if;',
'        for c_cur in (',
'            -- remove local synonyms that where created to suport the dropped package.',
'            select DISTINCT ''DROP SYNONYM '' || SYN.owner || ''.'' || Syn.synonym_Name DROP_STAT ',
'            from SYS.All_Synonyms SYN, -- local supporting synonyms ',
'                SYS.ALL_SYNONYMS ORI,   -- public synonym to the original package',
'                SYS.ALL_DEPENDENCIES DEP -- dependencies on the public synonym',
'            where SYN.Table_Owner = Dep.referenced_Owner',
'            and SYN.Table_Name = Dep.referenced_Name',
'            and ORI.Table_Owner = Dep.Owner',
'            AND ORI.Table_Name = Dep.Name',
'            and SYN.Owner = p_Dest_Schema',
'            and ORI.Owner = ''PUBLIC''',
'            and ORI.Synonym_Name = p_Package_Name',
'            and not exists (',
'                select 1 -- no dependencies on the local supporting synonym',
'                from SYS.ALL_DEPENDENCIES LD ',
'                where LD.referenced_Owner = SYN.owner',
'                AND LD.referenced_Name = SYN.synonym_Name',
'                and LD.referenced_Type = ''SYNONYM''',
'                and LD.Owner = SYN.owner',
'            )',
'        ) loop ',
'            if p_Use_Dbms_Output then',
'                DBMS_OUTPUT.PUT_LINE (c_cur.DROP_STAT||'';'');',
'            end if;',
'            if p_Do_Execute then',
'                EXECUTE IMMEDIATE c_cur.DROP_STAT;',
'            end if;',
'        end loop;',
'        ',
'        -- eventually, recreate local synonym.',
'        if v_Synonym_Text IS NOT NULL AND INSTR(v_Synonym_Text, ''PUBLIC'') != 1 then ',
'            v_Synonym_Text := ''CREATE '' || v_Synonym_Text;',
'            if p_Use_Dbms_Output then',
'                DBMS_OUTPUT.PUT_LINE (v_Synonym_Text||'';'');',
'            end if;',
'            if p_Do_Execute then',
'                EXECUTE IMMEDIATE v_Synonym_Text;',
'            end if;   ',
'        end if;',
'    END Disable;',
'',
'    PROCEDURE Disable_APEX (',
'        p_Dest_Schema  IN VARCHAR2 DEFAULT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA''),',
'        p_Use_Dbms_Output BOOLEAN DEFAULT TRUE,',
'        p_Do_Execute BOOLEAN DEFAULT TRUE',
'    )',
'    is',
'    begin ',
'        for c_cur in (',
'            select SYNONYM_NAME from table(get_APEX_Packages_List) SYN',
'            where exists (',
'                select 1 ',
'                from SYS.ALL_OBJECTS OBJ ',
'                where OBJ.object_Name = SYN.SYNONYM_NAME',
'                and OBJ.owner = p_Dest_Schema',
'            )',
'            order by SYNONYM_NAME',
'        ) loop ',
'            DBMS_OUTPUT.PUT_LINE (''-- disabled package '' || c_cur.SYNONYM_NAME);',
'            begin ',
'                Disable(',
'                    p_Package_Name=>c_cur.SYNONYM_NAME, ',
'                    p_Dest_Schema=>p_Dest_Schema,',
'                    p_Use_Dbms_Output=>p_Use_Dbms_Output,',
'                    p_Do_Execute=>p_Do_Execute);',
'            exception',
'                when others then',
'                   DBMS_OUTPUT.PUT_LINE (''-- Errors with ''|| c_cur.SYNONYM_NAME || '' : '' || SQLERRM);',
'            end;',
'        end loop;',
'    end Disable_APEX;',
'END package_tracer;',
'/',
'',
'/*',
'',
'- Examples:',
'GRANT EXECUTE ON APEX_190100.WWV_FLOW_SECURITY TO HR_DATA;',
'',
'set serveroutput on size unlimited',
'call package_tracer.Enable(''APEX_LANG'');',
'call package_tracer.Enable(''APEX_UTIL'');',
'',
'call package_tracer.Disable(''APEX_LANG'');',
'call package_tracer.Disable(''APEX_UTIL'');',
'',
'select * from table(package_tracer.Dyn_Log_Call_List (''APEX_LANG''));',
'',
'*/'))
);
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
