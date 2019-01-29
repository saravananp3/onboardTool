import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.*;
public class Archive_execution_db_update {
    public static void progress_bar_current_stage(ArrayList<Integer> level_num,ArrayList<String> actual_enddate,ArrayList<String> progressbar,String prjname,int selectedindex,int currentlevel)
    {
        try {
            ArrayList<Integer> checkindex = new ArrayList<Integer>();
            String myDriver = "org.gjt.mm.mysql.Driver";

            String myUrl = "jdbc:mysql://localhost:3306/Onboarding";

            Class.forName(myDriver);

            Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

            Statement sr = conn.createStatement();
            while (currentlevel != 0) {
                int totalcount=0;
                int node_count = 0;
                System.out.println("current level " + currentlevel);
                boolean check = true;
                ArrayList<Integer> date = new ArrayList<Integer>();
                //checking actual end date before the current index
                for (int l = selectedindex - 1; l >= 0; l--) {
                    if (level_num.get(l) == 1 || level_num.get(l) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(l)) {
                        if (actual_enddate.get(l).equals("")) {
                            check = false;
                            totalcount++;
                        } else {
                            totalcount++;
                            node_count++;
                            System.out.println("node count :" + node_count);
                            if (!checkindex.contains(l)) {
                                progressbar.set(l, "100");
                                sr.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (l + 1) + ";");
                            }
                        }
                    }
                }
                //checking the actual end date in and after the current index
                for (int m = selectedindex; m < actual_enddate.size(); m++) {
                    if (level_num.get(m) == 1 || level_num.get(m) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(m)) {
                        if (actual_enddate.get(m).equals("")) {
                            check = false;
                            totalcount++;
                        } else {
                            totalcount++;
                            node_count++;
                            System.out.println("node count :" + node_count);
                            if (!checkindex.contains(m)) {
                                progressbar.set(m, "100");
                                sr.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (m + 1) + ";");
                            }
                        }
                    }
                }
                for (int n = selectedindex; n >= 0; n--) {
                    if (currentlevel - 1 == level_num.get(n)) {

                        if (check == true) {
                            progressbar.set(n, "100");
                            sr.executeUpdate("update archiveexecution_details set progressbar='100' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                            System.out.println("level" + n + ": " + progressbar.get(n));
                            int index = n;
                            selectedindex = index;
                            break;
                        } else {
                            if (node_count != 0) {
                                System.out.println("node count :" + node_count);
                                float progperc = 100 /(float)totalcount;
                                float percentage=progperc*node_count;
                                checkindex.add(n);
                                System.out.println("node count: " + node_count + "total count : "+totalcount+" progress bar percentage: " + progperc+"Percentage : "+percentage);
                                progressbar.set(n, Double.toString(percentage));
                                sr.executeUpdate("update archiveexecution_details set progressbar='"+Math.round(percentage)+"' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                            } else {
                                progressbar.set(n, "0");
                                sr.executeUpdate("update archiveexecution_details set progressbar='0' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
                            }
                            int index = n;
                            selectedindex = index;
                            break;
                        }
                    }
                }
                //System.out.println("current index "+current_index+" number"+current_level);
                currentlevel--;
            }
        }
        catch(Exception e)
        {
            System.out.println("----------[Exception:"+e+"]------------");
        }
        //return progressbar;
    }
}
