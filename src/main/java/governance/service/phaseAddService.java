package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class phaseAddService {
	
	DBconnection dBconnection;
	Connection con;
	String Id;
	String tableName;
	String IdWhereCond;
	String IdAndCond;
	
public phaseAddService(String Id,String operation) throws ClassNotFoundException, SQLException {
	 dBconnection = new DBconnection();
	 con = (Connection) dBconnection.getConnection();
     this.Id = Id;
     getTableProp(operation);
}

private void getTableProp(String operation) {
	
	switch(operation)
	{
	
	case "EditPhase":
		tableName =" phase_info";
		IdWhereCond =  " where phaseId='"+Id+"'";
		IdAndCond = " and phaseId='"+Id+"'";
		break;
	
	case "NewPhase":
		tableName =" phase_info_details";
		IdWhereCond =  "";
		IdAndCond = "";
		break;
	}
	
	
}

public boolean phaseAdd(String type,String label_name,String options,String mandatory)
{
	boolean addStatus =  false;
     try
     {
    	 int max_seq_num = 0;
    	 String select_query = "select * from  "+tableName+IdWhereCond+" order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(select_query);
			String name = "phaseAddInfo";
			
			if (rs.next()) {
				max_seq_num= getSeqNum();
			}
			if (!type.equals("Text box") && !type.equals("Datepicker")) {
				options = options.substring(0, options.length() - 1);
			}
			String insert_query = "insert into "+tableName+" (seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
			preparedStatement1.setInt(1, max_seq_num);
			preparedStatement1.setString(2,Id);
			preparedStatement1.setString(3,"");
			preparedStatement1.setString(4, "");
			preparedStatement1.setString(5, options);
			preparedStatement1.setString(6, label_name);
			preparedStatement1.setString(7, (name + max_seq_num));
			preparedStatement1.setString(8, type);
			preparedStatement1.setString(9, mandatory);
			preparedStatement1.setString(10, "");
			preparedStatement1.execute();
            preparedStatement1.close();
            addStatus =true;
     }
     catch(Exception e)
     {
    	 e.printStackTrace();
     }
	return addStatus;
}

public int getSeqNum()
{
	int max_seq_num = 0;
	try
	{
	String max_seqnum = "select max(seq_no) from "+tableName+IdWhereCond+" order by seq_no;";
	Statement st1 = con.createStatement();
	ResultSet rs1 = st1.executeQuery(max_seqnum);

	if (rs1.next()) {
		max_seq_num = Integer.parseInt(rs1.getString(1));
		max_seq_num++;
	}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
return max_seq_num;
}
public boolean checkLabelName(String labelName)
{
	boolean checkDuplicate = false;
	try
	{
      String labelQuery = "select * from "+tableName+" where label_name = '"+labelName+"'"+ IdAndCond;
      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery(labelQuery);
      if(rs.next())
    	  checkDuplicate = true;
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return checkDuplicate;
}
protected void finalize() throws Throwable {
con.close();
System.out.println("Db connection closed.");
}

}
