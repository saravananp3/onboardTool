<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
		<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/dropdown.js"></script>
  <style>
span.multiselect-native-select {
	position: relative
}
span.multiselect-native-select select {
	border: 0!important;
	clip: rect(0 0 0 0)!important;
	height: 1px!important;
	margin: -1px -1px -1px -3px!important;
	overflow: hidden!important;
	padding: 0!important;
	position: absolute!important;
	width: 1px!important;
	left: 50%;
	top: 30px
}
.multiselect-container {
	position: absolute;
	list-style-type: none;
	margin: 0;
	padding: 0
}
.multiselect-container .input-group {
	margin: 5px
}
.multiselect-container>li {
	padding: 0
}
.multiselect-container>li>a.multiselect-all label {
	font-weight: 700
}
.multiselect-container>li.multiselect-group label {
	margin: 0;
	padding: 3px 20px 3px 20px;
	height: 100%;
	font-weight: 700
}
.multiselect-container>li.multiselect-group-clickable label {
	cursor: pointer
}
.multiselect-container>li>a {
	padding: 0
}
.multiselect-container>li>a>label {
	margin: 0;
	height: 100%;
	cursor: pointer;
	font-weight: 400;
	padding: 3px 0 3px 30px
}
.multiselect-container>li>a>label.radio, .multiselect-container>li>a>label.checkbox {
	margin: 0
}
.multiselect-container>li>a>label>input[type=checkbox] {
	margin-bottom: 5px
}
.btn-group>.btn-group:nth-child(2)>.multiselect.btn {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px
}
.form-inline .multiselect-container label.checkbox, .form-inline .multiselect-container label.radio {
	padding: 3px 20px 3px 40px
}
.form-inline .multiselect-container li a label.checkbox input[type=checkbox], .form-inline .multiselect-container li a label.radio input[type=radio] {
	margin-left: -20px;
	margin-right: 0
}
</style>
	<style>
	@import "font-awesome.min.css";
@import "font-awesome-ie7.min.css";
/* Space out content a bit */


/* Everything but the jumbotron gets side spacing for mobile first views */
.header,
.marketing,
.footer {
  padding-right: 15px;
  padding-left: 15px;
}

/* Custom page header */
.header {
  border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
  padding-bottom: 9px;
  margin-top: 0;
  margin-bottom: 0;
  line-height: 20px;
}

/* Custom page footer */
.footer {
  padding-top: 1px;
  color: #777;
  border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media (min-width: 768px) {
  .container {
    max-width: 930px;
  }
}
.container-narrow > hr {
  margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
  text-align: center;
  border-bottom: 1px solid #e5e5e5;
}
.jumbotron .btn {
  padding: 14px 24px;
  font-size: 21px;
}

/* Supporting marketing content */
.marketing {
  margin: 40px 0;
}
.marketing p + h4 {
  margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
  /* Remove the padding we set earlier */
  .header,
  .marketing,
  .footer {
    padding-right: 0;
    padding-left: 0;
  }
  /* Space out the masthead */
  .header {
    margin-bottom: 30px;
  }
  /* Remove the bottom border on the jumbotron for visual effect */
  .jumbotron {
    border-bottom: 0;
  }
}
			#table-scroll {
  height:600px;
  overflow:auto;  
  margin-top:20px;
}
	</style>
	
	
	
	<style>
	
	input
{
border:none;
border-color:transparent;
width:40px;
background-color:#87CEFA
}

input.act
{
border:none;
border-color:transparent;
width:175px;
background-color:#87CEFA
}
	.glyphicon {
    font-size: 35px;
}
.glyphicon.glyphicon-asterisk
{
color:red;
font-size:10px;
}
th
{
color:#00BFFF;
text-align:center;
}
	
/* Style the tab */
div.tab {
    float: left;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
    width: 7%;
    height: 720px;
}

/* Style the buttons inside the tab */
div.tab button {
    display: block;
    background-color: inherit;
    color: black;
    padding: 22px 16px;
    width: 100%;
    border: none;
    outline: none;
    text-align: left;
    cursor: pointer;
    transition: 0.3s;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current "tab button" class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    float: left;
    padding: 0px 12px;
    border: 1px solid #ccc;
    width: 93%;
    border-left: none;
    height: 720px;
}
	</style>
	
	<script>
	function calls()
	{
		    var x = document.getElementById('myDiv1');
		    if (x.style.display === 'none') {
		        x.style.display = 'block';
		    } 
		    else {
		        x.style.display = 'none';
		    }
		
	}
	</script>
	<script>
	function edit_serv()
	{
		 var f=document.loginForm;
		    f.method="post";
		    f.action='rdetails';
		    f.submit(); 
	}
	
	</script>
	
			</head>

<body>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		
<%
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 
String query="select * from role_details";
String query1="select * from user_details";
Statement s=conn.createStatement();
Statement s1=conn.createStatement();
ResultSet rs=s.executeQuery(query);
ResultSet rs1=s1.executeQuery(query1);
int count=0;
%>
<form class="form-signin" name="loginForm" method="post" action="Role_details">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
    
                 
                    <a class="navbar-brand">Onboarding Tool</a>
              
                <div id="navbar" class="navbar-collapse collapse">
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
        
			
			<div class="tab"><br/><br/><br/>
			 <button type="button" onclick="window.location.href='Registration.jsp'"><span class="glyphicon glyphicon-list-alt"></span><b><br/>User Config</b></button>
   <button type="button" onclick="window.location.href='users_list.jsp'"><span class="glyphicon glyphicon-list-alt"></span><b>User List</b></button>
   <button type="button" onclick="window.location.href='roledetails.jsp'"><span class="glyphicon glyphicon-list-alt"></span><b><br/>Role Details</b></button>
</div>
<div id="list" style="display:block;" class="tabcontent">
 <div class="container" >
  <br/><br/>
  <h3>ROLE PAGE</h3>
	<div class="col-lg-12" style="background-color:#FFFAFA;align:middle;" >
	
	<div class="row">
				<form>

&nbsp;<input type="textbox" id="myDiv1"  style="float:right;border-radius:5px;display:none;" >&nbsp;
</h3>

					<div class="col-sm-12">
					<div class="table-responsive" id="table-scroll"> 
  <table  class="js-dynamitable table table-bordered" id="myTable">
  <thead style="background-color:white">
  <th>Role</th>
  <th>Admin</th>
  <th>AppEmphasize</th>
  <th>Intake</th>
  <th>Archival Execution</th>
  <th>Decommision</th>
  <th>Program governance</th>
  <th>Reporting</th>
  <th>Finance</th>
  </thead>
  <tbody>
  <%
  int i=0;
  while(rs.next()){ 
  %>
  <tr style="background-color:#87CEFA">
  <td><input class="act" type="text" name="role<%=i %>" value="<%= rs.getString(1) %>"></td>
  <td><input type="text" name="admin<%=i %>" value="<%= rs.getString(2) %>"></td>
  <td><input type="text" name="app_emp<%=i %>" value="<%= rs.getString(3) %>"></td>
  <td><input type="text" name="intake<%=i %>" value="<%= rs.getString(4) %>"></td>
  <td><input type="text" name="arch_exe<%=i %>" value="<%= rs.getString(5) %>"></td>
  <td><input type="text" name="decomm<%=i %>" value="<%= rs.getString(6) %>"></td>
  <td><input type="text" name="prgm_gov<%=i %>" value="<%= rs.getString(7) %>"></td>
  <td><input type="text" name="report<%=i %>" value="<%= rs.getString(8) %>"></td>
  <td><input type="text" name="finance<%=i %>" value="<%= rs.getString(9) %>"></td>
  </tr> 
  <%
  }
%>  
  
  </tbody>
  </table>
  <button type="button" class="btn btn-primary" onclick="edit_serv()">Submit</button>
  
  </div>
</div>
</form>
</div>
</div>
</div>
</div>


</form>
			
</body>
</html>