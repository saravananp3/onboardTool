package NewArchiveRequirements.addendumInfo.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveReqAddendumDataRetrieveService {

	DBconnection dBconnection;
	public Connection con;
	
	String Id;
	String oppName;
	
	public archiveReqAddendumDataRetrieveService(String Id, String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.oppName = oppName;
	}
	
public JsonArray archiveReqAddendumDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from Archive_Req_Addendum_Info where OppId = '"+Id+"' order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(rs.next()) {
				JsonObject jsonObj =new JsonObject();
				jsonObj.addProperty("checkExistance",true);
				
				jsonObj.addProperty("labelName",rs.getString("labelName"));
				jsonObj.addProperty("addendumInfo",rs.getString("addendumInfo"));
			
                jsonArray.add(jsonObj);
                
                while(rs.next()) {
                	JsonObject jsonObj1 =new JsonObject();
    				jsonObj1.addProperty("labelName",rs.getString("labelName"));
    				jsonObj1.addProperty("addendumInfo",rs.getString("addendumInfo"));
    				
                    jsonArray.add(jsonObj1);
                }
			}
			else
            {
				String InsertQuery = "insert into Archive_Req_Addendum_Info(seq_no, OppId, oppName, prjName, labelName, addendumInfo)"
						+ " value(?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, 1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, "Section 1");
	          prestmt.setString(6, "");
	          prestmt.execute();
	          prestmt.close();
                JsonObject jsonObj2 = new JsonObject();
                jsonObj2.addProperty("checkExistance",false);
                jsonArray.add(jsonObj2);
            }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
		
	}
	
	protected void finalize() throws Throwable {
	      con.close();
	      System.out.println("Db connection Closed");
		}

	
}
