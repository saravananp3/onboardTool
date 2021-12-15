package NewArchiveRequirements.addendumInfo.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveReqAddendumAddService {

	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	String oppName;
	String labelName;
	public archiveReqAddendumAddService(int SeqNum, String Id, String oppName, String labelName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
		 this.oppName = oppName;
		 this.labelName = labelName;
	}
	
public boolean checkDuplicateLabelName()
{
	boolean checkDuplicate = false;
	try
	{
		String checkQuery ="select * from Archive_Req_Addendum_Info where oppId='"+Id+"' and labelName ='"+labelName+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(checkQuery);
		if(rs.next())
		checkDuplicate = true;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return checkDuplicate;
}
public JsonObject archiveReqAddendumAdd() {
		
		JsonObject jsonObject = new JsonObject();
		
		try {
			
			boolean statusFlag = false;
			  String InsertQuery = "insert into Archive_Req_Addendum_Info (seq_no, OppId, OppName, prjName, labelName, addendumInfo)"
						+ " value(?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, SeqNum+1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, labelName);
	          prestmt.setString(6, "");
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
