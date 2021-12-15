package NewArchiveRequirements.Introduction.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class ApproverRolesDeleteService {
	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	
	public ApproverRolesDeleteService(int SeqNum,String Id) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
	}

	public JsonObject DeleteRow()
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
			String selectQuery = "select * from archivereq_roles_info where oppid='"+Id+"' order by seq_no;";
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
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					titleRes.add(title.get(i));
					approverPurposeRes.add(approverPurpose.get(i));
				}
				else if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					titleRes.add(title.get(i));
					approverPurposeRes.add(approverPurpose.get(i));
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
			jsonObject.addProperty("DeleteStatus", statusFlag);
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}
	protected void finalize() throws Throwable {
      con.close();
	}

}
