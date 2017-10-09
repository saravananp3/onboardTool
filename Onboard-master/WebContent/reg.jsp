<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>atozknowledge.com demo Regjsp</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=request.getParameter("userid"); 
session.putValue("userid",user); 
String password=request.getParameter("pwd"); 
String firstname=request.getParameter("fname"); 
String lastname=request.getParameter("lname"); 
String email=request.getParameter("email"); 
String project_name=request.getParameter("proj"); 
String designation=request.getParameter("designation"); 
String userrole=request.getParameter("role"); 
String workphone=request.getParameter("workphone"); 
String company=request.getParameter("company"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into users values ('"+user+"','"+firstname+"','"+lastname+"',	'"+password+"','"+email+"','"+project_name+"','"+designation+"','"+userrole+"','"+workphone+"','"+company+"')"); 

out.println("Registered"); 


%>
<a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>