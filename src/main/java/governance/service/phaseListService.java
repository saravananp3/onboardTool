package governance.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class phaseListService {
	DBconnection dBconnection;
	Connection con;
	String waves;
	
	public phaseListService(String waves) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.waves = waves;
	}

	public  JsonArray phaseListDetails() {
		JsonArray jsonArray = new JsonArray();
		try {
			
			if(waves.equals("all"))
			{
			 String selectQuery ="select * from phase_info where column_name = 'phaseName'";
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery(selectQuery);
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 jsonObj.addProperty("phaseId", rs.getString("phaseid"));
				 jsonObj.addProperty("phaseName", rs.getString("value"));
			     
				 jsonArray.add(jsonObj);
			 }
			 
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray;
	}

}
