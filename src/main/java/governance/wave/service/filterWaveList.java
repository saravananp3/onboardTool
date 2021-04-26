package governance.wave.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.ws.rs.core.Request;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class filterWaveList {

	DBconnection dBconnection;
	Connection con;
	
	String phaseName;
	String waveName;
	String appName;
	
	public filterWaveList(String phaseName, String waveName,String appName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.phaseName = phaseName;
		this.waveName = waveName;
		this.appName = appName;
	}
	
	public JsonArray getWaveList()
	{
		JsonArray jsonArray = new JsonArray();
		try {
			if(!appName.equals("All")) {
		    jsonArray = getWaveListByApp();
			}
			else if(!waveName.equals("All")) {
			    jsonArray = getWaveListByWave();	
			}
			else 
			jsonArray = getWaveListByPhase();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray getWaveListByApp()
	{
		JsonArray jsonArray = new JsonArray();
		try {
			
		String selectWave = "select * from governance_info where column_name='apps' and value like '%"+appName+"%'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(selectWave);
		
		if(rs.next())
		{
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("WaveId",rs.getString("waveId"));
			jsonObject.addProperty("WaveName",rs.getString("waveName"));
		
			jsonArray.add(jsonObject);
		}
	
		rs.close();
		st.close();
		
	   }
	   catch(Exception e){
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray getWaveListByPhase()
	{
		JsonArray jsonArray = new JsonArray();
		try {
	    String selectPhase = "select * from phase_info where column_name='waves' and phaseName='"+phaseName+"';";
	    Statement st1 = con.createStatement();
	    ResultSet rs1 = st1.executeQuery(selectPhase);
	    if(rs1.next()) {
		
	    String waves[] = rs1.getString("value").split(",");	
	    for(String wave:waves) {
	    String selectWave = "select * from governance_info where column_name='waveName' and value = '"+wave+"';";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(selectWave);
	
		while(rs.next())
		{
			
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("WaveId",rs.getString("waveId"));
			jsonObject.addProperty("WaveName",rs.getString("waveName"));
		
			jsonArray.add(jsonObject);
			
		}
	
		rs.close();
		st.close();
	    }
	    
	 }
	    
	    rs1.close();
	    st1.close();
	   }
	   catch(Exception e){
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray getWaveListByWave()
	{
		JsonArray jsonArray = new JsonArray();
		try {
			
		String selectWave = "select * from governance_info where column_name='waveName' and value = '"+waveName+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(selectWave);
		
		if(rs.next())
		{
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("WaveId",rs.getString("waveId"));
			jsonObject.addProperty("WaveName",rs.getString("waveName"));
		
			jsonArray.add(jsonObject);
		}
	
		rs.close();
		st.close();
		
	   }
	   catch(Exception e){
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	protected void finalize() throws Throwable {
	 con.close();
	}

}
