<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>atozknowledge.com demo loginjsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	
	<%
	HttpSession details=request.getSession(); 
String userid=request.getParameter("usr");
String pwd=request.getParameter("pwd"); 
session.setAttribute("username",userid);

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from user_details where uname='"+userid+"'"); 
if(userid.equals("admin")&&pwd.equals("admin"))
{
	details.setAttribute("role","admin");
	details.setAttribute("projects","all");
	details.setAttribute("admin","X");
	details.setAttribute("prj","X");
	details.setAttribute("app_emp","X");
	details.setAttribute("intake","X");
	details.setAttribute("archive_exec","X");

    String redirectURL = "project.jsp";

    response.sendRedirect(redirectURL);
}else{
if(rs.next()) 
{ 
if((rs.getString(5).equals(pwd))) 
{ 
	details.setAttribute("role",rs.getString(7));
	details.setAttribute("projects",rs.getString(6));
	Statement st1= con.createStatement(); 
	ResultSet rs1=st.executeQuery("select * from role_details where role='"+rs.getString(7)+"'"); 
	if(rs1.next())
	{
		details.setAttribute("admin",rs1.getString(2));
		details.setAttribute("app_emp",rs1.getString(3));
		details.setAttribute("intake",rs1.getString(4));
		details.setAttribute("archive_exec",rs1.getString(5));
		
	}

	
	
	
		        String redirectURL = "project.jsp";
	
		        response.sendRedirect(redirectURL);
	
		   

} 
else 
{ 
out.println("Invalid username or password or you are not authenticated"); 
} 
} 
else
	out.println("Invalid username or password or you are not authenticated"); 	
}
%>

</body>
</html>