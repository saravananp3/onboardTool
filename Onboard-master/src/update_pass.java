

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class update_pass
 */
@WebServlet("/update_pass")
public class update_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_pass() {
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
		// TODO Auto-generated method stub
		String pwd=request.getParameter("new_pass");
		String email=request.getParameter("email");
		 try
	      {
	        // create a mysql database connection
	        String myDriver = "org.gjt.mm.mysql.Driver";
	        String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
	        Class.forName(myDriver);
	        Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	      
	        Statement st=conn.createStatement();
		        
		   st.executeUpdate("update user_details set pwd='"+pwd+"' where email='"+email+"'");     
		             
	        
	        conn.close();
	      }
	      catch (Exception e)
	      {
	      	 
	        System.err.println("Got an exception!");
	        System.err.println(e.getMessage());
	      }		
		 response.sendRedirect("Login.html");
	}

}
