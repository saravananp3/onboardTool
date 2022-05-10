package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class phaseDataRetrieveService {
	DBconnection dBconnection;
	Connection con;
	String phaseId;
	String purpose;
	
	
	public phaseDataRetrieveService(String phaseId, String purpose) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.phaseId = phaseId;
		 this.purpose = purpose;
	}
	
	public JsonArray phaseDataRetrieve()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			
			
			if(purpose.equals("NewPhase")) {
				moveTemptoInfo();
				updateApplications();
				jsonArray = getInfoDetails();
			}
			else if(purpose.equals("EditPhase"))
			{
				updateApplicationsEditPhase();
				jsonArray = getInfoEditDetails();
			}
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
			String deleteQuery = "delete from phase_Info_Details";
			Statement st1 = con.createStatement();
			st1.executeUpdate(deleteQuery);
			
			//select temp details
			String selectTempQuery = "select * from phase_info_template_details order by seq_no";
			Statement st2 = con.createStatement();
			ResultSet rs2 = st2.executeQuery(selectTempQuery); 
			String phaseId=getUUID();
			while(rs2.next())
			{
				// insert temp details into info details
				String wave_InsertQuery = "insert into phase_Info_Details (seq_no,phaseId,phaseName,prj_name, options, label_name, column_name, type, mandatory, value)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

				PreparedStatement prestmt = con.prepareStatement(wave_InsertQuery);
				prestmt.setInt(1, rs2.getInt("seq_no"));
				prestmt.setString(2,phaseId);
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
		String phaseId="";
		try
		{
			boolean checkphaseId = true;
			while(checkphaseId)
			{
			phaseId=UUID.randomUUID().toString();
			//checking the wave id in phase_Info
			String selectQuery = "select * from phase_Info where phaseId=?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, phaseId);
			ResultSet rs = st.executeQuery();
			if(!rs.next())
			checkphaseId =false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return phaseId;
	}
	
	public JsonArray getInfoDetails()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectQuery = "select * from phase_Info_Details;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("seq_num",rs.getInt("seq_no"));
			jsonObject.addProperty("phaseId",rs.getString("phaseId"));
			jsonObject.addProperty("phaseName", rs.getString("phaseName"));
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
	
	public JsonArray getInfoEditDetails()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectQuery = "select * from phase_Info where phaseId = ?;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, phaseId);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("seq_num",rs.getInt("seq_no"));
			jsonObject.addProperty("phaseId",rs.getString("phaseId"));
			jsonObject.addProperty("phaseName", rs.getString("phaseName"));
			jsonObject.addProperty("options",rs.getString("options"));
			jsonObject.addProperty("LabelName",rs.getString("label_name"));
			jsonObject.addProperty("ColumnName",rs.getString("column_name"));
			jsonObject.addProperty("Type",rs.getString("type"));
			jsonObject.addProperty("Mandatory",rs.getString("mandatory"));
			jsonObject.addProperty("Value",rs.getString("value"));
			jsonArray.add(jsonObject);
		}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	
	private void updateApplications()
	{
		String waveNames = "";
		try
		{
			boolean checkApp = false;
			String selectQuery="select * from governance_info where column_name='waveName';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
				checkApp =true;
				String selectQuery1 = "select * from phase_info where column_name='waves' and value like ?";
				PreparedStatement st1 = con.prepareStatement(selectQuery1);
				st1.setString(1,"%" +rs.getString("value")+"%");
				ResultSet rs1 = st1.executeQuery();
				if(!rs1.next())
					waveNames += rs.getString("value")+",";	
			  rs1.close();
			  st1.close();
			}
			rs.close();
			st.close();
			if(!waveNames.equals(""))
				waveNames=waveNames.substring(0,waveNames.length()-1);
			
			String updateQuery ="update phase_info_details set options =? where column_name = 'waves';";
			PreparedStatement st2 = con.prepareStatement(updateQuery);
	          st2.setString(1, waveNames);
	          st2.execute();
	          st2.close();
			System.out.println("waveNames : "+waveNames);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	private void updateApplicationsEditPhase()
	{
		String waveNames = "";
		try
		{
			boolean checkApp = false;
			String selectQuery="select * from governance_info where column_name='waveName';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
				checkApp =true;
				String selectQuery1 = "select * from phase_info where column_name='waves' and value like ?";
				PreparedStatement st1 = con.prepareStatement(selectQuery1);
				st1.setString(1,"%" +rs.getString("value")+"%");
				ResultSet rs1 = st1.executeQuery();
				if(!rs1.next())
					waveNames += rs.getString("value")+",";	
			  rs1.close();
			  st1.close();
			}
			rs.close();
			st.close();
			System.out.println("waveNames : "+waveNames);

			String selectWaves = "select * from phase_info where column_name='waves' and phaseId=?";
			PreparedStatement st3 = con.prepareStatement(selectWaves);
			st3.setString(1,phaseId);
			ResultSet rs3 = st3.executeQuery();
			if(rs3.next())
			{
				String wave = ((rs3.getString("value").equals(""))?"":rs3.getString("value")+",");
				waveNames = wave+waveNames;
			}
			if(!waveNames.equals(""))
				waveNames=waveNames.substring(0,waveNames.length()-1);
			
			String updateQuery ="update phase_info set options =? where column_name = 'waves' and phaseId=?;";
			PreparedStatement st2 = con.prepareStatement(updateQuery);
	          st2.setString(1, waveNames);
	          st2.setString(2, phaseId);
	          st2.execute();
	          st2.close();
			System.out.println("waveNames : "+waveNames);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	
	protected void finalize() throws Throwable {
		con.close();
		System.out.println("Db connection closed");
	}

}
