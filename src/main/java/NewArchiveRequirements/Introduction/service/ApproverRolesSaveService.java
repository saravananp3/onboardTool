package NewArchiveRequirements.Introduction.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class ApproverRolesSaveService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	public ApproverRolesSaveService(String Id,JsonArray jsonArray) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
	}

	public JsonObject archiveIntroRolesResponseSave()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{	boolean statusFlag =false;
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String role = jsonObj.get("role").getAsString();
		  		String name =  jsonObj.get("name").getAsString();
		  		String title =  jsonObj.get("title").getAsString();
		  		String approverPurpose =  jsonObj.get("approverpurpose").getAsString();
		  		
			  String UpdateQuery = "update ArchiveReq_Roles_Info set role = ?, name =?, title=?, approverpurpose=? where OppId='"+Id+"' and seq_no='"+seqNum+"'";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, role);
	          prestmt.setString(2, name);
	          prestmt.setString(3, title);
	          prestmt.setString(4, approverPurpose);
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
