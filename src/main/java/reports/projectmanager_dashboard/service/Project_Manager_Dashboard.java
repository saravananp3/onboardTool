package reports.projectmanager_dashboard.service;

import com.google.gson.JsonArray;
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
            String ProjectQuery="select * from appemphazize_applicationinfo where prjname= '"+projectname+"';";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(ProjectQuery);
            String app_in_appem="";
            while(rs1.next())
            {
                app_in_appem+=rs1.getString(1)+",";

            }
            String[] app_in_appem_arr=app_in_appem.substring(0,app_in_appem.length()-1).split(",");
            String apps_in_drop_down="";
            for(int j=0;j<app_in_appem_arr.length;j++)
            {
                if(applicationname.contains(app_in_appem_arr[j]))
                {
                    apps_in_drop_down+=app_in_appem_arr[j]+",";
                }
            }
            apps_in_drop_down=apps_in_drop_down.substring(0,apps_in_drop_down.length()-1);
            infoJson.addProperty("AppDropdown",apps_in_drop_down);
            connection.close();
            app_count_stat.close();
            app_count_resultset.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;

    }
    public static JsonArray ProjectManagerDashboardTeamMembers(String projectname, String Applicationname, String Role)
    {
        JsonArray jsonArray=new JsonArray();
        try
        {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            JsonObject json=new JsonObject();
            json.addProperty("Roles",Role);
            jsonArray.add(json);
            if(Role.equals("All"))
            {
                JsonObject json1=new JsonObject();
                String[] Roles={"ArchivalProjectManager","ArchivalProgramManager","LegacyProgramManager","ArchivalAdmin","LegacyTechnicalSME","LegacyBusinessSME","ArchivalBusinessAnalyst","ArchivalTechnicalLead","ArchivalDeveloper","TestLead"};
                for(int i=0;i<Roles.length;i++)
                {
                    String AllRoles="select * from Admin_UserDetails where projects like '%"+projectname+"%' and application like '%"+Applicationname+"%' and roles='"+Roles[i]+"'";
                    Statement st=connection.createStatement();
                    ResultSet rs=st.executeQuery(AllRoles);
                    if(rs.next())
                    {
                        JsonObject jsonrole=new JsonObject();
                        int j=1;
                        json1.addProperty(rs.getString("roles")+j,rs.getString("uname"));
                        j++;
                        while(rs.next())
                        {
                            json1.addProperty(rs.getString("roles")+j,rs.getString("uname"));
                            j++;
                        }
                    }
                }
                jsonArray.add(json1);
            }
            else
            {
                JsonObject json1=new JsonObject();
                String SelectedRole="select * from Admin_UserDetails where projects like '%"+projectname+"%' and application like '%"+Applicationname+"%' and roles='"+Role+"'";
                Statement st1=connection.createStatement();
                ResultSet rs1=st1.executeQuery(SelectedRole);
                JsonObject json2=new JsonObject();
                if(rs1.next())
                {
                    int j=1;
                    json2.addProperty(rs1.getString("roles")+j,rs1.getString("uname"));
                    j++;
                    while(rs1.next())
                    {
                        json2.addProperty(rs1.getString("roles")+j,rs1.getString("uname"));
                        j++;
                    }
                }
                jsonArray.add(json2);
                System.out.println("sample---->"+jsonArray);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception---------[info]--------"+e);
        }
        return jsonArray;
    }

}
