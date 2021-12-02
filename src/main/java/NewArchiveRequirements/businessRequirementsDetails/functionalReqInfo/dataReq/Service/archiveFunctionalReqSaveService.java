package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveFunctionalReqSaveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	String tableName;
	String column;
	public archiveFunctionalReqSaveService(String Id,JsonArray jsonArray,String tableName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
		 this.tableName = tableName;
		 getTableNameInfo();
	}

	
	public JsonObject archiveFunctionalReqSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{	
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String ReqId = jsonObj.get("ReqId").getAsString();
		  		String InScope =  jsonObj.get("InScope").getAsString();
		  		String ReqType=  jsonObj.get("ReqType").getAsString();
		  		String Requirements =  jsonObj.get("Requirements").getAsString();
		  		String Additional =  jsonObj.get("Additional").getAsString();
		  		
			  String UpdateQuery = "update "+tableName+" set reqId = ?, reqInScope =?, reqType=?, "+column+"=?, additionInfo=? where OppId='"+Id+"' and seq_no='"+seqNum+"'";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, ReqId);
	          prestmt.setString(2, InScope);
	          prestmt.setString(3, ReqType);
	          prestmt.setString(4, Requirements);
	          prestmt.setString(5, Additional);
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
	
	public void getTableNameInfo() {

		switch(tableName) {
		
		case "Archive_DataReq_Info":
			column = "req";
			break;
		default : 
			column = "descp";
		}
	}
	
	protected void finalize() throws Throwable {
      con.close();
	}

	
}
