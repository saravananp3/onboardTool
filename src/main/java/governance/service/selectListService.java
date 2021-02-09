package governance.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Opportunity.OpportunityList.Service.OpportunityListService;
import onboard.DBconnection;

public class selectListService {

	DBconnection dBconnection;
	Connection con;
	String categoryName;
	String phaseName;
	String waveName;
	
	public selectListService(String categoryName,String phaseName, String waveName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.categoryName = categoryName;
		this.phaseName =  phaseName;
		this.waveName = waveName;
	}
	
	
	public JsonArray getList()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
		switch(categoryName)
		{
		
		case "Wave":
			jsonArray = getWaveList();
			break;
			
		case "Application":
			jsonArray = getApplicationList();
			break;
			
		}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	public JsonArray getWaveList()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectWaves = "select * from governance_info where column_name='waveName';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectWaves);
			while(rs.next())
			{
				String wave = rs.getString("value");
				if(checkPhaseList(wave))
				{
					JsonObject jsonObject = new JsonObject();
					
					jsonObject.addProperty("WaveId",rs.getString("waveId"));
					jsonObject.addProperty("WaveName",rs.getString("waveName"));
					
					jsonArray.add(jsonObject);
				}
				if(phaseName.equals("none"))
				{
					JsonObject jsonObject = new JsonObject();
					
					jsonObject.addProperty("WaveId",rs.getString("waveId"));
					jsonObject.addProperty("WaveName",rs.getString("waveName"));
					
					jsonArray.add(jsonObject);
				}
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
	
	public boolean checkPhaseList(String wave)
	{
		boolean checkFlag = false;
		try
		{
			String selectPhase = "select * from phase_info where phaseName = '"+phaseName+"' and column_name='waves' and value like '%"+wave+"%'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectPhase);
			
			if(rs.next())
				checkFlag = true;
			
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
  return checkFlag;
	}
	
	public JsonArray getApplicationList()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			   if(phaseName.equals("none")&&waveName.equals("none"))
				{
				   jsonArray = OpportunityListService.OpportunityListDetails("all");
				}
			   else if(!phaseName.equals("none")&&waveName.equals("none"))
				{
				   JsonArray jsonArray1 = new JsonArray();
				    jsonArray.add(new JsonArray());
					String selectPhases = "select * from phase_info where phaseName='"+phaseName+"' and column_name='waves';";
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(selectPhases);
					if(rs.next())
					{
						String waves[] = rs.getString("value").split(",");
						for(String wave : waves)
						{
							String selectApps = "select * from governance_info where column_name='apps' and waveName='"+wave+"'";
							Statement st1 = con.createStatement();
							ResultSet rs1 = st1.executeQuery(selectApps);
							if(rs1.next())
							{
							   String[] apps = rs1.getString("value").split(",");
							   for(String app : apps)
							   {
								   String selectApp = "select * from opportunity_info where column_name='appName' and value='"+app+"';";
									Statement st2 = con.createStatement();
									ResultSet rs2 = st2.executeQuery(selectApp);
									if(rs2.next())
									{
										JsonObject jsonObject = new JsonObject();
										jsonObject.addProperty("OpportunityId",rs2.getString("Id"));
										jsonObject.addProperty("OpportunityName",app);
										jsonObject.addProperty("CheckWave",new OpportunityListService().checkOpportunityWave(app));
										jsonArray1.add(jsonObject);
									}
									rs2.close();
									st2.close();
							   }
							}
							rs1.close();
							st1.close();
						}
					}
					st.close();
					rs.close();
					jsonArray.add(jsonArray1);
				}
				else if(!phaseName.equals("none")&&!waveName.equals("none")||phaseName.equals("none")&&!waveName.equals("none"))
				{
					JsonArray jsonArray1 = new JsonArray();
					jsonArray.add(new JsonArray());
					String selectApps = "select * from governance_info where column_name='apps' and waveName='"+waveName+"'";
					Statement st1 = con.createStatement();
					ResultSet rs1 = st1.executeQuery(selectApps);
					if(rs1.next())
					{
					   String[] apps = rs1.getString("value").split(",");
					   for(String app : apps)
					   {
						   String selectApp = "select * from opportunity_info where column_name='appName' and value='"+app+"';";
							Statement st2 = con.createStatement();
							ResultSet rs2 = st2.executeQuery(selectApp);
							if(rs2.next())
							{
								JsonObject jsonObject = new JsonObject();
								jsonObject.addProperty("OpportunityId",rs2.getString("Id"));
								jsonObject.addProperty("OpportunityName",app);
								jsonObject.addProperty("CheckWave",new OpportunityListService().checkOpportunityWave(app));
								jsonArray1.add(jsonObject);
							}
							rs2.close();
							st2.close();
					   }
					}
					rs1.close();
					st1.close();
					jsonArray.add(jsonArray1);
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	protected void finalize() throws Throwable {
		con.close();
	}
}
