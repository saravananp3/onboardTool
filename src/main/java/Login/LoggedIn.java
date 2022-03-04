package Login;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class LoggedIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoggedIn() {
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
		
		HttpSession details=request.getSession(); 
		HttpSession session=request.getSession();
		
		String jdbcurl="jdbc:mysql://localhost:3306/decom3sixtytool";
		String jdbcuname="root";
		String jdbcpwd="password123";
		//details.setAttribute("u_Name",userid);
		String ufname=request.getParameter("usr");
		String ulname=request.getParameter("pwd");
		String ugroup=request.getParameter("u_email");
		session.setAttribute("username",ufname);
			try
			{	
				Class.forName("com.mysql.jdbc.Driver");
				Connection c=DriverManager.getConnection(jdbcurl,jdbcuname,jdbcpwd);
				PreparedStatement ps=c.prepareStatement("SELECT * FROM user_table WHERE ufname=? AND ulname=? AND ugroup=? ");
				ps.setString(1, ufname);
				ps.setString(2,ulname);
				ps.setString(3,ugroup);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next())
				{
					String dbuname=rs.getString("ufname");
					String dbpwd=rs.getString("ulname");
					String dburole=rs.getString("ugroup");
					
					if(ufname.equals(dbuname) && ulname.equals(dbpwd) && ugroup.equals(dburole)) //check fethable database record and user input value are match after continue
		            {
				
						if(ugroup.equals("DECOM_ADMIN")||ugroup.equals("DECOM_SUPER_ADMIN")|| ugroup.equals("DECOM_TECHNICAL_CONTRIBUTOR"))
						{
							session.setAttribute("USER",dbuname); //session name is "admin_login" and store fetchable database "dbemail" address
		                    response.sendRedirect("DashBoard.jsp");
						}
					
					
					}
				else {
					response.sendRedirect("Login_Error.jsp");
				}
				}}
					
	                 
					catch(Exception e)
					{
						
					
					
					}
		
		
		
		doGet(request, response);
	}

}
