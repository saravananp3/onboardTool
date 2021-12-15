package NewArchiveRequirements.ApprovalInfo.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveReqApprovalSaveService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	String approvalStatus;
	int seqNum;
	String OppName;
	public archiveReqApprovalSaveService(int seqNum,String Id,String OppName,String approvalStatus) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.approvalStatus = approvalStatus;
		 this.seqNum = seqNum;
		 
	}
	
	public JsonObject approvalSave()
	{
		boolean statusFlag = false;
		JsonObject jsonObject = new JsonObject();
		try
		{
		   String updateQuery = "update ArchiveRequirements_Stake_Holder_Info set ArchiveRequirementApproval ='"+approvalStatus+"'  where oppid='"+Id+"' and seq_no='"+seqNum+"';";
		   Statement st =  con.createStatement();
		   st.executeUpdate(updateQuery);
		   statusFlag =true;
		   jsonObject.addProperty("statusFlag",statusFlag);
		   checkAndUpdateOverallApproval();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}
	 
	private boolean checkAndUpdateOverallApproval()
	{
		boolean checkOverallStatus = true;
		try
		{
			int seq_num = getSequenceNumber()+1;
			String checkQuery = "select * from ArchiveRequirements_Stake_Holder_Info where oppId='"+Id+"'";
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(checkQuery);
			while(rs1.next())
			{
				if(!rs1.getString("ArchiveRequirementApproval").equals("Approved"))
					checkOverallStatus = false;
			}
			
			String selectQuery = "select * from module_approval_info where oppId='"+Id+"' and moduleName = 'Archive_Requirement';";
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(selectQuery);
			if(rs2.next()) {
				String UpdateQuery ="update Module_Approval_Info set overAllApproval ='"+checkOverallStatus+"' where oppid='"+Id+"' and moduleName = 'Archive_Requirement' ";
	            Statement st3 = con.createStatement();
	            st3.executeUpdate(UpdateQuery);
	            st3.close();
			}
			else {
				String insertQuery = "insert into Module_Approval_Info (seq_no, OppId, moduleName, overAllApproval)" + "values (?, ?, ?, ?);";
				PreparedStatement prestmt = con.prepareStatement(insertQuery);
		          prestmt.setInt(1, seq_num);
		          prestmt.setString(2, Id);
		          prestmt.setString(3, "Archive_Requirement");
		          prestmt.setString(4, Boolean.toString(checkOverallStatus));
		          prestmt.execute();
		          prestmt.close();
			}
			rs2.close();
			st2.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return checkOverallStatus;
	}
	
	private int getSequenceNumber()
    {
    	int seq_num =0;
		try
		{
		String MaxSeqNumQuery = "select max(seq_no) from Module_Approval_Info where OppId ='"+Id+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(MaxSeqNumQuery);
		if(rs.next())
		seq_num = rs.getInt(1);
		rs.close();
		st.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return seq_num;
    }
	
	protected void finalize() throws Throwable {
		con.close();
		System.out.println("Db connection closed.");
	}
}
