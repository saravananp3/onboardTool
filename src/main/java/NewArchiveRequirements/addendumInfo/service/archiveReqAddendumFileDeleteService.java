package NewArchiveRequirements.addendumInfo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.google.gson.JsonObject;

import onboard.DBconnection;

public class archiveReqAddendumFileDeleteService {

	 public static JsonObject delete_uploaded_files(String Id,String File_Name) {
	        JsonObject jsonobj = new JsonObject();
	    try {
	        DBconnection dBconnection = new DBconnection();
	        Connection connection = (Connection) dBconnection.getConnection();
	        System.out.println("DB Connected...");
	        String delete_query = "delete from archive_req_addendum_fileupload where oppId=? and File_Name=?;";
	        PreparedStatement st2=connection.prepareStatement(delete_query);
	        st2.setString(1, Id);
	        st2.setString(2, File_Name);
	        st2.executeUpdate();
	        System.out.println("File Deleted : "+File_Name);
	        jsonobj.addProperty("Deleted File : ", File_Name);
	        connection.close();
	        }
	    catch(Exception e)
	    {
	    System.out.println("Execption Occurs"+e);
	    }
	    return jsonobj;
	    }
}
