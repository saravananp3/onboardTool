<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
 
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="js/tableExport.js"></script>
<script type="text/javascript" src="js/jquery.base64.js"></script>
<script type="text/javascript" src="jspdf/libs/sprintf.js"></script>
<script type="text/javascript" src="jspdf/jspdf.js"></script>
<script type="text/javascript" src="jspdf/libs/base64.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<%@page language="java"%>
<%@page import="java.sql.*"%>
 
 
<%
try {
	String det=(String)session.getAttribute("theName");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
%>
 
 
  <table id="customers" class="table " style="background-color:#D3D3D3" >
       <thead>                   
             <tr "class="thead-default" >
           
         
               <th style="text-align:right;font-size:200%">  REVIEW</th>
          
                  <th></th> 
                  
             </tr>
       </thead>
   

       <tbody>
        <%if(rs3.next()){ %>
        
        <script>
        var name="<%=rs3.getString("projectname") %>";
        window.location.replace("test1.jsp?name="+name);
        </script>
        <%} %>
    
        <% 
        String name=request.getParameter("name");
        System.out.println("efe"+name);
        	String query1 = "select * from app_prior";
        	Statement st1 = conn.createStatement();
        	ResultSet rs1 = st1.executeQuery(query1); 
     
        	
        	%>
        	
       

            	 <%      while(rs1.next()){ %>

            	         
            	          <tr ><td style="border:'none';"> Application Name</td><td><%=rs1.getString("proj_name") %></td></tr> 
            	           <tr class="row_s"><td>Complexity</td><td><%=rs1.getString("complexity") %></td></tr>
            	           <tr class="row_t"><td>Read Only Date</td><td><%=rs1.getString("read_date") %></td></tr> 
            	           <tr class="row_d"><td>SME Date</td><td><%=rs1.getString("sme_date") %></td></tr> 
            	            <tr class="row_d"><td>Estimated DB Size</td><td><%=rs1.getString("est_db_size") %></td></tr>
            	            <tr><td><br></td></tr>
            	   
            	       
            	          
            	      
            	        <% }%> 
            	         
            	 	
            	               
       </tbody>
</table>
<a href="#" onClick ="$('#customers').tableExport({type:'pdf',escape:'false'});" style="font-size:150%">Export to PDF</a>
  
</div>
 
    <%
}                  
catch(Exception e){}
%>
</body>
</html>
