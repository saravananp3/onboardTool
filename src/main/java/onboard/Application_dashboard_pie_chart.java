package onboard;
import java.sql.* ;  // for standard JDBC programs
import java.math.* ;
public class Application_dashboard_pie_chart
{
    public String Applicationpercentage(String[] app,String selprj) throws ClassNotFoundException, SQLException
    {
        String resperc="";
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        Statement st_distinct = con.createStatement();
        try
        {
            String detail="";
            for(int perci=0;perci<app.length;perci++)
            {

                String q3 = "select seq_num from ArchiveExecution_Details where projects='"+selprj+"' and name='" + app[perci] + "'";
                Statement stt = con.createStatement();
                ResultSet rst = stt.executeQuery(q3);
                if (rst.next())
                {
                    detail = rst.getString(1);
                }

                System.out.println("details "+detail);
                String q1 = "select * from ArchiveExecution_Details where projects='"+selprj+"' and seq_num>" + detail + " and seq_num<"+(detail + 70)+" and level=3";
                Statement stp = con.createStatement();
                ResultSet rsp = stp.executeQuery(q1);
                int l = -1;
                while (rsp.next()) {
                    l++;
                    if (rsp.getString(15).equals("100") || Integer.parseInt(rsp.getString(15)) >= 100)
                    {
                        continue;
                    }
                    else {
                        resperc+=rsp.getString(15)+"% state:"+rsp.getString(3)+",";
                        System.out.println("resperc---------------"+rsp.getString(15));
                        break;
                    }
                }
            }
        }
        catch(Exception e)
        {
            System.out.println();
        }

        return resperc;
    }
}