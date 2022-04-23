<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%-- <% String user_fname = request.getParameter("user_fname"); %> --%>
<%
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;
                                            charset=UTF-8">
        <title>Decom3Sixty Tool</title>
    </head>
    <body>
    
        <%String user_email = request.getParameter("user_email");%>
        <% String user_fname = request.getParameter("user_fname");%>
        <% String user_lname = request.getParameter("user_lname"); %>
        <%String username = request.getParameter("username");%>
        <% String user_group = request.getParameter("user_group"); %>
    </body>
     <%
    %>
       <form class=" vldauth" 
action="Login_1" method="POST" name="loginForm">
			   <input type="hidden" id="user_email" class="fadeIn second" name="user_email" placeholder="User Email" value="<%=user_email%>">
			   <input type="hidden" id="user_fname" class="fadeIn second" name="user_fname" placeholder="User FirstName" value="<%=user_fname%>">
			   <input type="hidden" id="user_lname" class="fadeIn second" name="user_lname" placeholder="User LastName" value="<%=user_lname%>">
           	   <input type="hidden" id="username" class="fadeIn third" name="username" placeholder="Username" value="<%=username%>">
               <input type="hidden" id="user_group" class="fadeIn third" name="user_group" placeholder="User Email" value="<%=user_group%>">
    			
        <!-- <input type="submit" name="submitInput"> -->
<script>
    window.onload = function(){
    document.forms['loginForm'].submit();
    }
    </script>
    </form>
    <%-- Here we use the JSP expression tag to display value
        stored in a variable
    --%>
    <%-- <h2>SAML Logged User is</h2>
    <h3>E-Mail : <%=user_email%></h3>
    <h3>Username : <%=username%></h3>
    <h3>Firstname : <%=user_fname%></h3>
    <h3>Lastname : <%=user_lname%></h3>
    <h3>Group : <%=user_group%></h3> --%>
</html>