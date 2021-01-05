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
	
		public JsonObject dashboardCardDetails() {
			
			JsonObject jsonObject = new JsonObject();
			try {
				
				//Opportunity Count 
				String oppQuery = "select count(*) from opportunity_info where column_name = 'appName';";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(oppQuery);
				
				if(rs.next()) 
					jsonObject.addProperty("opportunityCount", rs.getInt(1));
				
				rs.close();
				st.close();
				
				//Decommission Count 
				String decommQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Decommission';";
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(decommQuery);
				
				if(rs1.next()) 
					jsonObject.addProperty("decommissionCount", rs1.getInt(1));
				
				rs1.close();
				st1.close();
				
				
				//Archive Count 
				String archiveQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Archive';";
				Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery(archiveQuery);
				
				if(rs2.next()) 
					jsonObject.addProperty("archiveCount", rs2.getInt(1));
				
				rs2.close();
				st2.close();
				
				//To be retire Count 
				String retireQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'To be retire';";
				Statement st3 = con.createStatement();
				ResultSet rs3 = st3.executeQuery(retireQuery);
				
				if(rs3.next()) 
					jsonObject.addProperty("retireCount", rs3.getInt(1));
				
				rs3.close();
				st3.close();
				
			}
			catch(Exception e) {
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
		
		protected void finalize() throws Throwable 
    	{ 
	        con.close();
    	}
}
