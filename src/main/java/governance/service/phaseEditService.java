package governance.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;

import onboard.DBconnection;

public class phaseEditService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	String labelName;
	int seqNum;
	String tableName;
	String idWhereCond;
	String idAndCond;
	String id;
	public phaseEditService(String labelName,int seqNum,String id,String operation) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.labelName = labelName;
		this.seqNum = seqNum;
		this.id = id;
		getTableProperty(operation);
		
	}
	
	public void getTableProperty(String operation)
	{
		try
		{
			switch(operation)
			{
			case "EditPhase":
				  tableName = "phase_info";
				  idAndCond = " and phaseId='"+id+"'";
				break;
				
			case "NewPhase":
				tableName = "phase_info_details";
				idAndCond = "";
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public boolean EditService()
	{
		boolean editStatus  = false;
		try
		{
			String updateQuery ="update "+tableName+" set label_name=? where  seq_no=? "+idAndCond+"; ";
			PreparedStatement st = con.prepareStatement(updateQuery);
 			st.setString(1, labelName);
 			st.setInt(2, seqNum);
 			st.execute();
 			st.close();
			editStatus = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return editStatus;
	}
	
	public String getPreviousLabelName()
	{
		String previousLabel ="";
		try
		{
			String selectQuery = "select * from "+tableName+" where seq_no=? "+idAndCond+";";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setInt(1, seqNum);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			previousLabel =rs.getString("label_name");
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return previousLabel;
	}
	public boolean checkDuplicateLabelName()
	{
		boolean checkDuplicateLabel = false;
		try
		{
			String selectQuery = "select * from "+tableName+" where label_name=? "+idAndCond+";";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, labelName);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				checkDuplicateLabel = true;
				rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return checkDuplicateLabel;
	}
	protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("Db connection closed.");
	}

}
