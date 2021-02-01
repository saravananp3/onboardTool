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
	protected void finalize() throws Throwable {
	con.close();
	}
}
