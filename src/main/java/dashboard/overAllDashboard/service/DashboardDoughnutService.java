package dashboard.overAllDashboard.service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.ArrayUtils;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class DashboardDoughnutService {
    DBconnection dBconnection = null;
    Connection con = null;
    public DashboardDoughnutService() throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }
    public JsonArray dashboardDoughnutDetails(String doughnutType) {
        JsonArray jsonArray = new JsonArray();
        try {
            if (doughnutType.equals("Phase")) {
                jsonArray = dashboardPhaseDetails();
            }
            if (doughnutType.equals("Wave")) {
                jsonArray = getWaveDetails("All");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray dashboardPhaseDetails() {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        int yettoStartCount = 0, inProgressCount = 0, completedCount = 0;
        try {
            String selectPhases = "select * from phase_info where column_name='waves' ";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectPhases);
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == true) {
                            yettoStartCount++;
                    }
                }
            }
            JsonArray waveArray = getPercentageByphase("All");
            System.out.println("WaveArray " + waveArray);
            for (int i = 0; i < waveArray.size(); i++) {
                jsonObject = (JsonObject) waveArray.get(i);
                String completed = jsonObject.get("completed").getAsString();
                System.out.println("cpompleted "+completed);
                if(completed.equals("100.0"))
                {
                    completedCount++;
                }
                else
                {
                    inProgressCount++;
                }
            }
            rs.close();
            st.close();
            double totalCount = yettoStartCount + inProgressCount + completedCount;
            DecimalFormat f = new DecimalFormat("##.##");
            /*
             * String yestoStart = String.valueOf(f.format((yestoStartCount * 100) /
             * totalCount)); String inProgress = String.valueOf(f.format((inProgressCount *
             * 100) / totalCount)) ; String completed =
             * String.valueOf(f.format((completedCount * 100) / totalCount)) ;
             */
            double yestoStart = Double.parseDouble(f.format((yettoStartCount * 100) / totalCount));
            double inProgress = Double.parseDouble(f.format((inProgressCount * 100) / totalCount));
            double completed = Double.parseDouble(f.format((completedCount * 100) / totalCount));
            jsonObject.addProperty("yestoStart", yestoStart);
            jsonObject.addProperty("inProgress", inProgress);
            jsonObject.addProperty("completed", completed);
            jsonArray.add(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray getPercentageByphase(String phaseFilter) {
        JsonArray jsonArray = new JsonArray();
        try {
            String whereCondn = phaseFilter.equals("All") ? "" : " where phaseName like '" + phaseFilter + "%'";
            String selectPhases = "select * from phase_info" + whereCondn;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectPhases);
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == false) {
                        String waveArray[] = rs.getString("value").split(",");
                        jsonArray.addAll(getWaveDetailsStatus(waveArray));
                    }
                }
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray getWaveDetails(String phaseFilter) {
        JsonArray jsonArray = new JsonArray();
        List<String> waves = new ArrayList<String>();
        try {
            String whereCondn = phaseFilter.equals("All") ? "" : " where phaseName like '" + phaseFilter + "%'";
            String selectPhases = "select * from phase_info" + whereCondn;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectPhases);
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == false) {
                        String waveArray[] = rs.getString("value").split(",");
                        // jsonArray.addAll(getArchiveReqWaveDetails(waves, rs.getString("phaseName")));
                        // System.out.println("phase " +rs.getString("phaseName"));
                        for (String string : waveArray) {
                            waves.add(string);
                        }
                    }
                }
            }
            String[] allWave = new String[waves.size()];
            allWave = waves.toArray(allWave);
            jsonArray.addAll(getWaveDetailsStatus(allWave));
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    private JsonArray getWaveDetailsStatus(String[] waves) {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        String apps[] = {};
        int yestoStartCount = 0, inProgressCount = 0, completedCount = 0, appcount = 0;
        try {
            for (String wave : waves) {
                String selectWaves = "select * from governance_info where waveName='" + wave + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectWaves);
                while (rs.next()) {
                    if (rs.getString("column_name").equals("apps")) {
                        if (rs.getString("value").isEmpty() == false) {
                            apps = rs.getString("value").split(",");
                        }
                        if (apps.length > 0) {
                            List<Boolean> boolValues = dashboardAppDetails(apps);
                            for (Boolean bool : boolValues) {
                                if (bool == false) {
                                    inProgressCount++;
                                    break;
                                } else {
                                    appcount++;
                                }
                            }
                            if (appcount == apps.length) {
                                completedCount++;
                                appcount = 0;
                            }
                        } else {
                            yestoStartCount++;
                        }
                        apps = ArrayUtils.EMPTY_STRING_ARRAY;
                    }
                }
                rs.close();
                st.close();
            }
            double totalCount = yestoStartCount + inProgressCount + completedCount;
            DecimalFormat f = new DecimalFormat("##.##");
            /*
             * String yestoStart = String.valueOf(f.format((yestoStartCount * 100) /
             * totalCount)); String inProgress = String.valueOf(f.format((inProgressCount *
             * 100) / totalCount)) ; String completed =
             * String.valueOf(f.format((completedCount * 100) / totalCount)) ;
             */
            double yestoStart = Double.parseDouble(f.format((yestoStartCount * 100) / totalCount));
            double inProgress = Double.parseDouble(f.format((inProgressCount * 100) / totalCount));
            double completed = Double.parseDouble(f.format((completedCount * 100) / totalCount));
            jsonObject.addProperty("yestoStart", yestoStart);
            jsonObject.addProperty("inProgress", inProgress);
            jsonObject.addProperty("completed", completed);
            jsonArray.add(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public List<Boolean> dashboardAppDetails(String apps[]) {
        boolean check1 = false;
        boolean check2 = false;
        boolean check3 = false;
        boolean check4 = false;
        List<Boolean> bool = new ArrayList<Boolean>();
        try {
            for (String app : apps) {
                String selectApp = "select * from opportunity_info where column_name='appName' and value = '" + app
                        + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectApp);
                while (rs.next()) {
                    String Id = rs.getString("Id");
                    /*
                     * String selectStatus =
                     * "select intakeApproval from Intake_Stake_Holder_Info where  OppId = '" + Id +
                     * "' and priority_order_num is not null"; Statement st3 =
                     * con.createStatement(); ResultSet rs3 = st3.executeQuery(selectStatus); while
                     * (rs3.next()) { if
                     * (rs3.getString("intakeApproval").equals("Decision pending")) { check1 = true;
                     * break; } } rs3.close(); st3.close();
                     * 
                     * if (check1 == false) { String selectStatus1 =
                     * "select intakeApproval from ArchiveReq_Roles_Info where  OppId = '" + Id +
                     * "' and priority_order_num is not null"; Statement st4 =
                     * con.createStatement(); ResultSet rs4 = st4.executeQuery(selectStatus1); while
                     * (rs4.next()) { if
                     * (rs4.getString("intakeApproval").equals("Decision pending")) { check2 = true;
                     * break; } } rs4.close(); st4.close(); } if (check1 == false && check2 ==
                     * false) {
                     */
                    String selectStatus2 = "select distinct * from `archive_execution_info` where oppId='" + Id
                            + "'  and taskGroup='Closure' ;";
                    Statement st5 = con.createStatement();
                    ResultSet rs5 = st5.executeQuery(selectStatus2);
                    if (rs5.next()) {
                        check3 = true;
                        boolean level = rs5.getString("level").equals("1");
                        boolean actDate = rs5.getString("actEnd").isEmpty();
                        if (level == true && actDate == false) {
                            // System.out.println("Coming "+ rs5.getString("oppName"));
                            check4 = true;
                        }
                    }
                    rs5.close();
                    st5.close();
                    bool.add(check4);
                    check4 = false;
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bool;
    }
}