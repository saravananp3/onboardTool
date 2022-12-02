update decom3sixtytool.opportunity_info_template_details set options=',Archive,Decommission,Archive+Decommission' where column_name='request_type';
update decom3sixtytool.triage_info_template_details set options =',Yes,No' where column_name='funding_Avl';
update decom3sixtytool.triage_info_template_details set options =',Yes,No' where column_name='infrastructure_impact';
update decom3sixtytool.triage_info_template_details set options =',Yes,No' where column_name='archival_Sol';
update decom3sixtytool.triage_info_template_details set options =',Replace,Retire,Combine,Other' where column_name='rationalization_type';
update decom3sixtytool.triage_info_template_details set options =',Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name='appPlatfrm';

update Assessment_Data_Char_Info_Template_Details set options = ',DB2, MS SQL, MySQL, Oracle, Sybase, Other' where column_name ='DatabaseType';
update Assessment_Data_Char_Info_Template_Details set options = ',Flat File, Structured, Unstructured, Hybrid, Other' where column_name ='DataTypeCharacteristics';
update Assessment_Archival_Consumption_Info_Template_Details set options = ',Frequent users with Online Inquiry, Retention for Audit purposes, Ad-hoc reporting, Long-term Retention Only' where column_name ='archiveneed';
update Assessment_Application_Info_Template_Details set options = ',COTS - Commercial Off The Shelf,MOTS - Modified Off The Shelf,Custom - In-house Development' where column_name = 'AppDetails';
update Assessment_Application_Info_Template_Details set options = ',Currently supported, Nearing end of life, End of life with extended support/maintenance, unsupported' where column_name = 'Lifecycle';
update Assessment_Application_Info_Template_Details set options = ',Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name = 'AssessAppPlatform';

update ArchiveReq_LegacyApp_Template_Details set options = ',Internal,Third Party' where column_name = 'thirdpartyvendor';
update ArchiveReq_LegacyApp_Template_Details set options = ',Structured,Unstructured, Hybrid' where column_name = 'datachar';


update decom3sixtytool.opportunity_info_details set options=',Archive,Decommission,Archive+Decommission' where column_name='request_type';
update decom3sixtytool.opportunity_info set options=',Archive,Decommission,Archive+Decommission' where column_name='request_type';


update decom3sixtytool.opportunity_info set value='Archive+Decommission' where column_name='request_type' and value='To be Retire';

update decom3sixtytool.opportunity_info_details set value='Archive+Decommission' where column_name='request_type' and value='To be Retire';




