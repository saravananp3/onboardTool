<!DOCTYPE html>
<html lang="en">
<head>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
   <script type="text/javascript" src="js_in_pages/newproject.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/newproject.css" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  

  
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
  

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

    
</head>
<body class='default'>


<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="onboard.DBconnection" %>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.html");
}
%>

 
<form class="form-signin" name="loginForm" method="post" >

<script>

function valid1()
{
 
var project_name = document.getElementsByName("projectname")[0].value;
 
var descr = document.getElementsByName("descr")[0].value;
var appno = document.getElementsByName("appno")[0].value;
var Startdate = document.getElementsByName("Startdate")[0].value;
var Intdate = document.getElementsByName("Intdate")[0].value;
var Plandate = document.getElementsByName("Plandate")[0].value;
var Execdate = document.getElementsByName("Execdate")[0].value;
var Hyperdate = document.getElementsByName("Hyperdate")[0].value;
var Enddate = document.getElementsByName("Enddate")[0].value;
var flag=0;
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<%
String[] values_name = new String[5];
ArrayList<String> zoom = new ArrayList<String>();
int i=0;
int count=0;
    String project_name=request.getParameter("projectname"); 
    HttpSession details=request.getSession();
    String roles=(String)details.getAttribute("role");
    DBconnection d=new DBconnection();
    Connection con = (Connection)d.getConnection();
Statement st= con.createStatement(); 


ResultSet rs=st.executeQuery("select projectname from projinfo ");
while (rs.next())
{
zoom.add(rs.getString(1));
    
}   


for (String z : zoom) {

%>

if (project_name == "<%= z %>" ) 
 
{
flag=1;
 
}

<% } %> 

 

if (project_name == "" || descr == "" || Startdate == "" || Enddate == "" )
{
alert("Please fill the mandatory fields");
return false;
}
 
else if (flag == 1)
{
alert("Project Already Exists");
return false;
}
else
{
var f=document.loginForm;
    f.method="post";
    f.action='Project';
    f.submit();   
}
}


function validation(pro_name)
{

if (project_name == Pro_name)
{
alert("Project Already Exists");
}
else
{
var f=document.loginForm;
    f.method="post";
    f.action='Project';
    f.submit(); 
}
 
 
}
</script>

<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    
                    <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool</a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">&nbsp;
</li>
 <li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li>                     <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
            
              <div class="col-md-3 sidebar">
                  <div id='jqxWidget'>
         <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; margin-right:30px; padding-left:10px '>
                    <ul class="nav nav-sidebar" id="sidemenu">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="editproject.jsp">App Emphasize Module</a>
                    <ul>
                       <li item-expanded='true'><a href="editproject.jsp">Project Details</a>
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</a></li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                               
                            </ul>
                        </li>
                        <li><a href="applnprior.jsp">Application-Prioritized</li>
                     

                    </ul>
                </li>
             <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'><a href='firstinsert.jsp'>Business</a>
                <ul>
                <li><a href='firstinsert.jsp'>Application Information</a></li>
                <li><a href='firstinsert.jsp'>Legacy Retention Information</a></li>
                <li><a href='firstinsert.jsp'>Archive Data Management</a></li>
                <li><a href='firstinsert.jsp'>System Requirements</a></li>
                
                </ul></li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Technical</a>
                <ul>
                <li><a href='firstinsert.jsp'>Application Data Information</a></li>
                <li><a href='firstinsert.jsp'>Infrastructure & Environment Inforamation</a></li>
                <li><a href='firstinsert.jsp'>Technical Information</a></li>
                </ul>
                </li>
                
                 <li item-expanded='true'><a href='firstinsert.jsp'>Archival Requirements</a>
                 <ul>
                 <li><a href='firstinsert.jsp'>Screen/Report Requirements</a></li>
                 <li><a href='firstinsert.jsp'>Archive Requirements</a></li>
                 </ul>
                 </li>
                </ul>
                </li>
                </ul>
                </li>
                <li><a href="archive_exec_samp.jsp">Archive Execution Module</a>
               </li> 
               
                          </ul>
    
     </ul>
         </div>
   </div>
                </div>
       
               <div class="col-md-8">
              
         
          <br/><br/><br/>
                    <div class="panel-group" id="panels1"> 
                   
                                                <div class="panel panel-default">
        <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1" > Project Information  </a> </h4> 
                            </div>  
                                                       
                            <div id="collapse1" class="panel-collapse "> 
                                <div class="panel-body text-left">
                                
                                
                                    
                                    
                                        <form role="form">
                                        
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput198">
                                           <div class="required_fie">   Project Name&nbsp; </div> 
</label>
               <input type="text" class="form-control" id="formInput198" placeholder="Project Name" name="projectname" required/>
              
                                        </div>
                                        <%@ page import="java.sql.*"%>

                                
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput229">
                                            <div class="required_fie">Description&nbsp;</div>
</label>
                                            <input type="text" class="form-control" id="formInput229" placeholder="Description" name="descr" >
                                        </div>
                                       <div class="form-group row log-date">
          <div class="col-md-12">
            <label >No of Applications</label>
            <input placeholder="No of Applications" id="date" name="appno" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label  "><div class="required_fie">Project Start Date&nbsp;</div></label>
            <input placeholder="dd/mm/yyyy" id="Project_Start_Date" name="Startdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required/>
          </div>
          
        </div>  
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "> Initiate Start Date</label>
            <input placeholder="dd/mm/yyyy" id="Initiate_start_date" name="Intdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Plan Start Date</label>
            <input placeholder="dd/mm/yyyy" id="P_S_date" name="Plandate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>    
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Execution Start Date</label>
            <input placeholder="dd/mm/yyyy" id="Exec_start_date" name="Execdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>            
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Hypercare Start Date</label>
            <input placeholder="dd/mm/yyyy" id="Hyper_care_date" name="Hyperdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required"><div class="required_fie">Project End Date&nbsp;</div></label>
            <input placeholder="dd/mm/yyyy" id="Project_end_date" name="Enddate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>                 
                            
                                </div>                                 
                            </div>                             
                        </div>         
                        <br/>                
                       <button type="button" class="btn btn-primary btn pull-left" onclick="valid1()">Save</button>&nbsp;
                    <button type="button" class="btn btn-default" onclick="location.href='project.jsp';">Back</button>
                                        
                                                                           </form>                               
               



</body>
</html>