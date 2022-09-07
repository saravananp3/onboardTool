/* Opportunity_Info_Template_Details */
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Business Unit' where column_name='buisnessunit';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Business Segment' where column_name='buisnesssegment';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set options='EMR System,ERP Data,Financial Data,Healthcare Data,HR Data,MR/HR Data,Other Data' where column_name='date_type';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Please describe your needs for archival and decommission service' where column_name='arcdecomm';

/* Triage_Info_Template_Details */
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Business Segment' where column_name='business_Segment';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Program or Segment Contact' where column_name='segment_contact';
update `decom3sixtytool`.`Triage_Info_Template_Details` set options='Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name='appPlatfrm';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='EDR Analyst' where column_name='decomAnalyst';

/* Triage_Info */
update `decom3sixtytool`.`triage_info` set label_name='EDR Analyst' where column_name='decomAnalyst';

/* Assessment_Data_Char_Info_Template_Details */
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set label_name='Data is in Read Only State (no updates can be made)' where column_name='ReadonlyData';
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set label_name='Are there any datasets on mainframe  that this application uses?' where column_name='DataSetMainframe';
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set label_name='If yes, please describe ' where column_name='plsdescribeStreams';

/* Assessment_Application_Info_Template_Details */
update `decom3sixtytool`.`Assessment_Application_Info_Template_Details` set options='Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name='AssessAppPlatform';
update `decom3sixtytool`.`Assessment_Application_Info_Template_Details` set mandatory='No' where column_name='OtherPleaseDescribe';
update `decom3sixtytool`.`Assessment_Application_Info_Template_Details` set mandatory='No' where column_name='BriefArchitectureDescription';
update `decom3sixtytool`.`Assessment_Application_Info` set mandatory='No' where column_name='OtherPleaseDescribe';
update `decom3sixtytool`.`Assessment_Application_Info` set mandatory='No' where column_name='BriefArchitectureDescription';

/* Opportunity_Info_Details */
update `decom3sixtytool`.`Opportunity_Info_Details` set label_name='Business Unit' where column_name='buisnessunit';
update `decom3sixtytool`.`Opportunity_Info_Details` set label_name='Business Segment' where column_name='buisnesssegment';

/* Opportunity_Info */
update `decom3sixtytool`.`Opportunity_Info` set label_name='Business Unit' where column_name='buisnessunit';
update `decom3sixtytool`.`Opportunity_Info` set label_name='Business Segment' where column_name='buisnesssegment';

/* Assessment_Data_Char_Info */
update `decom3sixtytool`.`Assessment_Data_Char_Info` set label_name='Data is in Read Only State (no updates can be made)' where column_name='ReadonlyData';
update `decom3sixtytool`.`Assessment_Data_Char_Info` set label_name='Are there any datasets on mainframe  that this application uses?' where column_name='DataSetMainframe';
update `decom3sixtytool`.`Assessment_Data_Char_Info` set label_name='If yes, please describe ' where column_name='plsdescribeStreams';
update `decom3sixtytool`.`Assessment_Data_Char_Info` set mandatory='No',options=',PCI,SOX,Consumer PII,Customer PII,Associate PII,SSN,None' where column_name='ApplicationData';
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set mandatory='No',options=',PCI,SOX,Consumer PII,Customer PII,Associate PII,SSN,None' where column_name='ApplicationData';

/* Assessment_Application_Info */
update `decom3sixtytool`.`Assessment_Application_Info` set options='Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name='AssessAppPlatform';

/* Users Group Update For D3Sixty */
UPDATE `decom3sixtytool`.`users`SET u_role = REPLACE(u_role, 'DECOM', 'D3SIXTY') WHERE u_role like'%DECOM%';

/* archive_retentionlegalreq_template_details */
update decom3sixtytool.archive_retentionlegalreq_template_details set descp="Data from the application must be retained based on Company's Retention Policy and should be set at the:Application Level,Table Level,Record Level" where reqId='FR-R-001';
update decom3sixtytool.archive_retentionlegalreq_template_details set descp="Current Legal hold on the application data will be applied to the application's archived data to override the Retention schedule." where reqId='FR-R-002';

/* archive_retentionlegalreq_info */
update decom3sixtytool.archive_retentionlegalreq_info set descp="Data from the application must be retained based on Company's Retention Policy and should be set at the:Application Level,Table Level,Record Level" where descp="Data from the application must be retained based on Company�s Retention Policy and should be set at the:Application Level,Table Level,Record Level";
update decom3sixtytool.archive_retentionlegalreq_info set descp="Current Legal hold on the application data will be applied to the application's archived data to override the Retention schedule." where descp="Current Legal hold on the application data will be applied to the application�s archived data to override the Retention schedule.";

/* archive_securityreq_template_details */
update decom3sixtytool.archive_securityreq_template_details set reqType='Access - End User' where reqType='Access � End User';
update decom3sixtytool.archive_securityreq_template_details set reqType='Access - Unauthorized Login' where reqType='Access � Unauthorized Login';
update decom3sixtytool.archive_securityreq_template_details set reqType='Access - Company Code' where reqType='Access � Company Code';

/* archive_securityreq_info */
update decom3sixtytool.archive_securityreq_info set reqType='Access - End User' where reqType='Access � End User';
update decom3sixtytool.archive_securityreq_info set reqType='Access - Unauthorized Login' where reqType='Access � Unauthorized Login';
update decom3sixtytool.archive_securityreq_info set reqType='Access - Company Code' where reqType='Access � Company Code';

/* User Group Column Alter Statement */
ALTER TABLE decom3sixtytool.users ADD COLUMN u_group VARCHAR(255) AFTER u_pwd;

/* User Mandatory DeleteFlag Alter Statement */
ALTER TABLE decom3sixtytool.Opportunity_Info_Details ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.Opportunity_Info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.triage_info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.triage_summary_info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.assessment_application_info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.assessment_data_char_info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.assessment_compliance_char_info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.assessment_archival_consumption_info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.assessment_contract_info ADD usermandatoryflag varchar(255);
ALTER TABLE decom3sixtytool.archivereq_legacyapp_info ADD usermandatoryflag varchar(255);

/* Create Index for Plan & Priority */
CREATE INDEX column_name ON decom3sixtytool.opportunity_info(column_name,value);
CREATE INDEX phaseName ON decom3sixtytool.phase_info(phaseName);
CREATE INDEX waveName ON decom3sixtytool.governance_info(waveName);

update `decom3sixtytool`.`assessment_compliance_char_info` set mandatory='No',options=',On Hold,Pending review,Cleared,N/A' where column_name='legalstatus';
update `decom3sixtytool`.`Assessment_Compliance_Char_Info_Template_Details` set mandatory='No',options=',On Hold,Pending review,Cleared,N/A' where column_name='legalstatus';

