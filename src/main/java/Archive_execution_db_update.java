import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
    public static String user_name(String select_project)
    {
        String unames="";
        String unames1="";
        try
        {
            String myDriver = "org.gjt.mm.mysql.Driver";

            String myUrl = "jdbc:mysql://localhost:3306/Onboarding";

            Class.forName(myDriver);

            Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

            Statement sr = conn.createStatement();
            String query1="select distinct(uname) from admin_userdetails where projects like '%"+select_project+"%';";
            Statement st1 = conn.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            while(rs1.next())
            {
                unames+=rs1.getString("uname")+",";
            }
            unames1=unames.substring(0,unames.length()-1);
        }
        catch(Exception e)
        {
            System.out.println("Exception----------"+e);
        }
        return unames1;
    }
    public static float percent(int seq_num,String selected_project)
    {
        float prog=0;
        System.out.println("seq:" +seq_num);
        try
        {
            String myDriver = "org.gjt.mm.mysql.Driver";

            String myUrl = "jdbc:mysql://localhost:3306/Onboarding";

            Class.forName(myDriver);

            Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

            Statement sr = conn.createStatement();
            String query1="select * from archiveexecution_details where projects='"+selected_project+"' order by seq_num;";
            Statement st1 = conn.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            int db_count=0;
            ArrayList<Integer> level=new ArrayList<Integer>();
            ArrayList<String> actualend=new ArrayList<String>();
            while(rs1.next())
            {
                level.add(Integer.parseInt(rs1.getString("level")));
                actualend.add(rs1.getString("act_end_date"));
                db_count=Integer.parseInt(rs1.getString("seq_num"));
            }
        /*System.out.println("closure");
        System.out.println("testing");
        System.out.println("actualend :152"+actualend.get(152));
        System.out.println("level :152"+level.get(152));*/
            int totalchildcount=0;
            int actualendcount=0;
            int seqnum=seq_num;
            int parent_level=level.get(seq_num);
            int child_level=parent_level+1;
            // System.out.println("parent: "+parent_level+" child: "+child_level);
            float percent=0;
            // System.out.println("Db Count:"+ db_count);
            if(!actualend.get(seq_num).equals(""))
            {
                prog=100;
            }
            else
            {
                for(int i=seqnum+1;i<db_count;i++)
                {
                    if(level.get(i)==parent_level)
                    {
                        break;
                    }
                    else
                    {
                        if(level.get(i)==child_level)
                        {
                            totalchildcount++;
                            if(!actualend.get(i).equals(""))
                            {
                                actualendcount++;
                                //System.out.println("I" +i);

                            }
                        }
                    }
                }
                //System.out.println("total "+totalchildcount+" actual "+actualendcount);
                percent=100/(float)totalchildcount;
                prog=percent*actualendcount;
            }
            // System.out.println("total "+totalchildcount+" actual "+actualendcount);
            System.out.println("progressbar: "+prog);
        }
        catch(Exception e)
        {
            System.out.println("Exception----------"+e);
        }
        //System.out.println("prog"+prog);
        return prog;
    }

    /*public static int percent(int seq_num,String selected_project)
    {
    	int percentage = 0;
    	try
    	{
    	String myDriver = "org.gjt.mm.mysql.Driver";

        String myUrl = "jdbc:mysql://localhost:3306/Onboarding";

        Class.forName(myDriver);

        Connection conn = DriverManager.getConnection(myUrl, "root", "password123");

        Statement sr = conn.createStatement();
        String query1="select * from archiveexecution_details where projects='"+selected_project+"' and seq_num ='"+seq_num+"';";
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery(query1);
        if(rs1.next())
        {
        	percentage = Integer.parseInt(rs1.getString("progressbar"));
        }
    	}
        catch(Exception e)
    	{
    	 System.out.println("Exception----------"+e);
    	}
    	return percentage;
    }*/
    public static void progress_bar_delete_task(ArrayList<Integer> level_num,ArrayList<String> actual_enddate,ArrayList<String> progressbar,String prjname,int selectedindex,int currentlevel)
    {
        try {
            ArrayList<Integer> checkindex = new ArrayList<Integer>();
            int deleteindex=selectedindex;
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
                    if(m!=deleteindex) {
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
                }
                for (int n = selectedindex; n >= 0; n--) {
                    if(n!=deleteindex) {
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
                                    float progperc = 100 / (float) totalcount;
                                    float percentage = progperc * node_count;
                                    checkindex.add(n);
                                    System.out.println("node count: " + node_count + "total count : " + totalcount + " progress bar percentage: " + progperc + "Percentage : " + percentage);
                                    progressbar.set(n, Double.toString(percentage));
                                    sr.executeUpdate("update archiveexecution_details set progressbar='" + Math.round(percentage) + "' where projects='" + prjname + "' and seq_num=" + (n + 1) + ";");
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
