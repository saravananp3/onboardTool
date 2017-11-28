import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Displaydb")
public class Displaydb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Displaydb() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prj_name = request.getParameter("prj_name");
		String IA_lic_cst = request.getParameter("IA_lic_cst");
		String IA_maint_cst = request.getParameter("IA_maint_cst");
		String Infrastrct_cst = request.getParameter("Infrastrct_cst");
		String strg_est = request.getParameter("strg_est");
		String lab_cst = request.getParameter("lab_cst");
		 String proj_name = request.getParameter("proj_name");
	        String data_size = request.getParameter("data_size");
	        String data_source = request.getParameter("data_source");
	        String curnt_users = request.getParameter("curnt_users");
	        String complexity = request.getParameter("complexity");
	        String est_archive = request.getParameter("est_archive");
	        String est_scrn = request.getParameter("est_scrn");
	        String est_db_size = request.getParameter("est_db_size");
	        String est_hrs = request.getParameter("est_hrs");
	       
	        String est_cst = request.getParameter("est_cst");
	        String ttl_IA_cst = request.getParameter("ttl_IA_cst");
	        String ttl_infra_cst = request.getParameter("ttl_infra_cst");
	        String ttl_IA_prdct_cst = request.getParameter("ttl_IA_prdct_cst");
	        String ttl = request.getParameter("ttl");
	        String ttl_cst_fr_app = request.getParameter("ttl_cst_fr_app");
	        String add_cst_fr_contigency = request.getParameter("add_cst_fr_contigency");
	        String add_cst = request.getParameter("add_cst");
	        String IA_app_sprt_cst = request.getParameter("IA_app_sprt_cst");
	        String est_archive_cst = request.getParameter("est_archive_cst");
	        
	        
	        
	        PrintWriter writer = response.getWriter();
	        String htmlRespone = "<html>";
	        htmlRespone += "<h2>Your Order Has been Taken</h2>";  
	        htmlRespone += "</html>";
	        writer.println(htmlRespone);
	         
	        final String myDriver = "org.gjt.mm.mysql.Driver";
	          final String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
	       
	        try
	        {
	          // create a mysql database connection
	        	Class.forName(myDriver);
	          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	        
	         
	          // the mysql insert statement
	          String query = " insert into app_prior (prj_name, IA_lic_cst, IA_maint_cst, Infrastrct_cst, strg_est, lab_cst, proj_name, data_size, data_source, curnt_users, complexity, est_archive, est_scrn, est_db_size, est_hrs, est_cst, ttl_IA_cst, ttl_infra_cst, ttl_IA_prdct_cst, ttl, ttl_cst_fr_app, add_cst_fr_contigency, add_cst, IA_app_sprt_cst, est_archive_cst)"
	            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	          PreparedStatement preparedStmt = conn.prepareStatement(query);
	          preparedStmt.setString(1, prj_name);
	          preparedStmt.setString(2, IA_lic_cst);
	          preparedStmt.setString(3, IA_maint_cst);
	          preparedStmt.setString(4, Infrastrct_cst);
	          preparedStmt.setString(5, strg_est);
	          preparedStmt.setString(6, lab_cst);
	          preparedStmt.setString(7, proj_name);
	          preparedStmt.setString(8, data_size);
	          preparedStmt.setString(9, data_source);
	          preparedStmt.setString (10, curnt_users);
	          preparedStmt.setString   (11, complexity);
	          preparedStmt.setString (12, est_archive);
	          preparedStmt.setString(13, est_scrn);
	          preparedStmt.setString(14, est_db_size);
	          preparedStmt.setString (15, est_hrs);
	          preparedStmt.setString   (16, est_cst);
	          preparedStmt.setString (17, ttl_IA_cst);
	          preparedStmt.setString(18, ttl_infra_cst);
	          preparedStmt.setString(19, ttl_IA_prdct_cst);
	          preparedStmt.setString (20, ttl);
	          preparedStmt.setString(21, ttl_cst_fr_app);
	          preparedStmt.setString(22, add_cst_fr_contigency);
	          preparedStmt.setString(23, add_cst);
	          preparedStmt.setString(24, IA_app_sprt_cst);
	          preparedStmt.setString(25, est_archive_cst);
	        
	          
	          
         preparedStmt.execute();
	          
	          conn.close();
	        
	        }
	        catch (Exception e)
	        {
	        	 System.out.println("Sorry Your order for today has been already taken");
	          System.err.println("Got an exception!");
	          System.err.println(e.getMessage());
	        }
	        // return response
	      
			response.sendRedirect("tree.jsp");

		}
}
