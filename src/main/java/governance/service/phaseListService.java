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
			     jsonObj.addProperty("apps",getPhaseApps(rs.getString("value")));
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
	
	public String getPhaseApps(String phaseName)
	{
        String phaseApps = "";
		try
		{
			String selectWaves = "select * from phase_info where phaseName = '"+phaseName+"' and column_name='waves'";
		    Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery(selectWaves);
		    if(rs.next())
		    {
		    	String waves[] =rs.getString("value").split(",");
		    	
		    	for(String wave:waves)
		    	{
		    		String selectApps = "select * from governance_info where waveName = '"+wave+"' and column_name='apps'";
				    Statement st1 = con.createStatement();
				    ResultSet rs1 = st1.executeQuery(selectApps);
				    if(rs1.next())
				    {
				    	String apps[] = rs1.getString("value").split(","); 
				    	for(String app :apps)
				    	{
				    		phaseApps +=app+" ";
				    	}
				    }
				    rs1.close();
				    st1.close();
		    	}
		    }
		    rs.close();
		    st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	 return phaseApps;
	}

}
