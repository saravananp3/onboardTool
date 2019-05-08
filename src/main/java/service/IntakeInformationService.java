package service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class IntakeInformationService {
    final static Logger logger = Logger.getLogger(IntakeInformationService.class);

    public JsonObject getInformation(String appName) {
        JsonObject infoJson = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String businesscustomizationQuery = "select * from intake_buisnesscustomization where appname ='" + appName + "'";
            Statement businesscustomizationStaement = connection.createStatement();
            ResultSet businesscustomizationResultSet = businesscustomizationStaement.executeQuery(businesscustomizationQuery);
            while (businesscustomizationResultSet.next()) {
                String businesskey = businesscustomizationResultSet.getString(1);
                String businessdetailsQuery = "select " + businesscustomizationResultSet.getString("idname") + " from intake_buisnessdetails where appname ='" + appName + "'";
                Statement businessdetailsStaement = connection.createStatement();
                ResultSet businessdetailsResultSet = businessdetailsStaement.executeQuery(businessdetailsQuery);
                if (businessdetailsResultSet.next()) {
                    String businessvalue = businessdetailsResultSet.getString(1) + "/" + businesscustomizationResultSet.getString(10);
                    infoJson.addProperty(businesskey, businessvalue);
                }


            }

            String technicalcustomizationQuery = "select * from intake_technicalcustomization where appname ='" + appName + "'";
            Statement technicalcustomizationStaement = connection.createStatement();
            ResultSet technicalcustomizationResultSet = technicalcustomizationStaement.executeQuery(technicalcustomizationQuery);
            while (technicalcustomizationResultSet.next()) {
                String technicalkey = technicalcustomizationResultSet.getString(1);
                if (technicalkey.equals(" ") && technicalcustomizationResultSet.getString(2).equals("Check box")) {
                    technicalkey = technicalcustomizationResultSet.getString("checkbox_labels");
                }
                String technicaldetailsQuery = "select " + technicalcustomizationResultSet.getString("idname") + " from intake_technicaldetails where appname ='" + appName + "'";
                Statement technicaldetailsStaement = connection.createStatement();
                ResultSet technicaldetailsResultSet = technicaldetailsStaement.executeQuery(technicaldetailsQuery);
                if (technicaldetailsResultSet.next()) {
                    String technicalvalue = technicaldetailsResultSet.getString(1) + "/" + technicalcustomizationResultSet.getString(10);
                    infoJson.addProperty(technicalkey, technicalvalue);
                }


            }

            String archivalrequirementcustomizationQuery = "select * from intake_archivalrequirementcustomization where appname ='" + appName + "'";
            Statement archivalrequirementcustomizationStaement = connection.createStatement();
            ResultSet archivalrequirementcustomizationResultSet = archivalrequirementcustomizationStaement.executeQuery(archivalrequirementcustomizationQuery);
            while (archivalrequirementcustomizationResultSet.next()) {
                String archivalrequirementkey = archivalrequirementcustomizationResultSet.getString(1);
                if (archivalrequirementkey.equals(" ") && archivalrequirementcustomizationResultSet.getString(2).equals("Check box")) {
                    archivalrequirementkey = archivalrequirementcustomizationResultSet.getString("checkbox_labels");
                }
                String archivalrequirementdetailsQuery = "select " + archivalrequirementcustomizationResultSet.getString("idname") + " from intake_archivalrequirement where appname ='" + appName + "'";
                Statement archivalrequirementdetailsStaement = connection.createStatement();
                ResultSet archivalrequirementdetailsResultSet = archivalrequirementdetailsStaement.executeQuery(archivalrequirementdetailsQuery);
                if (archivalrequirementdetailsResultSet.next()) {
                    String archivalrequirementvalue = archivalrequirementdetailsResultSet.getString(1) + "/" + archivalrequirementcustomizationResultSet.getString(10);
                    infoJson.addProperty(archivalrequirementkey, archivalrequirementvalue);
                }


            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return infoJson;

    }

    public JsonArray archive_intake_app (String projectname, String appname,String ID, String uname, String roles)
    {
        JsonArray jsonArray = new JsonArray();
        String ApplicationName="";
        String applicationstate="";
        String application_percentage="";
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String Project_Name = "";
            String query = "";
            if (projectname.equals("all"))
                query = "select * from AppEmphazize_ProjectDetails where id=" + ID;
            else
                query = "select * from AppEmphazize_ProjectDetails where projectname='" + projectname + "'";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                Project_Name = rs.getString("projectname");
                //System.out.println("the projectname is "+Project_Name);
            }
            String query1 = "";
            if (projectname.equals("all"))
                query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '" + Project_Name + "'";
            else
                query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '" + Project_Name + "' and appname='" + appname + "'";
            Statement st1 = connection.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while (rs1.next()) {
                JsonObject infoJson = new JsonObject();
                ApplicationName=rs1.getString("appname");

                String detail = "";
                String q3 = "select seq_num from ArchiveExecution_Details where projects='" + Project_Name + "' and name='" + rs1.getString("appname") + "'";
                Statement stt = connection.createStatement();
                ResultSet rst = stt.executeQuery(q3);
                if (rst.next())
                    detail = rst.getString(1);

                String q1 = "select * from ArchiveExecution_Details where projects='" + Project_Name + "' and seq_num>" + detail + " and seq_num<" + (detail + 70) + " and level=3";
                Statement st2 = connection.createStatement();
                ResultSet rs2 = st2.executeQuery(q1);
                int l = -1;
                while (rs2.next()) {
                    l++;
                    if (rs2.getString(15).equals("100") || Integer.parseInt(rs2.getString(15)) >= 100)
                        continue;
                    else {
                        applicationstate=rs2.getString(3);                   }
                    application_percentage=rs2.getString(15);
                    break;
                }
                String ArchiveIntakeQuery="select * from AppEmphazize_ApplicationPrioritization where prj_name='"+Project_Name+"' and proj_name='"+ApplicationName+"' and data_retained='true';";
                Statement st3 = connection.createStatement();
                ResultSet rs3 = st3.executeQuery(ArchiveIntakeQuery);
                while(rs3.next())
                {
                    if(rs3.getString("proj_name").equals(ApplicationName))
                    {
                        infoJson.addProperty("applicationname",ApplicationName);
                        infoJson.addProperty("applicationstate",applicationstate);
                        infoJson.addProperty("applicationpercentage",application_percentage);
                        jsonArray.add(infoJson);
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception..."+ e);
        }
        System.out.println("json array archive intake------->"+jsonArray);
        return jsonArray;

    }

    public JsonArray decomm_intake_app (String projectname, String appname,String ID, String uname, String roles)
    {
        JsonArray jsonArray = new JsonArray();
        String ApplicationName="";
        String applicationstate="";
        String application_percentage="";
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String Project_Name = "";
            String query = "";
            if (projectname.equals("all"))
                query = "select * from AppEmphazize_ProjectDetails where id=" + ID;
            else
                query = "select * from AppEmphazize_ProjectDetails where projectname='" + projectname + "'";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                Project_Name = rs.getString("projectname");
                //System.out.println("the projectname is "+Project_Name);
            }
            String query1 = "";
            if (projectname.equals("all"))
                query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '" + Project_Name + "'";
            else
                query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '" + Project_Name + "' and appname='" + appname + "'";
            Statement st1 = connection.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while (rs1.next()) {
                JsonObject infoJson = new JsonObject();
                ApplicationName=rs1.getString("appname");

                String detail = "";
                String q3 = "select seq_num from ArchiveExecution_Details where projects='" + Project_Name + "' and name='" + rs1.getString("appname") + "'";
                Statement stt = connection.createStatement();
                ResultSet rst = stt.executeQuery(q3);
                if (rst.next())
                    detail = rst.getString(1);

                String q1 = "select * from ArchiveExecution_Details where projects='" + Project_Name + "' and seq_num>" + detail + " and seq_num<" + (detail + 70) + " and level=3";
                Statement st2 = connection.createStatement();
                ResultSet rs2 = st2.executeQuery(q1);
                int l = -1;
                while (rs2.next()) {
                    l++;
                    if (rs2.getString(15).equals("100") || Integer.parseInt(rs2.getString(15)) >= 100)
                        continue;
                    else {
                        applicationstate=rs2.getString(3);                   }
                    application_percentage=rs2.getString(15);
                    break;
                }
                String ArchiveIntakeQuery="select * from AppEmphazize_ApplicationPrioritization where prj_name='"+Project_Name+"' and proj_name='"+ApplicationName+"' and data_retained= 'false' OR Decommission = 'true';";
                Statement st3 = connection.createStatement();
                ResultSet rs3 = st3.executeQuery(ArchiveIntakeQuery);
                while(rs3.next())
                {
                    if(rs3.getString("proj_name").equals(ApplicationName))
                    {
                        infoJson.addProperty("applicationname",ApplicationName);
                        infoJson.addProperty("applicationstate",applicationstate);
                        infoJson.addProperty("applicationpercentage",application_percentage);
                        jsonArray.add(infoJson);
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception..."+ e);
        }
        System.out.println("json array archive intake------->"+jsonArray);
        return jsonArray;

    }

}
