
<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    div div #testDecom
{
  pointer-events: none;

  /* for "disabled" effect */
  opacity: 0.5;
  
}
   #navbar {
    color:#008B8B;
    
    }
  </style>
  <script src="js/multiplepages.js"></script>
  <script language="javascript"></script>

 
</head>
<body>

<%@page language="java"%>
<%@page import="java.sql.*"%>

<%


Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "strutsdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="password";

String name = request.getParameter("id");
session.setAttribute("theName", name);

String roles = request.getParameter("role");

int sumcount=0;
Statement st;
try{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);
Statement st1;
String query1 = "select * from projinfo where id = "+name;
st1 = con.createStatement();
ResultSet rs = st1.executeQuery(query1);


if(rs.next())
{
	
	
	
%>
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
    
                 
                    <a class="navbar-brand">Onboarding Tool-<%=rs.getString("projectname") %></a>
              
                <div id="navbar" class="navbar-collapse collapse" >
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>
                        <li>
                            <a href="#">Settings</a>
                        </li>
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li>
                            <a href="Login.html">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
     
        </div>

  <br><br>
<div class="container-fluid bg-3 text-center">
<div class="container-fluid bg-3 text-center">  
<div class="container-fluid bg-3 text-center">
<div class="container-fluid bg-3 text-center">  
 <br>
  
<br>
<br>
<br><br>
<br><br>
<br><br>
<br><br>
<div class="col-sm-3">
</div>

<% 
	if(roles.equals("admin")){
System.out.println("Result:"+roles);

	%>
    <!--  admin Role -->  
    
           
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        

<%

}

	else if(roles.equals("Testlead"))
{
%>
<!-- Test Lead -->
 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom" >
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="90" alt="Avatar" >
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
     
          <div class="well">
         <a href="#">
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="90" alt="Avatar" float="left">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>

<%
}

else if(roles.equals("aadmin"))
{
	%>
	<!-- Archival Admin -->
	 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
           
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">

        <div class="col-sm-2">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
	
	<%} 
	
else if(roles.equals("ArchivalProgramManager"))
{
	%>
	<!-- Archival Program Manager -->
 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
           
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        


<%
}

else if(roles.equals("LeagalBusinessSME"))
{


%>
      <!-- Technical BUsiness SME -->
     <div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      
      
      
      
      
 <%
}
else if(roles.equals("LeagacyTechnicalSME"))
{
      %>
      <!-- Legacy Technical SME -->
       <div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 
 <%} 
else if(roles.equals("LeagacyProgramManager"))
{
 %>    

<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 


<%
  
         }

else if(roles.equals("ArchivalBusinessAnalyst"))
{
         %>
         
         <!-- Archival Business Analyst -->
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 

<%
}
else if(roles.equals("ArchivalTechnicalLead"))
{
%>
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
 
<%

}

else if(roles.equals("ArchivalProjectManager"))
{
	%>
	<!-- Archival Program Manager -->
 <div class="col-sm-8">
<div class="row">
        <div class="col-sm-2" height="100" width="100">
          <div class="well">
           
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2">
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        


<%
}
else if(roles.equals("ArchivalDeveloper"))
{
%>
<div class="col-sm-8" >
<div class="row">
        <div class="col-sm-2" height="100" width="100" id="testDecom" >
          <div class="well">
           <center>
           <img src="assets/images/Admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="editproject.jsp">
         <center>
           <img src="assets/images/Appemphasize.png" class="img-rounded" height="100" width="100" alt="Avatar" onclick="edit()"></center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="firstinsert.jsp">
           <center>
           <img src="assets/images/Intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
          </a>
        </div>
        <div class="col-sm-2">
          <div class="well">
          <a href="archive_exec_samp.jsp">
           <center>
           <img src="assets/images/ArchivalExecution.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
      </div>
<div class="row">
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
           
           <center>
           <img src="assets/images/Decom.png" class="img-rounded" height="100" width="100" alt="Avatar" >
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
         <center>
           <img src="assets/images/Program.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="well">
           <center>
           <img src="assets/images/Report.png" class="img-rounded" height="100" width="100" alt="Avatar">
           </center>
          </div>
        </div>
        <div class="col-sm-2" id="testDecom" >
          <div class="well">
           <center>
           <img src="assets/images/Finance&ContractManagement.png" class="img-rounded" height="100" width="100" alt="Avatar"></center>
          </div>
        </div>



<%} %>



      </div>
   
</div>
<div class="col-sm-3"></div>
<br><br>
</div>
</div>
</div>
</div>

   <center>
      <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="project.jsp" tabindex="-1">Previous</a>
    </li>

    <li class="page-item disabled">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</center>


					<%
					
}
%>

<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</body>

<script>
$(document).ready(function() {
    
    $('#testDecom').attr('disabled', true);
});

</script>
</html>
