package governance.wave.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class waveListService {

	DBconnection dBconnection;
	Connection con;
	
	String phaseId;
	String phaseName;
	String waves[];
	public waveListService(String phaseId,String phaseName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.phaseId = phaseId;
		this.phaseName = phaseName;
	}
	
	public JsonArray getWaveList()
	{
	
	JsonArray jsonArray = new JsonArray();
	JsonArray jsonArray1 = new JsonArray();
	try
	{
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("phaseName", phaseName);
		jsonArray.add(jsonObject);
		String selectWaves = "select * from phase_info where column_name='waves' and phaseId='"+phaseId+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(selectWaves);
		if(rs.next()) {
		 waves = rs.getString("value").split(",");
		for(String wave : waves)
		{
			jsonArray1.add(getWave(wave));
		}
		}
		st.close();
		rs.close();
		jsonArray.add(jsonArray1);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return jsonArray;
	
	}
	
	public JsonObject getWave(String wave)
	{
		JsonObject jsonObject = new JsonObject();
	try
	{
		String selectWaves = "select * from governance_info where column_name='waveName' and value='"+wave+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(selectWaves);
		if(rs.next()) {
		     jsonObject.addProperty("WaveId", rs.getString("waveId"));
		     jsonObject.addProperty("WaveName", rs.getString("waveName"));
		     jsonObject.addProperty("Apps",getWaveOptions(rs.getString("waveName")));
		}
		st.close();
		rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return jsonObject;
	}
	
	public String getWaveOptions(String wave)
	{
		String app = "";
		try
		{
			
			String selectOptions = "select * from governance_info where column_name='apps' and waveName='"+wave+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectOptions);
			if(rs.next())
			{
			 app = rs.getString("value");
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return app;
	}
	protected void finalize() throws Throwable {
	 con.close();
	}
	
	
	
}
