<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


 
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
   
 <script type="text/javascript" src="js_in_pages/project.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/project.css" type="text/css" />
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
<!--from  w  w w  . ja  va 2 s.co  m-->
  <body style='margin:20px'>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
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

<% 
HttpSession role_ses=request.getSession();  
String frole=(String)role_ses.getAttribute("role");
%>
<%

int sumcount=0;
Statement st,st1;
try{
String query;
HttpSession details=request.getSession();
String prj=(String)details.getAttribute("projects");
String roles=(String)details.getAttribute("role");
DBconnection d=new DBconnection();
Connection con = (Connection)d.getConnection();
if(prj.equals("all"))
 query = "select * from projinfo";
else
 query = "select * from projinfo where projectname='"+prj+"'";
st = con.createStatement();
ResultSet rs = st.executeQuery(query);

%>
<form method="post" name="form" action="Appin">
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    
                    <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool</a>
              
                <div id="navbar" class="navbar-collapse collapse">
                
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        
              <img src="assets/images/logo1.png" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
</li>
 <li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li> 
                        <li>
                            <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-md-1 sidebar">
                    <ul class="nav nav-sidebar">
                    <br>
                       
                    </ul>
                </div>
                
                <div class="col-md-8">
                    <h1 class="page-header">Projects</h1>
                    
                    <div class="main">
<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
<div class="cbp-vm-options">
<button type="button" class="btn btn-primary pull-right"  name="newpr"   onclick="location.href = 'newproject.jsp';" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  New Project
</button>
<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid">Grid View</a>
<a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list">List View</a>
</div>

<ul>
<%
int k=0;
while(rs.next()){
	k++;
%> 
<li>
<h3 class="cbp-vm-title left-col primary" name="name"><%=rs.getString(1)%></h3>
<% String q="select * from archive_exec where level=1 and projects='"+rs.getString(1)+"'order by seq_num";
st1 = con.createStatement();
ResultSet rs1 = st1.executeQuery(q);

while(rs1.next())
{
	
if(rs1.getString(15).equals("100"))
continue;
else
{%>
	<center><div class="progress center-col cbp-vm-detail">
	  <div class="progress-bar progress-bar-success progress-bar-striped" id="prog_bar<%=k %>" role="progressbar" aria-valuenow="<%=rs1.getString(15) %>"
	  aria-valuemin="0" aria-valuemax="100" style="width:<%=rs1.getString(15) %>%">
	  <%=rs1.getString(15) %>%
	  </div>
	  
	</div>
	</center>
	<%

	if(Integer.parseInt(rs1.getString(15))<35){
%>
<script>
document.getElementById('prog_bar<%=k%>').className='progress-bar progress-bar-danger progress-bar-striped';</script>
<%

	} 
else if(Integer.parseInt(rs1.getString(15))<65){
%>
<script>
document.getElementById('prog_bar<%=k%>').className='progress-bar progress-bar-warning progress-bar-striped';
</script>
<%
} %>
<h5 class="cbp-vm-title right-col primary" ><%=rs1.getString(3) %></h5>
<%
break;
}
} %>
<button type="button" class="btn btn-primary" name="btn" onClick="edit('<%=rs.getString(10)%>','<%=rs.getString(1)%>');">
 View/Update
</button>
</li>
<%
}
%>
</ul>
<%
}
catch(Exception e){
e.printStackTrace();
}
%>
</div>
</div> 
   
       </div>
                
            </div>
            
      
        
</form>
<script src="js/classie.js"></script>
<script src="js/cbpViewModeSwitch.js"></script>
  </body>
</html>