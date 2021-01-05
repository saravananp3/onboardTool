package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class OpportunityListService {

	public static JsonArray OpportunityListDetails(String Projects) {
		JsonArray jsonArray = new JsonArray();
		JsonArray jsonArray1 = new JsonArray();
		try {
			jsonArray1.add(getWaveName());
			
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			
			if(Projects.equals("all"))
			{
			 String SelectOpportunityQuery ="select * from opportunity_info where column_name = 'appName'";
			 Statement st = connection.createStatement();
			 ResultSet rs = st.executeQuery(SelectOpportunityQuery);
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 jsonObj.addProperty("OpportunityId", rs.getString("id"));
				 jsonObj.addProperty("OpportunityName", rs.getString("value"));
			     jsonObj.addProperty("CheckWave",checkOpportunityWave(rs.getString("value")));
				 jsonArray.add(jsonObj);
			 }
			 jsonArray1.add(jsonArray);
			 
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray1;
	}
	
	public static JsonArray getWaveName() throws SQLException {
		
		
		DBconnection dBconnection = null;
		Connection connection = null;
		JsonArray jsonArray = new JsonArray();
		try {
			
			dBconnection = new DBconnection();
			connection = (Connection) dBconnection.getConnection();
			
			String selectQuery = "select * from governance_info where column_name = 'waveName';";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			while(rs.next()) 
				jsonArray.add(rs.getString("value"));
			
			st.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		finally{
			if(connection != null)
				connection.close();
		}
		
		return jsonArray;
	}
	
	public static boolean checkOpportunityWave(String waveName) throws SQLException {
		
		DBconnection dBconnection = null;
		Connection connection = null;
		boolean checkWave = false; 
		
		try {
			dBconnection = new DBconnection();
			connection = (Connection) dBconnection.getConnection();
			
			String selectQuery = "select * from governance_info where column_name = 'apps' and value like '%"+waveName+"%';";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(rs.next()) 
				checkWave = true;
			
			st.close();
			rs.close();
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		finally{
			if(connection != null)
				connection.close();
		}
		return checkWave;
	}
}
