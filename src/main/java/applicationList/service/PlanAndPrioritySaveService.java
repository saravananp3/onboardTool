package applicationList.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class PlanAndPrioritySaveService {
    DBconnection dBconnection = null;
    Connection con = null;
    JsonArray jsonArray;
    String Id;
    String OppId;
    public PlanAndPrioritySaveService(String OppId, String Id, JsonArray jsonArray)
            throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
        this.OppId = OppId;
        this.jsonArray = jsonArray;
    }
    public JsonObject planAndPrioritySave() {
        JsonObject jsonObject = new JsonObject();
        String UniqueId = null;
        String existingWave = null;
        boolean isAvailable = false;
        String applistExisting=null;
        try {
            boolean statusFlag = false;
            for (int i = 0; i < jsonArray.size(); i++) {
                String rowId = generateRandomApprovalId();
                JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
                String phase = jsonObj.get("phase").getAsString();
                String wave = jsonObj.get("wave").getAsString();
                String appName = jsonObj.get("appName").getAsString();
            //  String resource = jsonObj.get("resource").getAsString();
                String fetchdetailsFromWave = "select * from decom3sixtytool.Governance_Info;";
                PreparedStatement pst2 = con.prepareStatement(fetchdetailsFromWave);
                ResultSet rs1 = pst2.executeQuery();
                while (rs1.next()) {
                    if (rs1.getString("column_name").equals("apps")) {
                        if (rs1.getString("value").isEmpty() == false) {
                            String[] apps = rs1.getString("value").split(",");
                            for (String app : apps) {
                                if (app.equals(appName)) {
                                    isAvailable = true;
                                    existingWave = rs1.getString("value");
                                    continue;
                                }
                                applistExisting=String.join(",", app);
                            }
                        }
                    }
                }
                rs1.close();
                pst2.close();
                if(isAvailable) {
                String UpdateQueryExisting = "update Governance_Info set value=?"
                        + " where column_name ='apps' and waveName=?";
                PreparedStatement prestmt = con.prepareStatement(UpdateQueryExisting);
                // prestmt.setString(1, seq_no);
                prestmt.setString(1, applistExisting);
                prestmt.setString(2, existingWave);
                prestmt.execute();
                }
                String listWithNewApp=String.join(",",applistExisting, appName);
                String UpdateQueryNew = "update Governance_Info set value=?"
                        + " where column_name ='apps' and waveName=?";
                PreparedStatement prestmt = con.prepareStatement(UpdateQueryNew);
                // prestmt.setString(1, seq_no);
                prestmt.setString(1, listWithNewApp);
                prestmt.setString(2, wave);
                prestmt.execute();
                String phaseId=getPhaseId(phase);
                String waveId=getWaveId(wave);
                updatePlanAndPriorityInfo(phaseId,waveId,rowId,OppId);
                statusFlag = true;
            }
            jsonObject.addProperty("SaveStatus", statusFlag);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    public String getPhaseId(String phasename) {
        String phaseId=null;
        try {
        String selectQuery = "select distinct phaseId from decom3sixtytool.Phase_Info where phaseName=?;";
        PreparedStatement prestmt = con.prepareStatement(selectQuery);
        prestmt.setString(1, phasename);
        ResultSet rs1 = prestmt.executeQuery();
            while (rs1.next()) {
                phaseId=rs1.getString("phaseId");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return phaseId;
    }
    public String getWaveId(String wavename) {
        String waveId=null;
        try {
        String selectQuery = "select distinct waveId from decom3sixtytool.Governance_Info where waveName=?;";
        PreparedStatement prestmt = con.prepareStatement(selectQuery);
        prestmt.setString(1, wavename);
        ResultSet rs1 = prestmt.executeQuery();
            while (rs1.next()) {
                waveId=rs1.getString("waveId");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return waveId;
    }
    public void updatePlanAndPriorityInfo(String phaseId,String waveId,String rowId,String appId) {
        try {
        String selectQuery = "select * from decom3sixtytool.planAndPriorityInfo where app_Id=?;";
        PreparedStatement prestmt = con.prepareStatement(selectQuery);
        prestmt.setString(1, appId);
        ResultSet rs1 = prestmt.executeQuery();
        boolean isExist=rs1.next();
        if(isExist)
        {
            String UpdateQuery = "update planAndPriorityInfo set rowId=?,waveId=?,phaseId=?"
                    + " where app_Id=?;";
            PreparedStatement prestmt1 = con.prepareStatement(UpdateQuery);
            // prestmt.setString(1, seq_no);
            prestmt1.setString(1, rowId);
            prestmt1.setString(2, waveId);
            prestmt1.setString(3, phaseId);
            //prestmt1.setString(4, resource);
            prestmt1.setString(5, appId);
            prestmt1.execute();
        }
        else
        {
            String insertQuery = "insert into planAndPriorityInfo(rowId,waveId,phaseId,app_Id)"
                    + "values(?,?,?,?)";        
            PreparedStatement prestmt1 = con.prepareStatement(insertQuery);
            // prestmt.setString(1, seq_no);
            prestmt1.setString(1, rowId);
            prestmt1.setString(2, waveId);
            prestmt1.setString(3, phaseId);
        //  prestmt1.setString(4, resource);
            prestmt1.setString(5, appId);
            prestmt1.execute();
        }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    protected void finalize() throws Throwable {
        con.close();
    }
    public String generateRandomApprovalId() throws SQLException {
        String uniqueID = "";
        boolean checkTermination = true;
        while (checkTermination) {
            uniqueID = UUID.randomUUID().toString();
            System.out.println("App Id : " + uniqueID);
            boolean checkDupilcateId = checkDuplicateApprovalId(uniqueID);
            if (checkDupilcateId == false) {
                checkTermination = false;
            }
        }
        return uniqueID;
    }
    public boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
        boolean checkDuplicate = false;
        String selectQuery = "select * from planAndPriorityInfo;";
        Statement state = con.createStatement();
        ResultSet result = state.executeQuery(selectQuery);
        while (result.next()) {
            String checkApprovalId = result.getString("rowId");
            if (checkApprovalId == uniqueID) {
                checkDuplicate = true;
            }
        }
        return checkDuplicate;
    }
}