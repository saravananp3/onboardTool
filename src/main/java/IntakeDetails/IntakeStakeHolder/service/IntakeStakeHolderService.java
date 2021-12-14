package IntakeDetails.IntakeStakeHolder.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.Common.DynamicFields;
import onboard.DBconnection;

public class IntakeStakeHolderService extends  DynamicFields
{
    DBconnection dBconnection =null;
	
	Connection con = null;
	
	public String oppId="";
	public String userName="";
	
	public IntakeStakeHolderService() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}
	@Override
	public JsonObject edit(String lavel_name, int sequence_number, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int seq_num, String Id) {
		try {
			int seqmax = 0;
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
			ArrayList<String> arr_Oppid = new ArrayList<String>();
			ArrayList<String> arr_prj = new ArrayList<String>();
			ArrayList<String> arr_app = new ArrayList<String>();
			ArrayList<String> arr_name = new ArrayList<String>();
			ArrayList<String> arr_email = new ArrayList<String>();
			ArrayList<String> arr_username = new ArrayList<String>();
			ArrayList<String> arr_role = new ArrayList<String>();
			ArrayList<String> arr_ApprovalId = new ArrayList<String>();
			ArrayList<String> arr_IntakeApproval = new ArrayList<String>();
			ArrayList<String> arr_moduleId =  new ArrayList<String>();
			ArrayList<String> arr_intakeApproval = new ArrayList<String>();

			ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
			ArrayList<String> arr_Oppid_split = new ArrayList<String>();
			ArrayList<String> arr_prj_split = new ArrayList<String>();
			ArrayList<String> arr_app_split = new ArrayList<String>();
			ArrayList<String> arr_name_split = new ArrayList<String>();
			ArrayList<String> arr_email_split = new ArrayList<String>();
			ArrayList<String> arr_username_split = new ArrayList<String>();
			ArrayList<String> arr_role_split = new ArrayList<String>();
			ArrayList<String> arr_ApprovalId_split = new ArrayList<String>();
			ArrayList<String> arr_IntakeApproval_split = new ArrayList<String>();
			ArrayList<String> arr_moduleId_split =  new ArrayList<String>();
			ArrayList<String> arr_intakeApproval_split = new ArrayList<String>();
			
			String select_query = "select max(seq_no) from intake_stake_holder_info where OppId = '"+Id+"' order by seq_no;";
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(select_query);
			if (rs.next()) {
				seqmax = Integer.parseInt(rs.getString(1));
			}

			String query = "select * from intake_stake_holder_info where OppId = '"+Id+"' order by seq_no;";
			Statement st1 = connection.createStatement();
			ResultSet rs1 = st1.executeQuery(query);
			while (rs1.next()) {
				arr_seqmax.add(rs1.getInt(1));
				arr_Oppid.add(rs1.getString(2));
				arr_prj.add(rs1.getString(3));
				arr_app.add(rs1.getString(4));
				arr_name.add(rs1.getString(5));
				arr_email.add(rs1.getString(6));
				arr_username.add(rs1.getString(7));
				arr_role.add(rs1.getString(8));
				arr_ApprovalId.add(rs1.getString(9));
				arr_intakeApproval.add(rs1.getString(10));
				arr_moduleId.add(rs1.getString(11));
			}

			for (int i = 0; i < seqmax; i++) {
				if (arr_seqmax.get(i) < seq_num) {
					arr_seqmax_split.add(arr_seqmax.get(i));
					arr_Oppid_split.add(arr_Oppid.get(i));
					arr_prj_split.add(arr_prj.get(i));
					arr_app_split.add(arr_app.get(i));
					arr_name_split.add(arr_name.get(i));
					arr_email_split.add(arr_email.get(i));
					arr_username_split.add(arr_username.get(i));
					arr_role_split.add(arr_role.get(i));
					arr_ApprovalId_split.add(arr_ApprovalId.get(i));
					arr_intakeApproval_split.add(arr_intakeApproval.get(i));
					arr_moduleId_split.add(arr_moduleId.get(i));
				} else if (arr_seqmax.get(i) > seq_num) {
					arr_seqmax_split.add((arr_seqmax.get(i) - 1));
					arr_Oppid_split.add(arr_Oppid.get(i));
					arr_prj_split.add(arr_prj.get(i));
					arr_app_split.add(arr_app.get(i));
					arr_name_split.add(arr_name.get(i));
					arr_email_split.add(arr_email.get(i));
					arr_username_split.add(arr_username.get(i));
					arr_role_split.add(arr_role.get(i));
					arr_ApprovalId_split.add(arr_ApprovalId.get(i));
					arr_intakeApproval_split.add(arr_intakeApproval.get(i));
					arr_moduleId_split.add(arr_moduleId.get(i));
				}
			}

			String delete_query = "delete from intake_stake_holder_info where OppId='"+Id+"';";
			Statement st2 = connection.createStatement();
			st2.executeUpdate(delete_query);
			for (int j = 0; j < seqmax - 1; j++) {
				String insert_query = "insert into intake_stake_holder_info (seq_no,Oppid,prj_name,app_name,name,emailId,username,role,approvalid,intakeApproval,moduleid) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
				preparedStatement1.setInt(1, arr_seqmax_split.get(j));
				preparedStatement1.setString(2, arr_Oppid_split.get(j));
				preparedStatement1.setString(3, arr_prj_split.get(j));
				preparedStatement1.setString(4, arr_app_split.get(j));
				preparedStatement1.setString(5, arr_name_split.get(j));
				preparedStatement1.setString(6, arr_email_split.get(j));
				preparedStatement1.setString(7, arr_username_split.get(j));
				preparedStatement1.setString(8, arr_role_split.get(j));
				preparedStatement1.setString(9, arr_ApprovalId_split.get(j));
				preparedStatement1.setString(10, arr_intakeApproval_split.get(j));
				preparedStatement1.setString(11,arr_moduleId_split.get(j));
				preparedStatement1.execute();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			
	}

	@Override
	public JsonArray AddTemplateFields(int[] selected_index, String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void OrderingColumnNameBySeq(String ID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int Add(String id, String label_name, String mandatory, String type, int NumberofInputfields,
			String options) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	public JsonArray IntakeStakeHolderDataRetrieve(String Id, String UserName,String approverId,boolean isApprover) {
		JsonArray jsonArray1 = new JsonArray();
		try
		{
		if(isApprover) {
			getOppIdAndUserName(approverId);
		  Id = oppId;
		  UserName = userName;
		}
		
	    JsonArray jsonArray = new JsonArray();
		boolean checkExistence =  false;
		String CheckQuery = "select * from intake_stake_holder_info where OppId ='"+Id+"' order by seq_no;";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(CheckQuery);
		while(rs.next())
		{
			checkExistence =  true;
			JsonObject jsonObj = new JsonObject();
			jsonObj.addProperty("seq_no",rs.getString(1));
			jsonObj.addProperty("OppId",rs.getString(2));
			jsonObj.addProperty("name",rs.getString(5));
			jsonObj.addProperty("emailId",rs.getString(6));
			jsonObj.addProperty("username",rs.getString(7));
			jsonObj.addProperty("role",rs.getString(8));
			jsonObj.addProperty("approvalId",rs.getString(9));
			jsonObj.addProperty("intakeApproval",rs.getString(10));
			jsonObj.addProperty("moduleId",rs.getString(11));
			jsonArray.add(jsonObj);
		}
		rs.close();
		st.close();
		
		  JsonObject jsonObject = new JsonObject();
		  jsonObject.addProperty("checkExistence",checkExistence);
		  jsonObject.addProperty("username",UserName);
		  jsonArray1.add(jsonObject);
			/*
			 * if(!checkExistence) jsonArray.addAll(getOpportunityInfo(Id)); else
			 */
		  jsonArray1.addAll(jsonArray);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray1;
	}
     private void getOppIdAndUserName(String approverId) {
    	  oppId=null;
    	 try {
    		 String selectQuery = "select * from intake_stake_holder_info where approvalId = '"+approverId+"'";
    		 Statement st = con.createStatement();
    		 ResultSet rs = st.executeQuery(selectQuery);
    		 if(rs.next()) {
    			 oppId = rs.getString("oppId");
    			 userName =rs.getString("username");
    		 }
    		 rs.close();
    		 st.close();
    	 }
    	 catch(Exception e) {
    		 e.printStackTrace();
    	 }
     }
	
	private JsonArray getOpportunityInfo(String Id) {
		
		JsonArray jsonArray = new JsonArray();
		try {
			String OppInfoQuery = "select * from decom3sixtytool.opportunity_info where id = '"+Id+"' and (column_name = 'appowner' or column_name = 'businessowner' or column_name = 'sme') order by seq_no;";
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(OppInfoQuery);
			int seq_num = 0;
			while (rs1.next()) {
				
	         String Role = getRoleName(rs1.getString("column_name"));
	         
	         String UserName = rs1.getString("value");
	         
	         String StakeHolderInsertQuery = "insert into intake_stake_holder_info (seq_no, OppId, prj_name, app_name, name, emailId, username, role, approvalId, intakeApproval, moduleId)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, seq_num+1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, "");
	          prestmt.setString(5, "");
	          prestmt.setString(6, "");
	          prestmt.setString(7, UserName);
	          prestmt.setString(8, Role);
	          prestmt.setString(9, "");
	          prestmt.setString(10, "");
	          prestmt.setString(11, "");
	          prestmt.execute();
	          JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("seq_no",seq_num+1);
				jsonObj.addProperty("OppId",Id);
				jsonObj.addProperty("name","");
				jsonObj.addProperty("emailId","");
				jsonObj.addProperty("username",UserName);
				jsonObj.addProperty("role",Role);
				jsonObj.addProperty("approvalId","");
				jsonObj.addProperty("intakeApproval","");
				jsonObj.addProperty("moduleId","");
				jsonArray.add(jsonObj);
			seq_num++;
			}
			rs1.close();
			st1.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
		 
	}
	
	private String getRoleName(String role) {
		String rolename="";
		switch(role)
		{
		case "appowner":
			rolename = "Application Owner";
			break;
		case "businessowner":
			rolename = "Business Owner";
			break;
		case "sme":
			rolename = "Development Owner";
			break;
		}
		
		return rolename;
	}
    public JsonObject AddRow(String Id)
    {
    	JsonObject jsonObj = new JsonObject();
    	try
    	{
    		int seq_num = getSequenceNumber(Id);
    	    jsonObj.addProperty("checkAdd",AddRowInTable(Id,seq_num));
    		
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return jsonObj;
    }
    private int getSequenceNumber(String Id)
    {
    	int seq_num =0;
		try
		{
		String MaxSeqNumQuery = "select max(seq_no) from intake_stake_holder_info where OppId ='"+Id+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(MaxSeqNumQuery);
		if(rs.next())
		seq_num = rs.getInt(1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return seq_num;
    }
    private boolean AddRowInTable(String Id,int seq_num)
    {
    	boolean check = false;
    	try
    	{
    		String approvalId = generateRandomApprovalId();
    		String StakeHolderInsertQuery = "insert into intake_stake_holder_info (seq_no, OppId, prj_name, app_name, name, emailId, username, role, approvalId, intakeApproval, moduleId)"
					+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
          prestmt.setInt(1, seq_num+1);
          prestmt.setString(2, Id);
          prestmt.setString(3, "");
          prestmt.setString(4, "");
          prestmt.setString(5, "");
          prestmt.setString(6, "");
          prestmt.setString(7, "");
          prestmt.setString(8, "");
          prestmt.setString(9, approvalId);
          prestmt.setString(10, "Decision pending");
          prestmt.setString(11, "");
          prestmt.execute();
          check = true;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return check;
    }
	@Override
	public void Save(JsonArray jsonArr, String id) {
		try
		{
		  	for(int i=0;i<jsonArr.size();i++)
		  	{
		  		JsonObject jsonObj = jsonArr.get(i).getAsJsonObject();
		  		String name = jsonObj.get("name").getAsString();
				String email = jsonObj.get("emailid").getAsString();
				String username = jsonObj.get("username").getAsString();
  				String role = jsonObj.get("role").getAsString();
  			
  			
  			String StakeHolderUpdateQuery = "update intake_stake_holder_info set name = ?, emailId = ?, username = ?, role = ? where seq_no='"+(i+1)+"' and oppid='"+id+"'";

  	          PreparedStatement prestmt = con.prepareStatement(StakeHolderUpdateQuery);
  	        
  	          prestmt.setString(1, name);
  	          prestmt.setString(2, email);
  	          prestmt.setString(3, username);
  	          prestmt.setString(4, role);
  	          
  	          prestmt.execute();
		  	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public JsonObject CheckUserDetails(JsonArray jsonArray,String id)
	{
		JsonObject jsonObjCheck = new JsonObject();
		boolean checkUser = true;
		boolean checkName = true;
		boolean checkEmail = true;
		boolean checkRole = true;
		ArrayList<String> UserName = new ArrayList<String>();
		ArrayList<String> Name = new ArrayList<String>();
		ArrayList<String> Email = new ArrayList<String>();
		ArrayList<String> Role = new ArrayList<String>();
		try
		{
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
				String username = jsonObj.get("username").getAsString();
				String name = jsonObj.get("name").getAsString();
				String emailId = jsonObj.get("emailid").getAsString();
				String role = jsonObj.get("role").getAsString();
				
				if(!UserName.contains(username))
				UserName.add(username);
				else
					checkUser = false;
				
				if(!Name.contains(name))
					Name.add(name);				
				else
					checkName = false;
				
				if(!Email.contains(emailId))
					Email.add(emailId);				
				else
					checkEmail = false;
				
				if(!Role.contains(role))
					Role.add(role);				
				else
					checkRole = false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		jsonObjCheck.addProperty("checkUser", checkUser);
		jsonObjCheck.addProperty("checkName", checkName);
		jsonObjCheck.addProperty("checkEmail", checkEmail);
		jsonObjCheck.addProperty("checkRole", checkRole);
		
		return jsonObjCheck;
	}
	@Override
    protected void finalize() throws Throwable 
    { 
		System.out.println("Db connection closed.");
        con.close();
    }
	@Override
	public JsonArray DataRetrieve(String Id) {
		// TODO Auto-generated method stub
		return null;
	} 
	public void CheckForStakeHolderField(String columnname,String value,String Id)
	{
		try
		{
		String RoleName = changeRoleName(columnname);
		if(!value.isEmpty()&&!value.equals(null))
		{
			boolean checkInsert = true;
			String selectQuery = "select * from intake_stake_holder_info where oppid='"+Id+"' and role ='"+RoleName+"'";
			Statement st1 = con.createStatement();
			ResultSet rs1= st1.executeQuery(selectQuery);
			if(rs1.next())
				checkInsert = false;
			
			if(!checkInsert)
			{
			 String UpdateQuery = "update intake_stake_holder_info set username ='"+value+"' where role ='"+RoleName+"' and oppid = '"+Id+"'";
			 Statement st2 = con.createStatement();
			 st2.executeUpdate(UpdateQuery);
			}
			else
			{
			  int seq_num =0;
			  String SeqNumQuery = "select max(seq_no) from intake_stake_holder_info where oppid='"+Id+"';"; 
			  Statement st3 = con.createStatement();
			  ResultSet rs3 = st3.executeQuery(SeqNumQuery);
			  if(rs3.next())
			  {
				 String seqnum = rs3.getString(1);
			if(seqnum!=null)
			  seq_num = Integer.parseInt(rs3.getString(1));
			  }
			  String approvalId = generateRandomApprovalId();
			  String StakeHolderInsertQuery = "insert into intake_stake_holder_info (seq_no, OppId, prj_name, app_name, name, emailId, username, role, approvalId, intakeApproval, moduleId)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, seq_num+1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, "");
	          prestmt.setString(5, value);
	          prestmt.setString(6, "");
	          prestmt.setString(7, "");
	          prestmt.setString(8, RoleName);
	          prestmt.setString(9, approvalId);
	          prestmt.setString(10, "Decision pending");
	          prestmt.setString(11, "");
	          prestmt.execute();
			}     
		 }
		else
		{
			String checkQuery ="";
			int seq_num = 0;
			String selectSeqNum ="select seq_no from intake_stake_holder_info where oppid='"+Id+"' and role='"+RoleName+"';";
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(selectSeqNum);
		     if(rs4.next())
			      seq_num = Integer.parseInt(rs4.getString(1));
		    if(seq_num!=0)
		    delete(seq_num,Id);
		     
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static String changeRoleName(String column)
	{
       String role ="";
    switch(column)
    {
    
    case "appowner":
    	role = "Application Owner";
    	break;
    	
    case "businessowner":
    	role = "Business Owner";
    	break;
    	
    case "sme":
    	role = "Development Owner";
    	break;
    
    }
       return role;
   }
	
	public String generateRandomApprovalId() throws SQLException {
		
		String uniqueID = "";
		boolean checkTermination = true;
		
		while(checkTermination) {
		
			uniqueID = UUID.randomUUID().toString();
			System.out.println("Approval Id : " + uniqueID);
			
			boolean checkDupilcateId = checkDuplicateApprovalId(uniqueID);
		
			if(checkDupilcateId == false) {
				checkTermination = false;
				}
		}
		
		return uniqueID;
	}
		
	public boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
		
		boolean checkDuplicate = false;
		
		String selectQuery = "select * from intake_stake_holder_info order by seq_no;";
		Statement state = con.createStatement();
		ResultSet result = state.executeQuery(selectQuery);
		
		while(result.next()) {
			String checkApprovalId = result.getString("approvalId");
			if(checkApprovalId == uniqueID) {
				checkDuplicate = true;
			}	
		}
		return checkDuplicate;
	}
 }