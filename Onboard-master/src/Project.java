

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
 * Servlet implementation class Project
 */
@WebServlet("/Project")
public class Project extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project() {
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
				String projectname = request.getParameter("projectname");
		        String descr = request.getParameter("descr");
		        String appno = request.getParameter("appno");
		        String Startdate = request.getParameter("Startdate");
		        String Intdate = request.getParameter("Intdate");
		        String Plandate = request.getParameter("Plandate");
		        String Execdate = request.getParameter("Execdate");
		        String Hyperdate = request.getParameter("Hyperdate");
		        String Enddate = request.getParameter("Enddate"); 
		        
		        // do some processing here...
		         
		        // get response writer
		        PrintWriter writer = response.getWriter();
		         
		        // build HTML code
		        String htmlRespone = "<html>";
		        htmlRespone += "<h2>Your Order Has been Taken</h2>";  
		        htmlRespone += "</html>";
		        writer.println(htmlRespone);
		        try
		        {
		          // create a mysql database connection
		          String myDriver = "org.gjt.mm.mysql.Driver";
		          String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
		          Class.forName(myDriver);
		          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
		        
		         
		          // the mysql insert statement
		          String query = " insert into projinfo (projectname, descr,appno,Startdate,Intdate,Plandate,Execdate,Hyperdate,Enddate)"
		            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		          // create the mysql insert preparedstatement
		          //Scanner sin=new Scanner(System.in);
		          //String id,food,extra;
		          //System.out.println("Enter Your id");
		          //id=sin.next();
		          //System.out.println("Please tell what food you want");
		          //food=sin.next();
		          //System.out.println("would you like to have extra food today say y or n");
		          //extra=sin.next();
		          PreparedStatement preparedStmt = conn.prepareStatement(query);
		          preparedStmt.setString (1, projectname);
		          preparedStmt.setString   (2, descr);
		          preparedStmt.setString (3, appno);
		          preparedStmt.setString   (4, Startdate);
		          preparedStmt.setString (5, Intdate);
		          preparedStmt.setString   (6, Plandate);
		          preparedStmt.setString (7, Execdate);
		          preparedStmt.setString   (8, Hyperdate);
		          preparedStmt.setString (9, Enddate);
		      
		          
		          		          
		          
		          

		          // execute the preparedstatement
		          preparedStmt.execute();
		          
		          conn.close();
		        }
		        catch (Exception e)
		        {
		        	 
		          System.err.println("Got an exception!");
		          System.err.println(e.getMessage());
		        }
		        // return response
		        response.sendRedirect("project.jsp");
				


	}

}
