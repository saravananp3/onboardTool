/* Triage_Info_Template_Details */
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='EDR Analyst' where column_name='decomAnalyst';

/* Triage_Info */
update `decom3sixtytool`.`triage_info` set label_name='EDR Analyst' where column_name='decomAnalyst';

/* Assessment_Application_Info_Template_Details */
update `decom3sixtytool`.`Assessment_Application_Info_Template_Details` set mandatory='No' where column_name='BriefArchitectureDescription';
update `decom3sixtytool`.`Assessment_Application_Info` set mandatory='No' where column_name='BriefArchitectureDescription';

/* Assessment_Data_Char_Info */
update `decom3sixtytool`.`Assessment_Data_Char_Info` set mandatory='No',options=',PCI,SOX,Consumer PII,Customer PII,Associate PII,SSN,None' where column_name='ApplicationData';
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set mandatory='No',options=',PCI,SOX,Consumer PII,Customer PII,Associate PII,SSN,None' where column_name='ApplicationData';

/* assessment_compliance_char_info */
update `decom3sixtytool`.`assessment_compliance_char_info` set mandatory='No',options=',On Hold,Pending review,Cleared,N/A' where column_name='legalstatus';
update `decom3sixtytool`.`Assessment_Compliance_Char_Info_Template_Details` set mandatory='No',options=',On Hold,Pending review,Cleared,N/A' where column_name='legalstatus';

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
