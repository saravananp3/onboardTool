package NewArchiveRequirements.LegacyApplicationInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedHashMap;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class archiveReqLegacyDataRetrieveService {

	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	public String oppName = null; 
	
	public archiveReqLegacyDataRetrieveService(String Id,String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.oppName = oppName;
	}
	
	public JsonArray archiveReqLegacyTemplateToArchiveReqLegacyInfo() {
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from archivereq_legacyapp_info where Id = '"+Id+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(!rs.next()) {
				
				String TemplateQuery = "select * from archivereq_legacyapp_template_details order by seq_no;";
				Statement st1 = con.createStatement();
				ResultSet rs1 = st1.executeQuery(TemplateQuery);
				
				
				while(rs1.next()) {
					String column =rs1.getString("column_name");
					String insertQuery = "insert into archivereq_legacyapp_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
					PreparedStatement preparedStatement1 = con.prepareStatement(insertQuery);
					preparedStatement1.setString(1, rs1.getString("seq_no"));
					preparedStatement1.setString(2, Id);
					preparedStatement1.setString(3, "");
					preparedStatement1.setString(4, oppName);
					preparedStatement1.setString(5, rs1.getString("options"));
					preparedStatement1.setString(6, rs1.getString("label_name"));
					preparedStatement1.setString(7, rs1.getString("column_name"));
					preparedStatement1.setString(8, rs1.getString("type"));
					preparedStatement1.setString(9, rs1.getString("mandatory"));
					preparedStatement1.setString(10, rs1.getString("value"));
					preparedStatement1.execute();
				}
				
			}
			jsonArray = archiveLegacyDataRetrieve();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	
	public JsonArray archiveLegacyDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from archivereq_legacyapp_info where Id = '"+Id+"' order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			LinkedHashMap<String,String> columnDetails = getAutoPopulateFields();
			while(rs.next()) {
				String column = rs.getString("column_name");
				JsonObject jsonObject = new JsonObject();
				
				jsonObject.addProperty("seq_num", rs.getString("seq_no"));
				jsonObject.addProperty("oppId", rs.getString("Id"));
				jsonObject.addProperty("prjName", rs.getString("prj_name"));
				jsonObject.addProperty("oppName", rs.getString("app_name"));
				jsonObject.addProperty("options", rs.getString("options"));
				jsonObject.addProperty("LabelName", rs.getString("label_name"));
				jsonObject.addProperty("ColumnName", rs.getString("column_name"));
				jsonObject.addProperty("Type", rs.getString("type"));
				jsonObject.addProperty("mandatory", rs.getString("mandatory"));
				jsonObject.addProperty("Value", columnDetails.containsKey(column)&&rs.getString("value").equals("")?getAutoPopulateValue(columnDetails.get(column)):rs.getString("value"));
				jsonArray.add(jsonObject);
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	public LinkedHashMap<String, String> getAutoPopulateFields(){
		LinkedHashMap<String, String> columnDet =new LinkedHashMap<String,String>(); 
		try {
			columnDet.put("legacyappname","appName-opportunity_info_details");
			columnDet.put("srcdb","AssessAppPlatform-assessment_application_info");
			columnDet.put("readonly","ReadonlyData-assessment_data_char_info");
			columnDet.put("ifYesDate","LastUpdateMade-assessment_data_char_info");
			columnDet.put("ifNoDate","ExpectedDate-assessment_data_char_info");
			columnDet.put("thirdpartyvendor","AppDetails-assessment_application_info");
			columnDet.put("AppDetails","DataTypeCharacteristics-assessment_data_char_info");
			//columnDet.put("srcdb","AssessAppPlatform-assessment_application_info");
			columnDet.put("nooftables","StrucNoofTables-assessment_data_char_info");
			columnDet.put("estimatestrucsize","StrucDBsize-assessment_data_char_info");
			columnDet.put("estimateunstrucsize","UnstrucDataVolume-assessment_data_char_info");
			columnDet.put("estimatefile","UnstrucNoofFiles-assessment_data_char_info");
			columnDet.put("datahold","legalhold-assessment_compliance_char_info");
			columnDet.put("encreq","enc-assessment_archival_consumption_info");
			columnDet.put("makreq","datamask-assessment_archival_consumption_info");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return columnDet;
	}
	
	public String getAutoPopulateValue(String columnTablePair)
	{
		String value="";
		try
		{
		 boolean checkValue =false;
		 String columnName =columnTablePair.split("-")[0];
		 String tableName =columnTablePair.split("-")[1];
		 
		 String selectQuery = "select * from "+tableName+" where column_name = '"+columnName+"' and Id = '"+Id+"'";
		 Statement st = con.createStatement();
		 ResultSet rs = st.executeQuery(selectQuery);
		 if(rs.next())
		 {
			 checkValue = true;
	         value= rs.getString("value");		 
		 }
		 if(!checkValue&&columnName.equals("AssessAppPlatform"))
		 {
			 tableName = "triage_info";
			 columnName ="appPlatfrm";
			 String selectQuery1 = "select * from "+tableName+" where column_name = '"+columnName+"' and Id = '"+Id+"'";
			 Statement st1 = con.createStatement();
			 ResultSet rs1 = st1.executeQuery(selectQuery1);
			 if(rs1.next())
			 {
				 checkValue = true;
		         value= rs1.getString("value");		 
			 } 
		 }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return value;
	}
	
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}

}
