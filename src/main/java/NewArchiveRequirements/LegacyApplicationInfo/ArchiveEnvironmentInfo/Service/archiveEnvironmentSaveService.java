package NewArchiveRequirements.LegacyApplicationInfo.ArchiveEnvironmentInfo.Service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveEnvironmentSaveService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	String tableName;
	String columnSuffix;
	public archiveEnvironmentSaveService(String Id,JsonArray jsonArray,String tableName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
		 this.tableName = tableName;
		 columnSuffix = getColumnSuffix(tableName);
	}

	private String getColumnSuffix(String tableName)
	{
		return((tableName.equals("archive_environment_name_info"))?"Name":(tableName.equals("archive_environment_serverip_info")?"ServerIp":""));
	}
	public JsonObject archiveEnvironmentSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{	
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String dev = jsonObj.get("dev").getAsString();
		  		String test =  jsonObj.get("test").getAsString();
		  		String stage=  jsonObj.get("stage").getAsString();
		  		String prod =  jsonObj.get("prod").getAsString();
		  		
			  String UpdateQuery = "update "+tableName+" set dev"+columnSuffix+" = ?, test"+columnSuffix+" =?, stage"+columnSuffix+"=?, prod"+columnSuffix+"=? where OppId='"+Id+"' and seq_no='"+seqNum+"'";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, dev);
	          prestmt.setString(2, test);
	          prestmt.setString(3, stage);
	          prestmt.setString(4, prod);
	          prestmt.execute();
			}
			statusFlag =true;
			
			
		}
		
		catch(Exception e)
		{
			statusFlag =false;
			e.printStackTrace();
		}
		jsonObject.addProperty("SaveStatus", statusFlag);
		return jsonObject;
		
	}
	protected void finalize() throws Throwable {
      con.close();
	}

}
