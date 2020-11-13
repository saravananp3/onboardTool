package NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class businessReqSaveService{
	DBconnection dBconnection;
	Connection con;
	String columnName;
	String value;
	String Id;
	String app_Name;
	
	public businessReqSaveService(String columnName,String value,String Id,String appName) throws ClassNotFoundException, SQLException {
	this.columnName =columnName;
	this.value =value;
	this.Id =Id;
	this.app_Name = appName;
	 dBconnection = new DBconnection();
	 con = (Connection) dBconnection.getConnection();
	}
	
	public JsonObject BusinessRequirementSave()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkInsert =true;
			int max_seq = 0;
			String Business_Requirements = "Each requirement must be marked as In-Scope or Out-of-Scope for this project, with additional information specific to each requirement if necessary.::\r\n" + 
					"Requirement ID's are linked to test script ID's to ensure traceability from requirement to test execution. Requirement ID's may be formatted according to client needs.";
			String selectQuery = "select * from archivebussinessreq_info where OppId='"+Id+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next())
				checkInsert =false;
			rs.close();
			st.close();
			String selectSeqNum = "select max(seq_no) from archivebussinessreq_info;";
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(selectSeqNum);
			if(rs1.next())
				max_seq =rs1.getInt(1);
			rs1.close();
			st1.close();
			if(checkInsert)
			{
				String InsertQuery = "Insert into archivebussinessreq_info (seq_no,OppId,app_name,businessreq) values (?,?,?,?)";
				PreparedStatement prepareStmt = con.prepareStatement(InsertQuery);
				prepareStmt.setString(1,String.valueOf(max_seq+1));
				prepareStmt.setString(2,Id);
				prepareStmt.setString(3,app_Name);
				prepareStmt.setString(4, Business_Requirements);
				prepareStmt.execute();
				prepareStmt.close();
			}
			String UpdateQuery ="update archivebussinessreq_info set "+columnName+"='"+value+"' where OppId='"+Id+"';";
			Statement st2 = con.createStatement();
			System.out.println(UpdateQuery);
			st2.executeUpdate(UpdateQuery);
			
			st2.close();
			jsonObject.addProperty("checkUpdate", true);
		}
		catch(Exception e)
		{
			jsonObject.addProperty("checkUpdate", false);
			e.printStackTrace();
		}
		return jsonObject;
	}
	protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("DB connection closed");
	}
}