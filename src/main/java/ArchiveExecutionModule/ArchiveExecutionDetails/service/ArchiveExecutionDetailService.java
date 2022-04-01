package ArchiveExecutionModule.ArchiveExecutionDetails.service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class ArchiveExecutionDetailService {
    String oppname;
     DBconnection dBconnection =null;
        Connection con = null;
    public ArchiveExecutionDetailService() throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }
    public JsonArray archiveExecutionDataRetrieve(String Id, String oppName) {
        JsonArray jsonArray = new JsonArray();
        
        try {
        	JsonObject jsonObject= archiveExecutionHearderInfo(Id,oppName); 
            jsonArray.add(jsonObject);
            
            String selectQuery = "select * from Archive_Execution_Info where oppId = '"+Id+"' order by seq_no;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            while(rs.next())
            {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("seq_no",rs.getString(1));
                jsonObj.addProperty("oppId",rs.getString(2));
                jsonObj.addProperty("oppName",rs.getString(3));
                jsonObj.addProperty("level",rs.getString(4));
                jsonObj.addProperty("taskId",rs.getString(5));
                jsonObj.addProperty("taskGroup",rs.getString(6));
                jsonObj.addProperty("taskName",rs.getString(7));
                jsonObj.addProperty("taskType",rs.getString(8));
                jsonObj.addProperty("majorDep",rs.getString(9));
                jsonObj.addProperty("assignedTo",rs.getString(10));
                jsonObj.addProperty("planStart",rs.getString(11));
                jsonObj.addProperty("planEnd",rs.getString(12));
                jsonObj.addProperty("actStart",rs.getString(13));
                jsonObj.addProperty("actEnd",rs.getString(14));
                jsonObj.addProperty("completion",rs.getString(15));
                jsonObj.addProperty("status",rs.getString(16));
                jsonObj.addProperty("remark",rs.getString(17));
                jsonArray.add(jsonObj);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("Bug"+jsonArray);
        return jsonArray;
    }
    public JsonObject archiveExecutionHearderInfo(String Id,String oppName) {
        JsonArray jsonArray=new JsonArray();
        JsonObject jsonObj = new JsonObject();
        try {
            String selectQuery = "select * from opportunity_info where id = '"+Id+"'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            String sd = "select planSrt from Archive_Execution_Info where oppId = '"+Id+"' and taskId='1.01'  order by seq_no;";
            Statement sds = con.createStatement();
            ResultSet srs = sds.executeQuery(sd);
            String ed = "select planEnd from Archive_Execution_Info where oppId = '"+Id+"' and taskId='5.05'  order by seq_no;";
            Statement eds = con.createStatement();
            ResultSet ers = eds.executeQuery(ed);
            String at = "select r_name from resources";
            Statement ats = con.createStatement();
            ResultSet ars = ats.executeQuery(at);
            while(rs.next()) {
                if((rs.getString("column_name")).equals("apmid"))
                    jsonObj.addProperty("Opp_Id",rs.getString("value"));
                else if((rs.getString("column_name")).equals("appName"))
                    jsonObj.addProperty("appName",rs.getString("value"));
            }
            while(srs.next())
            {
                jsonObj.addProperty("startDate",srs.getString("planSrt"));
                jsonArray.add(jsonObj);
        }
            while(ers.next())
            {
                jsonObj.addProperty("endDate",ers.getString("planEnd"));
                jsonArray.add(jsonObj);
        }
            JsonArray jsonArrayUsers = new JsonArray();
            JsonObject jsonObjectUsers = new JsonObject();
            int c=0;
            String str= "Select";
           while(ars.next())
           {
				/* jsonObj.addProperty("user"+c,ars.getString("r_name")); */
				/* jsonArrayUsers.add(ars.getString("r_name")); */
        	   str = str+","+ars.getString("r_name") ;
               System.out.println("H"+jsonObjectUsers);
               System.out.println("User Array "+ jsonArrayUsers);
               c++;
       }
		/* jsonArray.add(jsonObjectUsers); */
		/* jsonObj.put("user",(Object)jsonArrayUsers); */
           
           //System.out.println("User List "+ jsonArrayUsers.toString());
           jsonObj.addProperty("user",str);
       
            
		
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return jsonObj;
    }
    

	
    protected void finalize() throws Throwable 
    { 
        System.out.println("Db connection closed.");
        con.close();
    }
}