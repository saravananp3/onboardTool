
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;

import onboard.DBconnection;

/**
 * Servlet implementation class ArchivalRequirements
 */
@WebServlet("/ArchivalRequirements")
public class ArchivalRequirements extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Logger logger = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchivalRequirements() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException

    {

        logger = Logger.getRootLogger();

        BasicConfigurator.configure();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed ArchivalRequirements servlet-----[INFO]");
        HttpSession details = request.getSession();
        String project_name = request.getParameter("project_name");
        String app_name = request.getParameter("appln_name");
        int DEL_count = 0;
        try {
        	 DBconnection dBconnection = new DBconnection();
             Connection connection = (Connection) dBconnection.getConnection();
		     int i = 2;
		     String s="P"+String.valueOf(i);
		     String query21 = "SELECT * from Intake_ArchivalRequirementCustomization where panels=?";
		     PreparedStatement st21 = connection.prepareStatement(query21);
			 st21.setString(1, s);
			 ResultSet rs21 = st21.executeQuery();
		     while (rs21.next()) {
                String val = request.getParameter(rs21.getString("idname") + "1");
                String Idname = rs21.getString("idname");
                if (val != null) {
                    String query4 = "delete from Intake_ArchivalRequirementCustomization where idname=?and projectname=?";
                    PreparedStatement preparedStmt4 = connection.prepareStatement(query4);
                    preparedStmt4.setString(1, Idname);
                    preparedStmt4.setString(2, project_name);
                    preparedStmt4.execute();

                    String query5 = "alter table intake_archivalrequirement drop " + Idname + " where projectname=? and appname=?";
                    PreparedStatement preparedStmt5 = connection.prepareStatement(query5);
                    preparedStmt5.setString(1, project_name);
                    preparedStmt5.setString(2, app_name);
                    preparedStmt5.execute();
                    DEL_count++;

                }

            }

            if (DEL_count == 0) {
                String query = "SELECT * from Intake_ArchivalRequirementCustomization where appname=? and projectname=?";
                PreparedStatement st = connection.prepareStatement(query);
				st.setString(1, app_name);
				st.setString(2, project_name);
			    ResultSet rs = st.executeQuery();
               
                int cnt = 0;
                String ref_id = "";
                while (rs.next()) {
                    if (cnt == 0) {
                        String n = request.getParameter(rs.getString("idname"));
                        cnt++;
                        String query1 = "insert into intake_archivalrequirement("+ rs.getString("idname") +",appname,projectname) values(?,?,?)";
                        PreparedStatement preparedStmt = connection.prepareStatement(query1);
                        preparedStmt.setString(1, n);
                        preparedStmt.setString(2, app_name);
                        preparedStmt.setString(3, project_name);
                        preparedStmt.execute();
                        String query10 = "SELECT max(id) from intake_archivalrequirement where appname=?";
                        PreparedStatement st10 = connection.prepareStatement(query10);
        				st10.setString(1, app_name);
                        ResultSet rs10 = st10.executeQuery();
                        if (rs10.next())
                            ref_id = rs10.getString(1);

                    } else {
                        String n = request.getParameter(rs.getString("idname"));
                        if (rs.getString("type_of_box").equals("Check box") && n == null)
                            n = "no";


                        String query2 = "update intake_archivalrequirement set " + rs.getString("idname") + "=? where id = ?";
                        PreparedStatement preparedStmt1 = connection.prepareStatement(query2);
                        preparedStmt1.setString(1, n);
                        preparedStmt1.setString(2,ref_id);
                        preparedStmt1.execute();
                    }

                }
            }
            connection.close();
        } catch (Exception e) {

            System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----" + e.getMessage() + "----[ERROR]");
        }
        response.sendRedirect("Intake_ReviewPage.jsp");

    }

}