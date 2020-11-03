package NewArchiveRequirements.Introduction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class archiveReqIntroRolesResponseTemplateService {

	
DBconnection dBconnection =null;
	
	Connection con = null;
	
	public String Id = null;
	public String OppName;
	
	public archiveReqIntroRolesResponseTemplateService(String Id,String OppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.OppName = OppName;
	}

	
	public void archiveReqRolesResponseDefaultRecords() {
		
		
		 try {
			 
			 String oppName = "";
			 
			 String QueryAppName = "SELECT * FROM OPPORTUNITY_INFO WHERE COLUMN_NAME = 'appName' and Id = '"+Id+"';";
			 Statement st = con.createStatement();
			 ResultSet rs = st.executeQuery(QueryAppName);
			 
			 if(rs.next())
				 oppName = rs.getString("value");
			 
			 st.close();
			 rs.close();
			 
			
			 
			 String selectQuery = "select * from ArchiveReq_Roles_Info_Template_Details";
			 Statement st1 = con.createStatement();
			 ResultSet rs1 = st1.executeQuery(selectQuery);
			 
			 while(rs1.next()) {
				 String RolesResponse_InsertQuery = "insert into ArchiveReq_Roles_Info (seq_no, OppId, prj_name, OppName, role, name, title, approverpurpose)"
						 +" value(?,?,?,?,?,?,?,?)";
				 
				 PreparedStatement preparedStatement1 = con.prepareStatement(RolesResponse_InsertQuery);
					preparedStatement1.setInt(1, rs1.getInt(1));
					preparedStatement1.setString(2, Id);
					preparedStatement1.setString(3, "");
					preparedStatement1.setString(4, oppName);
					preparedStatement1.setString(5, rs1.getString(2));
					preparedStatement1.setString(6, rs1.getString(3));
					preparedStatement1.setString(7, rs1.getString(4));
					preparedStatement1.setString(8, rs1.getString(5));
					preparedStatement1.execute();
			 	}
				 st1.close();
				 rs1.close();
			 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		
	}
	
	public JsonArray archiveReqIntroRolesResponseDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			 String selectQuery1 = "select * from ArchiveReq_Roles_Info where OppId = '"+Id+"';";
			 Statement st2 = con.createStatement();
			 ResultSet rs2 = st2.executeQuery(selectQuery1);
			 
			 if(!rs2.next()) {
				 archiveReqRolesResponseDefaultRecords();
				 
			 }
			 jsonArray = getTableInfo();
			 st2.close();
			 rs2.close();
		}
		
			 catch(Exception e) {
				 e.printStackTrace();
			 }
		return jsonArray;
	}
	
	public JsonArray getTableInfo() {
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			 String selectQuery1 = "select * from ArchiveReq_Roles_Info where OppId = '"+Id+"' order by seq_no;";
			 Statement st2 = con.createStatement();
			 ResultSet rs2 = st2.executeQuery(selectQuery1);
			 
			 while(rs2.next()) {
				 JsonObject jsonObject = new JsonObject();
				 jsonObject.addProperty("seqNum", rs2.getInt(1));
				 jsonObject.addProperty("OppId", rs2.getString(2));
				 jsonObject.addProperty("prj_name", rs2.getString(3));
				 jsonObject.addProperty("OppName", rs2.getString(4));
				 jsonObject.addProperty("role", rs2.getString(5));
				 jsonObject.addProperty("name", rs2.getString(6));
				 jsonObject.addProperty("title", rs2.getString(7));
				 jsonObject.addProperty("approverpurpose", rs2.getString(8));
				 jsonArray.add(jsonObject);
			 }
			 st2.close();
			 rs2.close();
		}
		
			 catch(Exception e) {
				 e.printStackTrace();
			 }
		return jsonArray;
		
	}
	
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}
	
}
