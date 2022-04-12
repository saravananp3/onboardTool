package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class Add_users_service {
    public static JsonObject add_users(String uname,String ufname,String ulname,String u_email,String u_pwd,String u_role) {
        JsonObject jsonobj = new JsonObject();
    try {
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
        preparedStmt1.setString(6, u_pwd);
        preparedStmt1.setString(7, u_role);
        preparedStmt1.execute();
        jsonobj.addProperty("id", random_id);
        jsonobj.addProperty("uname", uname);
        jsonobj.addProperty("ufname", ufname);
        jsonobj.addProperty("ulname", ulname);
        jsonobj.addProperty("u_email", u_email);
        jsonobj.addProperty("u_pwd", u_pwd);
        jsonobj.addProperty("u_role", u_role);
    }
catch(Exception e)
    {
    System.out.println("Execption Occurs");
    }
    return jsonobj;
}
    public static String generateRandomApprovalId() throws SQLException {
        String uniqueID = "";
            uniqueID = UUID.randomUUID().toString();
            System.out.println("App Id : " + uniqueID);
        return uniqueID;
    }
}