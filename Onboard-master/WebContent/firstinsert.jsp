<!DOCTYPE html>
<html lang="en">
<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Projects</title>
		<meta name="description" content="Blueprint: View Mode Switch" />
		<meta name="keywords" content="view mode, switch, css, style, grid, list, template" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	
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
 <script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   <!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script>
    $(document).ready(function(){
      var date_input=$('input[name="Startdate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
    $(document).ready(function(){
      var date_input=$('input[name="Enddate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
</script>   
  
<script type="text/javascript">
    function EnableDisableTextBox(chkROD) {
        var txtROD = document.getElementById("txtROD");
        txtROD.disabled = chkROD.checked ? false : true;
        if (!txtROD.disabled) {
            txtROD.focus();
        }
        
    }
</script>
<script>

$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox").attr("disabled", "disabled");
        }
    });
});
$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox1").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox1").attr("disabled", "disabled");
        }
    });
});


</script>
<script type="text/javascript">
    function ShowHideDiv() {
        var adMigrated = document.getElementById("adMigrated");
        var adMigratedDet = document.getElementById("adMigratedDet");
        adMigratedDet.style.display = adMigrated.value == "Y" ? "block" : "none";
    }
</script>

<script type="text/javascript">
    function ShowHideDiv() {
        var arcNeed = document.getElementById("arcNeed");
        var arcReason = document.getElementById("arcReason");
        arcReason.style.display = arcNeed.value == "N" ? "block" : "none";
        var arcComment = document.getElementById("arcComment");
        arcComment.style.display = arcNeed.value == "O" ? "block" : "none";
    }
</script>

<script language="javascript">
function editRecord(){
    var f=document.form;
    f.method="post";
    f.action='newapplication.jsp';
    f.submit();
}
function edit(id){
    var f=document.form;
    f.method="post";
    f.action='business.jsp?id='+id;
    f.submit();
}
</script>
  
	</head>
	<!--from  w  w w  . ja  va 2 s.co  m-->
  <body style='margin:30px'>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
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

String det=(String)session.getAttribute("theName");
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "strutsdb";
String driver = "com.mysql.jdbc.Driver";
String userName ="root";
String password="password123";

try{
Class.forName(driver).newInstance();
con = DriverManager.getConnection(url+db,userName,password);

String query3 = "select * from projinfo where id = "+det;
Statement st3 = con.createStatement();
ResultSet rs3 = st3.executeQuery(query3);





%>

<form method="post" name="form" action="Appin">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
                     <%if (rs3.next()) {
                    	 String name=rs3.getString("projectname");
                    	 String query = "select * from appinfo where prjname = '"+name+"'";
                    	 Statement st = con.createStatement();
                    	 ResultSet rs = st.executeQuery(query);
                     
                     %>
                  <a class="navbar-brand" href="#">Onboarding Tool-<%=rs3.getString("projectname") %></a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                  
                        <li item-selected='true'>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>

                        <li>
                            <a href="#">Settings</a>
                        </li>
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li>
                            <a href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-sm-2 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                    <br>
                        
                        
                    </ul>
                </div>
                
                <div class="col-md-9">
                    <h1 class="page-header">Applications</h1>
                    
                    <div class="main">
				<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
				
					<div class="cbp-vm-options">
					
					
		<button type="button" class="btn btn-primary pull-right"  name="newpr"   onClick="editRecord();" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  New Application
</button>
					
						<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid">Grid View</a>
						<a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list">List View</a>
					</div>
					
	<ul>
<%
while(rs.next()){
%>			
				
						<li>
							
							
							
							<h3 class="cbp-vm-title left-col primary" name="name" value="<%= rs.getString(1)%>" ><%= rs.getString(1)%></h3>
							<center><div class="progress center-col cbp-vm-detail">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="10"
  aria-valuemin="0" aria-valuemax="100" style="width:10%">
    10%
  </div>
  
							
</div> 	
		
</center>

			
							<button type="button" class="btn btn-primary" onClick="edit('<%= rs.getString(1)%>');">
 View/Update
</button>
						</li>
												
						<%
}
%>			

</ul>
<%
}}
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