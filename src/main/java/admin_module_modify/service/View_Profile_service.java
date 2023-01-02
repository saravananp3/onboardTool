package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class View_Profile_service {
    public JsonArray view_profile(String username) {
    	PreparedStatement st=null;
    	ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
    try {
        //String random_id = generateRandomApprovalId();
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        System.out.println("username..."+username);

        String selectQuery = "select uname,ufname,ulname,u_email,u_role,random_id from decom3sixtytool.users where random_id IS NOT NULL and uname=?";
        st = connection.prepareStatement(selectQuery);
        st.setString(1, username);
        rs = st.executeQuery();
       if(rs.next()) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("uname",rs.getString(1));
            jsonObj.addProperty("ufname",rs.getString(2));
            jsonObj.addProperty("ulname",rs.getString(3));
            jsonObj.addProperty("u_email",rs.getString(4));
            jsonObj.addProperty("u_role",rs.getString(5));
            jsonObj.addProperty("random_id",rs.getString(6));
            jsonArray.add(jsonObj);
            System.out.println("jsonArray from view profile service "+jsonArray);
      
        st.close();
        rs.close();
       }
    }
catch(Exception e)
    {
    System.out.println("Exception Occurs");
    }
    System.out.println("JSON"+jsonArray);
    return jsonArray;
}
}