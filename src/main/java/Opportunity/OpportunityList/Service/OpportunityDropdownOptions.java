package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class OpportunityDropdownOptions {

	DBconnection dBconnection ;
	Connection connection;
	
	public OpportunityDropdownOptions() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		connection = (Connection) dBconnection.getConnection();
	}
	public JsonArray getOptions()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			jsonArray.add(getPhaseOptions());
			jsonArray.add(getWaveOptions());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	public JsonArray getPhaseOptions()
	{
	    JsonArray jsonArray = new JsonArray();
	    try
	    {
	    	String selectPhase ="select * from phase_info where column_name='phaseName';";
	    	Statement st = connection.createStatement();
	    	ResultSet rs = st.executeQuery(selectPhase);
	    	while(rs.next())
	    	{
	    		JsonObject jsonObject = new JsonObject();
	    		String phaseName = rs.getString("value");
	    		jsonObject.addProperty("phaseName",phaseName);
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
	
	public JsonArray getWaveOptions()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectWaves ="select * from governance_info where column_name='waveName'";
    		Statement st1 = connection.createStatement();
    		ResultSet rs1 = st1.executeQuery(selectWaves);
    		
    		while(rs1.next())
    		{
    			JsonObject jsonObject = new JsonObject();
    			
    			   
    			    String wave = rs1.getString("value");
    			    jsonObject.addProperty("waveName",wave );
    				String selectWave = "select * from phase_info where column_name='waves' and value like '%"+wave+"%'";
    				Statement st2 = connection.createStatement();
    				ResultSet rs2 = st2.executeQuery(selectWave);
    				
    				if(rs2.next())
    					jsonObject.addProperty("phaseName",rs2.getString("phaseName"));
    				else
    					jsonObject.addProperty("phaseName","");
    				
    				rs2.close();
    				st2.close();
    				jsonArray.add(jsonObject);
    		}
    		rs1.close();
    		st1.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	return jsonArray;
	}
	
	protected void finalize() throws Throwable {
	 connection.close();
	}
}
