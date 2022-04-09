package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class Update_users_service {
    public static JsonObject update_users(String uname_modify,String ufname_modify,String ulname_modify,String u_email_modify,String u_role_modify,int seq_num) {
        JsonObject jsonobj = new JsonObject();
    try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        String usersupdatequery = "select uname,ufname,ulname,u_email,u_role from users where seq_num = '"+seq_num+"';";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(usersupdatequery);
        if (rs.next()) {
            jsonobj.addProperty("prev_uname", rs.getString(1));
            jsonobj.addProperty("prev_ufname", rs.getString(2));
            jsonobj.addProperty("prev_ulname", rs.getString(3));
            jsonobj.addProperty("prev_u_email", rs.getString(4));
            jsonobj.addProperty("prev_u_role", rs.getString(5));
        }
System.out.println("Username"+uname_modify);
System.out.println("Firstname"+ufname_modify);
        String update_query = "update users set uname =?,ufname=?,ulname=?,u_email=?,u_role=? where seq_num = '"+seq_num+"';";
        PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
        preparedStmt1.setString(1, uname_modify);
        preparedStmt1.setString(2, ufname_modify);
        preparedStmt1.setString(3, ulname_modify);
        preparedStmt1.setString(4, u_email_modify);
        preparedStmt1.setString(5, u_role_modify);
        preparedStmt1.execute();
        jsonobj.addProperty("uname", uname_modify);
        jsonobj.addProperty("ufname", ufname_modify);
        jsonobj.addProperty("ulname", ulname_modify);
        jsonobj.addProperty("u_email", u_email_modify);
        jsonobj.addProperty("u_role", u_role_modify);
    }
    catch(Exception e)
        {
        System.out.println("Execption Occurs");
        }
        return jsonobj;
    }
    }