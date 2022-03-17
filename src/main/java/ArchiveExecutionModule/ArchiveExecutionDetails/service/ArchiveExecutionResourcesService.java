package ArchiveExecutionModule.ArchiveExecutionDetails.service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class ArchiveExecutionResourcesService {

	DBconnection dBconnection =null;
    Connection con = null;
    public ArchiveExecutionResourcesService() throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }
    public JsonArray ArchiveExecutionResourcesdetail(String Id, String oppName) {
    	JsonArray jsonArray = new JsonArray();
    	try {
    		DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			
			String resselect ="select r_name from resources";
			 Statement resstmt = connection.createStatement();
			 ResultSet resrs = resstmt.executeQuery(resselect);
			 while(resrs.next()) {
				 jsonArray.add(resrs.getString("r_name"));
			 }
    	}
    	catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
    	
    }
}
