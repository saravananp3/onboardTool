SELECT * FROM decom3sixtytool.Opportunity_Info_Template_Details;

update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Business Unit' where label_name='Buisness Unit';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Business Segment' where label_name='Buisness Segment';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='EMR System,ERP Data,Financial Data,Healthcare Data,HR Data,MR/HR Data,Other Data' where label_name='EMR System,ERP Data,Financial Data,HealthCare Data,HR Data,MR/HR Data,Other Data';
update `decom3sixtytool`.`Opportunity_Info_Template_Details` set label_name='Please describe your needs for archival and decommission service' where label_name='Please describe your needs for Archival and Decommission Service';

select * from decom3sixtytool.Triage_Info_Template_Details;
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Business Segment' where label_name='Business Segement';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Program or Segment Contact' where label_name='Program or Segement Contact';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Mainframe,Distributed - Unix,Windows,hybrid,Others' where label_name='Mainframe,Distibuted - Unix,Windows,hybrid,Others';

select * from decom3sixtytool.Assessment_Data_Char_Info_Template_Details;
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Mainframe,Distributed - Unix,Windows,hybrid,Others' where label_name='Mainframe,Distibuted - Unix,Windows,hybrid,Others';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Data is in Read Only State (no updates can be made)' where label_name='Data is in Read Only state (no updates CAN be made)';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='Are there any datasets on mainframe  that this application uses?' where label_name='Are there any datasets on Mainframe  that this application uses?';
update `decom3sixtytool`.`Triage_Info_Template_Details` set label_name='please describe' where label_name='please decsribe';

select * from decom3sixtytool.Assessment_Application_Info_Template_Details;
update `decom3sixtytool`.`Assessment_Application_Info_Template_Details` set options='Mainframe,Distributed - Unix,Windows,hybrid,Others' where options='Mainframe,Distibuted - Unix,Windows,hybrid,Others';