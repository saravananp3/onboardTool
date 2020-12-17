package IntakeDetails.IntakeApproval.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import onboard.DBconnection;

public class IntakeApprovalService {

DBconnection dBconnection =null;
	
	Connection con = null;
	
	public String Id = null;
	
	public IntakeApprovalService(String Id) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		
	}
	
	public boolean IntakeApprovalUpdate(String IntakeApproval, int seq_no) {
	
		boolean check = false;
		
		try
		{
			dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
			String UpdateQuery ="update intake_stake_holder_info set intakeApproval ='"+IntakeApproval+"' where oppid='"+Id+"' and seq_no = '"+seq_no+"' ";
            Statement st = con.createStatement();
            st.executeUpdate(UpdateQuery);
            st.close();
            check=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return check;
	}
	
	public boolean checkIntakeStakeHolderApprovalInfo() {
		
		boolean checkStatus = true;
		
		try {
		
			String selectQuery = "select * from Intake_Stake_Holder_Info where OppId = '"+Id+"' order by seq_no;";
			Statement st1 =con.createStatement();
			ResultSet rs1 = st1.executeQuery(selectQuery);
			
			while(rs1.next()) {
				
				String intakeApprovalValue = rs1.getString("intakeApproval");
				if(!intakeApprovalValue.equals("Approved"))
					checkStatus = false;
				
			}	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return checkStatus;
	}
	
	public void IntakeApprovalModuleInfo() {
		
		boolean checkStatus = checkIntakeStakeHolderApprovalInfo();
		int seq_num = getSequenceNumber();
		
		try {
				String selectQuery = "select * from Module_Approval_Info where OppId = '"+Id+"' and moduleName ='Intake' order by seq_no;";
				Statement st =con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				if(rs.next()) {
					String UpdateQuery ="update Module_Approval_Info set overAllApproval ='"+checkStatus+"' where oppid='"+Id+"' and moduleName = 'Intake' ";
		            Statement st1 = con.createStatement();
		            st1.executeUpdate(UpdateQuery);
				}
				else {
					String insertQuery = "insert into Module_Approval_Info (seq_no, OppId, moduleName, overAllApproval)" + "values (?, ?, ?, ?);";
					PreparedStatement prestmt = con.prepareStatement(insertQuery);
			          prestmt.setInt(1, seq_num+1);
			          prestmt.setString(2, Id);
			          prestmt.setString(3, "Intake");
			          prestmt.setString(4, Boolean.toString(checkStatus));
			          prestmt.execute();
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
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
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return seq_num;
    }
	
	 protected void finalize() throws Throwable 
	    { 
			System.out.println("Db connection closed.");
	        con.close();
	    }
	
}
