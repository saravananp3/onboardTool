package NewArchiveRequirements.addendumInfo.service;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import onboard.DBconnection;

public class ArchiveReqAddendumFileRetrieveService {
	public JsonArray file_retrieve(String Id) {
		
        JsonArray jsonArray = new JsonArray();
    try {
     	
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        String selectQuery = "select File_Name from archive_req_addendum_fileupload where oppId=?";
        PreparedStatement st=connection.prepareStatement(selectQuery);
        st.setString(1, Id);
        ResultSet rs = st.executeQuery();
        while(rs.next())
        {
            JsonObject jsonObj = new JsonObject();
//            jsonObj.addProperty("oppId",rs.getString(1));
            jsonObj.addProperty("File_Name",rs.getString(1));
            jsonArray.add(jsonObj);
            System.out.println("Data Fetched..."+jsonObj); 
       }
        connection.close();
    }
catch(Exception e)
    {
    System.out.println("Exception Occurs"+e);
    }
    System.out.println("Addendum File Json Array : "+jsonArray);
    return jsonArray;
}

}
