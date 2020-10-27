package ArchiveExecutionModule.ArchiveExecutionDetails.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ArchiveExecutionAddService {
	
	 DBconnection dBconnection =null;
		
		Connection con = null;
		public String Id = null;
		public String oppName = null;
		static int seqNum;
		static String taskGroup = null;
		static String taskName = null;
		static String typeRow = null;
		static String planStDt = null;
		boolean checkChild = true;
		
		public ArchiveExecutionAddService(String Id, String oppName, int seqNum, String taskGroup, String taskName, String typeRow, String planStDt) throws ClassNotFoundException, SQLException{
			
			dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
			this.Id = Id;
			this.oppName = oppName;
			this.seqNum = seqNum;
			this.taskGroup = taskGroup;
			this.taskName = taskName;
			this.typeRow = typeRow;
			this.planStDt= planStDt;
		}
		
		private String getLevel() {
			
			String newLevel = "2";
			if(typeRow.equals("Parent")) 
				newLevel = "1";
			return newLevel;		
		}
		
		
		public JsonArray archiveExecutionAdd() {
			
			JsonArray jsonArray = new JsonArray();
			try {
				
				ArrayList<Integer> arrSeqNum = new ArrayList<Integer>();
				ArrayList<String> arrOppId = new ArrayList<String>();
				ArrayList<String> arrOppName = new ArrayList<String>();
				ArrayList<String> arrLevel = new ArrayList<String>();
				ArrayList<String> arrTaskId = new ArrayList<String>();
				ArrayList<String> arrTaskGroup = new ArrayList<String>();
				ArrayList<String> arrTaskName = new ArrayList<String>();
				ArrayList<String> arrTaskType = new ArrayList<String>();
				ArrayList<String> arrMajorDep = new ArrayList<String>();
				ArrayList<String> arrAssignedTo = new ArrayList<String>();
				ArrayList<String> arrPlanSrt = new ArrayList<String>();
				ArrayList<String> arrPlanEnd = new ArrayList<String>();
				ArrayList<String> arrActSrt = new ArrayList<String>();
				ArrayList<String> arrActEnd = new ArrayList<String>();
				ArrayList<String> arrCompletion = new ArrayList<String>();
				ArrayList<String> arrStatus = new ArrayList<String>();
				ArrayList<String> arrRemark = new ArrayList<String>();
				
				
				ArrayList<Integer> arrSeqNumRes = new ArrayList<Integer>();
				ArrayList<String> arrOppIdRes = new ArrayList<String>();
				ArrayList<String> arrOppNameRes = new ArrayList<String>();
				ArrayList<String> arrLevelRes = new ArrayList<String>();
				ArrayList<String> arrTaskIdRes = new ArrayList<String>();
				ArrayList<String> arrTaskGroupRes = new ArrayList<String>();
				ArrayList<String> arrTaskNameRes = new ArrayList<String>();
				ArrayList<String> arrTaskTypeRes = new ArrayList<String>();
				ArrayList<String> arrMajorDepRes = new ArrayList<String>();
				ArrayList<String> arrAssignedToRes = new ArrayList<String>();
				ArrayList<String> arrPlanSrtRes = new ArrayList<String>();
				ArrayList<String> arrPlanEndRes = new ArrayList<String>();
				ArrayList<String> arrActSrtRes = new ArrayList<String>();
				ArrayList<String> arrActEndRes = new ArrayList<String>();
				ArrayList<String> arrCompletionRes = new ArrayList<String>();
				ArrayList<String> arrStatusRes = new ArrayList<String>();
				ArrayList<String> arrRemarkRes = new ArrayList<String>();
				
				String selectQuery = "select * from archive_execution_info where oppid='"+Id+"' order by seq_no";
				Statement st1 = con.createStatement();
				ResultSet rs = st1.executeQuery(selectQuery);
			
				int selectedIndex = seqNum-1;
				
				while(rs.next()) {
					
					arrSeqNum.add(rs.getInt("seq_no"));
					arrOppId.add(rs.getString("oppId"));
					arrOppName.add(rs.getString("oppName"));
					arrLevel.add(rs.getString("level"));
					arrTaskId.add(rs.getString("taskId"));
					arrTaskGroup.add(rs.getString("taskGroup"));
					arrTaskName.add(rs.getString("taskName"));
					arrTaskType.add(rs.getString("taskType"));
					arrMajorDep.add(rs.getString("majorDependencies"));
					arrAssignedTo.add(rs.getString("assignedTo"));
					arrPlanSrt.add(rs.getString("planSrt"));
					arrPlanEnd.add(rs.getString("planEnd"));
					arrActSrt.add(rs.getString("actSrt"));
					arrActEnd.add(rs.getString("actEnd"));
					arrCompletion.add(rs.getString("completion"));
					arrStatus.add(rs.getString("status"));
					arrRemark.add(rs.getString("remark"));
					
					}
				int newIndex = findingNewNode(selectedIndex, arrLevel);
				
				for(int j = 0; j<newIndex; j++) {
					
					arrSeqNumRes.add(j,arrSeqNum.get(j));
					arrOppIdRes.add(j,arrOppId.get(j));
					arrOppNameRes.add(j,arrOppName.get(j));
					arrLevelRes.add(j,arrLevel.get(j));
					arrTaskIdRes.add(j,arrTaskId.get(j));
					arrTaskGroupRes.add(j,arrTaskGroup.get(j));
					arrTaskNameRes.add(j,arrTaskName.get(j));
					arrTaskTypeRes.add(j,arrTaskType.get(j));
					arrMajorDepRes.add(j,arrMajorDep.get(j));
					arrAssignedToRes.add(j,arrAssignedTo.get(j));
					arrPlanSrtRes.add(j,arrPlanSrt.get(j));
					arrPlanEndRes.add(j,arrPlanEnd.get(j));
					arrActSrtRes.add(j,arrActSrt.get(j));
					arrActEndRes.add(j,arrActEnd.get(j));
					arrCompletionRes.add(j,arrCompletion.get(j));
					arrStatusRes.add(j,arrStatus.get(j));
					arrRemarkRes.add(j,arrRemark.get(j));
					
				}
				
				arrSeqNumRes.add(newIndex,newIndex+1);
				arrOppIdRes.add(newIndex,Id);
				arrOppNameRes.add(newIndex,oppName);
				arrLevelRes.add(newIndex,getLevel());
				arrTaskIdRes.add(newIndex,getTaskId(newIndex, arrLevel));
				arrTaskGroupRes.add(newIndex,taskGroup);
				arrTaskNameRes.add(newIndex,taskName);
				arrTaskTypeRes.add(newIndex,"");
				arrMajorDepRes.add(newIndex,"");
				arrAssignedToRes.add(newIndex,"");
				arrPlanSrtRes.add(newIndex,"");
				arrPlanEndRes.add(newIndex,"");
				arrActSrtRes.add(newIndex,"");
				arrActEndRes.add(newIndex,"");
				arrCompletionRes.add(newIndex,"");
				arrStatusRes.add(newIndex,"");
				arrRemarkRes.add(newIndex,"");
				
				for(int i = newIndex; i<arrSeqNum.size(); i++) {
							
					arrSeqNumRes.add(i+1,arrSeqNum.get(i)+1);
					arrOppIdRes.add(i+1,arrOppId.get(i));
					arrOppNameRes.add(i+1,arrOppName.get(i));
					arrLevelRes.add(i+1,arrLevel.get(i));
					arrTaskIdRes.add(i+1,changeTaskId(arrTaskId.get(i),arrLevel.get(i)));
					arrTaskGroupRes.add(i+1,arrTaskGroup.get(i));
					arrTaskNameRes.add(i+1,arrTaskName.get(i));
					arrTaskTypeRes.add(i+1,arrTaskType.get(i));
					arrMajorDepRes.add(i+1,arrMajorDep.get(i));
					arrAssignedToRes.add(i+1,arrAssignedTo.get(i));
					arrPlanSrtRes.add(i+1,arrPlanSrt.get(i));
					arrPlanEndRes.add(i+1,arrPlanEnd.get(i));
					arrActSrtRes.add(i+1,arrActSrt.get(i));
					arrActEndRes.add(i+1,arrActEnd.get(i));
					arrCompletionRes.add(i+1,arrCompletion.get(i));
					arrStatusRes.add(i+1,arrStatus.get(i));
					arrRemarkRes.add(i+1,arrRemark.get(i));
					
					}
				
				String deleteQuery = "delete from archive_execution_info where oppid='"+Id+"' order by seq_no;";
				Statement st3 = con.createStatement();
	            st3.executeUpdate(deleteQuery);
				
				for(int k = 0; k<arrSeqNumRes.size(); k++) {
					
				/*
				 * JsonObject jsonObject = new JsonObject();
				 * 
				 * 
				 * jsonObject.addProperty("seq_no", arrSeqNumRes.get(k));
				 * jsonObject.addProperty("oppId", arrOppIdRes.get(k));
				 * jsonObject.addProperty("oppName", arrOppNameRes.get(k));
				 * jsonObject.addProperty("level", arrLevelRes.get(k));
				 * jsonObject.addProperty("taskId", arrTaskIdRes.get(k));
				 * jsonObject.addProperty("taskGroup", arrTaskGroupRes.get(k));
				 * jsonObject.addProperty("taskName", arrTaskNameRes.get(k));
				 * jsonObject.addProperty("taskType", arrTaskTypeRes.get(k));
				 * jsonObject.addProperty("majorDep", arrMajorDepRes.get(k));
				 * jsonObject.addProperty("assignedTo", arrAssignedToRes.get(k));
				 * jsonObject.addProperty("planStart", arrPlanSrtRes.get(k));
				 * jsonObject.addProperty("planEnd", arrPlanEndRes.get(k));
				 * jsonObject.addProperty("actStart", arrActSrtRes.get(k));
				 * jsonObject.addProperty("actEnd", arrActEndRes.get(k));
				 * jsonObject.addProperty("completion", arrCompletionRes.get(k));
				 * jsonObject.addProperty("status", arrStatusRes.get(k));
				 * jsonObject.addProperty("remark", arrRemarkRes.get(k));
				 */
					
				
					System.out.println(arrSeqNumRes.get(k)+" "+arrLevelRes.get(k)+" "+arrTaskIdRes.get(k)+" "+arrTaskGroupRes.get(k));
					
					String insertQuery = "insert into archive_execution_info(seq_no, oppId, oppName, level, taskId, taskGroup, taskName, taskType, majorDependencies, assignedTo, planSrt, planEnd, actSrt, actEnd, completion, status, remark)"
										+"values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement prepare = con.prepareStatement(insertQuery);
	                prepare.setInt(1, arrSeqNumRes.get(k));
	                prepare.setString(2, arrOppIdRes.get(k));
	                prepare.setString(3, arrOppNameRes.get(k));
	                prepare.setString(4, arrLevelRes.get(k));
	                prepare.setString(5, arrTaskIdRes.get(k));
	                prepare.setString(6, arrTaskGroupRes.get(k));
	                prepare.setString(7, arrTaskNameRes.get(k));
	                prepare.setString(8, arrTaskTypeRes.get(k));
	                prepare.setString(9, arrMajorDepRes.get(k));
	                prepare.setString(10, arrAssignedToRes.get(k));
	                prepare.setString(11, arrPlanSrtRes.get(k));
	                prepare.setString(12, arrPlanEndRes.get(k));
	                prepare.setString(13, arrActSrtRes.get(k));
	                prepare.setString(14, arrActEndRes.get(k));
	                prepare.setString(15, arrCompletionRes.get(k));
	                prepare.setString(16, arrStatusRes.get(k));
	                prepare.setString(17, arrRemarkRes.get(k));
	                prepare.execute();
	                
				}
				
				ArchiveExecutionSaveService archive = new ArchiveExecutionSaveService(Id, newIndex+1, "planSrt", planStDt);
				if(typeRow.equals("Child"))
	        	archive.ArchiveExecutionSave();
				System.gc();
				
				ArchiveExecutionDetailService archiveExecution =  new ArchiveExecutionDetailService();
				jsonArray = archiveExecution.archiveExecutionDataRetrieve(Id,oppName);
				archiveExecution =null;
				System.gc();
				}
				catch(Exception e) {
				e.printStackTrace();
			}
		
			return jsonArray;
		}
		
		
		private String getTaskId(int newIndex, ArrayList<String> level) {
			
			String taskId = "";
			int parentSeqNum = 0;
			int childSeqNum = 0;
			
			
			for(int i = 0; i<newIndex; i++) {
				
				if(level.get(i).equals("1")) {
					parentSeqNum++;
					childSeqNum=0;
				}
				else
				childSeqNum++;
				
			}
			if(typeRow.equals("Parent")){
				taskId = String.valueOf(++parentSeqNum);
				
			}
			else{
				String child = String.valueOf(++childSeqNum);
				taskId = parentSeqNum+"."+((child.length() == 2) ? child : "0"+child);
			}
				 return taskId;
		}

	
	  private String changeTaskId(String taskId, String iterationLevel) {
	  
		  String value = taskId;
		  
		  if(typeRow.equals("Parent")) {
			  if(taskId.contains(".")) {
				  int afterDecimalValue = Integer.parseInt(taskId.substring(0,taskId.lastIndexOf(".")));
				  afterDecimalValue++;
				  value = afterDecimalValue+taskId.substring(taskId.lastIndexOf("."));
			  }
			  else {
				  int intValue = Integer.parseInt(taskId)+1;
				  value = String.valueOf(intValue);
			  }		  
		  }
		  else if(typeRow.equals("Child") && checkChild) {
			  if(iterationLevel.equals("1"))
				  checkChild = false;

			  else {
				  int childValue = Integer.parseInt(taskId.substring(taskId.lastIndexOf(".")+1));
				  childValue++;
				  String child = String.valueOf(childValue);
				  value = taskId.substring(0,taskId.lastIndexOf(".")+1) + ((child.length() == 2) ? child : "0"+child);
			  }
		  }
			  
			return value;
	  }
	 
		
		private int findingNewNode(int selectedIndex, ArrayList<String> level) {
			
			int index = 0;
			boolean checkChildFlag = false;
			int currentLevel = Integer.parseInt(level.get(selectedIndex));
			if(currentLevel == 2) 
				index = selectedIndex+1;
			
			else if(currentLevel == 1) {
				
				for( int j = selectedIndex+1; j<level.size(); j++) {
					
					if(level.get(j).equals("2")) {
						index = j+1;
						checkChildFlag = true;
						continue;
					}
					else if(level.get(j).equals("1")) 
						break;		
				}
				if(!checkChildFlag) 
					index = selectedIndex+1;
				
			}
				
			
			return index;
		}
		
		protected void finalize() throws Throwable 
	    	{ 
				System.out.println("Db connection closed.");
		        con.close();
	    	}
		
}
