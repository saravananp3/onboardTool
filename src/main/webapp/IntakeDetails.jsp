<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Decom3Sixty - Intake</title>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >
   <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
  
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
 
   
    <!-- ========== MODERNIZR ========== -->
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script>
<script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummary.js"></script>
<script src="js/IntakeDetails/IntakeAssessment/Common/IntakeAssessmentDataRetrieve.js"></script>
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" />
<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/toggleSwitch/toggleSwitch.css">
 
   
<style type="text/css">
         
body{
background:#fff;
}


.page-title-div {
background:#1565c0;
padding: 15px; 
}
.fixed-top{
width:100%;
padding-left: 0px;
padding-right: 0px;
}
<!-- Wizard-->

body {
  background-color: #ffffff;
  color: #444444;
  font-family: 'Roboto', sans-serif;
  font-size: 16px;
  font-weight: 300;
  margin: 0;
  padding: 0;
}
.wizard-content-left {
  background-blend-mode: darken;
  background-color: rgba(0, 0, 0, 0.45);
  background-image: url("https://i.ibb.co/X292hJF/form-wizard-bg-2.jpg");
  background-position: center center;
  background-size: cover;
  height: 100vh;
  padding: 30px;
}
.wizard-content-left h1 {
  color: #ffffff;
  font-size: 38px;
  font-weight: 600;
  padding: 12px 20px;
  text-align: center;
}

.form-wizard {
  color: #888888;
  
}
.form-wizard .wizard-form-radio {
  display: inline-block;
  margin-left: 5px;
  position: relative;
}
.form-wizard .wizard-form-radio input[type="radio"] {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  background-color: #dddddd;
  height: 25px;
  width: 25px;
  display: inline-block;
  vertical-align: middle;
  border-radius: 50%;
  position: relative;
  cursor: pointer;
}
.form-wizard .wizard-form-radio input[type="radio"]:focus {
  outline: 0;
}
.form-wizard .wizard-form-radio input[type="radio"]:checked {
  background-color: #fb1647;
}
.form-wizard .wizard-form-radio input[type="radio"]:checked::before {
  content: "";
  position: absolute;
  width: 10px;
  height: 10px;
  display: inline-block;
  background-color: #ffffff;
  border-radius: 50%;
  left: 1px;
  right: 0;
  margin: 0 auto;
  top: 8px;
}
.form-wizard .wizard-form-radio input[type="radio"]:checked::after {
  content: "";
  display: inline-block;
  webkit-animation: click-radio-wave 0.65s;
  -moz-animation: click-radio-wave 0.65s;
  animation: click-radio-wave 0.65s;
  background: #000000;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
  border-radius: 50%;
}
.form-wizard .wizard-form-radio input[type="radio"] ~ label {
  padding-left: 10px;
  cursor: pointer;
}
.form-wizard .form-wizard-header {
  text-align: center;
}

.form-wizard .wizard-fieldset {
  display: none;
}
.form-wizard .wizard-fieldset.show {
  display: block;
}
.form-wizard .wizard-form-error {
  display: none;
  background-color: #d70b0b;
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  height: 2px;
  width: 100%;
}


.form-wizard .form-control:focus {
  box-shadow: none;
}
.form-wizard .form-group {
  position: relative;
  margin: 25px 0;
}
.form-wizard .wizard-form-text-label {
  position: absolute;
  left: 10px;
  top: 16px;
  transition: 0.2s linear all;
}
.form-wizard .focus-input .wizard-form-text-label {
  color: #d65470;
  top: -18px;
  transition: 0.2s linear all;
  font-size: 12px;
}
.form-wizard .form-wizard-steps {
  margin: 30px 0;
}
.form-wizard .form-wizard-steps li {
  width: 14%;
  float: left;
  position: relative;
}
.form-wizard .form-wizard-steps li::after {
  background-color: #f3f3f3;
  content: "";
  height: 5px;
  left: 0;
  position: absolute;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
  width: 100%;
  border-bottom: 1px solid #dddddd;
  border-top: 1px solid #dddddd;
}
.form-wizard .form-wizard-steps li span {
  background-color: #dddddd;
  border-radius: 50%;
  display: inline-block;
  height: 40px;
  line-height: 40px;
  position: relative;
  text-align: center;
  width: 40px;
  z-index: 1;
}
.form-wizard .form-wizard-steps li:last-child::after {
  width: 50%;
}
.form-wizard .form-wizard-steps li.active span, .form-wizard .form-wizard-steps li.activated span {
  background-color: #0db02b;
  color: #ffffff;
}
.form-wizard .form-wizard-steps li.active::after, .form-wizard .form-wizard-steps li.activated::after {
  background-color: #0db02b;
  left: 50%;
  width: 50%;
  border-color:#0db02b ;
}
.form-wizard .form-wizard-steps li.activated::after {
  width: 100%;
  border-color: #0db02b;
}
.form-wizard .form-wizard-steps li:last-child::after {
  left: 0;
}
.form-wizard .wizard-password-eye {
  position: absolute;
  right: 32px;
  top: 50%;
  transform: translateY(-50%);
  cursor: pointer;
}
@keyframes click-radio-wave {
  0% {
    width: 25px;
    height: 25px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    width: 60px;
    height: 60px;
    margin-left: -15px;
    margin-top: -15px;
    opacity: 0.0;
  }
}
@media screen and (max-width: 767px) {
  .wizard-content-left {
    height: auto;
  }
}



fieldset {
    padding: 0.875em 1.75em 1.75em;
    border-width: 1px #fff;
    border-style: solid;
    max-width: 141%;
    margin-bottom: 1.875em;
}

.form-wizard-steps li  i{
	position: absolute;
    top: -22px;
    font-style: normal;
    font-weight: 400;
    white-space: nowrap;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 14px;
    font-weight: 700;
    color: #000;
}

.form-wizard-steps li  i{
	color: #d65470;
}
.back-to-top {
    position: fixed;
    bottom: 20px;
    right: 35px;
    
    border-radius:50%;
    background:Gray;
}

.fa{
padding-left:3px;
padding-top:-3px;
padding-bottom:10px;
margin:0 auto;
font-size:14x;
color:#fff;

}
	#module_header{
 
 margin-top:75px;
 }
 
 
table {
    width: 92%;
    border-spacing: 0;
    
    margin-bottom: 2.375em;
    border-style:none;
} 


.pdf{

float:right;
    margin-top: -36px;

}
.pdf{
background:#1565c0;
}


.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

.userlist{

width:95%;

}

input[type="text"]{

font-size:12px;

}
</style>

</head>
<body class="top-navbar-fixed">

<div class="main-wrapper">
 <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Decomm3Sixty" class="logo">
                    </a>
                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                  <ul class="nav navbar-nav">
		              <li class="active"><a href="#" style="background:#1565c0;color:white;">Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp">Administration</a></li>
		              <li><a href="GovernanceList.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li ><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right">
                      <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
      </div>
      <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                             <div class="col-sm-6">
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >>Opportunity</p>
                     
                    

                    </div>

                </div>
			</nav>
      
        </div>
        <!-- /.container-fluid -->
    </nav >
<div class="content-wrapper">
 <div class="content-container" >
  <div class="main-page">
       <section class="wizard-section">
		<div class="container" id="module_header">
			<div class=" col-md-12">
				<div class="form-wizard">
					<form action="" method="post" role="form">
						<div class="form-wizard-header">
							<p>Fill all the required fields to go next step</p>
							<ul class="list-unstyled form-wizard-steps clearfix">
								<li class="active"><span>1</span><i>Opportunity</i></li>
								<li><span>2</span><i>Triage</i></li>
								<li><span>3</span><i>Triage Summary</i></li>
								<li><span>4</span><i>Assessment</i></li>
								<li><span>5</span> <i>Stake Holder</i></li>
								<li><span>6</span><i>Review</i></li>
								<li><span>7</span><i>Approval</i></li>
							</ul>
						</div>
						<fieldset class="wizard-fieldset show" style="border-style: none">
							   <div class="tab-pane active" role="tabpanel" id="step1">
                                       <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse"
                                                        data-parent="#panels1" >Opportunity</a> </h4>
                                            </div>
                                            <div id="collapse1" class="panel-collapse "
                                                name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFields" >
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                                                    </div>                                                
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button>
                                                            </div>
                                                            <div class="col-md-6 dropup" style="padding-right: 10px; float: right;  width: 43%;">
                                                                <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".bd-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#AddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="Edit" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="Delete" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                               
                                                                <button type="submit" class="btn btn-success" id="create">Save</button>
                                                                 <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info">Next</a>
                                                                
                                                              
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#EditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#DeletePopUp" style="display: none;">Delete PopUp</button>
                                                               <!--  <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button> -->
                                                            </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
                               
                                
                                
                                
                                
                                
						</fieldset>	
						<fieldset class="wizard-fieldset" style="border-style: none">
							  <div class="tab-pane" role="tabpanel" id="step2">
                                    
                                             <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Triage Information</a>  </h4>
                                        </div>
                                        <div id="collapse2" class="panel-collapse ">
                                            <div class="panel-body">
                                            <div id="inputValue">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                                             </div>
                                            <div class="col-md-12">
                                                <div class="col-md-1">
                                                     <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" >Prev</button> </div>
                                                            <div class="col-md-6 dropup" style=" padding-right: 10px; float: right; width: 43%;">
                                                                <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".triage-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span> </button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#AddTriagePopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditTriage" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteTriage" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                                <button type="submit" class="btn btn-success" id="createbtn">Save</button>
                                                                
                                                                <a href="javascript:;" class="form-wizard-next-btn float-right btn btn-info">Next</a>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn1" data-toggle="modal" data-target="#EditTriagePopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn1" data-toggle="modal" data-target="#DeleteTriagePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                            </div>    
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    </div>
						</fieldset>	
						<fieldset class="wizard-fieldset" style="border-style: none">
							      <div class="tab-pane" role="tabpanel" id="step3">
                                                        <!-- Triage Summary -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Triage Summary</a></h4>
                                        </div>
                                        <div id="collapse3" class="panel-collapse ">
                                            <div class="panel-body">
                                            <div id="inputFieldsSummary">
                                                    <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/> </div>
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsSummary">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/></div>                                           
                                                    <div class="col-md-12">
                                                       <div class="col-md-1">
                                                           <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" >Prev</button></div>
                                                       <div class="col-md-6 dropup" style=" padding-right: 10px; float: right;width: 45%;">
                                                          <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".triage-summary-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="addSummary" data-toggle="modal" data-target="#TiageSummAddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditSummary" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteSummary" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                                <button type="submitBtn" class="btn btn-success" id="createTriSummary">Save</button>
                                                                <a href="javascript:;" class="form-wizard-next-btn float-right btn btn-info">Next</a>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopupSummary_btn" data-toggle="modal" data-target="#TriSummEditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopupSummary_btn" data-toggle="modal" data-target="#TriageSummaryDeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                                        </div>
								</div>
					</div>
                                    </div>
                                    
                                </div>
                            </div>
                                  </div>
						</fieldset>	
						<fieldset class="wizard-fieldset" style="border-style: none">
							  
                                  <div class="tab-pane" role="tabpanel" id="step4">
                                     <!-- Assessment Table -->
                            <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Assessment</a></h4>
                                        </div>
                                        <div id="collapse4" class="panel-collapse ">
                                          
                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsAssessment">
                                      <!-- Application Information -->
                                     <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Application information</a></h4>
                                        </div>
                                        <div id="collapse5" class="panel-collapse ">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsAppInfo">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse6" aria-expanded="false" aria-controls="multiCollapseExample2">Next</button>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>   
                                                   
                               <!-- Data Characteristics -->
                                     <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse6" ">Data Characteristics</a></h4>
                                        </div>
                                        <div id="collapse6" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsDataChar">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                 <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse7" aria-expanded="false" aria-controls="multiCollapseExample2">Next</button>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>         
                                                    
                             <!-- Compliance Characteristics -->
                                      <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse7">Compliance Characteristics</a></h4>
                                        </div>
                                        <div id="collapse7" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsComplianceChar">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse8" aria-expanded="false" aria-controls="multiCollapseExample2">Next</button>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>
							         </div>
							         
							      <!-- Archival Consumption -->
                                      <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse8" ">Archival Consumption</a></h4>
                                        </div>
                                        <div id="collapse8" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsArchivConsump">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapse9" aria-expanded="false" >Next</button></div>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>
							         
							         <!-- Contract Information-->
							         <div id ="ContractInformation" style="display:none;">
							           <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse9" onclick="switchColors();">Contract Information</a></h4>
                                        </div>
                                        <div id="collapse9" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsContInfo">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                 </div>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>
							         </div>
							         </div>
							         </div>
							         <br>
							         <br>
							         <div class="col-md-12">
                                       <div class="col-md-1">
                                       <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" >Prev</button></div>
                                       <div class="col-md-6 dropup" style=" padding-right: 10px; float: right; width:31%">
                                       <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                       <ul class="dropdown-menu">
                                       <li><a href="#" id="AddAssess" data-toggle="modal" data-target="#AssessAddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                       <li><a href="#" id="EditAssess" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                       <li><a href="#" id="DeleteAssess" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                       </ul>
                                       <button type="button" class="btn btn-success" id="AssessmentSaveBtn">Save</button>
                                        <a href="javascript:;" class="form-wizard-next-btn float-right btn btn-info" >Next</a>
                                       <button type="button" class="btn btn-primary pull-right" id="editpopupAssess_btn" data-toggle="modal" data-target="#AssessEditPopUp" style="display: none;">Edit PopUp</button>
                                       <button type="button" class="btn btn-primary pull-right" id="deletepopupAssess_btn" data-toggle="modal" data-target="#AssessDeletePopUp" style="display: none;">Delete PopUp</button>
                                       <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                       </div>
                                     </div>
                                     
								</div>
					           </div>     
                                </div>
                            </div>
                    </div>
                                  
                                  
                                  
                                  </div>
						</fieldset>	
						<!-- Stake Holder -->
						<fieldset class="wizard-fieldset" style="border-style: none">	
						
						       <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse"
                                                        data-parent="#panels1">Stake Holder</a> </h4>
                                            </div>
                                            <div class="panel-collapse collapse in"
                                                name="collapse">
                                                <div class="panel-body">
                                                    <div class="col-md-12">
                                                    <h3 class="panel-title">User List</h3>           
  													<table class="table table-bordered userlist">
    												<thead>
      												<tr>
        											<th>Name</th>
        											<th>Email</th>
        											<th>User Name</th>
        											<th>Role</th>
        											<th>Action</th>
      												</tr>
    												</thead>
    												<tbody id ="UserList">
      												    												
      												</tbody>
  													</table>
                                                    </div>                                                
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" >Prev</button>
                                                            </div>
                                                           <div class="col-md-3" style="padding-top: 10px; padding-right: 10px; float: right; width:26%;">
                                                                <button class="btn btn-primary" type="button" id="AddStakeUserBtn">Add</button>

                                                                <button type="submit" class="btn btn-success" id="save">Save</button>
                                                                <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info">Next</a>
                                                               
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#EditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#DeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" style="display:none;"></button>
                                                            </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
						
						
						</fieldset>	
						
						<fieldset class="wizard-fieldset" style="border-style: none">
						  <div class="panel panel-default">
                                            <div class="panel-heading">
                                                 <h4 class="panel-title">Intake Summary</h4>
                                                
                                                 <button id="intake_module" class="btn pdf"><span
                                                    class="glyphicon glyphicon-download-alt"></span> Export Pdf
                                                 </button>
                                              
                                            </div>
                                            <div class="panel-collapse collapse in"
                                                name="collapse">
                                                <div class="panel-body">
						 <div class="col-md-6">
                        
                            
                             
                               <div class="container">

                                            <div bgcolor='#e4e4e4' style='font-family:Arial,Helvetica,sans-serif;'
                                                 id="table-scroll">

                                                <table>
                                                    <tbody>
                                                    <tr>
                                                        <td>
                                                            <table width='780' border='0' align='center'>

                                                                <tbody>

                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="OpportunityInfoPreview"> <h3 class="panel-title"><strong>Opportunity Information</strong></h3>  <br></div> </div> </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="TriageInfoPreview"> <h3 class="panel-title"><strong>Triage Information</strong></h3> <br> </div> </div> </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="TriageSummInfoPreview"> <h3 class="panel-title"><strong>Triage Summary Information</strong></h3> <br> </div> </div> </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="AssessInfoPreview"> <h2 class="panel-title"><strong>Assessment Information</strong></h2> <br> <br> 
                                                         <div id="ApplicationInformationPreview"> <h4 class="panel-title"><strong>Application Information</strong></h3> <br> </div>
                                                          <div id="DataCharacteristicsPreview"> <h4 class="panel-title"><strong>Data Characteristics</strong></h3> <br> </div>
                                                           <div id="ComplianceCharacteristicsPreview"> <h4 class="panel-title"><strong>Compliance Characteristics</strong></h3> <br> </div>
                                                            <div id="ArchivalConsumptionPreview"> <h4 class="panel-title"><strong>Archival Consumption</strong></h3> <br></div>
                                                            <div id="ContractInformationPreview" style = "display:none;"> <h3>Contract Consumption</h3> <br> </div></div> 
                                                        </div> </td> </tr>
                                                        
                                                 <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="StakeHolderInfoPreview"> <h3 class="panel-title" ><strong>Stake Holder</strong></h3>  <br></div> </div> </td> </tr>
                                                        </tbody>
                                    </table>
 								</td>
 </tr>
 </tbody>
 </table>
 </div>
 </div>
                            
                         </div>
                         
                          <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                 <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" >Prev</button>
                                                            </div>
                                                           <div class="col-md-3" style="padding-top: 10px; padding-right: 10px; float: right; width:26%;">
                                                               <button type="button" id="button_id" name="button_id" class="btn btn-primary">
                        Request Sign
                    </button>
                   
                                                                <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info">Next</a>
                                                                

                                                               
                                                            </div>
                                                    </div>
                         
                         
                         
                         </div>
                         </div>
                         </div>
						</fieldset>	
						
						<fieldset class="wizard-fieldset" style="border-style: none">
						<div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse"
                                                        data-parent="#panels1">Intake Approval</a> </h4>
                                            </div>
                                            <div ng-app="btn" ng-controller="MainCtrl">
</div>
                                            <div class="panel-collapse collapse in"
                                                name="collapse">
                                                <div class="panel-body">
                                                    <div>
                                                    <h2 class="panel-title">Approver List</h2>
                                                    <br>        
  													<table class="table table-bordered">
    												<thead>
      												<tr>
        											<th style='text-align:center;vertical-align: middle;'>Approver Name</th>
        											<th style='text-align:center;vertical-align: middle;'>Approver Role</th>
        											<th style='text-align:center;vertical-align: middle;'>Approval</th>
        											<th style='text-align:center;vertical-align: middle;'>Action</th>
      												</tr>
    												</thead>
    												<tbody id="ApprovalDetails">
    												</tbody>
  													</table>
                                                    </div>                                                
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                 <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" >Prev</button>
                                                            </div>
                                                            <div class="col-md-2" style="padding-top: 10px; padding-right: 10px; float: right;">
                                                                <button type="button" class="btn btn-primary" id="ApprovalSave"  onclick ="window.location.href='OpportunityList.jsp';">Finish</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="ConfirmationPopUp_Btn" data-toggle="modal" data-target="#ConfirmationPopUp" style="display: none;">Delete PopUp</button>
                                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
						</fieldset>
						
						
						
						
						
						
						
			  <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"> Questions :</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <div class="form-check form-check-inline">
                                                                <div class="col-md-1">
                                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-check-label" for="inlineCheckbox1">Add developer Name</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Add</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>			
						
						     <!-- Intake OpportunityTemplate modal-->
    <div class="modal fade bd-example-modal-lg" id="myFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Opportunity Template</h5>
                    <button type="button" class="close" id="temp_close_id" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TemplateFields">
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="apmid_temp" name="apmid_temp" class="Template_Field" value="" disabled="disabled" checked=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Id</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="apmid_temp1" name="apmid"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appName_temp" name="appName_temp" class="Template_Field" value="" disabled="disabled" checked=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Name</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appName_temp1" name="appName"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="creation_date_temp" name="creation_date_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Creation Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" id="creation_date_temp1" placeholder="mm/dd/yyyy" name="creation_date"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="source_temp" name="source_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Request Source</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="source_temp1" name="source"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="status_temp" name="status_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Status</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="status_temp1" name="status"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="request_type_temp" name="request_type_temp" class="Template_Field" value="" disabled="disabled" checked ="">  </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Request Type</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control" id="request_type_temp1" name="request_type_temp">
                                        <option label="Decommission" class="control-label" for="opportunity">Decommission</option>
                                        <option label="Archive" class="control-label" for="opportunity">Archive</option>
                                        <option label="To" be="" retrive="" class="control-label" for="opportunity">To be retrive</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="requester_temp" name="requester_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Requester</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="requester_temp1" name="requester"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appdesc_temp" name="appdesc_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Descrpition</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appdesc_temp1" name="appdesc"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appowner_temp" name="appowner_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appowner_temp1" name="appowner"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="businessowner_temp" name="businessowner_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Business Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="businessowner_temp1" name="businessowner"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="sme_temp" name="sme_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Development Owner/SME</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="sme_temp1" name="sme"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="billcode_temp" name="billcode_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Billing Code</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="billcode_temp1" name="billcode"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="buisnesssegment_temp" name="buisnesssegment_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Buisness Segment</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="buisnesssegment_temp1" name="buisnesssegment"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="buisnessunit_temp" name="buisnessunit_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Buisness Unit</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="buisnessunit_temp1" name="buisnessunit"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="keyfunction_temp" name="keyfunction_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Key Function</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="keyfunction_temp1" name="keyfunction"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="pscontact_temp" name="pscontact_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Program or Segment Contact</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="pscontact_temp1" name="pscontact"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="date_type_temp" name="date_type_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Data Type</label> </div>
                                <div></div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control"
                                        id="date_type_temp1" name="date_type_temp">
                                        <option label="EMR" system="" class="control-label"
                                            for="opportunity">EMR System</option>
                                        <option label="ERP" data="" class="control-label"
                                            for="opportunity">ERP Data</option>
                                        <option label="Financial" data="" class="control-label"
                                            for="opportunity">Financial Data</option>
                                        <option label="HealthCare" data="" class="control-label"
                                            for="opportunity">HealthCare Data</option>
                                        <option label="HR" data="" class="control-label"
                                            for="opportunity">HR Data</option>
                                        <option label="MR/HR" data="" class="control-label"
                                            for="opportunity">MR/HR Data</option>
                                        <option label="Other" dat="" class="control-label"
                                            for="opportunity">Other Data</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="if_other_data_temp" name="if_other_data_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">If Other Data</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="if_other_data_temp1" name="if_other_data"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="arcdecomm_temp" name="arcdecomm_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Please describe your needs for Archival and Decommission Service</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="arcdecomm_temp1" name="arcdecomm"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="completion_date_temp" name="completion_date_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Desired Completion Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" id="completion_date_temp1" placeholder="mm/dd/yyyy" name="completion_date"> </div>
                            </div>
                            <br>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary submitDisable" onclick="validateForm()">Add Template</button>
                </div>
            </div>
        </div>
    </div>    
   <!-- Triage Template modal-->
        <div class="modal fade triage-example-modal-lg" id="myFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Triage Template</h5>
                    <button type="button" class="close" id="triage_temp_close_id" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="Templatevalues" >
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appId_temp" name="appId" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">APM Id</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>        
                            </div>        
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationName_temp" name="appName" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">APM Name</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationDesc_temp" name="appDesc" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application Description</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
							</div>
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationOwner_temp" name="appOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="busOwner_temp" name="busOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Business Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="devOwner_temp" name="devOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Developement Owner or SME</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>   
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="billing_Code_temp" name="billing_Code" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Billing Code</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>           
                            <br>   
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="business_Segment_temp" name="biling_Segment" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Billing Segement</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" name="biling_Segment"> </div>
                             </div>           
                             <br> 
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="busUnit_temp" name="busUnit" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Business Unit</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
						    </div>    
                             <br>
							<div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="segment_contact_temp" name="segment_contact" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Program or Segement Contact</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
							</div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="logic_Grp_temp" name="logic_Grp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Logical Grouping</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br> 
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Preliminary_CBA_temp" name="Preliminary_CBA" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Preliminary CBA</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="funding_Avl_temp" name="funding_Avl" class="Template_Values" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Funding available</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                    </select>
                               </div>
                            </div>     
							<br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="prgFunder_temp" name="prgFunder" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Program Funder</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
							<div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="PrjInfo_temp" name="PrjInfo" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Project Portfolio Information</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Decom_date_temp" name="Decom_date" class="Template_Values" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Project Decomission Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" placeholder="mm/dd/yyyy"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="infrastructure_impact_temp" name="infrastructure_impact" class="Template_Values" value="" >  </div>
                                <div class="col-md-2">  <label class="control-label" for="Triage">Infrastructure Impact</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                        </select> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="nmbr_of_infrastructure_components_temp" name="nmbr_of_infrastructure_components" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Number of Infrastructure Components</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                             </div>    
                             <br>
                             <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="archival_Sol_temp" name="archival_Sol" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Archival Solution</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                    </select> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Status_temp" name="Status" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Status/Notes</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="decomAnalyst_temp" name="decomAnalyst" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Decom Analyst</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="rationalization_type_temp" name="rationalization_type" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Rationalization Type</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Replace" class="control-label" for="Triage">Replace</option>
                                        <option label="Retire" class="control-label" for="Triage">Retire</option>
                                        <option label="Combine" class="control-label" for="Triage">Combine</option>
                                        <option label="Other" class="control-label" for="Triage">Other</option>
                                    </select> </div>
                            </div>    
                             <br>
                             <div class="row" style = "display:none;">
                                <div class="col-md-1"> <input type="hidden" id="If_other_please_describe_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If other, please describe </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                             </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appPlatfrm_temp" name="appPlatfrm" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application platform</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Mainframe" class="control-label" for="Triage">Mainframe</option>
                                        <option label="Distibuted - Unix" class="control-label" for="Triage">Distibuted - Unix</option>
                                        <option label="Windows" class="control-label" for="Triage">Windows</option>
                                        <option label="hybrid" class="control-label" for="Triage">hybrid</option>
                                        <option label="Others" class="control-label" for="Triage">Others</option>
                                     </select>  </div>
                            </div>            
                            <br>
                            <div class="row" style="display:none;">
                                <div class="col-md-1"> <input type="hidden" id="If_Other_describe_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If Other,please describe </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="app_and_data_hosted_temp" name="app_and_data_hosted_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Is application and Data hosted externally?</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No           </div>        
                            </div>           
                            <br>
                            <div class="row" style="display:none;">
                                <div class="col-md-1"> <input type="hidden" id="vendor_temp" name="" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If yes,vendor?Location?</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="compliance_temp" name="compliance_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any compliance or legal drivers determining retirement by a certain date </label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row" style="display:none;">
								<div class="col-md-1"><input type="hidden" id="describe_temp" name="" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If yes above,please describe</label></div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Financialdate_temp" name="Financialdate_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any business or financial drivers determining retirement by a certain date?Eg.,contract expiring</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row" style="display:none;">
                                    <div class="col-md-1"><input type="hidden" id="plsdescribe_temp" name="" class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">If Yes above,please describe</label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="TechincalDeterminingdate_temp" name="TechincalDeterminingdate_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any technical drivers determining retirement by a certain date?.(Eg server end of life ,support,software,end of life,support)</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row" style="display:none;">
                             <div class="col-md-1"> <input type="hidden" id="pls_describe_temp" name="" class="Template_Values" value="" > </div>
                            <div class="col-md-2"> <label class="control-label" for="Triage">If Yes above,please describe</label> </div>
                            <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="useforArchival_temp" name="useforArchival " class="Template_Values" value=""> </div> 
								<div class="col-md-2"> <label class="control-label" for="Triage">Please describe business need/use for Archival</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> </div>    
                             <br>
                             <div class="row">
                                <div class="col-md-1">
                                     <input type="checkbox" id="highlevelapplicationdata_temp" name="highlevelapplicationdata " class="Template_Values" value="" > </div>
                                     <div class="col-md-2"> <label class="control-label" for="Triage">Please describe at high-level your applications data </label> </div>
                                     <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="ideaNmbr_temp" name="ideaNmbr " class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Idea Number</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35">  </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="DemandNmbr" name="DemandNmbr " class="Template_Values" value="" > </div> <div class="col-md-2"> <label class="control-label" for="Triage">Demand Number </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" name="DemandNmbr"> </div>
                            </div>    
                            <br>
                            <div class="row">
									<div class="col-md-1"> <input type="checkbox" id="PrjNmbr_temp" name="PrjNmbr " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Project Number </label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                    <div class="col-md-1"> <input type="checkbox" id="PrjctTaskNmbr_temp" name="PrjctTaskNmbr " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Project Task Number </label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                             <div class="row">
                                     <div class="col-md-1"> <input type="checkbox" id="Bigrock_temp" name="Bigrock " class="Template_Values" value="" > </div>
                                     <div class="col-md-2"> <label class="control-label" for="Triage">Big Rock </label> </div>
                                     <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>
                              </div>
                             <br>
                            <div class="row">
                                   <div class="col-md-1"> <input type="checkbox" id="DenialRsn_temp" name="DenialRsn " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Denial Reason </label>  </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>     <br> </div>
                                       </form>
                                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary submitDisable" onclick="validateTriage()">Add Template</button>
                </div>
		</div>
		</div>
		</div>
	<!-- Triage Ssummary Template modal-->                                        
	 <div class="modal fade triage-summary-example-modal-lg" id="myFormModal"
                   tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                      aria-hidden="true">
                   <div class="modal-dialog modal-lg" role="document">
                     <div class="modal-content">
                      <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Triage Summary Template</h5>
                    <button type="button" class="close" id="TriageTempSummaryCloseId" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TriSummTemplate" >
                                   <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="ideaNumber_temp" name="ideaNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Idea Number</label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DemandNumber_temp" name="DemandNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Demand Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35" name="DemandNmbr"> </div>
									</div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjNumber_temp" name="PrjNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjctTaskNumber_temp" name="PrjctTaskNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Task Number </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
									</div>    
                                     <br>
                                    <div class="row">
                                            <div class="col-md-1"> <input type="checkbox" id="BigrockSumm_temp" name="BigrockSumm_temp" class="Template_Summary_Values" value="" ></div>
                                            <div class="col-md-2"> <label class="control-label" for="Triage">Big Rock </label> </div>
                                            <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No</div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DenialReason_temp" name="DenialReason_temp" class="Template_Summary_Values" value="" ></div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Denial Reason </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>     <br> </div>
                                       </form>
                                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary SubmitDisableTriSumm" onclick="validateTriageSummary()">Add Template</button>
                </div>
		</div>
		</div>
		</div>                                     
<!-------Oppurtunity Add popup---------->
    <div class="modal" id="AddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "add_close_id" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="label"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">
                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="types" class="form-control" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidefield" id="check" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="number"  name="number1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="rdo" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="radio_number"  name="radio_number">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="drop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="drop_number"  name="drop_number">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="options">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="mandatory" class="form-control" name="mandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="submit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>    
<!-------Triage Add popup---------->
    <div class="modal" id="AddTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "add_Triage_close_id" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Triagelabel"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="Triage_project_name" name="project_name" value="">
                <input type="text" id="Triage_appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="Triage_servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="Triageidname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="Triagetypes" class="form-control" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row TriageHideField" id="TriageCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriageNumber"  name="TriageNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriageRadioNumber"  name="TriageRadioNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="TriageDropNumber"  name="TriageDropNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="TriageOptions">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="Triagemandatory" class="form-control" name="mandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="submitTriage" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
    <!-------Triage Summary Add popup---------->
    <div class="modal" id="TiageSummAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "TriageSummAddCloseId" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabel"  name="TriSummLabel" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">
                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Type:</label>
                            <select id="TriSummTypes" class="form-control" name="TriSummTypes" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidefield" id="TriSummCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriSummNumber"  name="TriSummNumber1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriSummRadioNbr"  name="TriSummRadioNbr">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of Options:</label>
                            <input type="text" class="form-control" id="TriSummDropNbr"  name="TriSummDropNbr">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="TriageSummaryOptions">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Mandatory:</label>
                            <select id="TriSummMandatory" class="form-control" name="TriSummMandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>   
      </div>
      <div class="modal-footer">
        <button type="button" id ="TriSummSubmit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
 
 <!-- Assessment Common Add Popup -->
 
     <div class="modal" id="AssessAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "AssessAddCloseId" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
             <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Section:</label>
                            <select id="AssessSection" class="form-control" name="AssessSection" required >
                                <option value="ApplicationInformation" selected>Application Information</option>
                                <option value="DataCharacteristics">Data Characteristics</option>
                                <option value="ComplianceCharacteristics">Compliance Characteristics</option>
                                <option value="ArchivalConsumption">Archival Consumption</option>
                                <option value="ContractInformation">Contract Information</option>
                            </select>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="AssessLabel"  name="AssessLabel" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">
                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="AssessTypes" class="form-control" name="AssessTypes" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row AssessHideField" id="AssessCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="AssessCheckNumber"  name="AssessCheckNumber1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row AssessHideField" id="AssessRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="AssessRadioNumber"  name="AssessRadioNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row AssessHideField" id="AssessDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="AssessDropNumber"  name="AssessDropNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="AssessOptions">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="AssessMandatory" class="form-control" name="AssessMandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="AssessAddSubmit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>    
 
  <!--Delete pop up-->
         <div class="modal" id="DeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="delete_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequence1"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="submit2" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>   
<!--Triage Delete pop up-->
         <div class="modal" id="DeleteTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="TriageDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequenceTriageDelete"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>                                      
   <!-- Triage Summary Delete Pop up -->
        <div class="modal" id="TriageSummaryDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="TriSummDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="TriSummSequence"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>    

<!-- AssessmentCommon Delete Pop Up -->

<div class="modal" id="AssessDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="AssessDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="AssessSequence"/>
                    <input type="hidden" id="DeleteSection"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="AssessDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>  

<!-- Edit pop up -->
    <div class="modal" id="EditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="edit_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Label_modify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="text" id="seq_num" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="submit1" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  
 <!--Triage Edit pop up -->
    <div class="modal" id="EditTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="TriageEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="TriageLabelModify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="TriageEditMandatory" class="form-control" name="TraigeEditMandatory" required >
                                <option value = "Yes" >Yes</option>
                            </select>
                        </div>
                    </div>
                </div>   <input type="text" id="TriageEditSeqNum" name="TriageEditSeqNum" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

  <!-- Triage Summary Edit pop up -->
    <div class="modal" id="TriSummEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="TriSummEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabelModify"  name="TriSummlabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="TriSummSeqNum" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

<!--  Assessment Common Edit Pop up -->

 <div class="modal" id="AssessEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="AssessEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="Assessment">Label:</label>
                            <input type="text" class="form-control" id="AssessLabelModify"  name="Assesslabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="AssessSeqNum" name="" value="" style="display:none;">
                <input type="text" id="EditSection" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="AssessEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div> 
        
	 <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button" ><i class="fa fa-arrow-up"></i></a> 					
						
					</form>
					
					
					
					 
				</div>
			</div>
		</div>
	</section>
  <div class="modal" id="DeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="DeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this Row permanently?</p>
                    <input type="hidden" id="Sequence"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="DeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>  
  <!-- Modal -->
                    <div class="modal fade" id="myModal modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" style="width:1000px">
                            <div id="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel" style="text-align: center"><b>List of
                                        Users</b></h4>
                                    <input type="checkbox" name="signorder" id="signorder" style="margin-left: 245px;"> <b>Set signing order</b>
                                    <input class="searchbox" id="search_bar" type="text" placeholder="Search User"
                                           name="search" style="font-size: 15px"/>
                                </div>
                                <div class="modal-body" style="width: 500px" id="user_list_div_id_name">

                                </div>
                                <div class="modal-footer" style="height: 80px;padding: 20px">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" name="email_id" id="email_id"
                                            data-dismiss="modal">Send Email
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div> 
  
    <div class="modal" id="ConfirmationPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmation for Approval</h5>
        <button type="button" id ="ConfirmationClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">By Approving this opportunity overall approval for intake module will be confirmed as approved.</p><br/><p style="font-size:20px;"> Do you want to allow this?</p>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="ConfirmationYes" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" id="ConfirmationNo">No</button>
      </div>
    </div>
  </div>
</div>  
  
  
  
  </div> <!-- main-page -->
 </div>  <!-- content-container -->
</div>   <!-- content-wrapper -->

</div> <!-- main-wrapper -->
<script src ="js/IntakeDetails/StakeHolder/StakeHolderDataRetrieve.js"></script>
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
      <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
       <script src="js/toastr/toastr.min.js"></script>
       <!-- Intake Stakeholder -->
     
     
      
    <script src="js/Opportunity/AddFeatureFunctionality.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/AddFeatureAjaxCall.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/EditDeleteToggle.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/EditDeleteAjaxCall.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/TemplateFeature.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/IntakeDetailsOpportunitySave.js"></script>
    
    <!-- Triage js file -->
    
    <script src="js/IntakeDetails/IntakeTriage/IntakeTriage.js"></script>
    <script src="js/IntakeDetails/IntakeTriage/AddTemplateTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/AddFeatureAjaxCallTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/EditDeleteToggleTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/EditDeleteAjaxCallTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/AddFeatureFunctionalityTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/IntakeTriageSave.js"></script>
     
     <!-- Intake triage Summary -->
     
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeletAjaxCallTriageSummary.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummarySave.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/AddFeatureFunctionality.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/TriageSummaryAddFeatureAjaxCall.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeleteToggle.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummaryTemplate.js"></script>
     
     <!-- Intake Assessment -->
     <script src="js/IntakeDetails/IntakeAssessment/ApplicationInformation/ApplicationDetailsFieldFunctionality.js"></script>  
     <script src="js/IntakeDetails/IntakeAssessment/Common/AssessmentAddAjaxCall.js"></script>  
     <script src="js/IntakeDetails/IntakeAssessment/Common/AssessmentAddFunctionality.js"></script>
     <script src="js/IntakeDetails/IntakeAssessment/Common/EditDeleteToggle.js"></script>
     <script src="js/IntakeDetails/IntakeAssessment/Common/AssessEditDeleteAjaxCall.js"></script>
     <script src="js/IntakeDetails/IntakeAssessment/Common/IntakeAssessmentSave.js"></script>
     
    
     
      
      
      <script src ="js/IntakeDetails/StakeHolder/IntakeStakeHolderAddRow.js"></script>
      <script src ="js/IntakeDetails/StakeHolder/IntakeStakeHolderSave.js"></script>
      
             <script src="js/IntakeDetails/IntakeApproval/IntakeApprovalSave.js"></script>
       <script src="js/IntakeDetails/IntakeApproval/IntakeApprovalDataRetrieve.js"></script>
     
     
      
      
 
      
       
     
     

 <script>
    $(document).ready(function(){
    	$(window).scroll(function () {
    			if ($(this).scrollTop() > 50) {
    				$('#back-to-top').fadeIn();
    			} else {
    				$('#back-to-top').fadeOut();
    			}
    		});
    		// scroll body to 0px on click
    		$('#back-to-top').click(function () {
    			$('body,html').animate({
    				scrollTop: 0
    			}, 400);
    			return false;
    		});
    });
    </script>









<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="js/amcharts/themes/light.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>
 <script id ="scripttag"></script>
 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
         
         <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.js"></script>
         <script src = "https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular.js"></script>
          <script src = "https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular-animate.js"></script>
         
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
      <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
       <script src="js/toastr/toastr.min.js"></script>
     <script src="js/notification/notification.js"></script>
     
       
      
      <script>
      var app = angular.module("btn", []);

      app.controller("MainCtrl", function($scope) {
          

        
      });

      </script>
      
  <!-- Intake preview -->
      <script src ="js/IntakeDetails/IntakePreviewDetails/IntakePreviewDataRetrieve.js"></script>
  
  
<script>

jQuery(document).ready(function() {
	// click on next button
	jQuery('.form-wizard-next-btn').click(function() {
		var parentFieldset = jQuery(this).parents('.wizard-fieldset');
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		var next = jQuery(this);
		var nextWizardStep = true;
		parentFieldset.find('.wizard-required').each(function(){
			var thisValue = jQuery(this).val();

			if( thisValue == "") {
				jQuery(this).siblings(".wizard-form-error").slideDown();
				nextWizardStep = false;
			}
			else {
				jQuery(this).siblings(".wizard-form-error").slideUp();
			}
		});
		if( nextWizardStep) {
			next.parents('.wizard-fieldset').removeClass("show","400");
			currentActiveStep.removeClass('active').addClass('activated').next().addClass('active',"400");
			next.parents('.wizard-fieldset').next('.wizard-fieldset').addClass("show","400");
			jQuery(document).find('.wizard-fieldset').each(function(){
				if(jQuery(this).hasClass('show')){
					var formAtrr = jQuery(this).attr('data-tab-content');
					jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function(){
						if(jQuery(this).attr('data-attr') == formAtrr){
							jQuery(this).addClass('active');
							var innerWidth = jQuery(this).innerWidth();
							var position = jQuery(this).position();
							jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
						}else{
							jQuery(this).removeClass('active');
						}
					});
				}
			});
		}
	});
	//click on previous button
	jQuery('.form-wizard-previous-btn').click(function() {
		var counter = parseInt(jQuery(".wizard-counter").text());;
		var prev =jQuery(this);
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		prev.parents('.wizard-fieldset').removeClass("show","400");
		prev.parents('.wizard-fieldset').prev('.wizard-fieldset').addClass("show","400");
		currentActiveStep.removeClass('active').prev().removeClass('activated').addClass('active',"400");
		jQuery(document).find('.wizard-fieldset').each(function(){
			if(jQuery(this).hasClass('show')){
				var formAtrr = jQuery(this).attr('data-tab-content');
				jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function(){
					if(jQuery(this).attr('data-attr') == formAtrr){
						jQuery(this).addClass('active');
						var innerWidth = jQuery(this).innerWidth();
						var position = jQuery(this).position();
						jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
					}else{
						jQuery(this).removeClass('active');
					}
				});
			}
		});
	});
	//click on form submit button
	jQuery(document).on("click",".form-wizard .form-wizard-submit" , function(){
		var parentFieldset = jQuery(this).parents('.wizard-fieldset');
		var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
		parentFieldset.find('.wizard-required').each(function() {
			var thisValue = jQuery(this).val();
			if( thisValue == "" ) {
				jQuery(this).siblings(".wizard-form-error").slideDown();
			}
			else {
				jQuery(this).siblings(".wizard-form-error").slideUp();
			}
		});
	});
	// focus on input field check empty or not
	jQuery(".form-control").on('focus', function(){
		var tmpThis = jQuery(this).val();
		if(tmpThis == '' ) {
			jQuery(this).parent().addClass("focus-input");
		}
		else if(tmpThis !='' ){
			jQuery(this).parent().addClass("focus-input");
		}
	}).on('blur', function(){
		var tmpThis = jQuery(this).val();
		if(tmpThis == '' ) {
			jQuery(this).parent().removeClass("focus-input");
			jQuery(this).siblings('.wizard-form-error').slideDown("3000");
		}
		else if(tmpThis !='' ){
			jQuery(this).parent().addClass("focus-input");
			jQuery(this).siblings('.wizard-form-error').slideUp("3000");
		}
	});
});





</script>



</body>
</html>
