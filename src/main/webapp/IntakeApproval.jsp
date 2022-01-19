<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decom3Sixty - Intake</title>

<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
    media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
    media="screen">
 <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/Intake/Intake.css" type="text/css" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
<link rel="stylesheet" href="css/headerIcon/headerIcon.css" media="screen" >
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>

<!--  ========== Three Toggle ========= -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" />
<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/toggleSwitch/toggleSwitch.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
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
  background-color: #1565c0;
  color: #ffffff;
}
.form-wizard .form-wizard-steps li.active::after, .form-wizard .form-wizard-steps li.activated::after {
  background-color: #1565c0;
  left: 50%;
  width: 50%;
  border-color: #1565c0;
}
.form-wizard .form-wizard-steps li.activated::after {
  width: 100%;
  border-color: #1565c0;
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
  /*   font-weight: 700; */
    color: #000;
}

.form-wizard-steps li  i{
	color: rgba(0,0,0,.9);
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
</style>
  <style type="text/css">
         body{
            background:#fff;
        }

        .active1{
        background:#1565c0;
         }
      .page-title-div {
	 background:#1565c0;
	  padding: 15px;
	  
	  
	}
</style>
</head>
<body class="top-navbar-fixed">

<%@include file="Nav-Bar.jspf"%>
		<nav class="nav nav-height-70 nav-font" id="bg-color"
			style="font-size: 14px;">
			<div class="container-fluid" id="container-fluid-margin">
				<div class="row" id="d3s-mt-10">
					<div class="col-lg-12 col-md-12">
						<div class="sub-title" style="color: #fff">
								<a href="OpportunityList.jsp" id="sitetitle1"
									style="color: #fff"><span class="glyphicon glyphicon-home"></span>
									Home</a> >> <a href="IntakeOpportunity.jsp" id="sitetitle1"
									style="color: #fff"> Opportunity </a> >> <a
									href="IntakeTriageSummary.jsp" id="sitetitle1"
									style="color: #fff"> Triage Summary</a> <a
									href="IntakeAssessment.jsp" id="sitetitle1" style="color: #fff">
									Assessment</a> >> <a href="IntakeStakeHolder.jsp"
									id="sitetitle1" style="color: #fff"> StakeHolder</a>
									<a  href="IntakeReviewDetails.jsp" id="sitetitle1" style="color:#fff">
                           			Review Details</a> >>
                                	<a  href="IntakeReviewDetails.jsp" id="sitetitle1" style="color:#fff">
                           			Approval</a>
							</div>
					</div>
				</div>
			</div>
		</nav>
    <form class="form-signin" name="loginForm" method="post">
        <div class="main-wrapper">
              <!-- ========== TOP NAVBAR ========== -->
  <!--  <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/Decom3Sixty_logo.png" alt="Decom3Sxity" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                /.navbar-header
                <div class="tabs-content">
                  <ul class="nav navbar-nav navAlign">
		             <li class="active1"><a href="OpportunityList.jsp" style="color:white;"><i class="fad fa-folders fa-2x iconAlign activeIcon"></i>Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
		              <li><a href="Governance.jsp"><i class="fad fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
		              <li><a href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
		              <li ><a href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
		              <li><a href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right" style = "margin-top:45px;">
                      <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
      </div>
      <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                             <div class="col-sm-6">
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff">
                          <span class="glyphicon glyphicon-home"></span> Home</a> >> 
                         
                          <a  href="IntakeOpportunity.jsp" id="sitetitle1" style="color:#fff">
                           Opportunity</a> >>
                          <a  href="IntakeTriage.jsp" id="sitetitle1" style="color:#fff">
                           Triage</a> >>
                            <a  href="IntakeTriageSummary.jsp" id="sitetitle1" style="color:#fff">
                           TriageSummary</a> >>
                            <a  href="IntakeAssessment.jsp" id="sitetitle1" style="color:#fff">
                           Assessment</a> >>
                            <a  href="IntakeStakeHolder.jsp" id="sitetitle1" style="color:#fff">
                           StakeHolder</a> >> <br>
                           <a  href="IntakeReviewDetails.jsp" id="sitetitle1" style="color:#fff">
                           Review Details</a> >>
                                <a  href="IntakeReviewDetails.jsp" id="sitetitle1" style="color:#fff">
                           Approval</a>
                         </p>

                    </div>

                </div>
			</nav>
      
        </div>
        /.container-fluid
    </nav > -->
			<div class="content-wrapper">
				<div class="content-container">

					<div class="main-page">

						<section>
							<div class="row">
								<div class="container">

									<div class=" col-md-12">
										<div class="form-wizard">
											<form action="" method="post" role="form">
												<br/>
				                                                        	<br/>
												<div class="form-wizard-header nav-font">
													<p style="font-size: 14px;">Fill all the required fields to go next step</p>
													<ul class="list-unstyled form-wizard-steps clearfix">
														<li class="activated"><span>1</span><i>Opportunity</i></li>
														<li class="activated"><span>2</span><i>Triage</i></li>
														<li class="activated"><span>3</span><i>Triage
																Summary</i></li>
														<li class="activated"><span>4</span><i>Assessment</i></li>
														<li class="activated"><span>5</span> <i>Stake
																Holder</i></li>
														<li class="activated"><span>6</span><i>Review</i></li>
														<li class="active"><span>7</span><i>Approval</i></li>
													</ul>
												</div>
												

												

										<!-- 		<div class="panel panel-default">
												 Opportunity Details
													<div class="panel-heading OpportunityInfoPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse1">
																Opportunity Details</a>
														</h4>
													</div>
													<div id="collapse1" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse11" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="OpportunityInfoPreview">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
													Triage Details
													<div class="panel-heading TriageInfoPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse2">
																Triage Details</a>
														</h4>
													</div>
													<div id="collapse2" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse12" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="TriageInfoPreview">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
													Triage Summary Details
													<div class="panel-heading TriageSummInfoPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse3">
																Triage Summary Details</a>
														</h4>
													</div>
													<div id="collapse3" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse13" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="TriageSummInfoPreview">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
													Intake Assessment Details
													<div class="panel-heading AssessmentInfoPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse4">
																Intake Assessment</a>
														</h4>
													</div>
													<div id="collapse4" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse14" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																<div class="panel panel-default">
																	Application Details
													<div class="panel-heading ApplicationInformationPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse41">
																Application Details</a>
														</h4>
													</div>
													<div id="collapse41" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse141" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="ApplicationInformationPreview">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>

															Data Characteristics Details
													<div class="panel-heading DataCharacteristicsPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse42">
																Data Characteristics</a>
														</h4>
													</div>
													<div id="collapse42" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse142" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="DataCharacteristicsPreview">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>

													Compliance Characteristics Details
													<div class="panel-heading ComplianceCharacteristicsPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse43">
																Compliance Characteristics</a>
														</h4>
													</div>
													<div id="collapse43" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse143" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="ComplianceCharacteristicsPreview">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
															
													Archival Consumption Details
													<div class="panel-heading ArchivalConsumptionPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse44">
																Archival Consumption</a>
														</h4>
													</div>
													<div id="collapse44" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse144" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="ArchivalConsumptionPreview">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
															
					
													Contract Information Details
													<div class="panel-heading ContractInformationPreview intakeSection" style="display:none;">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse45">
																Contract Information</a>
														</h4>
													</div>
													<div id="collapse45" class="panel-collapse collapse" >
														<div class="panel-body">
															<div id="collapse145" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div>
																	<table class="IntakePreviewClass" style="border-collapse: collapse;width: 100%;">
																	<tbody id="ContractInformationPreview" style="display:none;">
																	
																	</tbody>
																	</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
													</div>
													</div>
																</div>
															</div>
														</div>
														Stake Holder
													<div class="panel-heading StakeHolderInfoPreview intakeSection">
														<h4 class="panel-title">
															<a class="collapsed" data-toggle="collapse"
																data-parent="#panels1" href="#collapse5">
																Stake Holder</a>
														</h4>
													</div>
													<div id="collapse5" class="panel-collapse collapse">
														<div class="panel-body">
															<div id="collapse15" class="panel-collapse collapse in"
																name="collapse">
																<div class="panel-body">
																	<div id="StakeHolderInfoPreview">
																	</div>
																</div>
															</div>
														</div>
													</div>
													</div> -->
																	
								
												<div class="card-container card">											 
											<!-- ========== Opportunity Details ========== -->
							         <div class="accordion" id="accordionPanelsStayOpenExample">
							          	<div class="accordion-item">
							          		<h2 class="accordion-header" id="panelsStayOpen-headingOne">
							          			<button class="accordion-button" id="accordion-button-clr" type="button" data-bs-toggle="collapse"
							          				data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
							          				aria-controls="panelsStayOpen-collapseOne">Opportunity Details</button>
							          		</h2>
							          		<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne"
							          			data-bs-parent="#accordionPanelsStayOpenExample">
							          			<div class="accordion-body">
													<div>
														<table class="IntakePreviewClass"
															style="border-collapse: collapse; width: 100%;">
															<tbody id="OpportunityInfoPreview"></tbody>
														</table>
													</div>
												</div>
							          		</div>
							          	</div>
							          <!-- ========== Triage Details ========== -->
							          <div class="accordion-item">
							          		<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
							          			<button class="accordion-button collapsed" id="accordion-button-clr" type="button" data-bs-toggle="collapse"
							          				data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">Triage Details</button>
							          		</h2>
							          		<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo"
							          			data-bs-parent="#accordionPanelsStayOpenExample">
							          			<div class="accordion-body">
							          		 		<div>
														<table class="IntakePreviewClass"
															style="border-collapse: collapse; width: 100%;">
															<tbody id="TriageInfoPreview"></tbody>
														</table>
													</div>
							          			</div>
							          		</div>
							          </div>
							          <!-- ========== Triage Summary Details ========== -->
							           <div class="accordion-item">
							          		<h2 class="accordion-header" id="panelsStayOpen-headingThree">
							          			<button class="accordion-button collapsed" id="accordion-button-clr" type="button" data-bs-toggle="collapse"
							          				data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">Triage Summary Details</button>
							          		</h2>
							          		<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree"
							          			data-bs-parent="#accordionPanelsStayOpenExample">
							          			<div class="accordion-body">
							          		 		<div>
														<table class="IntakePreviewClass"
															style="border-collapse: collapse; width: 100%;">
															<tbody id="TriageSummInfoPreview"></tbody>
														</table>
													</div> 
							          			</div>
							          		</div>
							          </div>
							          <!-- ========== Intake Assessment Details ========== -->
							           <div class="accordion-item">
							          		<h2 class="accordion-header" id="panelsStayOpen-headingFour">
							          			<button class="accordion-button collapsed" id="accordion-button-clr" type="button" data-bs-toggle="collapse"
							          				data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">Intake Assessment</button>
							          		</h2>
							          		<div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour"
							          			data-bs-parent="#accordionPanelsStayOpenExample">
																	<div class="accordion-body">
																	<div class="accordion"   id="accordionPanelsStayOpenEx">
																	<!-- ========== Application Details ========== -->
																	
																		<div class="accordion-item">
																			<h2 class="accordion-header"
																				id="panelsStayOpen-heading-4">
																				<button class="accordion-button collapsed"
																					id="accordion-button-clr" type="button"
																					data-bs-toggle="collapse"
																					data-bs-target="#panelsStayOpen-collapse-4"
																					aria-expanded="false"
																					aria-controls="panelsStayOpen-collapse-4">Application Details</button>
																			</h2>
																			<div id="panelsStayOpen-collapse-4"
																				class="accordion-collapse collapse"
																				aria-labelledby="panelsStayOpen-heading-4"
																				data-bs-parent="#accordionPanelsStayOpenEx">
																				<div class="accordion-body">
																					<div>
																						<table class="IntakePreviewClass"
																							style="border-collapse: collapse; width: 100%;">
																							<tbody id="ApplicationInformationPreview"></tbody>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>
																		
																		<!-- ========== Data Characteristics Details========== -->
																		<div class="accordion-item">
																			<h2 class="accordion-header"
																				id="panelsStayOpen-heading-5">
																				<button class="accordion-button collapsed"
																					id="accordion-button-clr" type="button"
																					data-bs-toggle="collapse"
																					data-bs-target="#panelsStayOpen-collapse-5"
																					aria-expanded="false"
																					aria-controls="panelsStayOpen-collapse-5">Data Characteristics</button>
																			</h2>
																			<div id="panelsStayOpen-collapse-5"
																				class="accordion-collapse collapse"
																				aria-labelledby="panelsStayOpen-heading-5"
																				data-bs-parent="#accordionPanelsStayOpenEx">
																				<div class="accordion-body">
																					<div>
																						<table class="IntakePreviewClass"
																							style="border-collapse: collapse; width: 100%;">
																							<tbody id="DataCharacteristicsPreview"></tbody>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>
																			<!-- ==========Compliance Characteristics Details========== -->
																		<div class="accordion-item">
																			<h2 class="accordion-header"
																				id="panelsStayOpen-heading-6">
																				<button class="accordion-button collapsed"
																					id="accordion-button-clr" type="button"
																					data-bs-toggle="collapse"
																					data-bs-target="#panelsStayOpen-collapse-6"
																					aria-expanded="false"
																					aria-controls="panelsStayOpen-collapse-6">Compliance Characteristics</button>
																			</h2>
																			<div id="panelsStayOpen-collapse-6"
																				class="accordion-collapse collapse"
																				aria-labelledby="panelsStayOpen-heading-6"
																				data-bs-parent="#accordionPanelsStayOpenEx">
																				<div class="accordion-body">
																					<div>
																						<table class="IntakePreviewClass"
																							style="border-collapse: collapse; width: 100%;">
																							<tbody id="ComplianceCharacteristicsPreview"></tbody>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>

																<!-- ==========Archival Consumption Details========== -->
																		<div class="accordion-item">
																			<h2 class="accordion-header"
																				id="panelsStayOpen-heading-7">
																				<button class="accordion-button collapsed"
																					id="accordion-button-clr" type="button"
																					data-bs-toggle="collapse"
																					data-bs-target="#panelsStayOpen-collapse-7"
																					aria-expanded="false"
																					aria-controls="panelsStayOpen-collapse-7">Archival Consumption</button>
																			</h2>
																			<div id="panelsStayOpen-collapse-7"
																				class="accordion-collapse collapse"
																				aria-labelledby="panelsStayOpen-heading-7"
																				data-bs-parent="#accordionPanelsStayOpenEx">
																				<div class="accordion-body">
																					<div>
																						<table class="IntakePreviewClass"
																							style="border-collapse: collapse; width: 100%;">
																							<tbody id="ArchivalConsumptionPreview"></tbody>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>

																
															<!-- ==========Contract Information Details========== -->
																		<div class="accordion-item">
																			<h2 class="accordion-header"
																				id="panelsStayOpen-heading-8">
																				<button class="accordion-button collapsed"
																					id="accordion-button-clr" type="button"
																					data-bs-toggle="collapse"
																					data-bs-target="#panelsStayOpen-collapse-8"
																					aria-expanded="false"
																					aria-controls="panelsStayOpen-collapse-8">Contract Information</button>
																			</h2>
																			<div id="panelsStayOpen-collapse-8"
																				class="accordion-collapse collapse"
																				aria-labelledby="panelsStayOpen-heading-8"
																				data-bs-parent="#accordionPanelsStayOpenEx">
																				<div class="accordion-body">
																					<div>
																						<table class="IntakePreviewClass"
																							style="border-collapse: collapse; width: 100%;">
																							<tbody id="ContractInformationPreview"></tbody>
																						</table>
																					</div>
																				</div>
																			</div>
																		</div>
																		</div>
																		
																		</div>
																	</div>
																	
																	</div>
															
																
															
							           <!-- ========== Stake Holder ========== -->
														<div class="accordion-item">
															<h2 class="accordion-header"
																id="panelsStayOpen-headingFive">
																<button class="accordion-button collapsed"
																	id="accordion-button-clr" type="button"
																	data-bs-toggle="collapse"
																	data-bs-target="#panelsStayOpen-collapseFive"
																	aria-expanded="false"
																	aria-controls="panelsStayOpen-collapseFive">Stake
																	Holder</button>
															</h2>
															<div id="panelsStayOpen-collapseFive"
																class="accordion-collapse collapse"
																aria-labelledby="panelsStayOpen-headingFive"
																data-bs-parent="#accordionPanelsStayOpenExample">
																<div class="accordion-body">
																	<div id="StakeHolderInfoPreview"></div>
																</div>
															</div>
														</div>

														<div class="card-header d3s-mt-40" id="cd-header">Intake Approval</div>
											<div ng-app="btn" ng-controller="MainCtrl"></div>
											<div class="panel-collapse" name="collapse">
												<div class="panel-body">
													<div>
														<h2>Approver List</h2>
														<table class="table-bordered" style="width: 100%;">
															<thead>
																<tr>
																	<th style='text-align: center; vertical-align: middle;'>Approver
																		Name</th>
																	<th style='text-align: center; vertical-align: middle;'>Approver
																		Role</th>
																	<th style='text-align: center; vertical-align: middle;'>Approval</th>
																	<th style='text-align: center; vertical-align: middle;'>Action</th>
																</tr>
															</thead>
															<tbody id="ApprovalDetails">
															</tbody>
														</table>
													</div>
													<div class="row">
														<div class="col-6">
															<button type="button" class="btn btn-secondary"
																onclick="location.href='IntakeReviewDetails.jsp';">Prev</button>
														</div>
														<div class="col-6" align="end">
															<button type="button" class="btn btn-primary"
																id="ApprovalSave">Finish</button>
															<button type="button" class="btn btn-primary pull-right"
																id="ConfirmationPopUp_Btn" data-bs-toggle="modal"
																data-bs-target="#ConfirmationPopUp" style="display: none;">Confirmation
																PopUp</button>
															<!-- comment popup button -->
															<button type="button" id="ApprovalComments" data-bs-toggle="modal" data-bs-target="#ApprovalCommentsPopUp" style="display: none;">Comments PopUp</button>
														</div>
													</div>
												</div>
											</div>
										
										   </div>
							          </div>
									</div>
										</div>
						</section>
					</div>
				</div>
			</div>
		</div>

	</form>
	<!-- confirmation Row Pop Up  -->
	<div class="modal" id="ConfirmationPopUp" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Confirmation for Approval</h5>
					<button type="button" id="ConfirmationClose" class="close"
						data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="DeleteForm">
						<div class="modal-body">
							<p style="font-size: 20px;">By Approving this opportunity
								overall approval for intake module will be confirmed as
								approved.</p>
							<br />
							<p style="font-size: 20px;">Do you want to allow this?</p>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="ConfirmationYes" class="btn btn-primary">Yes</button>
					<button type="button" class="btn btn-secondary" id="ConfirmationNo">No</button>
				</div>
			</div>
		</div>
	</div>
	
 
<!-- Comment Pop Up -->
	<div class="modal" id="ApprovalCommentsPopUp"   tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Remarks</h5>
			<button type="button" class="btn-close" id ="ApprovalCommentClose" data-bs-dismiss="modal"
				aria-label="Close"></button>
		</div>
      <div class="modal-body">
                <div class="modal-body">
                <label>comments</label>
             <textarea id="ApprovalCommentId" name="ApprovalCommentSection" rows="4" cols="70"></textarea>
			 </div>
             <input type="hidden" id="ApprovalCommentSeq"/>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-primary" id = "ApprovalCommentOKBtn" >Ok</button>
        <button type="button" class="btn btn-secondary" id = "ApprovalCommentCancelBtn" >Cancel</button>
      </div>
      </div>
    </div>
  </div>
    <!-- Date picker --> 
    
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
         <script src ="js/IntakeDetails/IntakeApproval/IntakeApprovalSave.js"></script>
      
       <!-- Active Icon Color changes  -->
<script>
$(document).on('mouseenter','.active1', function(){
		
		 $('.activeIcon').css('color','#1565c0');
		 
		 
	 });
	 
	 $(document).on('mouseleave','.active1', function(){
			
		 $('.activeIcon').css('color','#fff');
		 
	 });
</script>
      
      <script>
      var app = angular.module("btn", []);

      app.controller("MainCtrl", function($scope) {
          

        
      });

      </script>
    <!-- <script>
        function myFunction() {
            let today = new Date().toISOString().substr(0, 10);
            document.getElementById('creation_date').value = today;
        }
    </script> -->
    </body>
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
    <link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
        type="text/css" media="all" />
         <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
      <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
       <script src="js/toastr/toastr.min.js"></script>
        <script src="js/notification/notification.js"></script>
        <script src="js/IntakeDetails/IntakeApproval/IntakeApprovalDataRetrieve.js"></script>
        
    <script src="js/amcharts/themes/light.js"></script>
   
    <script src="js/icheck/icheck.min.js"></script>
    <script src="js/bootstrap-tour/bootstrap-tour.js"></script>
    <!-- ========== THEME JS ========== -->
    <script src="js/production-chart.js"></script>
    <script src="js/traffic-chart.js"></script>
    <script src="js/task-list.js"></script>
    <!-- ========== THEME JS ========== -->
    <script src="js/main.js"></script>
    <script id ="scripttag"></script>
    <script src="js/navigation/navigation.js"></script>
    <!-- ========== Toastr ========== -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
	
	<!-- ========== BootstrapV5 ========== -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
    
</html>
