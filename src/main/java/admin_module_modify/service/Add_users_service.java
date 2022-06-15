package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import java.security.*;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class Add_users_service {
	public static JsonObject add_users(String uname,String ufname,String ulname,String u_email,String u_pwd,String u_role) {
		JsonObject jsonobj = new JsonObject();
		try {
			String s_u_pwd = generate_u_encrypt_pwd(u_pwd);
			System.out.println("S_U_Pwd:"+s_u_pwd);
			String random_id = generateRandomApprovalId();
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String insert_query ="insert into users (random_id,uname,ufname,ulname,u_email,u_pwd,u_role) values(?,?, ?, ?, ?, ?, ?);";
			PreparedStatement preparedStmt1 = connection.prepareStatement(insert_query);
			preparedStmt1.setString(1, random_id);
			preparedStmt1.setString(2, uname);
			preparedStmt1.setString(3, ufname);
			preparedStmt1.setString(4, ulname);
			preparedStmt1.setString(5, u_email);
			preparedStmt1.setString(6, s_u_pwd);
			preparedStmt1.setString(7, u_role);
			preparedStmt1.execute();
			jsonobj.addProperty("id", random_id);
			jsonobj.addProperty("uname", uname);
			jsonobj.addProperty("ufname", ufname);
			jsonobj.addProperty("ulname", ulname);
			jsonobj.addProperty("u_email", u_email);
			jsonobj.addProperty("u_pwd", s_u_pwd);
			jsonobj.addProperty("u_role", u_role);
		}
		catch(Exception e)
		{
			System.out.println("Execption Occurs");
		}
		return jsonobj;
	}
	public static String generate_u_encrypt_pwd(String u_pwd) throws SQLException {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.update(u_pwd.getBytes());
			byte[] pwdresultarray =md.digest();
			StringBuilder psb=new StringBuilder();
			for(byte b:pwdresultarray)
			{
				psb.append(String.format("%02x",b));
			}
			return psb.toString();
		}
		catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	public static String generateRandomApprovalId() throws SQLException {
		String uniqueID = "";
		boolean checkTermination = true;
		while(checkTermination) {
			uniqueID = UUID.randomUUID().toString();
			System.out.println("App Id : " + uniqueID);
			boolean checkDupilcateId = checkDuplicateApprovalId(uniqueID);
			if(checkDupilcateId == false) {
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
			String selectQuery = "select * from users order by seq_no;";
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