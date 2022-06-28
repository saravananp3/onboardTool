/* Opportunity_Info_Template_Details */
SELECT * FROM decom3sixtytool.Opportunity_Info_Template_Details;
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Business Unit' where column_name='buisnessunit';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Business Segment' where column_name='buisnesssegment';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set options='EMR System,ERP Data,Financial Data,Healthcare Data,HR Data,MR/HR Data,Other Data' where column_name='date_type';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Please describe your needs for archival and decommission service' where column_name='arcdecomm';


/* Triage_Info_Template_Details */
select * from decom3sixtytool.Triage_Info_Template_Details;
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Business Segment' where column_name='business_Segment';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Program or Segment Contact' where column_name='segment_contact';
update `decom3sixtytool`.`Triage_Info_Template_Details` set options='Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name='appPlatfrm';

/* Assessment_Data_Char_Info_Template_Details */
select * from decom3sixtytool.Assessment_Data_Char_Info_Template_Details;
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set label_name='Data is in Read Only State (no updates can be made)' where column_name='ReadonlyData';
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set label_name='Are there any datasets on mainframe  that this application uses?' where column_name='DataSetMainframe';
update `decom3sixtytool`.`Assessment_Data_Char_Info_Template_Details` set label_name='If yes, please describe ' where column_name='plsdescribeStreams';

/* Assessment_Application_Info_Template_Details */
select * from decom3sixtytool.Assessment_Application_Info_Template_Details;
update `decom3sixtytool`.`Assessment_Application_Info_Template_Details` set options='Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name='AssessAppPlatform';

/* Opportunity_Info_Details */
SELECT * FROM decom3sixtytool.Opportunity_Info_Details;
update `decom3sixtytool`.`Opportunity_Info_Details` set label_name='Business Unit' where column_name='buisnessunit';
update `decom3sixtytool`.`Opportunity_Info_Details` set label_name='Business Segment' where column_name='buisnesssegment';
ALTER TABLE decom3sixtytool.Opportunity_Info_Details ADD usermandatoryflag varchar(255);

/* Opportunity_Info */
SELECT * FROM decom3sixtytool.Opportunity_Info;
update `decom3sixtytool`.`Opportunity_Info` set label_name='Business Unit' where column_name='buisnessunit';
update `decom3sixtytool`.`Opportunity_Info` set label_name='Business Segment' where column_name='buisnesssegment';
ALTER TABLE decom3sixtytool.Opportunity_Info ADD usermandatoryflag varchar(255);

/* Triage_Info */
ALTER TABLE decom3sixtytool.Triage_Info ADD usermandatoryflag varchar(255);

/* Triage_Summary_Info */
ALTER TABLE decom3sixtytool.Triage_Summary_Info ADD usermandatoryflag varchar(255);

/* Assessment_Data_Char_Info */
select * from decom3sixtytool.Assessment_Data_Char_Info;
update `decom3sixtytool`.`Assessment_Data_Char_Info` set label_name='Data is in Read Only State (no updates can be made)' where column_name='ReadonlyData';
update `decom3sixtytool`.`Assessment_Data_Char_Info` set label_name='Are there any datasets on mainframe  that this application uses?' where column_name='DataSetMainframe';
update `decom3sixtytool`.`Assessment_Data_Char_Info` set label_name='If yes, please describe ' where column_name='plsdescribeStreams';
ALTER TABLE decom3sixtytool.Assessment_Data_Char_Info ADD isCompleted varchar(45) NULL DEFAULT 'No',ADD usermandatoryflag varchar(255);

/* Assessment_Application_Info */
select * from decom3sixtytool.Assessment_Application_Info;
update `decom3sixtytool`.`Assessment_Application_Info` set options='Mainframe,Distributed - Unix,Windows,hybrid,Others' where column_name='AssessAppPlatform';
ALTER TABLE decom3sixtytool.Assessment_Application_Info ADD isCompleted varchar(45) NULL DEFAULT 'No',ADD usermandatoryflag varchar(255);

/* Assessment_Compliance_Char_Info */
ALTER TABLE decom3sixtytool.Assessment_Compliance_Char_Info ADD isCompleted varchar(45) NULL DEFAULT 'No',ADD usermandatoryflag varchar(255);

/* Assessment_Archival_Consumption_Info */
ALTER TABLE decom3sixtytool.Assessment_Archival_Consumption_Info ADD usermandatoryflag varchar(255);

/* Assessment_Contract_Info */
ALTER TABLE decom3sixtytool.Assessment_Contract_Info ADD isCompleted varchar(45) NULL DEFAULT 'No',ADD usermandatoryflag varchar(255);