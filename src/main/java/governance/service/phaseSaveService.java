package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;

public class phaseSaveService {
	
	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray;
	String phaseName;
	String oppName;
	
	String tableName;
	String idWhereCond;
	String idAndCond;
	String operation;
	String id;
	
	public phaseSaveService(String Id,String phaseName,JsonArray jsonArray,String id,String operation) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.id = id;
		this.phaseName = phaseName;
		this.jsonArray = jsonArray;
		this.operation = operation;
		getTableProperty(operation);
	}
	
	public phaseSaveService(String phaseName, String oppName) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.phaseName = phaseName;
		this.oppName = oppName;
	}
	
	public void getTableProperty(String operation)
	{
		try
		{
			switch(operation)
			{
			case "EditPhase":
				  tableName = "phase_info";
				  idAndCond = " and phaseId='"+id+"'";
				  idWhereCond = " where phaseId='"+id+"'";
				break;
				
			case "NewPhase":
				tableName = "phase_info_details";
				idWhereCond = "";
				idAndCond = "";
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public boolean AddOpportunityToExistingWave()
	{
		boolean statusFlag = false;
		try
		{
			String oppNames = "";
			String selectQuery = "select * from phase_info where phaseName = '"+phaseName+"' and column_name='apps';";
			Statement st1 =con.createStatement();
			ResultSet rs1 = st1.executeQuery(selectQuery);
			
			if(rs1.next())
			oppNames = rs1.getString("value");
			rs1.close();
			st1.close();
			
			String updateQuery = "update phase_info set value='"+oppNames+","+oppName+"' where column_name='apps' and phaseName = '"+phaseName+"';";
            Statement st = con.createStatement();
            st.executeUpdate(updateQuery);
            st.close();
            
            statusFlag = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	public boolean SaveService()
	{
		boolean saveStatus = false;
		try
		{
			for(int i=0;i<jsonArray.size();i++)
			{
				
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
				String name = jsonObj.get("Name").getAsString();
				String value = jsonObj.get("Value").getAsString();
				
	            String updateQuery = "update "+tableName+" set value='"+value+"',phaseName='"+phaseName+"' where column_name='"+name+"' "+idAndCond+";";
	            Statement st = con.createStatement();
	            st.executeUpdate(updateQuery);
	            st.close();
	            
			}
			if(operation.equals("NewPhase"))
			moveInfoDetailsToInfo();
			saveStatus = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return saveStatus;
	}
	public boolean moveInfoDetailsToInfo()
	{
		boolean statusFlag = false;
		try
		{
			String selectQuery = "select * from phase_info_details order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
				String insert_query = "insert into phase_info (seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
				preparedStatement1.setInt(1, rs.getInt(1));
				preparedStatement1.setString(2,rs.getString(2));
				preparedStatement1.setString(3,rs.getString(3));
				preparedStatement1.setString(4,rs.getString(4));
				preparedStatement1.setString(5,rs.getString(5));
				preparedStatement1.setString(6,rs.getString(6));
				preparedStatement1.setString(7,rs.getString(7));
				preparedStatement1.setString(8,rs.getString(8));
				preparedStatement1.setString(9,rs.getString(9));
				preparedStatement1.setString(10,rs.getString(10));
				preparedStatement1.execute();
	            preparedStatement1.close();
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	public boolean checkDuplicateData(String columnName,String value)
	{
		boolean statusFlag  = false;
		try
		{
			if(operation.equals("NewPhase"))
			{
			String selectQuery = "select * from phase_info where column_name='"+columnName+"' and value='"+value+"';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			System.out.println("Query : "+selectQuery);
			if(rs.next())
			{
				if(value.equals(rs.getString("value")))
				statusFlag =  true;
			}
			st.close();
			rs.close();
			}
			else if(operation.equals("EditPhase"))
			{
				String selectQuery = "select * from phase_info where column_name='"+columnName+"' and value='"+value+"';";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				System.out.println("Query : "+selectQuery);
				while(rs.next())
				{
					if(value.equals(rs.getString("value"))&&!rs.getString("phaseId").equals(id))
					statusFlag =  true;
					
				}
				st.close();
				rs.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	protected void finalize() throws Throwable {
	   System.out.println("Db connection closed.");
		con.close();
	}

}
