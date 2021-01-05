package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

import org.checkerframework.checker.formatter.qual.ReturnsFormat;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class governanceDataRetrieveService {

	DBconnection dBconnection;
	Connection con;
	public governanceDataRetrieveService() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
	}
	
	public JsonArray governanceDataRetrieve()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			moveTemptoInfo();
			
			updateApplications();
			jsonArray = getInfoDetails();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	private void moveTemptoInfo()
	{
		try
		{
			//delete prev table
			String deleteQuery = "delete from Governance_Info_Details";
			Statement st1 = con.createStatement();
			st1.executeUpdate(deleteQuery);
			
			//select temp details
			String selectTempQuery = "select * from governance_info_template_details order by seq_no";
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(selectTempQuery); 
			String WaveId=getUUID();
			while(rs2.next())
			{
				// insert temp details into info details
				String wave_InsertQuery = "insert into Governance_Info_Details (seq_no,waveId,waveName,prj_name, options, label_name, column_name, type, mandatory, value)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

				PreparedStatement prestmt = con.prepareStatement(wave_InsertQuery);
				prestmt.setInt(1, rs2.getInt("seq_no"));
				prestmt.setString(2,WaveId);
				prestmt.setString(3,"");
				prestmt.setString(4,"");
				prestmt.setString(5,rs2.getString("options"));
				prestmt.setString(6, rs2.getString("label_name"));
				prestmt.setString(7, rs2.getString("column_name"));
				prestmt.setString(8, rs2.getString("type"));
				prestmt.setString(9, rs2.getString("mandatory"));
				prestmt.setString(10, rs2.getString("value"));
				prestmt.execute();
				prestmt.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	private String getUUID()
	{
		String WaveId="";
		try
		{
			boolean checkWaveId = true;
			while(checkWaveId)
			{
			WaveId=UUID.randomUUID().toString();
			//checking the wave id in Governance_Info
			String selectQuery = "select * from Governance_Info where waveId='"+WaveId+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(!rs.next())
			checkWaveId =false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return WaveId;
	}
	
	public JsonArray getInfoDetails()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectQuery = "select * from Governance_Info_Details;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("seq_num",rs.getInt("seq_no"));
			jsonObject.addProperty("WaveId",rs.getString("WaveId"));
			jsonObject.addProperty("waveName", rs.getString("waveName"));
			jsonObject.addProperty("options",rs.getString("options"));
			jsonObject.addProperty("LabelName",rs.getString("label_name"));
			jsonObject.addProperty("ColumnName",rs.getString("column_name"));
			jsonObject.addProperty("Type",rs.getString("type"));
			jsonObject.addProperty("Mandatory",rs.getString("mandatory"));
			jsonObject.addProperty("Value",rs.getString("value"));
			jsonArray.add(jsonObject);
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	private void updateApplications()
	{
		String appNames = "";
		try
		{
			boolean checkApp = false;
			String selectQuery="select * from opportunity_info where column_name='appName';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
				checkApp =true;
				String selectQuery1 = "select * from governance_info where column_name='apps' and value like '%"+rs.getString("value")+"%'";
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(selectQuery1);
				if(!rs1.next())
				  appNames+=rs.getString("value")+",";	
			  rs1.close();
			  st1.close();
			}
			rs.close();
			st.close();
			if(!appNames.equals(""))
				appNames=appNames.substring(0,appNames.length()-1);
			
			String updateQuery ="update governance_info_details set options ='"+appNames+"' where column_name = 'apps';";
			Statement st2 = con.createStatement();
			st2.executeUpdate(updateQuery);
			st2.close();
			System.out.println("appNames : "+appNames);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	protected void finalize() throws Throwable {
		con.close();
		System.out.println("New Wave data retrieve Db connection closed");
	}
}
