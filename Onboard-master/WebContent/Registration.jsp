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
	</style>
	
	
	
	<style>
	.glyphicon {
    font-size: 35px;
}
.glyphicon.glyphicon-asterisk
{
color:red;
font-size:10px;
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
	
	function openCity(evt, cityName) {
	    // Declare all variables
	    var i, tabcontent, tablinks;

	    // Get all elements with class="tabcontent" and hide them
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }

	    // Get all elements with class="tablinks" and remove the class "active"
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }

	    // Show the current tab, and add an "active" class to the link that opened the tab
	    document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
	
	</script>

</head>

<body>
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
			 <button class="tablinks" onclick="openCity(event, 'config')"><span class="glyphicon glyphicon-list-alt"></span><b>User Config</b></button>
  <button class="tablinks" onclick="openCity(event, 'London')"><span class="glyphicon glyphicon-list-alt"></span><b>Registration</b></button>
  <button class="tablinks" onclick="openCity(event, 'Paris')"><span class="glyphicon glyphicon-cog"></span><b>Settings</b></button>
</div>
<div id="config" class="tabcontent">
 <div class="container">
 <br/><br/><br/><br/><br/>
	<div class="col-lg-12 well">
	<div class="row">
				<form>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>First Name<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text"  class="form-control" id="fname" onChange="call()" required>
							</div>
							</div>
							<div class="row">
							<div class="col-sm-5 form-group">
								<label>Last Name<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text"  class="form-control" id="lname" required>
							</div>
						</div>		
						<div class="row">			
							<div class="col-sm-5 form-group">
								<label>Roles<span class="glyphicon glyphicon-asterisk"></span></label>
								  <div class="checkbox"> 
                                            <label class="Data Source"> 
                                                <input type="checkbox" name="data_source" value="regulardb" ><b>Admin</b></label>
                                            <label class="Data Source">     <input type="checkbox" name="data_source" value="erp"><b>SME</b></label>
                                                <label class="Data Source"> <input type="checkbox" name="data_source" value="product"><b>BA</b></label>                         
                                        </div>
							</div>	
							</div>
							<div class="row">
							<div class="col-sm-5 form-group">
								<label>Email<span class="glyphicon glyphicon-asterisk"></span></label>
								<input type="text"  class="form-control" id="email" required>
							</div>
							</div>						
							<div class="row">					
					<div class="col-sm-5 form-group">
						<label>Projects</label>
						<input type="text"  class="form-control">
					</div>		
					</div>
					
					<button type="button" class="btn btn-lg btn-info" onclick="window.location.href='mails'">Send Invites</button>					
					</div>
				</form> 
				</div>
	</div>
	</div>
</div>
<script>
function call(){
	var x=document.getElementById('reg_fname');
	var y=document.getElementById('reg_lname');
	var z=document.getElementById('reg_email');
x.value=document.getElementById('fname').value;
y.value=document.getElementById('lname').value;
z.value=document.getElementById('email').value;
}
</script>
<div id="London" style="display:none;" class="tabcontent">
 <div class="container">
    <br/><br/><br/><br/>
	<div class="col-lg-12 well">
	<div class="row">
				<form>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>First Name</label>
								<input type="text" id="reg_fname"  class="form-control">
							</div>
							<div class="col-sm-5 form-group">
								<label>Last Name</label>
								<input type="text" id="reg_lname"  class="form-control" >
							</div>
						</div>					
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>Username</label>
								<input type="text" class="form-control">
							</div>	
							<div class="col-sm-5 form-group">
								<label>Roles</label>
								  <div class="checkbox"> 
                                            <label class="Data Source"> 
                                                <input type="checkbox" name="data_source" value="regulardb" ><b>Admin</b></label>
                                            <label class="Data Source">     <input type="checkbox" name="data_source" value="erp"><b>SME</b></label>
                                                <label class="Data Source"> <input type="checkbox" name="data_source" value="product"><b>BA</b></label>                         
                                        </div>
							</div>	
							</div>
							<div class="row">
							<div class="col-sm-5 form-group">
								<label>Email</label>
								<input type="text" id="reg_email" class="form-control">
							</div>
							</div>
							<div class="row">	
							<div class="col-sm-5 form-group">
								<label>Confirm Email</label>
								<input type="text" class="form-control">
							</div>		
						</div>
						
						<div class="row">
							<div class="col-sm-5 form-group">
								<label>Password</label>
								<input type="text"  class="form-control">
							</div></div>
							<div class="row">		
							<div class="col-sm-5 form-group">
								<label>Confirm Password</label>
								<input type="text"  class="form-control">
							</div>	</div>
							<div class="row">					
					<div class="col-sm-5 form-group">
						<label>Projects</label>
						<input type="text"  class="form-control">
					</div>		
					</div>
					
					<button type="button" class="btn btn-lg btn-info">Submit</button>					
					</div>
				</form> 
				</div>
	</div>
	</div>
</div>

<div id="Paris" style="display:none;" class="tabcontent">
  <h3>Paris</h3>
  <p>Paris is the capital of France.</p> 
</div>

			
</body>
</html>