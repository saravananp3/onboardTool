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
<script>
	function www()
	{
		window.alert("registration");
		var f=document.loginForm;
	    f.method="post";
	    f.action='user_registration';
	    f.submit(); 
	}
</script>
</head>
<body>
<%
String role=request.getParameter("role");
%>
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
								<label>First Name</label>
								<input type="text" name="reg_fname"  class="form-control">
							</div>
							<div class="col-sm-5 form-group">
								<label>Last Name</label>
								<input type="text" name="reg_lname"  class="form-control" >
							</div>
						</div>					
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>Username</label>
								<input type="text" class="form-control" name="reg_uname">
							</div>	
							<div class="col-sm-5 form-group">
								<div class="form-group">
   <label>Roles</label>
								<input type="text" class="form-control" name="reg_roles" value="<%=role%>" disabled>


							</div>	
							</div>
							</div>
							<div class="row">
							<div class="col-sm-5 form-group">
								<label>Email</label>
								<input type="text" name="reg_email" class="form-control">
							</div>
							</div>
							<div class="row">	
							<div class="col-sm-5 form-group">
								<label>Confirm Email</label>
								<input type="text" class="form-control" name="reg_cemail">
							</div>		
						</div>
						
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>Password</label>
								<input type="password"  class="form-control" id="reg_pwd">
							</div></div>
							<div class="row">		
							<div class="col-sm-5 form-group">
								<label>Confirm Password</label>
								<input type="password"  class="form-control" name="reg_cpwd">
							</div>	</div>
							<div class="row">					
					<div class="col-sm-5 form-group">
						<label>Projects</label>
						<input type="text"  class="form-control" name="reg_projects">
					</div>		
					</div>
					
					<button type="button" class="btn btn-lg btn-info" onclick="www();ee();">Submit</button>
										
					</div> 
				</div>
	</div>
	</div>
</form>
</body>
</html>