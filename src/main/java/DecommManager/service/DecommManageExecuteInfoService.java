package DecommManager.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DecommManageExecuteInfoService {
    public static JsonArray DecommManageExecuteInfoDataRetrieveService(String projectname, String applicationname)
    {
        JsonArray jsonArray = new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String query = "select * from decomm_manage_execution_info where prj_name = '"+projectname+"' and app_name = '"+applicationname+"'";
            Statement statementforcheck=connection.createStatement();
            ResultSet Resultset=statementforcheck.executeQuery(query);
            if(Resultset.next()){
                JsonObject jsonObject1=new JsonObject();
                jsonObject1.addProperty("seq_num",Resultset.getString("seq_num"));
                jsonObject1.addProperty("Project_Name",Resultset.getString("prj_name"));
                jsonObject1.addProperty("App_Name",Resultset.getString("app_name"));
                jsonObject1.addProperty("options",Resultset.getString("options"));
                jsonObject1.addProperty("LabelName",Resultset.getString("label_name"));
                jsonObject1.addProperty("ColumnName",Resultset.getString("column_name"));
                jsonObject1.addProperty("Type",Resultset.getString("type"));
                jsonObject1.addProperty("Mandatory",Resultset.getString("mandatory"));
                jsonObject1.addProperty("Value",Resultset.getString("value"));
                jsonArray.add(jsonObject1);
                while(Resultset.next())
                {
                    JsonObject jsonObject2=new JsonObject();
                    jsonObject2.addProperty("seq_num",Resultset.getString("seq_num"));
                    jsonObject2.addProperty("Project_Name",Resultset.getString("prj_name"));
                    jsonObject2.addProperty("App_Name",Resultset.getString("app_name"));
                    jsonObject2.addProperty("options",Resultset.getString("options"));
                    jsonObject2.addProperty("LabelName",Resultset.getString("label_name"));
                    jsonObject2.addProperty("ColumnName",Resultset.getString("column_name"));
                    jsonObject2.addProperty("Type",Resultset.getString("type"));
                    jsonObject2.addProperty("Mandatory",Resultset.getString("mandatory"));
                    jsonObject2.addProperty("Value",Resultset.getString("value"));
                    jsonArray.add(jsonObject2);
                }
            }
        }
        catch(Exception e){
            System.out.println("Exception--->>"+e);
        }
        return jsonArray;
    }

}
