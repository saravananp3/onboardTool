package NewArchiveRequirements.LegacyApplicationInfo.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class archiveLegacyAppInfoSaveService {

	public JsonArray jsonArray = new JsonArray();
	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	public String oppName = null;
	public archiveLegacyAppInfoSaveService(String Id,JsonArray jsonArray, String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
		 this.oppName = oppName;
	}
	 
	public boolean save()
	{
		boolean statusFlag =  false;
		try
		{
			for(int i=0;i<jsonArray.size();i++)
			 {
			JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
			String name = jsonObj.get("Name").getAsString();
			String value = jsonObj.get("Value").getAsString();
			String SelectQuery = "select * from archivereq_legacyapp_info where id ='"+Id+"' and column_name='"+name+"';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(SelectQuery);
			if(rs.next())
			{
				String UpdateQuery = "update archivereq_legacyapp_info set value='"+value+"', app_name = '"+oppName+"' where id ='"+Id+"' and column_name ='"+name+"'";
				Statement st1 = con.createStatement();
               st1.executeUpdate(UpdateQuery);
               st1.close();
			  }
			rs.close();
			st.close();
			}
			statusFlag = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	
	protected void finalize() throws Throwable {
		con.close();
		System.out.println("Db connection closed");
	}

}
