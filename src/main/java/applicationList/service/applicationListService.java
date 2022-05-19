package applicationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

public class applicationListService {
	/*
	 * DBconnection dBconnection; Connection con; JsonArray jsonArray ; public
	 * applicationListService(JsonArray jsonArray) throws ClassNotFoundException,
	 * SQLException { dBconnection = new DBconnection(); con = (Connection)
	 * dBconnection.getConnection(); this.jsonArray = jsonArray; }
	 */

	 public static JsonObject applicationListSave(String opportunityName, String opportunityId, String phase, String wave, String resource) {
		 JsonObject jsonobj = new JsonObject();
		 try {
		 DBconnection dBconnection = new DBconnection();
		 Connection connection = (Connection) dBconnection.getConnection();
		 String applicationListInsertQuery = "insert into application_list(opportunityName, opportunityId, phase, wave, resource) values(?,?,?,?,?);";
		 PreparedStatement preparedStatement1 = connection.prepareStatement(applicationListInsertQuery);
			/* preparedStatement1.setInt(1, seq_no); */
		 preparedStatement1.setString(2, opportunityName);
		 preparedStatement1.setString(3, opportunityId);
		 preparedStatement1.setString(4, phase);
		 preparedStatement1.setString(5, wave);
		 preparedStatement1.setString(6, resource);
		 preparedStatement1.execute();
		 System.out.println("Inserted");
		 } 
		 
		 catch (Exception e) {
			 
		 }
		return jsonobj;
	 }
	 
}
