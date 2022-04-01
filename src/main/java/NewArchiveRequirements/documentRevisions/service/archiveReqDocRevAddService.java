package NewArchiveRequirements.documentRevisions.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveReqDocRevAddService {

	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	String oppName;
	
	public archiveReqDocRevAddService(int SeqNum,String Id, String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
		 this.oppName = oppName;
	}
	

	public JsonObject archiveReqDocRevAdd() {
		
		JsonObject jsonObject = new JsonObject();
		
		try {
			
			boolean statusFlag = false;
			  String InsertQuery = "insert into archive_documentrevision_info (seq_no, OppId, OppName, prjName, date, version, documentChanges, changeAuthor)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, SeqNum+1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, "");
	          prestmt.setString(6, "");
	          prestmt.setString(7, "");
	          prestmt.setString(8, "");
	          prestmt.execute();
	          prestmt.close();
	          statusFlag =true;
			
			jsonObject.addProperty("AddStatus", statusFlag);
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	
	protected void finalize() throws Throwable {
	      con.close();
	      System.out.println("Db connection Closed");
		}

}
