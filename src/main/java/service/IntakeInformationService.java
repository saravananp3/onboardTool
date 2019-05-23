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
    public JsonArray DecommIntakeRequirementsDataRetrieve(String projectname,String applicationname)
    {
        JsonArray jsonArray=new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String existing_data_query="  select * from Decomm_BusinessUnit_GeographicCode where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by id;";
            Statement st=connection.createStatement();
            ResultSet existingdata=st.executeQuery(existing_data_query);
            int i=0;
            if(existingdata.next())
            {
                JsonObject existingdataObject2=new JsonObject();
                existingdataObject2.addProperty("CheckExistance",true);
                jsonArray.add(existingdataObject2);
                JsonObject existingdataObject=new JsonObject();
                existingdataObject.addProperty("BusinessUnit",existingdata.getString("business_unit"));
                existingdataObject.addProperty("OperationUnit",existingdata.getString("operation_unit"));
                existingdataObject.addProperty("LocationUnit",existingdata.getString("location_unit"));
                existingdataObject.addProperty("Dept",existingdata.getString("dept"));
                jsonArray.add(existingdataObject);
                i++;
                while(existingdata.next())
                {
                    JsonObject existingdataObject1=new JsonObject();
                    existingdataObject1.addProperty("BusinessUnit",existingdata.getString("business_unit"));
                    existingdataObject1.addProperty("OperationUnit",existingdata.getString("operation_unit"));
                    existingdataObject1.addProperty("LocationUnit",existingdata.getString("location_unit"));
                    existingdataObject1.addProperty("Dept",existingdata.getString("dept"));
                    jsonArray.add(existingdataObject1);
                    i++;

                }
            }
            else
            {
                JsonObject existingdataObject4=new JsonObject();
                existingdataObject4.addProperty("CheckExistance",false);
                jsonArray.add(existingdataObject4);
            }
        }
        catch(Exception e)
        {
            System.out.println("Exception----------------"+e);
        }
        System.out.println("json array------>"+jsonArray);
        return jsonArray;
    }

    public JsonArray DecommSiteLocationDataRetrieve(String projectname,String applicationname)
    {
        JsonArray jsonArray=new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String existing_data_query="  select * from Decomm_Sitelocation_Assets where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by id;";
            Statement st=connection.createStatement();
            ResultSet existingdata=st.executeQuery(existing_data_query);
            int i=0;
            if(existingdata.next())
            {
                JsonObject existingdataObject2=new JsonObject();
                existingdataObject2.addProperty("CheckExistance",true);
                jsonArray.add(existingdataObject2);
                JsonObject existingdataObject=new JsonObject();
                existingdataObject.addProperty("Country",existingdata.getString("country"));
                existingdataObject.addProperty("City",existingdata.getString("city"));
                existingdataObject.addProperty("State",existingdata.getString("state"));
                existingdataObject.addProperty("OfficeDesignation",existingdata.getString("office_designation"));
                jsonArray.add(existingdataObject);
                i++;
                while(existingdata.next())
                {
                    JsonObject existingdataObject1=new JsonObject();
                    existingdataObject1.addProperty("Country",existingdata.getString("country"));
                    existingdataObject1.addProperty("City",existingdata.getString("city"));
                    existingdataObject1.addProperty("State",existingdata.getString("state"));
                    existingdataObject1.addProperty("OfficeDesignation",existingdata.getString("office_designation"));
                    jsonArray.add(existingdataObject1);
                    i++;

                }
            }
            else
            {
                JsonObject existingdataObject4=new JsonObject();
                existingdataObject4.addProperty("CheckExistance",false);
                jsonArray.add(existingdataObject4);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception----------------"+e);
        }
        System.out.println("json array------>"+jsonArray);
        return jsonArray;
    }

    public JsonObject DecommIntakeRequirementDataRetrieve(String projectname,String applicationname)
    {
        JsonObject jsonobject=new JsonObject();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String existing_data_query="  select * from decomm_intake_req where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by id;";
            Statement st=connection.createStatement();
            ResultSet existingdata=st.executeQuery(existing_data_query);
            if(existingdata.next())
            {
                jsonobject.addProperty("CheckExistance",true);
                jsonobject.addProperty("Project_Name",existingdata.getString("prj_name"));
                jsonobject.addProperty("App_Name",existingdata.getString("app_name"));
                jsonobject.addProperty("Legacy_App_Name",existingdata.getString("legacy_app_name"));
                jsonobject.addProperty("Enterprise_Team_Decomm_Prj_No",existingdata.getString("enterprise_team_decomm_prj_no"));
                jsonobject.addProperty("App_Identification_No",existingdata.getString("app_identification_no"));
                jsonobject.addProperty("Infra_Prj_No",existingdata.getString("infra_prj_no"));
                //jsonobject.addProperty("Read_Only_Date",existingdata.getString("read_only_date"));

            }
            else{
                jsonobject.addProperty("CheckExistance",false);
            }
            String readOnly_query = "Select * from AppEmphazize_ApplicationPrioritization where prj_name='"+projectname+"' and proj_name='"+applicationname+"'";
            Statement st1=connection.createStatement();
            ResultSet existingdata1=st1.executeQuery(readOnly_query);
            if(existingdata1.next()) {
                jsonobject.addProperty("Read_Only", existingdata1.getString("read_date"));
            }
            //int i=0;
            /*if(existingdata.next())
            {
                JsonObject existingdataObject2=new JsonObject();
                existingdataObject2.addProperty("CheckExistance",true);
                jsonArray.add(existingdataObject2);
                JsonObject existingdataObject=new JsonObject();

                jsonArray.add(existingdataObject);
                i++;
                while(existingdata.next())
                {
                    JsonObject existingdataObject1=new JsonObject();
                    existingdataObject.addProperty("Project_Name",existingdata.getString("prj_name"));
                    existingdataObject.addProperty("App_Name",existingdata.getString("app_name"));
                    existingdataObject.addProperty("Legacy_App_Name",existingdata.getString("legacy_app_name"));
                    existingdataObject.addProperty("Enterprise_Team_Decomm_Prj_No",existingdata.getString("enterprise_team_decomm_prj_no"));
                    existingdataObject.addProperty("App_Identification_No",existingdata.getString("app_identification_no"));
                    existingdataObject.addProperty("Infra_Prj_No",existingdata.getString("infra_prj_no"));
                    existingdataObject.addProperty("Read_Only_Date",existingdata.getString("read_only_date"));
                    jsonArray.add(existingdataObject1);
                    i++;

                }
            }
            else
            {
                JsonObject existingdataObject4=new JsonObject();
                existingdataObject4.addProperty("CheckExistance",false);
                jsonArray.add(existingdataObject4);
            }*/
        }
        catch(Exception e)
        {
            System.out.println("Exception----------------"+e);
        }
        return jsonobject;
    }
    public JsonArray DecommIntakeContactInfoDataRetrieve(String projectname,String applicationname,String[] roles)
    {
        JsonArray jsonobject=new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            for(int i=0;i<roles.length;i++) {
                String query = "select * from Decomm_Intake_Contact_Info where prj_name='" + projectname + "' and app_name='" + applicationname + "' and role='" + roles[i] + "'order by seq_num;";
                Statement st=connection.createStatement();
                ResultSet rs=st.executeQuery(query);
                JsonArray jsonArray=new JsonArray();
                if(rs.next())
                {
                    JsonObject json1=new JsonObject();
                    json1.addProperty("CheckExistance",true);
                    json1.addProperty("name",roles[i]);
                    jsonArray.add(json1);
                    JsonObject json2=new JsonObject();
                    json2.addProperty("Uname",rs.getString("user_name"));
                    json2.addProperty("Email",rs.getString("Email"));
                    json2.addProperty("user_id",rs.getString("user_id"));
                    json2.addProperty("contact_no",rs.getString("contact_no"));
                    jsonArray.add(json2);
                    while(rs.next())
                    {
                        JsonObject json3=new JsonObject();
                        json3.addProperty("Uname",rs.getString("user_name"));
                        json3.addProperty("Email",rs.getString("Email"));
                        json3.addProperty("user_id",rs.getString("user_id"));
                        json3.addProperty("contact_no",rs.getString("contact_no"));
                        jsonArray.add(json3);
                    }
                }
                else
                {
                    JsonObject json4=new JsonObject();
                    json4.addProperty("CheckExistance",false);
                    jsonArray.add(json4);
                }
                jsonobject.add(jsonArray);
                System.out.println("json array"+jsonobject);
            }

        }
        catch(Exception e){
            System.out.println("Exception......"+e);
        }
        return  jsonobject;
    }

    public JsonArray DecommIntakeContactInfoDataRetrieve(String projectname,String applicationname,String[] roles)
    {
        JsonArray jsonobject=new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            if(roles.length==0)
            {
             JsonObject json=new JsonObject();
             json.addProperty("CheckRoles",false);
             jsonobject.add(json);
            }
            else {
                JsonObject json=new JsonObject();
                json.addProperty("CheckRoles",true);
                jsonobject.add(json);
                for (int i = 0; i < roles.length; i++) {
                    String query = "select * from Decomm_Intake_Contact_Info where prj_name='" + projectname + "' and app_name='" + applicationname + "' and role='" + roles[i] + "'order by seq_num;";

                    Statement st = connection.createStatement();
                    ResultSet rs = st.executeQuery(query);

                    JsonArray jsonArray = new JsonArray();
                    if (rs.next()) {
                        JsonObject json1 = new JsonObject();
                        json1.addProperty("CheckExistance", true);
                        json1.addProperty("name", roles[i]);
                        jsonArray.add(json1);
                        JsonObject json2 = new JsonObject();
                        json2.addProperty("Uname", rs.getString("user_name"));
                        json2.addProperty("Email", rs.getString("Email"));
                        json2.addProperty("user_id", rs.getString("user_id"));
                        json2.addProperty("contact_no", rs.getString("contact_no"));
                        jsonArray.add(json2);
                        while (rs.next()) {
                            JsonObject json3 = new JsonObject();
                            json3.addProperty("Uname", rs.getString("user_name"));
                            json3.addProperty("Email", rs.getString("Email"));
                            json3.addProperty("user_id", rs.getString("user_id"));
                            json3.addProperty("contact_no", rs.getString("contact_no"));
                            jsonArray.add(json3);
                        }
                    } else {
                        JsonObject json4 = new JsonObject();
                        json4.addProperty("CheckExistance", false);
                        json4.addProperty("name", roles[i]);
                        jsonArray.add(json4);
                    }
                    jsonobject.add(jsonArray);
                    System.out.println("json array" + jsonobject);
                }
            }

        }
        catch(Exception e){
            System.out.println("Exception......"+e);
        }
        return  jsonobject;
    }

}
