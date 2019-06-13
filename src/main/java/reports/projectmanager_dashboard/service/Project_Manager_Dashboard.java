package reports.projectmanager_dashboard.service;

import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Project_Manager_Dashboard {
    final static Logger logger = Logger.getLogger(Project_Manager_Dashboard.class);
    public JsonObject project_manager_dashboard(String uname,String projectname,String applicationname) {
        JsonObject infoJson = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String project_count = "SELECT \n"+
                    "  projects, \n" +
                    "  (CHAR_LENGTH(projects) - CHAR_LENGTH(REPLACE(projects, ',', '')) + 1) as total \n" +
                    "FROM admin_userdetails where uname='"+uname+"'";
            Statement project_count_statement = connection.createStatement();
            ResultSet project_count_resultset = project_count_statement.executeQuery(project_count);
            while (project_count_resultset.next()) {
                String key = "project_count";
                String value = project_count_resultset.getString(2);
                infoJson.addProperty(key, value);
            }
            String app_count = "SELECT \n"+
                    "  application, \n" +
                    "  (CHAR_LENGTH(application) - CHAR_LENGTH(REPLACE(application, ',', '')) + 1) as total \n" +
                    "FROM admin_userdetails where uname='"+uname+"'";
            Statement app_count_stat= connection.createStatement();
            ResultSet app_count_resultset = app_count_stat.executeQuery(app_count);
            while(app_count_resultset.next())
            {
                String key = "app_count";
                String value = app_count_resultset.getString(2);
                infoJson.addProperty(key, value);
            }

            String[] apps=applicationname.split(",");
            int applive_count=0;
            int appindev_count=0;
            for(int i=0;i<apps.length;i++) {
                String live_app_count = "select * from archiveexecution_details where projects='" + projectname + "' and act_srt_date!='' and act_end_date!='' and pln_srt_date!='' and pln_end_date!='' and name ='" + apps[i] + "';";
                System.out.println("sssss\t" + live_app_count);
                Statement live_app_count_stat = connection.createStatement();
                ResultSet live_app_count_resultset = live_app_count_stat.executeQuery(live_app_count);
                if(live_app_count_resultset.next()) {
                    applive_count++;
                }
            }
            String ApplicationDevelopment="select * from archiveexecution_details where projects='"+projectname+"' and act_srt_date!='' and act_end_date='' and pln_srt_date!='' and pln_end_date!='' and name='Build and Test';";
            Statement ApplicationDevelopmentStatement=connection.createStatement();
            ResultSet ApplicationDevelopmentResultset=ApplicationDevelopmentStatement.executeQuery(ApplicationDevelopment);
            while(ApplicationDevelopmentResultset.next())
            {
                appindev_count++;
            }
            String key = "live_app_count";
            infoJson.addProperty(key, applive_count);
            logger.info("json obj----->" + infoJson);
            infoJson.addProperty("AppInDevelopmentCount",appindev_count);
            connection.close();
            app_count_stat.close();
            app_count_resultset.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;

    }

}
