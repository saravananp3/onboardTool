package NewArchiveRequirements.Introduction.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class ApproverRolesAddService {

	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	String oppName;
	public ApproverRolesAddService(int SeqNum,String Id, String oppName) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
		 this.oppName = oppName;
	}

	public JsonObject AddRow()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean statusFlag = false;
			  String StakeHolderInsertQuery = "insert into ArchiveReq_Roles_Info (seq_no, OppId, prj_name, OppName, role, name, title, approverpurpose)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, SeqNum+1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, oppName);
	          prestmt.setString(5, "");
	          prestmt.setString(6, "");
	          prestmt.setString(7, "");
	          prestmt.setString(8, "");
	          prestmt.execute();
	          statusFlag =true;
			
			jsonObject.addProperty("AddStatus", statusFlag);
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}
	
	public JsonObject AddRow1()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean statusFlag = false;
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> role = new ArrayList<String>();
			ArrayList<String> name = new ArrayList<String>();
			ArrayList<String> title = new ArrayList<String>();
			ArrayList<String> approverPurpose = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> roleRes = new ArrayList<String>();
			ArrayList<String> nameRes = new ArrayList<String>();
			ArrayList<String> titleRes = new ArrayList<String>();
			ArrayList<String> approverPurposeRes = new ArrayList<String>();
			
			String oppName ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = "select * from archivereq_roles_info where oppid='"+Id+"' oreder by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   role.add(rs.getString("role"));
			   name.add(rs.getString("name"));
			   title.add(rs.getString("title"));
			   approverPurpose.add(rs.getString("approverpurpose"));
			  oppName = rs.getString("OppName");
			}
			
			for(int i=0;i<seqNum.size()+1;i++)
			{
				if(SeqNum<=Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					titleRes.add(title.get(i));
					approverPurposeRes.add(approverPurpose.get(i));
				}
				else if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i)+1);
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					titleRes.add(title.get(i));
					approverPurposeRes.add(approverPurpose.get(i));
				}
				else if(SeqNum==SeqNum+1)
				{
					seqNumRes.add(String.valueOf(SeqNum+1));
					roleRes.add("");
					nameRes.add("");
					titleRes.add("");
					approverPurposeRes.add("");
				}
			}
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+roleRes.get(i)+" "+nameRes.get(i)+" "+titleRes.get(i)+" "+approverPurposeRes.get(i)+" ");	
			}
			
			String deleteQuery ="delete from archivereq_roles_info where oppid='"+Id+"';";
			Statement st1 = con.createStatement();
			st1.executeUpdate(deleteQuery);
			st1.close();
			
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+roleRes.get(i)+" "+nameRes.get(i)+" "+titleRes.get(i)+" "+approverPurposeRes.get(i)+" ");	
			  String StakeHolderInsertQuery = "insert into ArchiveReq_Roles_Info (seq_no, OppId, prj_name, OppName, role, name, title, approverpurpose)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, oppName);
	          prestmt.setString(5, roleRes.get(i));
	          prestmt.setString(6, nameRes.get(i));
	          prestmt.setString(7, titleRes.get(i));
	          prestmt.setString(8, approverPurpose.get(i));
	          prestmt.execute();
	          statusFlag =true;
			}
			jsonObject.addProperty("AddStatus", statusFlag);
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}

	
	protected void finalize() throws Throwable {
      con.close();
      System.out.println("Db connection Closed");
	}
}
