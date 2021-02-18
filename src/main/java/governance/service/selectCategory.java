package governance.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class selectCategory {

	DBconnection dBconnection;
	Connection con;
	String Category;
	String Phase;
	String Wave;
	public selectCategory() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
	}
	
	public JsonArray AppsDropdown()
	{
JsonArray jsonArray = new JsonArray();
		
		try
		{
			String selectQuery ="select * from opportunity_info where column_name = 'appName'";
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery(selectQuery);
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 String appName = rs.getString("value");
				 String waveName = getWaveName(appName);
				 String phaseName =  getPhaseName(waveName);
				 jsonObj.addProperty("appId", rs.getString("id"));
				 jsonObj.addProperty("appName", appName);
				 jsonObj.addProperty("waveName", waveName);
				 jsonObj.addProperty("phaseName", phaseName);		
				 jsonArray.add(jsonObj);
			 }	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
		public JsonArray WavesDropdown()
	{
		JsonArray jsonArray = new JsonArray();
		
		try
		{
			String selectQuery ="select * from governance_info where column_name = 'waveName'";
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery(selectQuery);
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 String waveName = rs.getString("value");
				 
				 jsonObj.addProperty("WaveId", rs.getString("waveid"));
				 jsonObj.addProperty("WaveName", waveName);
				 jsonObj.addProperty("phaseName", getPhaseName(waveName));
				 
				 jsonArray.add(jsonObj);
			 }	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	private String getPhaseName(String waveName)
	{
		String phaseName = "";
		try
		{
			String selectQuery  = "select * from phase_info where column_name = 'waves' and value like '%"+waveName+"%'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(rs.next())
				phaseName = rs.getString("phaseName");
			
			st.close();
			rs.close();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return phaseName;
	}
	
	private String getWaveName(String appName)
	{
		String phaseName = "";
		try
		{
			String selectQuery  = "select * from governance_info where column_name = 'apps' and value like '%"+appName+"%'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(rs.next())
				phaseName = rs.getString("waveName");
			
			st.close();
			rs.close();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return phaseName;
	}
	protected void finalize() throws Throwable {
	con.close();
	}
	
	public JsonArray getPhaseList(String appName)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
		  String selectWave = "select * from governance_info where column_name='apps' and value like '%"+appName+"%'";
		  Statement st = con.createStatement();
		  ResultSet rs = st.executeQuery(selectWave);
		  if(rs.next()) {
			  
			  String selectPhase = "select * from phase_info where column_name = 'waves' and value like '%"+rs.getString("value")+"%' "; 
			  Statement st1 = con.createStatement();
			  ResultSet rs1 = st1.executeQuery(selectWave);
			  if(rs1.next())
			  {
				  JsonObject jsonObject = new JsonObject();
				  jsonObject.addProperty("ohaseId", rs1.getString("phaseId"));
				  jsonObject.addProperty("ohaseName", rs1.getString("phaseName"));
				  jsonObject.addProperty("apps", new phaseListService("all").getPhaseApps(rs.getString("phaseName")));
			  }
			  rs1.close();
			  st1.close();
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
}
