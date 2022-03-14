package dashboard.overAllDashboard.service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import com.docusign.esign.model.List;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class dashboardService {
    DBconnection dBconnection = null;
    Connection con = null;
    int intakeCount = 0;
    int reqCount = 0;
    int archiveExeCount = 0;
    int decomExeCount = 0;
    int totalCount = 0;
    public JsonArray GanttChartJsonArray = new JsonArray();
    public dashboardService() throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }
//      public JsonObject dashboardCardDetails() {
//          
//          JsonObject jsonObject = new JsonObject();
//          try {
//              
//              //Opportunity Count 
//              String oppQuery = "select count(*) from opportunity_info where column_name = 'appName';";
//              Statement st = con.createStatement();
//              ResultSet rs = st.executeQuery(oppQuery);
//              
//              if(rs.next()) 
//                  jsonObject.addProperty("opportunityCount", rs.getInt(1));
//              
//              rs.close();
//              st.close();
//              
//              //Decommission Count 
//              String decommQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Decommission';";
//              Statement st1 = con.createStatement();
//              ResultSet rs1 = st1.executeQuery(decommQuery);
//              
//              if(rs1.next()) 
//                  jsonObject.addProperty("decommissionCount", rs1.getInt(1));
//              
//              rs1.close();
//              st1.close();
//              
//              
//              //Archive Count 
//              String archiveQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'Archive';";
//              Statement st2 = con.createStatement();
//              ResultSet rs2 = st2.executeQuery(archiveQuery);
//              
//              if(rs2.next()) 
//                  jsonObject.addProperty("archiveCount", rs2.getInt(1));
//              
//              rs2.close();
//              st2.close();
//              
//              //To be retire Count 
//              String retireQuery = "select count(*) from opportunity_info where column_name = 'request_type' and value = 'To be retire';";
//              Statement st3 = con.createStatement();
//              ResultSet rs3 = st3.executeQuery(retireQuery);
//              
//              if(rs3.next()) 
//                  jsonObject.addProperty("retireCount", rs3.getInt(1));
//              
//              rs3.close();
//              st3.close();
//              
//          }
//          catch(Exception e) {
//              e.printStackTrace();
//          }
//          
//          return jsonObject;
//      }
    public JsonArray getApplicationFromPhaseDataTable(String phaseFilter) {
        JsonArray jsonArray = new JsonArray();
        try {
            String whereCondn = phaseFilter.equals("All") ? "" : " where phaseName like '" + phaseFilter + "%'";
            String selectPhases = "select * from phase_info" + whereCondn;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectPhases);
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    String waves[] = rs.getString("value").split(",");
                    jsonArray.addAll(getWaveDetails(waves, rs.getString("phaseName")));
                }
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    /*public JsonArray getAppDetails() {
        JsonArray jsonArray = new JsonArray();
        try {
            ArrayList<String> app = new ArrayList<String>();
            String selectApp = "select * from opportunity_info where column_name='appName'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectApp);
            while (rs.next()) {
                app.add(rs.getString("value"));
            }
            String[] apps = new String[app.size()];
            apps = app.toArray(apps);
            jsonArray.addAll(getApplicationApprovalDataTable(apps));
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }*/
    private JsonArray getApplicationApprovalDataTable(String[] apps, String wave, String phase) {
        JsonArray jsonArray = new JsonArray();
        try {
            for (String app : apps) {
                JsonObject jsonObject = new JsonObject();
                String selectApp = "select distinct ar.app_name,OppId from opportunity_info o inner join ArchiveReq_Roles_Info ar on o.Id=ar.oppId where column_name='appName' and value = '" + app
                        + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectApp);
                while (rs.next()) {
                    jsonObject.addProperty("app_name", rs.getString("app_name"));
                    jsonObject.addProperty("phaseName", phase);
                    jsonObject.addProperty("waveName", wave);
                    jsonObject.addProperty("targetCompletionDate", "15-07-2022");
                    jsonObject.addProperty("DesignApproval", "No");
                    String Id = rs.getString("OppId");
                    System.out.println("OppId: " + Id);
                    String selectAppdetail= "select * from ArchiveReq_Roles_Info where OppId = '"
                            + Id + "' and priority_order_num!=''";
                    Statement st11 = con.createStatement();
                    ResultSet rs11 = st11.executeQuery(selectAppdetail);
                    boolean flag=rs11.next();
                    if (!rs11.next())
                        jsonObject.addProperty("status", "0%");
                    rs11.close();
                    st11.close();
                    String selectCreationDate = "select value from opportunity_info where column_name='creation_date' and  Id = '"
                            + Id + "'";
                    Statement st2 = con.createStatement();
                    ResultSet rs2 = st2.executeQuery(selectCreationDate);
                    if (rs2.next())
                        jsonObject.addProperty("craetionDate", rs2.getString("value"));
                    rs2.close();
                    st2.close();
                    if(flag==true) {
                    String selectStatusLI = "select * from `decom3sixtytool`.`ArchiveReq_LegacyApp_Info` where mandatory='YES' and Id= '" + Id
                            + "'  and value =''";
                    Statement st9 = con.createStatement();
                    ResultSet rs9 = st9.executeQuery(selectStatusLI);
                    boolean Li = rs9.next();
                    rs9.close();
                    st9.close();
                    if(Li==true)
                    {
                        jsonObject.addProperty("status", "0%");
                    }
                    else
                    {
                        jsonObject.addProperty("status", "25%");
                        if(Li==false)
                        {
                            String selectStatusRC = "select * from `decom3sixtytool`.`Archive_Retention_Info`   where OppId= '" + Id
                                    + "' and retentionCheck='true'";
                            Statement st8 = con.createStatement();
                            ResultSet rs8 = st8.executeQuery(selectStatusRC);
                            boolean Rc = rs8.next();
                            rs8.close();
                            st8.close();
                            if(Rc==true)
                            {
                                jsonObject.addProperty("status", "50%");
                                String selectStatusBR1 = "select  * from `decom3sixtytool`.`Archive_DataReq_Info`  where OppId= '" + Id
                                        + "' and reqInScope=''";
                                Statement st4 = con.createStatement();
                                ResultSet rs4 = st4.executeQuery(selectStatusBR1);
                                boolean Br1 = rs4.next();
                                rs4.close();
                                st4.close();
                                String selectStatusBR2 = "select  * from `decom3sixtytool`.`Archive_RetentionLegalReq_Info`  where OppId= '" + Id
                                        + "' and reqInScope=''";
                                Statement st5 = con.createStatement();
                                ResultSet rs5 = st5.executeQuery(selectStatusBR2);
                                boolean Br2 = rs5.next();
                                rs5.close();
                                st5.close();
                                String selectStatusBR3 = "select  * from `decom3sixtytool`.`Archive_SecurityReq_Info`  where OppId= '" + Id
                                        + "' and reqInScope=''";
                                Statement st6 = con.createStatement();
                                ResultSet rs6 = st6.executeQuery(selectStatusBR3);
                                boolean Br3 = rs6.next();
                                rs6.close();
                                st6.close();
                                String selectStatusBR4 = "select  * from `decom3sixtytool`.`Archive_UsabilityReq_Info`  where OppId= '" + Id
                                        + "' and reqInScope=''";
                                Statement st7 = con.createStatement();
                                ResultSet rs7 = st7.executeQuery(selectStatusBR4);
                                boolean Br4 = rs7.next();
                                rs7.close();
                                st7.close();
                                String selectStatusBR5 = "select  * from `decom3sixtytool`.`Archive_AuditReq_Info`  where OppId= '" + Id
                                        + "' and reqInScope=''";
                                Statement st12 = con.createStatement();
                                ResultSet rs12 = st12.executeQuery(selectStatusBR5);
                                boolean Br5 = rs12.next();
                                rs12.close();
                                st12.close();
                                if(Br1==false && Br2==false && Br3==false && Br4==false && Br5==false)
                                {
                                    jsonObject.addProperty("status", "75%");
                                    String selectStatus = "select intakeApproval from ArchiveReq_Roles_Info where  OppId = '" + Id
                                            + "' and priority_order_num is not null and priority_order_num!='' and intakeApproval in ('Decision pending','Rejected')";
                                    Statement st3 = con.createStatement();
                                    ResultSet rs3 = st3.executeQuery(selectStatus);
                                    boolean approvalstatus = rs3.next();
                                    rs3.close();
                                    st3.close();
                                    String selectStatusApproved = "select intakeApproval from ArchiveReq_Roles_Info where  OppId = '" + Id
                                            + "' and priority_order_num is not null and priority_order_num!='' and intakeApproval='Approved'";
                                    Statement st10 = con.createStatement();
                                    ResultSet rs10 = st10.executeQuery(selectStatusApproved);
                                    boolean approvalstatusApproved = rs10.next();
                                    rs3.close();
                                    st3.close();
                                    if (approvalstatus == false && approvalstatusApproved==true) {
                                        jsonObject.addProperty("status", "100%");
                                        jsonObject.addProperty("DesignApproval", "Yes");
                                    }
                                }
                            }
                        }
                    }
                    }
                    jsonArray.add(jsonObject);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    private JsonArray getWaveDetails(String[] waves, String phase) {
        JsonArray jsonArray = new JsonArray();
        try {
            for (String wave : waves) {
                String selectWaves = "select * from governance_info where waveName='" + wave + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectWaves);
                while (rs.next()) {
                    if (rs.getString("column_name").equals("apps")) {
                        String apps[] = rs.getString("value").split(",");
                        jsonArray.addAll(getApplicationDetails(apps, rs.getString("waveName"), phase));
                    }
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    private JsonArray getApplicationDetails(String[] apps, String wave, String phase) {
        boolean check1 = false;
        boolean check2 = false;
        JsonArray jsonArray = new JsonArray();
        try {
            for (String app : apps) {
                JsonObject jsonObject = new JsonObject();
                String selectApp = "select * from opportunity_info where column_name='appName' and value = '" + app
                        + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectApp);
                while (rs.next()) {
                    jsonObject.addProperty("appName", app);
                    jsonObject.addProperty("phaseName", phase);
                    jsonObject.addProperty("completionTarget", "15-07-2022");
                    //jsonObject.addProperty("waveName", wave);
                    //jsonObject.addProperty("endDate", "14-02-2022");
                    String Id = rs.getString("Id");
                    System.out.println("OppId: " + Id);
                    String selectAppType = "select * from opportunity_info where column_name='request_type' and  Id = '"
                            + Id + "'";
                    Statement st1 = con.createStatement();
                    ResultSet rs1 = st1.executeQuery(selectAppType);
                    if (rs1.next())
                        jsonObject.addProperty("appType", rs1.getString("value"));
                    rs1.close();
                    st1.close();
                    String selectAppOwner = "select * from opportunity_info where column_name='appowner' and  Id = '"
                            + Id + "'";
                    Statement st2 = con.createStatement();
                    ResultSet rs2 = st2.executeQuery(selectAppOwner);
                    if (rs2.next())
                        jsonObject.addProperty("owner", rs2.getString("value"));
                    rs2.close();
                    st2.close();
                    String selectStatus = "select intakeApproval from Intake_Stake_Holder_Info where  OppId = '" + Id
                            + "' and priority_order_num is not null";
                    Statement st3 = con.createStatement();
                    ResultSet rs3 = st3.executeQuery(selectStatus);
                    boolean intakestatus = rs3.next();
                    while (rs3.next()) {
                        if (rs3.getString("intakeApproval").equals("Decision pending")) {
                            jsonObject.addProperty("appStatus", "Intake");
                            jsonObject.addProperty("progress", "25%");
                            check1 = true;
                            break;
                        }
                    }
                    rs3.close();
                    st3.close();
                    if (intakestatus == false) {
                        jsonObject.addProperty("appStatus", "Yet To Start");
                        jsonObject.addProperty("progress", "0%");
                    }
                    boolean archiverequirementstatus = false;
                    if (check1 == false) {
                        String selectStatus1 = "select intakeApproval from ArchiveReq_Roles_Info where  OppId = '" + Id
                                + "' and priority_order_num is not null";
                        Statement st4 = con.createStatement();
                        ResultSet rs4 = st4.executeQuery(selectStatus1);
                        archiverequirementstatus = rs4.next();
                        while (rs4.next()) {
                            if (rs4.getString("intakeApproval").equals("Decision pending")) {
                                jsonObject.addProperty("appStatus", "Archieve Requirements");
                                jsonObject.addProperty("progress", "50%");
                                check2 = true;
                                break;
                            }
                        }
                        rs4.close();
                        st4.close();
                    }
                    if (check1 == false && check2 == false && intakestatus == true
                            && archiverequirementstatus == true) {
                        String selectStatus2 = "select * from archive_execution_info where  OppId = '" + Id + "'";
                        Statement st5 = con.createStatement();
                        ResultSet rs5 = st5.executeQuery(selectStatus2);
                        if (rs5.next()) {
                            jsonObject.addProperty("appStatus", "Archieve Execution");
                            jsonObject.addProperty("progress", "75%");
                        }
                        rs5.close();
                        st5.close();
                    }
                    String selectSubmittedDate = "select distinct submittedDate from Intake_Stake_Holder_Info where  OppId = '" + Id
                            + "' and priority_order_num is not null";
                    Statement st6 = con.createStatement();
                    ResultSet rs6 = st6.executeQuery(selectSubmittedDate);
                    while (rs6.next()) {
                            jsonObject.addProperty("submittedDate", rs6.getString("submittedDate"));
                    }
                    rs6.close();
                    st6.close();
                    String selectDecomAnalyst = "select value from Triage_Info where  Id = '" + Id
                            + "' and column_name='decomAnalyst'";
                    Statement st7 = con.createStatement();
                    ResultSet rs7 = st7.executeQuery(selectDecomAnalyst);
                    while (rs7.next()) {
                            jsonObject.addProperty("decomAnalyst", rs7.getString("value"));
                    }
                    rs7.close();
                    st7.close();
                    String ArchiveRequired="Yes";
                    String selectArchiveRequired = "select value from Assessment_Compliance_Char_Info where  Id = '" + Id
                            + "' and column_name='archivalrequired'";
                    Statement st8 = con.createStatement();
                    ResultSet rs8 = st8.executeQuery(selectArchiveRequired);
                    while (rs8.next()) {
                        if(!rs8.getString("value").equals(""))
                        {
                            ArchiveRequired=rs8.getString("value");
                        }
                        jsonObject.addProperty("ArchiveRequired", ArchiveRequired);
                    }
                    rs8.close();
                    st8.close();
                    jsonArray.add(jsonObject);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonObject dashboardCardDetails()
    {
        JsonObject jsonObject = new JsonObject();
        try
        {
            String selectQuery = "select count(*) from phase_info where column_name = 'phaseName';";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            int countPhase = 0;
            if(rs.next())
            countPhase = rs.getInt(1);
            rs.close();
            st.close();
            String selectQuery1 = "select count(*) from governance_info where column_name = 'waveName';";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(selectQuery1);
            int countWave = 0;
            if(rs1.next())
            countWave = rs1.getInt(1);
            rs1.close();
            st1.close();
            //String selectQuery2 = "select count(*) from opportunity_info where column_name = 'appName';";
            String selectQuery2 = "select count(distinct OppId) from decom3sixtytool.Intake_Stake_Holder_Info where intakeApproval='Approved';";
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery(selectQuery2);
            int countOpportunity = 0;
            if(rs2.next())
            countOpportunity = rs2.getInt(1);
            rs2.close();
            st2.close();
            String selectQuery3 = "select count(distinct oi.Id) from decom3sixtytool.Opportunity_Info oi left join decom3sixtytool.Intake_Stake_Holder_Info ish on ish.OppId=oi.Id "
                    + "where column_name='appName' and oi.Id not in (select OppId from decom3sixtytool.Intake_Stake_Holder_Info where intakeApproval='Approved');";
            Statement st3 = con.createStatement();
            ResultSet rs3 = st3.executeQuery(selectQuery3);
            int countIntake = 0;
            if(rs3.next())
                countIntake = rs3.getInt(1);
            rs3.close();
            st3.close();
            jsonObject.addProperty("phaseCount", countPhase);
            jsonObject.addProperty("waveCount",countWave);
            jsonObject.addProperty("appCount", countOpportunity);
            jsonObject.addProperty("intakeCount", countIntake);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return jsonObject;
    }
    public JsonObject donetChartDetails() {
        JsonObject jsonObject = new JsonObject();
        try {
            String Query = "select distinct(Id) from opportunity_info;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(Query);
            while (rs.next()) {
                String oppId = rs.getString(1);
                String moduleNames[] = { "Intake", "Requirments", "ArchiveExecution", "DecommissionExecution" };
                for (String moduleName : moduleNames) {
                    boolean checkCurrentPhase = true;
                    if (!moduleName.equals("Requirments")) {
                        String selectQuery = "select * from module_approval_info where moduleName = '" + moduleName
                                + "' and OppId = '" + oppId + "'";
                        Statement st1 = con.createStatement();
                        ResultSet rs1 = st1.executeQuery(selectQuery);
                        if (rs1.next()) {
                            if (rs1.getBoolean(4))
                                checkCurrentPhase = false;
                        }
                    } else {
                        String selectQuery1 = "select * from opportunity_info where Id = '" + oppId
                                + "' and column_name = 'request_type';";
                        Statement st2 = con.createStatement();
                        ResultSet rs2 = st2.executeQuery(selectQuery1);
                        if (rs2.next())
                            checkCurrentPhase = getReqApproval(rs2.getString("value"), oppId);
                    }
                    if (checkCurrentPhase) {
                        setModuleCount(moduleName);
                        break;
                    }
                }
                totalCount++;
            }
            rs.close();
            st.close();
            jsonObject = getPhasePercentage();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    private void setModuleCount(String moduleName) {
        try {
            switch (moduleName) {
            case "Intake":
                intakeCount++;
                break;
            case "Requirments":
                reqCount++;
                break;
            case "ArchiveExecution":
                archiveExeCount++;
                break;
            case "DecommissionExecution":
                decomExeCount++;
                break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private boolean getReqApproval(String reqType, String oppId) {
        boolean checkPhase = true;
        try {
            switch (reqType) {
            case "Archive":
                checkPhase = getReqInfo("Archive_Requirement", oppId);
                break;
            case "Decommission":
                checkPhase = getReqInfo("Decommission_Requirement", oppId);
                break;
            case "To be retire":
                if (!getReqInfo("Archive_Requirement", oppId) && !getReqInfo("Decommission_Requirement", oppId))
                    checkPhase = false;
                break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checkPhase;
    }
    private boolean getReqInfo(String phaseName, String oppId) {
        boolean checkPhase = true;
        try {
            String selectQuery = "select * from module_approval_info where moduleName = '" + phaseName
                    + "' and OppId = '" + oppId + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            if (rs.next())
                if (rs.getBoolean(4))
                    checkPhase = false;
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checkPhase;
    }
    private JsonObject getPhasePercentage() {
        JsonObject jsonObject = new JsonObject();
        try {
            /*
             * float oppPercentage = (totalCount != 0)? (100/(float)totalCount) : 0; float
             * intakePercentage = intakeCount * oppPercentage; float reqPercentage =
             * reqCount * oppPercentage; float archiveExePercentage = archiveExeCount *
             * oppPercentage; float decomExePercentage = decomExeCount * oppPercentage;
             */
            jsonObject.addProperty("intakeCount", intakeCount);
            jsonObject.addProperty("reqCount", reqCount);
            jsonObject.addProperty("archiveExeCount", archiveExeCount);
            jsonObject.addProperty("decomExeCount", decomExeCount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    public JsonArray getOppNameList() {
        JsonArray jsonArray = new JsonArray();
        try {
            boolean checkFirstOpportunity = true;
            String selectQuery = "select * from opportunity_info where column_name = 'appName'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            while (rs.next()) {
                if (checkFirstOpportunity) {
                    dashboardGanttChartService ganttChart = new dashboardGanttChartService(rs.getString("value"));
                    GanttChartJsonArray = ganttChart.getArchiveExecution();
                    ganttChart = null;
                    checkFirstOpportunity = false;
                }
                jsonArray.add(rs.getString("value"));
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonObject getPieChartDetails() {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            int archiveCount = 0, decomissionCount = 0, retiredCount = 0;
            String selectQuery = "SELECT * FROM opportunity_info where column_name='request_type';";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            while (rs.next()) {
                String value = rs.getString("value");
                if (value.equals("Archive")) {
                    archiveCount++;
                }
                if (value.equals("Decommission")) {
                    decomissionCount++;
                }
                if (value.equals("To be retire")) {
                    retiredCount++;
                }
            }
            jsonObject.addProperty("archiveCount", archiveCount);
            jsonObject.addProperty("decommissionCount", decomissionCount);
            jsonObject.addProperty("retiredCount", retiredCount);
            jsonArray.add(jsonObject);
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    protected void finalize() throws Throwable {
        con.close();
    }
    public JsonArray getAppIssueCount() {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            Date date = cal.getTime();
            String todaysdate = sdf.format(date);
            int issueCount = 0, riskCount = 0, deadlineCount = 0;
            String selectQuery = "SELECT * FROM ArchiveExe_Issue_Info;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            while (rs.next()) {
                String type = rs.getString("type");
                String resolved = rs.getString("resolved");
                String expDtae = rs.getString("exp_date");
                if (type.equals("ISSUE")&& !resolved.equals("COMPLETED")&& !resolved.equals("CANCELLED")) {
                    issueCount++;
                }
                if (type.equals("RISK")&& !resolved.equals("COMPLETED")&& !resolved.equals("CANCELLED")) {
                    riskCount++;
                }
                if (sdf.parse(expDtae).before(sdf.parse(todaysdate))&& !resolved.equals("COMPLETED")&& !resolved.equals("CANCELLED")&& rs.getString("end_date")!=null&& expDtae!=null){
                    deadlineCount++;
                }
            }
            if(issueCount<10) {
                String issue = String.format("%02d", issueCount);
                jsonObject.addProperty("issueCount", issue);
            }
            if(riskCount<10) {
                String risk = String.format("%02d", riskCount);
                jsonObject.addProperty("riskCount", risk);
            }
            if(deadlineCount<10) {
                String deadline = String.format("%02d", deadlineCount);
                jsonObject.addProperty("deadlineCount", deadline);
            }
            jsonArray.add(jsonObject);
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    /*
     * public JsonArray getDataCharDetails() { JsonArray jsonArray = new
     * JsonArray(); try { ArrayList<String> app = new ArrayList<String>(); String
     * selectApp = "select * from opportunity_info where column_name='appName'";
     * Statement st = con.createStatement(); ResultSet rs =
     * st.executeQuery(selectApp); while (rs.next()) {
     * app.add(rs.getString("value")); } String[] apps = new String[app.size()];
     * apps = app.toArray(apps); jsonArray.addAll(getDataCharDataTable(apps));
     * rs.close(); st.close(); } catch (Exception e) { e.printStackTrace(); } return
     * jsonArray; }
     */
    public JsonArray getDataCharDataTable() {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            int DB2Count = 0, MSSQLCount = 0, MySqlCount = 0, OracleCount = 0, SybaseCount = 0, OtherCount = 0;
            String selectQuery = "SELECT * FROM decom3sixtytool.assessment_data_char_info where column_name='DatabaseType' and value!='';";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectQuery);
            while (rs.next()) {
                String value = rs.getString("value");
                if (value.equals("DB2")) {
                    DB2Count++;
                }
                if (value.equals("MS SQL")) {
                    MSSQLCount++;
                }
                if (value.equals("MySQL")) {
                    MySqlCount++;
                }
                if (value.equals("Oracle")) {
                    OracleCount++;
                }
                if (value.equals("Sybase")) {
                    SybaseCount++;
                }
                if (value.equals("Other")) {
                    OtherCount++;
                }
            }
            double totalCount = DB2Count + MSSQLCount + MySqlCount + OracleCount + OtherCount + SybaseCount;
            DecimalFormat f = new DecimalFormat("##.##");
            String Db2Percent = String.valueOf(f.format((DB2Count * 50) / totalCount)) + "%";
            String msSqlPercent = String.valueOf(f.format((MSSQLCount * 50) / totalCount)) + "%";
            String mySqlPercent = String.valueOf(f.format((MySqlCount * 50) / totalCount)) + "%";
            String oraclePercent = String.valueOf(f.format((OracleCount * 50) / totalCount)) + "%";
            String sybasePercent = String.valueOf(f.format((SybaseCount * 50) / totalCount)) + "%";
            String OtherPercent = String.valueOf(f.format((OtherCount * 50) / totalCount)) + "%";
            jsonObject.addProperty("db2Percent", Db2Percent);
            jsonObject.addProperty("msSqlPercent", msSqlPercent);
            jsonObject.addProperty("mySqlPercent", mySqlPercent);
            jsonObject.addProperty("oraclePercent", oraclePercent);
            jsonObject.addProperty("sybasePercent", sybasePercent);
            jsonObject.addProperty("otherPercent", OtherPercent);
            jsonArray.add(jsonObject);
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray getApplicationArchiveReqDataFromPhase(String phaseFilter) {
        JsonArray jsonArray = new JsonArray();
        try {
            String whereCondn = phaseFilter.equals("All") ? "" : " where phaseName like '" + phaseFilter + "%'";
            String selectPhases = "select * from phase_info" + whereCondn;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectPhases);
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    String waves[] = rs.getString("value").split(",");
                    jsonArray.addAll(getArchiveReqWaveDetails(waves, rs.getString("phaseName")));
                }
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    private JsonArray getArchiveReqWaveDetails(String[] waves, String phase) {
        JsonArray jsonArray = new JsonArray();
        try {
            for (String wave : waves) {
                String selectWaves = "select * from governance_info where waveName='" + wave + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectWaves);
                while (rs.next()) {
                    if (rs.getString("column_name").equals("apps")) {
                        String apps[] = rs.getString("value").split(",");
                        jsonArray.addAll(getApplicationApprovalDataTable(apps, rs.getString("waveName"), phase));
                    }
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    public JsonArray getDoughnutIntakeDetail() {
        JsonArray jsonArray = new JsonArray();
        try {
            ArrayList<String> app = new ArrayList<String>();
            String selectApp = "select * from opportunity_info where column_name='appName'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectApp);
            while (rs.next()) {
                app.add(rs.getString("value"));
            }
            String[] apps = new String[app.size()];
            apps = app.toArray(apps);
            jsonArray.addAll(getIntakeDetail(apps));
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray getIntakeDetail(String apps[]) {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            int yestoStartCount = 0, inProgressCount = 0, completedCount = 0;
            for (String app : apps) {
                String selectApp = "select * from opportunity_info where column_name='appName' and value = '" + app
                        + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectApp);
                while (rs.next()) {
                    String Id = rs.getString("Id");
                    String selectAppdetail = "select intakeApproval,max(priority_order_num) pr,OppId from Intake_Stake_Holder_Info where OppId = '" + Id+ "' group by intakeApproval,OppId";
                    Statement st11 = con.createStatement();
                    ResultSet rs11 = st11.executeQuery(selectAppdetail);
                    boolean checkData=false;
                        while (rs11.next()) {
                            String value = rs11.getString("intakeApproval");
                            checkData=true;
                            if(value.equals("Decision pending")||value.equals("Rejected"))
                            {
                                inProgressCount++;
                            }
                            else if(value.equals("Approved"))
                            {
                                completedCount++;
                            }
                        }
                         if(checkData==false) {
                                yestoStartCount++;
                            }
                    rs11.close();
                    st11.close();
                }
                rs.close();
                st.close();
            }
            double totalCount = yestoStartCount + inProgressCount + completedCount;
            DecimalFormat f = new DecimalFormat("##.##");
        /*  String yestoStart = String.valueOf(f.format((yestoStartCount * 100) / totalCount));
            String inProgress = String.valueOf(f.format((inProgressCount * 100) / totalCount)) ;
            String completed = String.valueOf(f.format((completedCount * 100) / totalCount)) ;*/
            double yestoStart = Double.parseDouble(f.format((yestoStartCount * 100) / totalCount));
            double inProgress = Double.parseDouble(f.format((inProgressCount * 100) / totalCount)) ;
            double completed = Double.parseDouble(f.format((completedCount * 100) / totalCount)) ;
            jsonObject.addProperty("yestoStart", yestoStart);
            jsonObject.addProperty("inProgress", inProgress);
            jsonObject.addProperty("completed", completed);
            jsonArray.add(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("myjson "+jsonArray);
        return jsonArray;
    }
}