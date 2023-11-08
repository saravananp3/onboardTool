package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class EditTableDetailsService {
    public static JsonObject updateDetails(String Application_Name  ,String ProjectNumber,String SoftwareAndLicensing,String ContractDate,String Scope,String Avoidance_Cost,String Archive_Cost,String CBA,String FundingDetails,String Fundings) {
        JsonObject jsonobj = new JsonObject();
    try {
    	String applicationName=Application_Name;
        DBconnection dBconnection = new DBconnection();
        int Project=0,Application=0;
        String Application_Name1="",ProjectNumber1="";
        boolean partial_update_flag=false;
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected to Edit Table ...");
      
        System.out.println("Application Name : "+Application_Name);
        System.out.println("Project Number: "+ProjectNumber);
        System.out.println("SoftwareAndLicensing: "+SoftwareAndLicensing);
        System.out.println("ContractDate: "+ContractDate);
        System.out.println("Scope_modify: "+Scope);
        System.out.println("Avoidance_Cost: "+Avoidance_Cost);
        System.out.println("Archive_Cost: "+Archive_Cost);
        System.out.println("CBA: "+CBA);
        System.out.println("FundingDetails: "+FundingDetails);
        System.out.println("Fundings Type: "+Fundings);
        
        String usersupdatequery = "select Id  from finance_informations where label_Name=Application Name and value=?;";
        PreparedStatement st = connection.prepareStatement(usersupdatequery);
       
		st.setString(1,applicationName);
		ResultSet rs = st.executeQuery();
        if (rs.next()) {
        	Application_Name1=rs.getString(1);
        	ProjectNumber1=rs.getString(2);
        	System.out.println("Application Name1"+Application_Name1);
        	System.out.println("the values entered into if");
            jsonobj.addProperty("Application_Name", rs.getString(1));
            jsonobj.addProperty("ProjectNumber", rs.getString(2));
            jsonobj.addProperty("SoftwareAndLicensing", rs.getString(3));
            jsonobj.addProperty("ContractDate", rs.getString(4));
            jsonobj.addProperty("Scope", rs.getString(5));
            jsonobj.addProperty("Avoidance_Cost", rs.getString(6));
            jsonobj.addProperty("Archive_Cost", rs.getString(7));
            jsonobj.addProperty("CBA", rs.getString(8));
            jsonobj.addProperty("FundingDetails", rs.getString(9));
            jsonobj.addProperty("Fundings", rs.getString(10));
        }        
        if((Application_Name1.equals(Application_Name))&&ProjectNumber1.equals(ProjectNumber))
        {	   partial_update_flag=true;
        System.out.println("It is enter into Update");
        	   String update_query = "UPDATE decom3sixtytool.financedetails SET Application_Name =?,Project_Number=?,Software_and_Licensing=?,Contract_Date=?,scope_of_infrastructure=?,Cost_Avoidance=?,Cost_of_Archive=?,CBA=?,Funding_approval=?,Funding_type=? where Application_Name = ?;";
               PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
               preparedStmt1.setString(1,Application_Name );
               preparedStmt1.setString(2, ProjectNumber);
               preparedStmt1.setString(3, SoftwareAndLicensing);
               preparedStmt1.setString(4, ContractDate);
               preparedStmt1.setString(5, Scope);
               preparedStmt1.setString(6,Avoidance_Cost );
               preparedStmt1.setString(7,Archive_Cost ); 
               preparedStmt1.setString(8,CBA );
               preparedStmt1.setString(9,FundingDetails );
               preparedStmt1.setString(10,Fundings );
               preparedStmt1.setString(11,applicationName );
               preparedStmt1.execute();
               jsonobj.addProperty("partial_update", "Success");
        }
        String select_query ="select count(*) from financedetails where Application_Name=?";
		PreparedStatement preparedStmt = connection.prepareStatement(select_query);
		preparedStmt.setString(1,applicationName);
		ResultSet rs1=preparedStmt.executeQuery();
		String select_query1 ="select count(*) from financedetails where Project_Number=?";
		PreparedStatement preparedStmt2 = connection.prepareStatement(select_query1);
		preparedStmt2.setString(1, ProjectNumber);
		ResultSet rs2=preparedStmt2.executeQuery();
		rs1.next();
	    Application = rs1.getInt(1);	
	    rs2.next();
	    Project = rs2.getInt(1);		
		if((Application!=0 && Project!=0) && !partial_update_flag)
		{
			if(!Application_Name.equals(Application_Name) && !ProjectNumber.equals(ProjectNumber)) {
			jsonobj.addProperty("ApplicationName", "Yes");
			jsonobj.addProperty("ProjectNumber", "Yes");
		}
		}
		if(Application!=0 && !partial_update_flag)
		{
			if(!Application_Name.equals(Application_Name)) {
			jsonobj.addProperty("ApplicationName", "Yes");
			}
		}
		if(Project !=0 && !partial_update_flag)
		{
			if(!ProjectNumber.equals(ProjectNumber)) {
			jsonobj.addProperty("ProjectNumber", "Yes");
			}
		}		
		if((Application==0 &&  Project==0) && !partial_update_flag)
		{
		
        String update_query = "update financedetails set Application_Name =?,Project_Number=?,Software_and_Licensing=?,Contract_Date=?,scope_of_infrastructure=?,Cost_Avoidance=?,Cost_of_Archive=?,CBA=?,Funding_approval=?,Funding_type=? where Application_Name = ?;";
        PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
        preparedStmt1.setString(1,Application_Name);
        preparedStmt1.setString(2,ProjectNumber );
        preparedStmt1.setString(3,SoftwareAndLicensing );
        preparedStmt1.setString(4,ContractDate );
        preparedStmt1.setString(5, Scope);
        preparedStmt1.setString(6, Avoidance_Cost);
        preparedStmt1.setString(7,Archive_Cost);
        preparedStmt1.setString(8,CBA );
        preparedStmt1.setString(9, FundingDetails);
        preparedStmt1.setString(10,Fundings);
        preparedStmt1.setString(11,Application_Name);
        preparedStmt1.execute();
        System.out.println("The Statement Comes");
        jsonobj.addProperty("flag", "Success");
        jsonobj.addProperty("Applicaton_Name", Application_Name);
        jsonobj.addProperty("ProjectNumber", ProjectNumber );
        jsonobj.addProperty("SoftwareAndLicensing",SoftwareAndLicensing);
        jsonobj.addProperty("ContractDate", ContractDate);
        jsonobj.addProperty("Scope", Scope);
        jsonobj.addProperty("Avoidance_Cost",  Avoidance_Cost);
        jsonobj.addProperty("Archive_Cost",Archive_Cost );
        jsonobj.addProperty("CBA",CBA );
        jsonobj.addProperty("FundingDetails", FundingDetails);
        jsonobj.addProperty("Fundings", Fundings);
    }		
    }
    catch(Exception e)
        {
        System.out.println("Execption Occurs");
        }
        return jsonobj;
    }
    }