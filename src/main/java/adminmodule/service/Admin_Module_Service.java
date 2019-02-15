package adminmodule.service;

import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Admin_Module_Service {

    public JsonObject getproject_details() {
        JsonObject infoJson = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String query2 = "select * from AppEmphazize_ProjectDetails";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query2);
            while (resultSet.next()) {
                String field = resultSet.getString("id");
                String value = resultSet.getString("projectname");
                infoJson.addProperty(field, value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;
    }

    public JsonObject applications_info(String projectname) {
        JsonObject infoJson = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();

            String query2 = "select * from appemphazize_applicationinfo where prjname in (" + projectname + ");";
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query2);
            while (rs.next()) {
                String key = rs.getString("id");
                String value = rs.getString("appname");
                infoJson.addProperty(key, value);
            }
            System.out.println("json obj" + infoJson);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;
    }
}
