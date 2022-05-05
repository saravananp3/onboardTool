package ArchiveExecution.Service;

import admin_module_modify.service.Modify_List_User_Service;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;
import org.json.JSONObject;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ArchiveExecutionDataRetrieve {
    final static Logger logger = Logger.getLogger(ArchiveExecutionDataRetrieve.class);

    public JsonObject ProgressBarDataRetrieve(String id) throws SQLException, ClassNotFoundException {
        DBconnection dBconnection = new DBconnection();
        String projectname="";
        Connection connection = (Connection) dBconnection.getConnection();
        String query = "select * from AppEmphazize_ProjectDetails where id =?;";
        PreparedStatement st = connection.prepareStatement(query);
        st.setString(1,id);
        ResultSet rs = st.executeQuery();
        if(rs.next()) {
           projectname = rs.getString("projectname");
        }
        JsonObject json = new JsonObject();
        String progress_bar_query = "select * from archiveexecution_details where projects=? and level=1;";
        PreparedStatement st1 = connection.prepareStatement(progress_bar_query);
        st1.setString(1, projectname);
        ResultSet resultSet = st1.executeQuery();
       
        while (resultSet.next()) {
            String key = resultSet.getString(3);
            String value = resultSet.getString(15);
            json.addProperty(key, value);
            // System.out.println("prgb "+json);
        }
        connection.close();
        return json;
    }

    public JsonArray TabledataRetrieval(String project_id) {
        JsonArray jsonArray = new JsonArray();
        String projectname="";
        try {

            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            //query for retrieving the table data
            String query7 = "select * from AppEmphazize_ProjectDetails where id = ?;";
            PreparedStatement st7 = connection.prepareStatement(query7);
            st7.setString(1,project_id);
            ResultSet rs7 = st7.executeQuery();
           
            if(rs7.next())
            {
                projectname=rs7.getString("projectname");
            }

            String query = "select * from archiveexecution_details where projects=? order by seq_num;";
            PreparedStatement st3 = connection.prepareStatement(query);
            st3.setString(1, projectname);
            ResultSet resultSet = st3.executeQuery(); 
            

            while (resultSet.next()) {
                JsonObject infoJson = new JsonObject();
                int total_rows = resultSet.getMetaData().getColumnCount();
                for (int i = 0; i < total_rows; i++) {

                    infoJson.addProperty(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultSet.getString(i + 1));
                }
                jsonArray.add(infoJson);
            }
            JsonObject lastobject = new JsonObject();
            String dummy_query="select * from dummy;";
            Statement dummy_statement=connection.createStatement();
            ResultSet dummy_value=dummy_statement.executeQuery(dummy_query);
            if(dummy_value.next())
            {
                lastobject.addProperty(dummy_value.getMetaData().getColumnLabel(1).toLowerCase(),dummy_value.getString(1));
            }
            String level1_query="select * from archiveexecution_details where projects=? and level=1 order by seq_num";
            PreparedStatement st1 =connection.prepareStatement(level1_query);
            st1.setString(1,projectname);
            ResultSet level1_value = st1.executeQuery();
           
            while(level1_value.next())
            {
                lastobject.addProperty(level1_value.getString(3).replace(" ",""),level1_value.getString(1));
            }
            lastobject.addProperty("projectname",projectname);
            jsonArray.add(lastobject);
            JsonObject parent_seq_num=new Read_Only_Seq_Number().Read_Seq_Number(project_id);
            jsonArray.add(parent_seq_num);
            System.out.println("hello"+jsonArray);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
}
