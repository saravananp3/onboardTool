package dashboard.overAllDashboard.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class dashboardService {

	 DBconnection dBconnection =null;
		Connection con = null;
		
		int intakeCount = 0;
		int reqCount = 0;
		int archiveExeCount = 0;
		int decomExeCount = 0;
		int totalCount = 0;
	    public JsonArray GanttChartJsonArray = new JsonArray();
	    
		public dashboardService() throws ClassNotFoundException, SQLException {
			dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
		}
	
//		public JsonObject dashboardCardDetails() {
//			
//			JsonObject jsonObject = new JsonObject();
//			try {
//				
//				//Opportunity Count 
//				String oppQuery = "select count(*) from opportunity_info where column_name = 'appName';";
//				Statement st = con.createStatement();
//				ResultSet rs = st.executeQuery(oppQuery);
//				
//				if(rs.next()) 
//					jsonObject.addProperty("opportunityCount", rs.getInt(1));
//				
//				rs.close();
//				st.close();
//				
//				//Decommission Count 
//				String decommQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Decommission';";
//				Statement st1 = con.createStatement();
//				ResultSet rs1 = st1.executeQuery(decommQuery);
//				
//				if(rs1.next()) 
//					jsonObject.addProperty("decommissionCount", rs1.getInt(1));
//				
//				rs1.close();
//				st1.close();
//				
//				
//				//Archive Count 
//				String archiveQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Archive';";
//				Statement st2 = con.createStatement();
//				ResultSet rs2 = st2.executeQuery(archiveQuery);
//				
//				if(rs2.next()) 
//					jsonObject.addProperty("archiveCount", rs2.getInt(1));
//				
//				rs2.close();
//				st2.close();
//				
//				//To be retire Count 
//				String retireQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'To be retire';";
//				Statement st3 = con.createStatement();
//				ResultSet rs3 = st3.executeQuery(retireQuery);
//				
//				if(rs3.next()) 
//					jsonObject.addProperty("retireCount", rs3.getInt(1));
//				
//				rs3.close();
//				st3.close();
//				
//			}
//			catch(Exception e) {
//				e.printStackTrace();
//			}
//			
//			return jsonObject;
//		}
		
		
		
		public JsonArray getApplicationFromPhaseDataTable(String phaseFilter) {
			JsonArray jsonArray = new JsonArray();
			try {
				
				String whereCondn = phaseFilter.equals("All")?"":" where phaseName like '"+phaseFilter+"%'";
				
				String selectPhases = "select * from phase_info"+whereCondn;
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectPhases);
				while(rs.next()) {
					if(rs.getString("column_name").equals("waves")) {
					String waves[] = rs.getString("value").split(",");
					jsonArray.addAll(getWaveDetails(waves,rs.getString("phaseName")));
					}
				}
				rs.close();
				st.close();
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return jsonArray;
		}
		
		private JsonArray getWaveDetails(String[] waves,String phase) {
         JsonArray jsonArray = new JsonArray();
			try {
			for(String wave:waves) {
				String selectWaves = "select * from governance_info where waveName='"+wave+"'";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectWaves);
				while(rs.next()) {
					if(rs.getString("column_name").equals("apps")) {
					String apps[] = rs.getString("value").split(",");
					jsonArray .addAll(getApplicationDetails(apps,rs.getString("waveName"),phase));
					}
				}
				rs.close();
				st.close();
				
			}
	      }
	      catch(Exception e) {
	    	  e.printStackTrace();
	      }
         return jsonArray;
        }




		private JsonArray getApplicationDetails(String[] apps, String wave,String phase) {
			JsonArray jsonArray = new JsonArray();
			try {
			for(String app:apps) {
				JsonObject jsonObject = new JsonObject();
				String selectApp = "select * from opportunity_info where column_name='appName' and value = '"+app+"'";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectApp);
				while(rs.next()) {
					
					jsonObject.addProperty("appName",app);
					jsonObject.addProperty("phaseName",phase);
					jsonObject.addProperty("waveName", wave);
					
					String Id = rs.getString("Id");
					String selectAppType = "select * from opportunity_info where column_name='request_type' and  Id = '"+Id+"'";
					Statement st1 = con.createStatement();
					ResultSet rs1 = st1.executeQuery(selectAppType);
					if(rs1.next())
						jsonObject.addProperty("appType",rs1.getString("value"));
					rs1.close();
					st1.close();
					
					String selectAppOwner = "select * from opportunity_info where column_name='appowner' and  Id = '"+Id+"'";
					Statement st2 = con.createStatement();
					ResultSet rs2 = st2.executeQuery(selectAppOwner);
					if(rs2.next())
						jsonObject.addProperty("owner",rs2.getString("value"));
					rs1.close();
					st1.close();
					
					jsonArray.add(jsonObject);
				}
				rs.close();
				st.close();
			}
	      }
	      catch(Exception e) {
	    	  e.printStackTrace();
	      }
         return jsonArray;
        }




		public JsonObject dashboardCardDetails()
		{
			JsonObject jsonObject = new JsonObject();
			try
			{
				String selectQuery = "select count(*) from phase_info where column_name = 'phaseName';";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				
				int countPhase = 0;
				
				if(rs.next())
				countPhase = rs.getInt(1);
				
				rs.close();
				st.close();
				
				String selectQuery1 = "select count(*) from governance_info where column_name = 'waveName';";
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(selectQuery1);
				
				int countWave = 0;
				
				if(rs1.next())
				countWave = rs1.getInt(1);
				
				rs1.close();
				st1.close();
				
				String selectQuery2 = "select count(*) from opportunity_info where column_name = 'appName';";
				Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery(selectQuery2);
				int countOpportunity = 0;
				
				if(rs2.next())
				countOpportunity = rs2.getInt(1);
				
				rs2.close();
				st2.close();
				
				jsonObject.addProperty("phaseCount", countPhase);
				jsonObject.addProperty("waveCount",countWave);
				jsonObject.addProperty("appCount", countOpportunity);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return jsonObject;
		}
		public JsonObject donetChartDetails() {
			
			JsonObject jsonObject = new JsonObject();
			
			try {
				
				String Query = "select distinct(Id) from opportunity_info;";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(Query);

				while(rs.next()) {
					String oppId = rs.getString(1);
					String moduleNames[] = {"Intake","Requirments","ArchiveExecution","DecommissionExecution"};
					
					for(String moduleName : moduleNames) {
						boolean checkCurrentPhase = true;
						if(!moduleName.equals("Requirments")) {
							
							String selectQuery = "select * from module_approval_info where moduleName = '"+moduleName+"' and OppId = '"+oppId+"'";
							Statement st1 = con.createStatement();
							ResultSet rs1 = st1.executeQuery(selectQuery);
							
							if(rs1.next()) {
								if(rs1.getBoolean(4))
									checkCurrentPhase = false;
							}
						}
						else {
							
							String selectQuery1 = "select * from opportunity_info where Id = '"+oppId+"' and column_name = 'request_type';";
							Statement st2 = con.createStatement();
							ResultSet rs2 = st2.executeQuery(selectQuery1);
							
							if(rs2.next())
								checkCurrentPhase = getReqApproval(rs2.getString("value"), oppId);
						}
						
						if(checkCurrentPhase) {
							setModuleCount(moduleName);
							break;
						}
					}
					totalCount++;
				}
				rs.close();
				st.close();
				
				jsonObject = getPhasePercentage();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return jsonObject;
		}
		
		private void setModuleCount(String moduleName) {
			try {
				
				switch(moduleName) {
				
				case "Intake":
					intakeCount++;
					break;
					
				case "Requirments":
					reqCount++;
					break;
					
				case "ArchiveExecution":
					archiveExeCount++;
					break;
					
				case "DecommissionExecution":
					decomExeCount++;
					break;
				
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		private boolean getReqApproval(String reqType, String oppId) {
			
			boolean checkPhase = true;
			try {
				
				switch(reqType) {
				
				case "Archive":
					checkPhase = getReqInfo("Archive_Requirement", oppId);
					break;
					
				case "Decommission":
					checkPhase = getReqInfo("Decommission_Requirement", oppId);
					break;
					
				case "To be retire":
					if(!getReqInfo("Archive_Requirement", oppId) && !getReqInfo("Decommission_Requirement", oppId)) 
						checkPhase = false;
					
					break;
				
				
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return checkPhase;
		}
		
		private boolean getReqInfo(String phaseName, String oppId) {
			
			boolean checkPhase = true;
			try {
				String selectQuery = "select * from module_approval_info where moduleName = '"+phaseName+"' and OppId = '"+oppId+"'";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				
				if(rs.next())
					if(rs.getBoolean(4))
						checkPhase = false;
				rs.close();
				st.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return checkPhase;
		}
		
		private JsonObject getPhasePercentage() {
			
			JsonObject jsonObject = new JsonObject();
			
			try {
				
			/*
			 * float oppPercentage = (totalCount != 0)? (100/(float)totalCount) : 0; float
			 * intakePercentage = intakeCount * oppPercentage; float reqPercentage =
			 * reqCount * oppPercentage; float archiveExePercentage = archiveExeCount *
			 * oppPercentage; float decomExePercentage = decomExeCount * oppPercentage;
			 */
				
				jsonObject.addProperty("intakeCount", intakeCount);
				jsonObject.addProperty("reqCount", reqCount);
				jsonObject.addProperty("archiveExeCount", archiveExeCount);
				jsonObject.addProperty("decomExeCount", decomExeCount);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return jsonObject;
		}
		
		public JsonArray getOppNameList() {
			
			JsonArray jsonArray = new JsonArray();
			
			try {
                boolean checkFirstOpportunity = true;			
				String selectQuery = "select * from opportunity_info where column_name = 'appName'";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);

				while(rs.next()) 
				{
					
					if(checkFirstOpportunity)
					{
						dashboardGanttChartService ganttChart = new dashboardGanttChartService(rs.getString("value"));
		            	GanttChartJsonArray = ganttChart.getArchiveExecution();
						ganttChart = null;
					    checkFirstOpportunity = false;
					}
					
					jsonArray.add(rs.getString("value"));
					
				}
				
				rs.close();
				st.close();
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			return jsonArray;
		}
		
		public JsonObject getPieChartDetails() {
			JsonArray jsonArray = new JsonArray();
			JsonObject jsonObject = new JsonObject();
			try {
				int archiveCount=0,decomissionCount=0,retiredCount=0;
				String selectQuery = "SELECT * FROM opportunity_info where column_name='request_type';";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				while(rs.next()) {
					String value = rs.getString("value");
					if(value.equals("Archive")) {
						archiveCount++;
					}
					
					if(value.equals("Decommission")) {
						decomissionCount++;
					}
					
					if(value.equals("To be retire")) {
						retiredCount++;
					}
				}
				jsonObject.addProperty("archiveCount",archiveCount);
				jsonObject.addProperty("decommissionCount",decomissionCount);
				jsonObject.addProperty("retiredCount", retiredCount);
				jsonArray.add(jsonObject);
				rs.close();
				st.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return jsonObject;
		}
		
		
		protected void finalize() throws Throwable 
    	{ 
	        con.close();
    	}
}
