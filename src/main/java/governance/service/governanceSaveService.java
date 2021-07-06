package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import ArchiveExecutionGovernanceModule.service.ArchiveExecutionGovernanceTemplateService;
import onboard.DBconnection;

public class governanceSaveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray;
	String waveName;
	String oppName;
        String tableName;
	String idWhereCond;
	String idAndCond;
	String operation;
	String previousApps = "";
	String selectedApps = "";
	String id;
	public governanceSaveService(String Id,String waveName,JsonArray jsonArray,String id,String operation) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.id = id;
		this.waveName = waveName;
		this.jsonArray = jsonArray;
		this.operation = operation;
		getTableProperty(operation);
	}
	public governanceSaveService(String waveName, String oppName) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.waveName = waveName;
		this.oppName = oppName;
	}
	
	public void getTableProperty(String operation)
	{
		try
		{
			switch(operation)
			{
			case "EditWave":
				  tableName = "governance_info";
				  idAndCond = " and waveId='"+id+"'";
				  idWhereCond = " where waveId='"+id+"'";
				  previousApps = getApps();
				break;
				
			case "NewWave":
				tableName = "governance_info_details";
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
	private String getApps() {
		String Apps = "";
		try
		{
			String selectPreviousApps = "select * from governance_info where column_name='apps' and waveId='"+id+"';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectPreviousApps);
			
			if(rs.next())
			{
				 Apps = rs.getString("Value");
			}
			
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return Apps;
	}
	public boolean AddOpportunityToExistingWave()
	{
		boolean statusFlag = false;
		try
		{
			String oppNames = "";
			String selectQuery = "select * from governance_info where waveName = '"+waveName+"' and column_name='apps';";
			Statement st1 =con.createStatement();
			ResultSet rs1 = st1.executeQuery(selectQuery);
			
			if(rs1.next())
			oppNames = rs1.getString("value");
			rs1.close();
			st1.close();
			if(oppNames.equals(""))
				oppNames=oppName;
			else
			   oppNames += ","+oppName;
			String updateQuery = "update governance_info set value='"+oppNames+"' where column_name='apps' and waveName = '"+waveName+"';";
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
				
	            String updateQuery = "update "+tableName+" set value='"+value+"',waveName='"+waveName+"' where column_name='"+name+"' "+idAndCond+";";
	            Statement st = con.createStatement();
                st.executeUpdate(updateQuery);
	            st.close();
	            
			}
			String waveName = jsonArray.get(1).getAsJsonObject().get("Value").getAsString();
			
			if(operation.equals("NewWave")) {
			moveInfoDetailsToInfo();
			archiveExecGovTempInfoToGovInfoTable(waveName);
		  }
			else 
			{
				ArchiveExecutionGovernanceTemplateService ArchObj = new ArchiveExecutionGovernanceTemplateService(id);
				ArchObj.ArchiveExecutionEditApplicationParentNode(waveName);
				ArchObj.getDataRetrieveBasedOnApps();
				ArchObj.con.close();
			}
			saveStatus = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return saveStatus;
	}
	
	private void getChangesInArchiveImplementation() {
		String currentApps[] = getApps().split(",");
		String prevApps[] =  previousApps.split(",");
		List<String> Apps = Arrays.asList(currentApps);
		for(int i=0;i<prevApps.length;i++) {
			
			boolean matchFlag = false;
			
			for(int j=0;j<currentApps.length;j++)
			{
				if(prevApps[i].equals(currentApps[j]))
				{
					matchFlag = true;
					Apps.remove(prevApps[i]);
				}
			}
			if(!matchFlag) {
				System.out.println("delete: "+prevApps[i]);
			}
		}
		
		for(String app:Apps)
		{
			System.out.println("Insert :"+app);
		}
	}
	private String getWaveId(String waveName)
	{
		String waveId="";
		try {
			String selectQuery = "select * from governance_info where column_name ='waveName' and value ='"+waveName+"';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next()) {
				waveId = rs.getString("waveId");
			}
			st.close();
			rs.close();
		}
		catch (Exception e) {
         e.printStackTrace();
		}
		return waveId;
	}
	
	public void archiveExecGovTempInfoToGovInfoTable(String waveName)
	{
		try {
			String waveId = getWaveId(waveName);
			ArchiveExecutionGovernanceTemplateService archiveExec =  new ArchiveExecutionGovernanceTemplateService(waveId);
			archiveExec.archiveTemplateToArchiveInfo(waveName);
			archiveExec.getDataRetrieveBasedOnApps();
			archiveExec.con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public boolean moveInfoDetailsToInfo()
	{
		boolean statusFlag = false;
		try
		{
			String selectQuery = "select * from governance_info_details order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
				String insert_query = "insert into governance_info (seq_no,waveId,waveName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
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
			String selectQuery = "select * from governance_info where column_name='"+columnName+"' and value='"+value+"';";
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
				String selectQuery = "select * from governance_info where column_name='"+columnName+"' and value='"+value+"';";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				System.out.println("Query : "+selectQuery);
				while(rs.next())
				{
					if(value.equals(rs.getString("value"))&&!rs.getString("waveId").equals(id))
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
