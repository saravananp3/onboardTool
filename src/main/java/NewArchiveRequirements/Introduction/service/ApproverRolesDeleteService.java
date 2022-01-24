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
			ArrayList<String> emailId = new ArrayList<String>();
			ArrayList<String> username = new ArrayList<String>();
			ArrayList<String> priority = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> roleRes = new ArrayList<String>();
			ArrayList<String> nameRes = new ArrayList<String>();
			ArrayList<String> emailIdRes = new ArrayList<String>();
			ArrayList<String> usernameRes = new ArrayList<String>();
			ArrayList<String> priorityRes = new ArrayList<String>();
			
			String appname ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = "select * from archivereq_roles_info where oppid='"+Id+"' order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   role.add(rs.getString("role"));
			   name.add(rs.getString("name"));
			   emailId.add(rs.getString("emailId"));
			   username.add(rs.getString("username"));
			   appname=(rs.getString("app_name"));
			  priority.add(rs.getString("priority_order_num"));
			}
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					emailIdRes.add(emailId.get(i));
					usernameRes.add(username.get(i));
					priorityRes.add(priority.get(i));
				}
				else if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					emailIdRes.add(emailId.get(i));
					usernameRes.add(username.get(i));
					priorityRes.add(priority.get(i));

				}
			}
	
			
			String deleteQuery ="delete from archivereq_roles_info where oppid='"+Id+"';";
			Statement st1 = con.createStatement();
			st1.executeUpdate(deleteQuery);
			st1.close();
			
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+roleRes.get(i)+" "+nameRes.get(i)+" "+emailIdRes.get(i)+" "+usernameRes.get(i)+" "+priorityRes.get(i)+" ");	
			  String StakeHolderInsertQuery = "insert into ArchiveReq_Roles_Info (seq_no, OppId, prj_name, app_name, role, name, emailId,username ,priority_order_num)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?,?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, appname);
	          prestmt.setString(5, roleRes.get(i));
	          prestmt.setString(6, nameRes.get(i));
	          prestmt.setString(7, emailIdRes.get(i));
	          prestmt.setString(8, usernameRes.get(i));
	          prestmt.setString(9, priorityRes.get(i));
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
