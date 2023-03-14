package NewArchiveRequirements.AbbreviationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import java.security.*;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class Add_Abbreviation_Service {
	public static JsonObject add_Abbreviation(String app_id,String abbreviation_acronym,String description) {
		JsonObject jsonobj = new JsonObject();
		try {
//			int uabbcount=0,udescount=0;
			String random_id = generateRandomApprovalId();
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String select_query ="select count(*) from archivereq_abbreviations_info_details where app_id=?";
			PreparedStatement preparedStmt = connection.prepareStatement(select_query);
			preparedStmt.setString(1, app_id);
			ResultSet rs=preparedStmt.executeQuery();
//			String select_query1 ="select count(*) from users where u_email=?";
//			PreparedStatement preparedStmt2 = connection.prepareStatement(select_query1);
//			preparedStmt2.setString(1, u_email);
//			ResultSet rs2=preparedStmt2.executeQuery();	
//			rs.next();			
//			uabbcount = rs.getInt(1);	
//			rs2.next();
//			udescount = rs2.getInt(1);	
//			if(uabbcount!=0)
//			{
//				jsonobj.addProperty("uabbduplicate", "Yes");
//			}
//			if(udescount!=0)
//			{
//				jsonobj.addProperty("udesduplicate", "Yes");
//			}
//
//			if(uabbcount!=0 && udescount!=0)
//			{
//				jsonobj.addProperty("uabbduplicate", "Yes");
//				jsonobj.addProperty("udesduplicate", "Yes");
//			}
//			if(uabbcount==0 && udescount==0)
//			{
//				System.out.println("uabbreviation Count : "+uabbcount);
//				System.out.println("udesc Count : "+udescount);

				String insert_query ="insert into archivereq_abbreviations_info_details (seq_no,app_id,abbreviation_acronym,description) values( ?, ?, ?, ?);";
				PreparedStatement preparedStmt1 = connection.prepareStatement(insert_query);
				preparedStmt1.setString(1, random_id);
				preparedStmt1.setString(2, app_id);
				preparedStmt1.setString(3, abbreviation_acronym);
				preparedStmt1.setString(4, description);
				
				preparedStmt1.execute();
				jsonobj.addProperty("flag", "Success");
				jsonobj.addProperty("id", random_id);
				jsonobj.addProperty("app_id", app_id);
				jsonobj.addProperty("abbreviation_acronym", abbreviation_acronym);
				jsonobj.addProperty("description", description);
			//}
			}
			catch(Exception e)
			{
				System.out.println("Exception Occurs");
			}
			return jsonobj;
		}
		public static String generateRandomApprovalId() throws SQLException {
			String uniqueID = "";
			boolean checkTermination = true;
			while(checkTermination) {
				uniqueID = UUID.randomUUID().toString();
				System.out.println("App Id : " + uniqueID);
				boolean checkDuplicateId = checkDuplicateApprovalId(uniqueID);
				if(checkDuplicateId == false) {
					checkTermination = false;
				}
			}
			return uniqueID;
		}
		public static boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
			PreparedStatement state=null;
			ResultSet result=null;
			boolean checkDuplicate = false;

			try {
				DBconnection dBconnection = new DBconnection();
				Connection connection = (Connection) dBconnection.getConnection();
				System.out.println("Connected...");
				String selectQuery = "select * from archivereq_abbreviations_info_details order by app_id;";
				state = connection.prepareStatement(selectQuery);
				result= state.executeQuery();
				while(result.next()) {
					String checkApprovalId = result.getString("random_id");
					if(checkApprovalId.equals(uniqueID)) {
						checkDuplicate = true;
					}   
				}
				state.close();
				result.close();
			}
			catch(Exception e)
			{

			}
			return checkDuplicate;

		}
	}