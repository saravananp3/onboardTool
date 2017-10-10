import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IntsantApp
 */
@WebServlet("/IntsantApp")
public class IntsantApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntsantApp() {
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
		
				String appname = request.getParameter("appname");
				String prjname = request.getParameter("prjname");
				
	
		    
		        
		        try
		        {
		          // create a mysql database connection
		          String myDriver = "org.gjt.mm.mysql.Driver";
		          String myUrl = "jdbc:mysql://localhost:3306/strutsdb";
		          Class.forName(myDriver);
		          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
		         
				     int i=0;
				
		 
		          // the mysql insert statement
		          String query = " insert into appinfo (appname,prjname)"
		            + " values (?,?)";
		       
		          PreparedStatement preparedStmt = conn.prepareStatement(query);
		          preparedStmt.setString (1, appname);
		          preparedStmt.setString (2, prjname);
		         
		          

		        
		          preparedStmt.execute();
		          
		          String query1 = "select appname from appinfo where prjname='Project1'"; 
		          Statement st = conn.createStatement();
				     ResultSet rs = st.executeQuery(query1);
				     
				     while(rs.next())
				     {
				    	 System.out.println("Application name :"+rs.getString(1));
				    	 String query2="select seq_num from archive_exec where name='Closure' order by seq_num";
				    	 Statement st2 = conn.createStatement();
					     ResultSet rs2 = st2.executeQuery(query2);
					      if(rs2.next()){
				    	 String query3="update archive_exec set seq_num=seq_num+63 where seq_num>="+rs2.getInt(1);
				    	 PreparedStatement preparedStmt1 = conn.prepareStatement(query3);
				    	 preparedStmt1.execute();
				    	 String query4="insert into archive_exec(seq_num,level,name,mem_ass,act_srt_date,act_end_date,pln_srt_date,pln_end_date,hours,planned_hrs)"+ " values(?,?,?,?,?,?,?,?,?,?)";
				    	 PreparedStatement preparedStmt2 = conn.prepareStatement(query4);
				          preparedStmt2.setInt (1, rs2.getInt(1));
				          preparedStmt2.setInt (2, 2);
				          preparedStmt2.setString (3,rs.getString(1));
				          preparedStmt2.setString (4,"");
				          preparedStmt2.setString (5,"");
				          preparedStmt2.setString (6,"");
				          preparedStmt2.setString (7,"");
				          preparedStmt2.setString (8,"");
				          preparedStmt2.setString (9,"");
				          preparedStmt2.setString (10,"");
				          preparedStmt2.execute();
				          int count=rs2.getInt(1);
				          String query5 = "select * from details"; 
				          Statement st5 = conn.createStatement();
						     ResultSet rs5 = st5.executeQuery(query5);
				         while(rs5.next()){
				        	 System.out.println(count);
				        	 String query6="insert into archive_exec(seq_num,level,name,mem_ass,act_srt_date,act_end_date,pln_srt_date,pln_end_date,hours,planned_hrs)"+ " values(?,?,?,?,?,?,?,?,?,?)";
						    		 PreparedStatement preparedStmt3 = conn.prepareStatement(query6);
						          preparedStmt3.setInt (1,++count);
						          preparedStmt3.setInt (2,rs5.getInt(1));
						          preparedStmt3.setString (3,rs5.getString(2));
						          preparedStmt3.setString (4,"");
						          preparedStmt3.setString (5,"");
						          preparedStmt3.setString (6,"");
						          preparedStmt3.setString (7,"");
						          preparedStmt3.setString (8,"");
						          preparedStmt3.setString (9,"");
						          preparedStmt3.setString (10,"");
						          preparedStmt3.execute();
				          }
					      }
				     }
		          
		         
		          conn.close();
		         
		        }
		        catch (Exception e)
		        {
		        	
		          System.err.println("Got an exception!");
		          System.err.println(e.getMessage());
		        }
		        // return response
		      
		        response.sendRedirect("application1.jsp"); 

	

	}

}
