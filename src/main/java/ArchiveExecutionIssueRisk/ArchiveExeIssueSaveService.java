package ArchiveExecutionIssueRisk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ArchiveExeIssueSaveService {
	
	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	public ArchiveExeIssueSaveService(String Id,JsonArray jsonArray) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
	}

	public JsonObject archiveExeIssueSave()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{	boolean statusFlag =false;
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seq_no = jsonObj.get("seq_no").getAsString();	
		  		String app_Id = jsonObj.get("app_Id").getAsString();
		  		String impact =  jsonObj.get("impact").getAsString();
		  		String type =  jsonObj.get("type").getAsString();
		  		String description =  jsonObj.get("description").getAsString();
		  		String start_date =  jsonObj.get("start_date").getAsString();
		  		String raised_by =  jsonObj.get("raised_by").getAsString();
		  		String status =  jsonObj.get("status").getAsString();
		  		String assigned_to =  jsonObj.get("assigned_to").getAsString();
		  		String resolved =  jsonObj.get("resolved").getAsString();
		  		String exp_date =  jsonObj.get("exp_date").getAsString();
		  		String end_date =  jsonObj.get("end_date").getAsString();
		  		String comments =  jsonObj.get("comments").getAsString();
		  		System.out.println(" ye araha"+app_Id+""+impact+""+type+""+comments+""+exp_date+" ye araha");
		  		
			  String UpdateQuery = "update ArchiveExe_Issue_Info set impact=?,type=?,description=?,"
			  		+ "start_date=?,raised_by=?,status=?,assigned_to=?,resolved=?,exp_date=?,end_date=?,comments=? where app_Id='"+app_Id+"'";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	         // prestmt.setString(1, seq_no);
	         // prestmt.setString(2, app_Id);
	          prestmt.setString(1, impact);
	          prestmt.setString(2, type);
	          prestmt.setString(3, description);
	          prestmt.setString(4, start_date);
	          prestmt.setString(5, raised_by);
	          prestmt.setString(6, status);
	          prestmt.setString(7, assigned_to);
	          prestmt.setString(8, resolved);
	          prestmt.setString(9, exp_date);
	          prestmt.setString(10, end_date);
	          prestmt.setString(11, comments);
	          prestmt.execute();
	          statusFlag =true;
			}
			jsonObject.addProperty("SaveStatus", statusFlag);
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}
	protected void finalize() throws Throwable {
      con.close();
	}


}
