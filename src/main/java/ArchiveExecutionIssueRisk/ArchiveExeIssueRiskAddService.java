package ArchiveExecutionIssueRisk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import com.google.gson.JsonObject;
import onboard.DBconnection;

public class ArchiveExeIssueRiskAddService {
	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	String oppName;
	public ArchiveExeIssueRiskAddService(int SeqNum,String Id, String oppName) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
		 this.oppName = oppName;
	}

	public JsonObject AddRow()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean statusFlag = false;

    		String approvalId = generateRandomApprovalId();
			  String StakeHolderInsertQuery = "insert into ArchiveExe_Issue_Info (seq_no, app_Id,impact, type, description, start_date, raised_by, status, assigned_to, resolved, exp_date, end_date, comments,oppId,IssueId) "
			  		+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, SeqNum+1);
	          prestmt.setString(2, approvalId);
	          prestmt.setString(3, "MEDIUM");
	          prestmt.setString(4, "ISSUE");
	          prestmt.setString(5, "");
	          prestmt.setString(6, "");
	          prestmt.setString(7, "");
	          prestmt.setString(8, "");
	          prestmt.setString(9, "");
	          prestmt.setString(10, "OPEN");
	          prestmt.setString(11, "");
	          prestmt.setString(12, "");
	          prestmt.setString(13, "");
	          prestmt.setString(14, Id);
	          prestmt.setString(15, "");
	          prestmt.execute();
	          statusFlag =true;
			
			jsonObject.addProperty("AddStatus", statusFlag);
		//	jsonObject.addProperty("id", approvalId);
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}
	
		
	protected void finalize() throws Throwable {
      con.close();
      System.out.println("Db connection Closed");
	}
	
public String generateRandomApprovalId() throws SQLException {
		
		String uniqueID = "";
		boolean checkTermination = true;
		
		while(checkTermination) {
		
			uniqueID = UUID.randomUUID().toString();
			System.out.println("App Id : " + uniqueID);
			
			boolean checkDupilcateId = checkDuplicateApprovalId(uniqueID);
		
			if(checkDupilcateId == false) {
				checkTermination = false;
				}
		}
		
		return uniqueID;
	}
		
	public boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
		
		boolean checkDuplicate = false;
		
		String selectQuery = "select * from ArchiveExe_Issue_Info order by seq_no;";
		Statement state = con.createStatement();
		ResultSet result = state.executeQuery(selectQuery);
		
		while(result.next()) {
			String checkApprovalId = result.getString("app_id");
			if(checkApprovalId == uniqueID) {
				checkDuplicate = true;
			}	
		}
		return checkDuplicate;
	}



}
