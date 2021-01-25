package governance.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class phaseEditService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	String labelName;
	int seqNum;
	public phaseEditService(String labelName,int seqNum) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.labelName = labelName;
		this.seqNum = seqNum;
	}
	
	public boolean EditService()
	{
		boolean editStatus  = false;
		try
		{
			String updateQuery ="update phase_info_details set label_name='"+labelName+"' where  seq_no='"+seqNum+"'; ";
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
			String selectQuery = "select * from phase_info_details where seq_no='"+seqNum+"'";
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
			String selectQuery = "select * from phase_info_details where label_name='"+labelName+"'";
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
