package ArchiveExecutionGovernanceModule.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ArchiveExecutionGovernanceDetailService {

	
	 DBconnection dBconnection =null;
		
		Connection con = null;
	
	public ArchiveExecutionGovernanceDetailService() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}

	public JsonArray archiveExecutionGovernanceDataRetrieve(String waveId, String waveName) {
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			JsonObject jsonObject = archiveExecutionHearderInfo(waveId); 
			jsonArray.add(jsonObject);
			
			String selectQuery = "select * from Archive_Execution_governance_Info where waveId = ? and waveName = ? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, waveId);
			st.setString(2, waveName);
			ResultSet rs = st.executeQuery();
						
			while(rs.next())
			{
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("seq_no",rs.getString(1));
				jsonObj.addProperty("waveId",rs.getString(2));
				jsonObj.addProperty("waveName",rs.getString(3));
				jsonObj.addProperty("level",rs.getString(4));
				jsonObj.addProperty("taskId",rs.getString(5));
				jsonObj.addProperty("taskGroup",rs.getString(6));
				jsonObj.addProperty("taskName",rs.getString(7));
				jsonObj.addProperty("taskType",rs.getString(8));
				jsonObj.addProperty("majorDep",rs.getString(9));
				jsonObj.addProperty("assignedTo",rs.getString(10));
				jsonObj.addProperty("planStart",rs.getString(11));
				jsonObj.addProperty("planEnd",rs.getString(12));
				jsonObj.addProperty("actStart",rs.getString(13));
				jsonObj.addProperty("actEnd",rs.getString(14));
				jsonObj.addProperty("completion",rs.getString(15));
				jsonObj.addProperty("status",rs.getString(16));
				jsonObj.addProperty("remark",rs.getString(17));
				jsonArray.add(jsonObj);
				
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
		
	}
	
	
	private JsonObject archiveExecutionHearderInfo(String waveId) {
		
		JsonObject jsonObj = new JsonObject();
		try {
			
			String selectQuery = "select * from governance_info where waveId = ?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, waveId);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				if((rs.getString("column_name")).equals("waveId"))
					jsonObj.addProperty("waveId",rs.getString("value"));
				else if((rs.getString("column_name")).equals("waveName"))
					jsonObj.addProperty("waveName",rs.getString("value"));
			}
			
			st.close();
			rs.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonObj;
		
	}
	
	protected void finalize() throws Throwable 
    { 
		System.out.println("Db connection closed.");
        con.close();
    }
	
	
}
