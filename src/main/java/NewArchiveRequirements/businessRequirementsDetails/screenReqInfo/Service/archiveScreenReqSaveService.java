package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveScreenReqSaveService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	String tableName;
	String column;
	 public archiveScreenReqSaveService(String Id,JsonArray jsonArray,String tableName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
		 this.tableName = tableName;
	}

	
	public JsonObject archiveFunctionalReqScreenReqSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		boolean updateSearchFormFlag = true;
		try
		{	
			for(int i=0;i<jsonArray.size();i++)
			{
				
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String ReqId = jsonObj.get("ReqId").getAsString();
		  		String screenDisplay =  jsonObj.get("screenDisplay").getAsString();
		  		String purpose=  jsonObj.get("purpose").getAsString();
		  		String equivalent =  jsonObj.get("equivalent").getAsString();
		  		
			  String UpdateQuery = "update archive_screenreq_info set  screenDisplay =?, purpose=?, equivalentLegacy = ? where OppId='"+Id+"' and seq_no='"+seqNum+"'";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, screenDisplay);
	          prestmt.setString(2, purpose);
	          prestmt.setString(3, equivalent);
	          prestmt.execute();
	          if(updateSearchFormFlag)
	          updateSearchFormFlag=updateSearchFormName(screenDisplay,ReqId);
	          else
	          updateSearchFormFlag = false;
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
	
	public JsonObject archiveFunctionalReqSearchFormSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{	
			for(int i=0;i<jsonArray.size();i++)
			{
				
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String searchForm = jsonObj.get("searchForm").getAsString();
		  		String searchField =  jsonObj.get("searchField").getAsString();
		  		String fieldFormat=  jsonObj.get("fieldFormat").getAsString();
		  		String dataType =  jsonObj.get("dataType").getAsString();
		  		String dataRetrieval =  jsonObj.get("dataRetrieval").getAsString();
		  		String requiredField=  jsonObj.get("requiredField").getAsString();
		  		String additionalInfo =  jsonObj.get("additionalInfo").getAsString();
		  		
			  String UpdateQuery = "update archive_screenreq_searchform set  searchForm =?, searchField =?, fieldFormat=?, dataType =?, dataRetrieval = ?, requiredField=?, additionalInfo=?  where OppId='"+Id+"' and seq_no='"+seqNum+"'";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, searchForm);
	          prestmt.setString(2, searchField);
	          prestmt.setString(3, fieldFormat);
	          prestmt.setString(4, dataType);
	          prestmt.setString(5, dataRetrieval);
	          prestmt.setString(6, requiredField);
	          prestmt.setString(7, additionalInfo);
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
	private boolean updateSearchFormName(String searchForm,String reqId)
	{
		boolean statusFlag = false;
		try
		{
			int seqNum = 0;
			String selectQuery = "select min(seq_no) from archive_screenreq_searchform where oppId='"+Id+"' and reqId = '"+reqId+"'";
			Statement st =  con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next())
				seqNum = rs.getInt(1);
			
			String UpdateQuery = "update archive_screenreq_searchform set  searchForm =?  where OppId='"+Id+"' and seq_no='"+seqNum+"'";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1,searchForm);
	          prestmt.execute();
			statusFlag = true;
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
