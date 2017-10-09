

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
 * Servlet implementation class Appin
 */
@WebServlet("/Appin")
public class Appin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Appin() {
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
		String prjname = request.getParameter("prjname");		
		String appname = request.getParameter("appname");
				String descr = request.getParameter("descr");
				String rod = request.getParameter("rod");
				String dbsize = request.getParameter("dbsize");
				String dbloc = request.getParameter("dbloc");
				String legappsme = request.getParameter("legappsme");
				
		           
		        
		        // do some processing here...
		         
		        // get response writer
		        PrintWriter writer = response.getWriter();
		         
		        // build HTML code
		    
		        
		        try
		        {
		          // create a mysql database connection
		          String myDriver = "org.gjt.mm.mysql.Driver";
		          String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
		          Class.forName(myDriver);
		          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
		        
		         
		          // the mysql insert statement
		          String query = " insert into appldetail (prjname,appname,descr,rod,dbsize,dbloc,legappsme)"
		            + " values (? ,? ,? ,?, ?, ?, ?)";

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
		          preparedStmt.setString (1, prjname);
		          preparedStmt.setString (2, appname);
		          preparedStmt.setString (3, descr);
		          preparedStmt.setString (4, rod);
		          preparedStmt.setString (5, dbsize);
		          preparedStmt.setString (6, dbloc);
		          preparedStmt.setString (7, legappsme);
		          

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
		       // request.setAttribute("value", pid);
		        response.sendRedirect("firstinsert.jsp");
				

	}

}
