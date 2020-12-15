package NewArchiveRequirements.archiveRequirementReview.service;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import NewArchiveRequirements.Introduction.service.ApproverRoles_Service;
import NewArchiveRequirements.Introduction.service.archiveReqIntroDataRetrieveService;
import NewArchiveRequirements.Introduction.service.archiveReqIntroRolesResponseTemplateService;
import NewArchiveRequirements.LegacyApplicationInfo.ArchiveEnvironmentInfo.Service.archiveEnvironmentNameDataRetrieveService;
import NewArchiveRequirements.LegacyApplicationInfo.Service.LegacyAppInfoService;
import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveReqLegacyDataRetrieveService;
import NewArchiveRequirements.LegacyApplicationInfo.retentionDetails.Service.archiveRetentionDataRetrieve;
import NewArchiveRequirements.addendumInfo.service.archiveReqAddendumDataRetrieveService;
import NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service.businessReqDataRetrieveService;
import NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service.businessReqInScopeService;
import NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service.archiveFunctionDataRetrieveService;
import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqDataRetrieveService;
import NewArchiveRequirements.documentRevisions.service.archiveReqDocRevDataRetrieveService;
import onboard.DBconnection;

public class archiveReqReviewService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	String OppName;
	public archiveReqReviewService(String Id,String OppName) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.OppName = OppName;
	}
public JsonArray archiveReqReviewDataRetrieve(){
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			// archive Requirement introduction page Data retrieve
			JsonArray JsonArray = new JsonArray();
			archiveReqIntroDataRetrieveService archiveReqIntro = new archiveReqIntroDataRetrieveService(Id);
			JsonArray.add(archiveReqIntro.archiveReqDataRetrieve());
			//archiveReqIntro.con.close();
			archiveReqIntroRolesResponseTemplateService archiveReqIntroObj = new archiveReqIntroRolesResponseTemplateService(Id,OppName);
 			JsonArray.add(archiveReqIntroObj.archiveReqIntroRolesResponseDataRetrieve());
			jsonArray.add(JsonArray);
			
			// archive Requirement legacy app info details
			JsonArray = new JsonArray();
			archiveReqLegacyDataRetrieveService Appinfo = new archiveReqLegacyDataRetrieveService(Id, OppName);
			JsonArray.add(Appinfo.archiveReqLegacyTemplateToArchiveReqLegacyInfo());
		    //Appinfo.con.close();
		    
		    archiveEnvironmentNameDataRetrieveService EnvmtName = new archiveEnvironmentNameDataRetrieveService(Id, OppName);
			JsonArray.add(EnvmtName.archiveEnvmtDataRetrieve());
			//EnvmtName.con.close();
			JsonArray.add(getUploadedScreenShotNameList());
			jsonArray.add(JsonArray);
			
			// archive Requirement Retention Details
			archiveRetentionDataRetrieve retentionDetails = new archiveRetentionDataRetrieve(Id, OppName);
			jsonArray.add(retentionDetails.archiveRetentionDataRetrieveService());
			//retentionDetails.con.close();
			
			// archive Requirement  Business Req Details
			businessReqInScopeService businesssreqscope = new businessReqInScopeService(Id,OppName);
 			jsonArray.add(businesssreqscope.BusinessRequirementsDataRetrieve());
 			//businesssreqscope.con.close();
 			
 			//archive Requirement  Business Req Contact Info Details
 			businessReqDataRetrieveService archivebusReq = new businessReqDataRetrieveService(Id);
			jsonArray.add(archivebusReq.archiveReqDataRetrieve());
 			
			JsonArray = new JsonArray();
 			String[] tableNamesFunctionReq = {"Archive_DataReq_Info","Archive_RetentionLegalReq_Info","Archive_SecurityReq_Info","Archive_UsabilityReq_Info","Archive_AuditReq_Info"};
 	    	for(int index=0;index<tableNamesFunctionReq.length;index++)
 	    	{
 	    		archiveFunctionDataRetrieveService dataReqDetails;
 				try {
 					dataReqDetails = new archiveFunctionDataRetrieveService(Id, OppName,tableNamesFunctionReq[index]);
 					JsonArray.add(dataReqDetails.archiveFunctionDataRetrieve());
 					//dataReqDetails.con.close();
 				} catch (ClassNotFoundException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				} catch (SQLException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				}
 	    	}
 	    	
 	    	jsonArray.add(JsonArray);
 	    	JsonArray = new JsonArray();
 	    	archiveScreenReqDataRetrieveService ScreenReq = new archiveScreenReqDataRetrieveService(Id);
			JsonArray.add(ScreenReq.archiveScreenInfoDataRetrieve());
			JsonArray.add(ScreenReq.searchFormDataRetrieve());
			jsonArray.add(JsonArray);
			//ScreenReq.con.close();
			
			// document revision 
			
			archiveReqDocRevDataRetrieveService docRevData = new archiveReqDocRevDataRetrieveService(Id, OppName);
			jsonArray.add(docRevData.archiveReqDocDataRetrieve());
            //docRevData.con.close();
            
            // addendum
            
            archiveReqAddendumDataRetrieveService addendumRevData = new archiveReqAddendumDataRetrieveService(Id, OppName);
			jsonArray.add(addendumRevData.archiveReqAddendumDataRetrieve());
			//addendumRevData.con.close();
			
			//over all status
		    jsonArray.add(getOverAllApproval());	
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	private JsonObject getUploadedScreenShotNameList()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			
			String path = "S:\\Decom3Sixty\\Screenshot\\Files\\DecommRequirements\\LegacyApplicationScreenshots"+File.separator+Id;
			File screenShot = new File(path);
			
			File[] files =screenShot.listFiles();
			String fileList = "";
			if(files!=null)
			for(File f: files)
			{
				fileList+=f.getName()+",";
			}
			
			jsonObject.addProperty("listOfScreenShots",(files!=null)?fileList.substring(0,fileList.length()-1):"");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}
	public JsonObject getOverAllApproval()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkOverAllApproval= false;
			String selectQuery ="select * from module_approval_info where OppId='"+Id+"' and moduleName='Archive_Requirement'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next())
				checkOverAllApproval = rs.getBoolean("overAllApproval");
		  jsonObject.addProperty("checkOverAllStatus",checkOverAllApproval);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}

	
}
