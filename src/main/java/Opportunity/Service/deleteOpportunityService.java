package Opportunity.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class deleteOpportunityService {

	String Id;
	DBconnection dBconnection;
	Connection con;
	String Name;
	String deleteType;
	boolean includeAll;
	
	public deleteOpportunityService(String Id,String Name, String deleteType, boolean includeAll) throws ClassNotFoundException, SQLException {
	 this.Id = Id;
	 this.Name = Name;
	 this.deleteType = deleteType;
	 this.includeAll = includeAll;
	 
	 dBconnection = new DBconnection();
	 con = (Connection) dBconnection.getConnection();
	}
	
	
	
	public boolean delete()
	{
		boolean deleteFlag = false;
		try
		{
			deleteFromWave(Name);
			LinkedHashMap<String,String> tableNames = getTableNames(); 
			Set entrySet = tableNames.entrySet();
			Iterator it = entrySet.iterator();     
			while(it.hasNext())
			{
				Map.Entry obj = (Map.Entry)it.next();
			String deleteQuery = "delete from "+obj.getKey()+" where "+obj.getValue()+"='"+Id+"'";
			Statement st = con.createStatement();
			int num_rows=st.executeUpdate(deleteQuery);
				System.out.println(obj.getKey()+" "+num_rows+" rows deleted.");
				
			st.close();
			}
			deleteFlag = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return deleteFlag;
	}
	
	private LinkedHashMap<String,String> getTableNames()
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			switch(deleteType) {
			
			case "Phase" :
				tableNames = getPhaseTableNames();
				break;
				
			case "Wave" :
				tableNames = getWaveTableNames();
				break;
			
			case "Application" :
				tableNames = getAppTableNames();
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	
	
	private LinkedHashMap<String,String> getAppTableNames()
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			//intake module
			tableNames.put("opportunity_info","Id");
			tableNames.put("triage_info","Id");
			tableNames.put("triage_summary_info","Id");
			tableNames.put("assessment_application_info","Id");
			tableNames.put("assessment_archival_consumption_info","Id");
			tableNames.put("assessment_compliance_char_info","Id");
			tableNames.put("assessment_contract_info","Id");
			tableNames.put("assessment_data_char_info","Id");
			tableNames.put("intake_stake_holder_info","OppId");
			
			//module approval table
			tableNames.put("module_approval_info","OppId");
			
			//archive execution module
			tableNames.put("archive_execution_info","oppId");
			
			//archive requirement module
			tableNames.put("archiveintro_info","oppId");
			tableNames.put("archivereq_roles_info","oppId");
			tableNames.put("archivereq_legacyapp_info","Id");
			tableNames.put("Archive_Environment_Name_Info","OppId");
			tableNames.put("Archive_Environment_ServerIp_Info","OppId");
			tableNames.put("Archive_Retention_Info","OppId");
			tableNames.put("Archive_Retention_Content_Info","OppId");
			tableNames.put("ArchiveBussinessReq_Info","OppId");
			
			tableNames.put("BusinessReqinscope_Info","OppId");
			tableNames.put("Archive_DataReq_Info","OppId");
			tableNames.put("Archive_RetentionLegalReq_Info","OppId");
			tableNames.put("Archive_SecurityReq_Info","OppId");
			tableNames.put("Archive_UsabilityReq_Info","OppId");
			tableNames.put("Archive_AuditReq_Info","OppId");
			tableNames.put("Archive_ScreenReq_Info","OppId");
			tableNames.put("Archive_ScreenReq_SearchForm","OppId");
			tableNames.put("Archive_DocumentRevision_Info","OppId");
			tableNames.put("Archive_Req_Addendum_Info","OppId");
			tableNames.put("ArchiveRequirements_Stake_Holder_Info", "OppId");



		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	private LinkedHashMap<String,String> getPhaseTableNames()
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			//phase
			tableNames.put("phase_info","phaseId");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	
	private LinkedHashMap<String,String> getWaveTableNames()
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			//wave
			tableNames.put("governance_info","waveId");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	
	private String getAppName()
	{
		String appName = "";
		
		try
		{
			String selectQuery = "select * from opportunity_info where id='"+Id+"' and column_name='appName'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(rs.next())
				appName = rs.getString("value");
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return appName;
	}
	
	private boolean deleteFromWave(String appName)
	{
		boolean statusFlag = false;
		try
		{
			String selectQuery ="select * from governance_info where column_name='apps' and value like '%"+appName+"%'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next())
			{
				String waveId = rs.getString("waveId");
				String apps = rs.getString("value");
				String appArr[] =apps.split(",");
				String newApps = "";
				for(String app:appArr)
					if(!app.equals(appName))
					newApps+=app+",";
				
				if(!newApps.equals(""))
					newApps = newApps.substring(0,newApps.length()-1);
				
				String updateQuery ="update governance_info set value='"+newApps+"' where column_name='apps' and waveId='"+waveId+"'";
				Statement st1 =con.createStatement();
				st1.executeUpdate(updateQuery);
				st1.close();
				
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	
	protected void finalize() throws Throwable {
	 con.close();
	}
}
