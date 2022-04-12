package admin_module_modify.service;
import java.sql.Connection;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class Delete_users_service {
    public static JsonObject delete_users(int seq_num) {
        JsonObject jsonobj = new JsonObject();
    try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("DB Connected...");
        String delete_query = "delete from users where seq_num='"+seq_num+"';";
        Statement st2 = connection.createStatement();
        st2.executeUpdate(delete_query);
        System.out.println("Deleted");
        }
    catch(Exception e)
    {
    System.out.println("Execption Occurs");
    }
    return jsonobj;
    }
}