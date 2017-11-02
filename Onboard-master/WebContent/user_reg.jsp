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
   <link href="http://cdn-na.infragistics.com/igniteui/2017.1/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
    <link href="http://cdn-na.infragistics.com/igniteui/2017.1/latest/css/structure/infragistics.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"/>
<style>
.glyphicon.glyphicon-asterisk
{
color:red;
font-size:10px;
}
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
<script src="js/dropdown.js"></script>
</head>
<body>
<%@page import="java.sql.*"%>
<%
HttpSession ses=request.getSession(); 
String role=(String)ses.getAttribute("My_Roles");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query="select uname from user_details";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
%>
<script>
	function www(x)
	{
	var ffname=document.getElementById("reg_fname").value;
	var llname=document.getElementById("reg_lname").value;
	var uuname=document.getElementById("reg_uname").value;
	var email=document.getElementById("reg_email").value;
	var pass=document.getElementById("reg_pwd").value;
	var cpass=document.getElementById("reg_cpwd").value;
	var confirm=document.getElementById("reg_cemail").value;
	<% while(rs.next()){ %>
	if(uuname == "<%=rs.getString(1)%>")
		{
		window.alert("already there");
		window.location.href='user_reg.jsp';
		}
	<%}%>
	if(ffname==="" || llname==="" || uuname==="")
		window.alert("fill the mandatory fileds");
	else
		{
		if((email.includes("@"))&&(email.includes(".com")))
		{
			 var confirm=document.getElementById("reg_cemail").value;
			 if(email==confirm)
				 {
			if(pass.length>8)
				{
				  if(pass==cpass)
					  {
					  var f=document.loginForm;
					    f.method="post";
					    f.action='user_registration?role='+x;
					    f.submit(); 
					  }
				  else
					  window.alert("password and confirm password are not same");
				}
			else
				window.alert("password must be less than 8 letters");
				 }
			 else
				 window.alert("both emails are not same");
		
		}
		else
			window.alert("Invalid Email");
	}
	}
</script>
<form class="form-signin" name="loginForm" method="post">
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
 <div class="container">
    <br/><br/><br/><br/>
	<div class="col-lg-12 well">
	<div class="row">
			
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>First Name<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text" name="reg_fname" id="reg_fname"   class="form-control" >
							</div>
							<div class="col-sm-5 form-group">
								<label>Last Name<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text" name="reg_lname" id="reg_lname"  class="form-control" >
							</div>
						</div>					
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>Username<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text" class="form-control" name="reg_uname" id="reg_uname" onChange="check()">
							</div>	
						
							<div class="col-sm-5 form-group">
								<div class="form-group">
   <label>Roles</label>
								<input type="text" class="form-control" name="reg_roles" value="<%=role%>">


							</div>	
							</div>
							</div>
							<div class="row">
							<div class="col-sm-5 form-group">
								<label>Email<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text" name="reg_email" id="reg_email" class="form-control">
							</div>
							</div>
							<div class="row">	
							<div class="col-sm-5 form-group">
								<label>Confirm Email<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text" class="form-control" name="reg_cemail" id="reg_cemail">
							</div>		
						</div>
						
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>Password<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="password"  class="form-control" name="reg_pwd" id="reg_pwd">
							</div></div>
							<div class="row">		
							<div class="col-sm-5 form-group">
								<label>Confirm Password<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="password"  class="form-control" name="reg_cpwd" id="reg_cpwd">
							</div>	</div>
							<div class="row">					
					<div class="col-sm-5 form-group">
						<label>Projects</label>
						<input type="text"  class="form-control" name="reg_projects">
					</div>		
					</div>
					
					<button type="button" class="btn btn-lg btn-info" onclick="www('<%=role %>');">Submit</button>
										
					</div> 
				</div>
	</div>
	</div>
</form>
</body>
</html>