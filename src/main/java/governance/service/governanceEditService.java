package governance.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class governanceEditService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	String labelName;
	int seqNum;
	String tableName;
	String idWhereCond;
	String idAndCond;
	String id;
	private String operation;
	
	public governanceEditService(String labelName,int seqNum, String id, String operation) throws ClassNotFoundException, SQLException
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
			case "EditWave":
				  tableName = "governance_info";
				  idAndCond = " and waveId='"+id+"'";
				break;
				
			case "NewWave":
				tableName = "governance_info_details";
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
			String updateQuery ="update "+tableName+" set label_name='"+labelName+"' where  seq_no='"+seqNum+"' "+idAndCond+"; ";
			Statement st = con.createStatement();
			st.executeUpdate(updateQuery);
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
			String selectQuery = "select * from "+tableName+" where seq_no='"+seqNum+"' "+idAndCond+";";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
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
			String selectQuery = "select * from "+tableName+" where label_name='"+labelName+"' "+idAndCond+";";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
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
