package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class archiveFunctionalReqDeleteService {

	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	String tableName;
	public String column;
	private String ReqId;
	public archiveFunctionalReqDeleteService(int SeqNum,String Id,String tableName) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
		 this.tableName = tableName;
		 getTableNameInfo();
	}

	public JsonObject DeleteRowFunctional()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag = false;
		try
		{
			
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> reqId = new ArrayList<String>();
			ArrayList<String> reqInScope = new ArrayList<String>();
			ArrayList<String> reqType = new ArrayList<String>();
			ArrayList<String> req = new ArrayList<String>();
			ArrayList<String> additionInfo = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> reqIdRes = new ArrayList<String>();
			ArrayList<String> reqInScopeRes = new ArrayList<String>();
			ArrayList<String> reqTypeRes = new ArrayList<String>();
			ArrayList<String> reqRes = new ArrayList<String>();
			ArrayList<String> additionInfoRes = new ArrayList<String>();
			
			String oppName ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = "select * from "+tableName+" where OppId='"+Id+"' order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   reqId.add(rs.getString("reqId"));
			   reqInScope.add(rs.getString("reqInScope"));
			   reqType.add(rs.getString("reqType"));
			   req.add(rs.getString(column));
			   additionInfo.add(rs.getString("additionInfo"));
			   oppName = rs.getString("OppName");
			}
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					reqIdRes.add(reqId.get(i));
					reqInScopeRes.add(reqInScope.get(i));
					reqTypeRes.add(reqType.get(i));
					reqRes.add(req.get(i));
					additionInfoRes.add(additionInfo.get(i));
				}
				else if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					reqIdRes.add(ReqId+getSeqNum(Integer.parseInt(seqNum.get(i))-1));
					reqInScopeRes.add(reqInScope.get(i));
					reqTypeRes.add(reqType.get(i));
					reqRes.add(req.get(i));
					additionInfoRes.add(additionInfo.get(i));
				}
			}
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+reqIdRes.get(i)+" "+reqInScopeRes.get(i)+" "+reqTypeRes.get(i)+" "+reqRes.get(i)+" "+additionInfoRes.get(i)+" ");	
			}
			
			String deleteQuery ="delete from "+tableName+" where OppId='"+Id+"';";
			Statement st1 = con.createStatement();
			st1.executeUpdate(deleteQuery);
			st1.close();
			
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+reqIdRes.get(i)+" "+reqInScopeRes.get(i)+" "+reqTypeRes.get(i)+" "+reqRes.get(i)+" "+additionInfoRes.get(i)+" ");	
			  String StakeHolderInsertQuery = "insert into "+tableName+" (seq_no, OppId, oppName, prjName, reqId, reqInScope, reqType, "+column+", additionInfo)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, reqIdRes.get(i));
	          prestmt.setString(6, reqInScopeRes.get(i));
	          prestmt.setString(7, reqTypeRes.get(i));
	          prestmt.setString(8, reqRes.get(i));
	          prestmt.setString(9, additionInfoRes.get(i));
	          prestmt.execute();
	          
			}
			statusFlag =true;
			
			
		}
		
		catch(Exception e)
		{
			statusFlag =false;
			e.printStackTrace();
		}
		jsonObject.addProperty("DeleteStatus", statusFlag);
		return jsonObject;
		
	}
	
	public void getTableNameInfo() {

		switch(tableName) {
		
		case "archive_datareq_info":
			column = "req";
			ReqId ="FR-D-";
			break;
			
		case "Archive_RetentionLegalReq_Info":
			column = "descp";
			ReqId ="FR-R-";
			break;
			
		case "Archive_SecurityReq_Info":
			column = "descp";
			ReqId ="FR-S-";
			break;
			
		case "Archive_UsabilityReq_Info":
			column = "descp";
			ReqId ="FR-U-";
			break;
			
		case "Archive_AuditReq_Info":
			column = "descp";
			ReqId ="FR-A-";
			break;
			
		}
	}
	private String getSeqNum(int seq_no)
	{
		String seq_num="";
	  try
	  {
		  int count = 0;
		  seq_num=String.valueOf(seq_no);
		  if(seq_num.length()<3)
		  {
		  count = 3-seq_num.length();
		  for(int i=0;i<count;i++)
		  seq_num = "0"+seq_num;
		  }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return seq_num;
	}
	
	protected void finalize() throws Throwable {
      con.close();
	}

	
}
