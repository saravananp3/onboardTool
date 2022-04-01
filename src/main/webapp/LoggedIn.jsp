<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% String user_fname = request.getParameter("user_fname"); %>
<%

%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;
											charset=UTF-8">
		<title>JSP Page</title>
	</head>
	<body>
		
		<%String user_email = request.getParameter("user_email");%>
		
		<% String user_lname = request.getParameter("user_lname"); %>
		<% String user_group = request.getParameter("user_group"); %>
		
		
		
	</body>
	 <%
	 
        
    %>
       <form class=" vldauth" 
action="Login" method="POST" name="loginForm">
   <input type="text" id="uname" class="fadeIn second" name="usr" placeholder="Username" value="<%=user_fname%>">
            <input type="password" id="pwd" class="fadeIn third" name="pwd" placeholder="Password" value="<%=user_lname%>">
             <input type="password" id="u_email" class="fadeIn third" name="u_email" placeholder="Password" value="<%=user_group%>">
    <input type="submit" name="submitInput">
    
<script>
    window.onload = function(){
    document.forms['loginForm'].submit();
    }
    </script>
    </form>
	<%-- Here we use the JSP expression tag to display value
		stored in a variable
	--%>
	
	<h2>SAML Logged User is</h2>
	<h3>E-Mail : <%=user_email%></h3>
	<h3>Firstname : <%=user_fname%></h3>
	<h3>Lastname : <%=user_lname%></h3>
	<h3>Group : <%=user_group%></h3>
	
	
</html>