package IntakeDetails.IntakeAssessment.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class IntakeAssessmentCompleteEnableService {
	
	DBconnection dBconnection = null;

	Connection con = null;
	public static String SectionName;

	public static String SectionTemplateTable;

	public static String SectionInfoTable;

	public static String id;

	public static boolean checkContractInfo;

	public static boolean checkThirdParty;

	public IntakeAssessmentCompleteEnableService(String id)
			throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.id = id;
	}

	private void SetTableName(String section) {

		SectionName = section;

		switch (section) {
		case "ComplianceCharacteristics":
			SectionTemplateTable = "assessment_compliance_char_info_template_details";
			SectionInfoTable = "Assessment_Compliance_Char_Info";
			break;

		case "ApplicationInformation":
			SectionTemplateTable = "Assessment_Application_Info_Template_Details";
			SectionInfoTable = "Assessment_Application_Info";
			break;
		case "ContractInformation":
			SectionTemplateTable = "Assessment_Contract_Info_Template_Details";
			SectionInfoTable = "Assessment_Contract_Info";
			break;
		case "DataCharacteristics":
			SectionTemplateTable = "assessment_data_char_info_template_details";
			SectionInfoTable = "assessment_data_char_info";
			break;
		case "ArchivalConsumption":
			SectionTemplateTable = "Assessment_Archival_Consumption_Info_Template_Details";
			SectionInfoTable = "Assessment_Archival_Consumption_Info";
			break;
		}

	}

	public JsonObject getCompleteEnableStatus(String id) {

		try {
			DBconnection con = new DBconnection();
			Connection connection = (Connection) con.getConnection();
			JsonObject jsonObject = new JsonObject();
			String[] section = {"ApplicationInformation" , "DataCharacteristics" , "ComplianceCharacteristics" , "ArchivalConsumption"};
			boolean status=false;
			boolean status1=false;
			boolean status2=false;
			boolean status3=false;
			int count=0;
			
			for (int i = 0; i < section.length; i++) {
				count++;
				SetTableName(section[i]);
				String SelectQuery = "select * from " + SectionInfoTable + " where id =? and mandatory='Yes' and value='';";
				PreparedStatement st=connection.prepareStatement(SelectQuery);
				st.setString(1, id);
				//st.setString(2, SectionName);
				ResultSet rs = st.executeQuery();
				if (rs.next()) {
					if(SectionName.equals(section[0]))
					{
						System.out.println("section 1 "+section[0]);
						status=true;
					}
					if(SectionName.equals(section[1]))
					{
						System.out.println("section 2 "+section[1]);
						status1=true;
					}
					if(SectionName.equals(section[2]))
					{
						System.out.println("section 3 "+section[2]);
						status2=true;
					}
					if(SectionName.equals(section[3]))
					{
						System.out.println("section 4 "+section[3]);
						status3=true;
					}
					SectionName="";
					SectionInfoTable="";
				}
			}
			System.out.println("count value "+count);
			System.out.println("For status "+status+" "+status1+" "+status2+" "+status3+" ");
			if(status || status1 || status2 || status3)
			{
				jsonObject.addProperty("status", "false");
			}
			if(status==false && status1==false && status2==false && status3==false) {
				jsonObject.addProperty("status", "true");
			}
			connection.close();
			return jsonObject;

		}

		catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception----------[info]--------" + e);
		    return null;
		}

	}


}
