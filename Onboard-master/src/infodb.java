

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

/**
 * Servlet implementation class infodb
 */
@WebServlet("/infodb")
public class infodb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infodb() {
        super();
        // TODO Auto-generated constructor stub
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
		
		 String proj_name = request.getParameter("proj_name");
		String complexity = request.getParameter("complexity");
		String est_db_size = request.getParameter("est_db_size");
		String est_cst = request.getParameter("est_cst");
		
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
	          
	          PreparedStatement preparedStmt = conn.prepareStatement("update appinfo set complexity=?, est_db_size=?, est_cst=? where appname=?");
	          preparedStmt.setString(1, complexity);
	          preparedStmt.setString(2, est_db_size);
	          preparedStmt.setString(3, est_cst);
	          preparedStmt.setString(4, proj_name);
preparedStmt.execute();
	          
	          conn.close();
	        
	        }
	        catch (Exception e)
	        {
	        	 System.out.println("Sorry Your order for today has been already taken");
	          System.err.println("Got an exception!");
	          System.err.println(e.getMessage());
	        }
	        response.sendRedirect("tree.jsp");	
	}
	

}
