<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%@ page import="java.util.ResourceBundle"%>
	<%
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();
	System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Logout JSP PAGE-----[INFO]");
	%>
	<%
	ResourceBundle resource = ResourceBundle.getBundle("Configuration");
	String authtype = resource.getString("AUTHTYPE");
	%>
	<%
	

	if (session.getAttribute("username") == null && !authtype.equals("SSO")) {
		response.sendRedirect("Login.jsp");
	}
	else if (session.getAttribute("username") != null && !authtype.equals("SSO")) {
		session.invalidate();
		response.sendRedirect("Login.jsp");

	}

	else if (authtype.equals("SSO")) {
		response.sendRedirect("SSO_Logout.jsp");
	}
	%>


</body>
</html>