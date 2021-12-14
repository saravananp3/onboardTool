package IntakeDetails.IntakePreviewDetails.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import IntakeDetails.IntakeOpportunity.Service.IntakeOpportunityService;
import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import onboard.DBconnection;

public class IntakePreviewDetailsService {
	
	    DBconnection dBconnection =null;
		Connection con = null;
		private String username;
		private String oppId;
		
		public IntakePreviewDetailsService(String oppId,String username) throws ClassNotFoundException, SQLException {
			dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
			this.oppId = oppId;
			this.username = username;
		}
		
		public JsonArray IntakePreviewDataRetrieve(String Id) throws ClassNotFoundException, SQLException {
		JsonArray jsonArray = new JsonArray();
		IntakeStakeHolderService intakeStake =  new IntakeStakeHolderService();
		try {
			
			jsonArray.add(IntakeOpportunityService.IntakeOpportunityDataRetrieveService(Id));
			jsonArray.add(new IntakeTriageService().DataRetrieve(Id));
			jsonArray.add(new IntakeTriageSummaryService().DataRetrieve(Id));
			jsonArray.add(new IntakeAssessmentService().DataRetrieve(Id));
			jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,"","",false));
			jsonArray.add(getCurrentUserApproverId());
			jsonArray.add(CheckOverallApproval(Id));
			
			intakeStake = null;
			System.gc();
		}
		
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception--------[info]----------"+e);
		}
		
		return jsonArray;
		
	}
		
	private JsonObject getCurrentUserApproverId() {
		JsonObject approverId = null;
		try {
		   	approverId = new JsonObject();
		   	String selectQuery = "select * from intake_stake_holder_info  where oppId='"+oppId+"' and username ='"+username+"'";
		   	Statement st = con.createStatement();
		   	ResultSet rs = st.executeQuery(selectQuery);
		   	if(rs.next()) {
		   		approverId.addProperty("a_id", rs.getString("approvalId"));
		   	}
		   	st.close();
		   	rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return approverId;
	}
	private JsonObject CheckOverallApproval(String Id)
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkOverallApproval = false;
			String SelectQuery="Select * from module_approval_info where oppid='"+Id+"' and moduleName='Intake' ";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(SelectQuery);
			if(rs.next())
			{
				checkOverallApproval = Boolean.parseBoolean(rs.getString(4));
			}
			rs.close();
			st.close();
			jsonObject.addProperty("CheckExistence",checkOverallApproval);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}

}
