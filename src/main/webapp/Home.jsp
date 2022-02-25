<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Decom3Sixty</title>
</head>
<%@ page language="java" import="java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<% ResourceBundle resource = ResourceBundle.getBundle("Configuration");
  String authtype=resource.getString("AUTHTYPE");
  
 %>
  <%=authtype %>
 <%-- <%=surname%> --%>
 <%
 if(authtype.equals("LOCAL"))
 {
 response.sendRedirect("Login_1.jsp");
 }
 else if(authtype.equals("SSO"))
 {
	 response.sendRedirect("https://localhost:8442/");
 }
 
 %>
<body>

</body>
</html>