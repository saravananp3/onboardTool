

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import onboard.DBconnection;

/**
 * Servlet implementation class deactivate
 */
@WebServlet("/deactivate")
public class deactivate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deactivate() {
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
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Deactivate servlet-----[INFO]");  
		String[] zz=request.getParameterValues("values");
		String[] names=zz[0].split(",");
		String[] yy=request.getParameterValues("values2");
		String[] nam=yy[0].split(",");

		try
	      {
			 DBconnection dBconnection = new DBconnection();
		        Connection connection = (Connection) dBconnection.getConnection();
	        Statement st = connection.createStatement();
	        
	      
	        for(int i=0;i<names.length;i++)
	        {
	        	String z=names[i];
	        	System.out.println("first   --- "+z);
	        	st.executeUpdate("update Admin_UserDetails set stats='deactive' where uname='"+z+"'");
	        }
	        for(int i=0;i<nam.length;i++)
	        {
	        	String z=nam[i];
	        	System.out.println("sec   --- "+z);
	        	st.executeUpdate("update Admin_UserDetails set stats='active' where uname='"+z+"'");
	        }

		         
	        response.sendRedirect("Admin_Userslist.jsp");
	        connection.close();
	      }
	      catch (Exception e)
	      {
	    	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
	      }
		
		
	}

}
