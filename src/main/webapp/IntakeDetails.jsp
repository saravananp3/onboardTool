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


<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/Intake/Intake.css" type="text/css" />
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script>
</head>
<body class="top-navbar-fixed" onload="myFunction()">
	<form class="form-signin" name="loginForm" method="post">
		<div class="main-wrapper">
			<!-- ========== TOP NAVBAR ========== -->
			<nav class="navbar top-navbar bg-white box-shadow">
				<div class="container-fluid">
					<div class="row">
						<div class="navbar-header no-padding">
							<a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
								<img src="images/logo1.png" alt="Onboarding Tool" class="logo">
							</a> <span class="small-nav-handle hidden-sm hidden-xs"><i
								class="fa fa-outdent"></i></span>
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse" data-target="#navbar-collapse-1"
								aria-expanded="false">
								<span class="sr-only">Toggle navigation</span> <i
									class="fa fa-ellipsis-v"></i>
							</button>
							<button type="button" class="navbar-toggle mobile-nav-toggle">
								<i class="fa fa-bars"></i>
							</button>
						</div>


						<input type="text" id="project_name" name="project_name"
							style="display: none;"> <input type="text"
							id="appln_name" name="appln_name" style="display: none;">

						<div class="collapse navbar-collapse" id="navbar-collapse-1">

							<!-- /.nav navbar-nav -->
							<ul class="nav navbar-nav navbar-right">
								<li><a href="#"><span id="nav_userid"></span>logged in
										as &nbsp;<span id='nav_role'></span></a></li>

								<li><a href="logout.jsp" class=" text-center"><i
										class="fa fa-sign-out"></i> Logout</a></li>
							</ul>

						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</nav>
			<div class="content-wrapper">
				<div class="content-container">
					<!-- ========== LEFT SIDEBAR ========== -->
					<div
						class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
						<div class="sidebar-content" id='jqxWidget'>

							<div class="sidebar-nav">
								<ul class="side-nav color-gray">
									<li class="nav-header"><span class="">Main Category</span>
									</li>
									<li id='home' item-selected='true'><a
										href="OpportunityList.jsp"><i class="fa fa-home"></i> <span>Home</span>
									</a></li>

									<%--   <li class="nav-header">
                                       <a href="AppEmphasize_EditProject.jsp"><span class="">Plan and pirority</span></a>
                                   </li>--%>
									<li class="has-children"><a href=""><i
											class="fa fa-archive"></i> <span>Plan and pirority</span> <i
											class="fa fa-angle-right arrow"></i></a>
										<ul class="child-nav">
											<li><a href="AppEmphasize_EditProject.jsp"
												class="active-menu"> <span>Project Information</span></a></li>
											<li><a href="AppEmphasize_Application.jsp"
												class="active-menu"> <span>Application
														Information</span></a></li>
											<li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application
														Complexity</span></a></li>
											<li><a href="AppEmphasize_PrioritizedApplications.jsp">
													<span>Prioritized Applications</span>
											</a></li>
											<li><a href="AppEmphasize_Preview.jsp"> <span>Review
														Page</span></a></li>
										</ul></li>

									<li class="has-children"><a href=""><i
											class="fa fa-file-text"></i> <span>Intake Module</span> <i
											class="fa fa-angle-right arrow"></i></a>
										<ul class="child-nav">
											<li><a href="Applications.jsp" class="active-menu">
													<span>Application Details</span>
											</a></li>
											<li><a href="Intake_Business.jsp"> <span>Business
														Details</span></a></li>
											<li><a href="Intake_TechnicalDetails.jsp"> <span>Technical
														Details</span></a></li>
											<li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive
														Requirements</span></a></li>
											<li><a href="Intake_ReviewPage.jsp"> <span>Review
														Page</span></a></li>
										</ul></li>

									<li class="has-children"><a href=""><i
											class="fa fa-map-signs"></i> <span>Archive Execution
												Module</span> <i class="fa fa-angle-right arrow"></i></a>
										<ul class="child-nav">
											<li><a href="Archive_Execution.jsp" class="active-menu">
													<span>Archive Execution</span>
											</a></li>
											<li><a href="archivesummary.jsp"> <span>Archive
														summary</span></a></li>

										</ul></li>

									<li class="has-children"><a href=""><i
											class="fa fa-paint-brush"></i> <span>Report Module</span> <i
											class="fa fa-angle-right arrow"></i></a>
										<ul class="child-nav">
											<li><a href="RoleUIDashboard.jsp" class="active-menu">
													<span>Reports Dashboard</span>
											</a></li>
											<li><a href="RoleDashboard.jsp" class="active-menu">
													<span>Role Dashboard</span>
											</a></li>
											<li><a href="ProjectDashboard.jsp"> <span>Project
														Dashboard</span></a></li>
											<li><a href="ApplicationDashboard.jsp"> <span>Application
														Dashboard</span></a></li>
										</ul></li>
								</ul>

							</div>
							<!-- /.sidebar-nav -->
						</div>
						<!-- /.sidebar-content -->
					</div>
					<!-- /.left-sidebar -->
					<div class="main-page">
						<div class="container-fluid">
							<div class="row page-title-div">
								<div class="col-sm-6">
									<h2 class="title">Intake Information</h2>
								</div>
							</div>
							<!-- /.row -->
							<div class="row breadcrumb-div">
								<div class="col-sm-6">
									<ul class="breadcrumb">
										<li><a href="OpportunityList.jsp"><i class="fa fa-home"></i>
												Home</a></li>
										<li><a href="AppEmphasize_EditProject.jsp">Intake</a></li>

									</ul>
								</div>



							</div>
							<!-- /.row -->
						</div>
						<section>
							<div class="row">
								<div class="container">
									<div class="main">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<a class="collapsed" data-toggle="collapse"
														data-parent="#panels1" href="#collapse1">Opportunity</a>
												</h4>
											</div>
											<div id="collapse1" class="panel-collapse collapse in"
												name="collapse">
												<div class="panel-body">
													<div id="inputFields">
														
													</div>
													<div class="col-md-12">
															<div class="col-md-1">
																<button type="button" class="btn btn-primary"
																	style="padding-top: 5px; padding-left: 10px; float: left;"
																	location.href='Project_List.jsp';">Back</button>
															</div>
															<div class="col-md-4 dropup"
																style="padding-top: 10px; padding-right: 10px; float: right;">

																<button type="button" class="btn btn-primary"
																	id="template" data-toggle="modal"
																	data-target=".bd-example-modal-lg">Template</button>
																<button class="btn btn-primary dropdown-toggle "
																	type="button" data-toggle="dropdown">
																	Actions <span class="caret"></span>
																</button>
																<ul class="dropdown-menu">
																	<li><a href="#" id="add" data-toggle="modal"
																		data-target="#AddPopUp" class="fa fa-plus"
																		style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
																	<li><a href="#" id="Edit" class="fa fa-edit"
																		style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
																	<li><a href="#" id="Delete" class="fa fa-trash"
																		style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
																</ul>
																<button type="submit" class="btn btn-primary"
																	id="create">Create</button>
																<button type="button" class="btn btn-primary pull-right"
																	id="editpopup_btn" data-toggle="modal"
																	data-target="#EditPopUp" style="display: none;">Edit
																	PopUp</button>
																<button type="button" class="btn btn-primary pull-right"
																	id="deletepopup_btn" data-toggle="modal"
																	data-target="#DeletePopUp" style="display: none;">Delete
																	PopUp</button>
															</div>
														</div>
													<!--  <div class="form-group">
	               <button type="button" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary  pull-right" id="create">Use Exists Que</button>
	               </div> -->
												</div>

											</div>
										</div>

									</div>

									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">
														Questions :</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<form>
														<div class="form-group">

															<div class="form-check form-check-inline">
																<div class="col-md-1">
																	<input class="form-check-input" type="checkbox"
																		id="inlineCheckbox1" value="option1">
																</div>
																<div class="col-md-6">
																	<label class="form-check-label" for="inlineCheckbox1">Add
																		developer Name</label>
																</div>
															</div>
														</div>

													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Add</button>
												</div>
											</div>
										</div>
									</div>




									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#panels1" href="#collapse2"
													onclick="switchColors();">Triage Information</a>
											</h4>
										</div>
										<div id="collapse2" class="panel-collapse collapse">
											<div class="panel-body">
												<div class="form-group">
													<label class="control-label" for="oppourtunity">
														APM ID </label> <input type="text" class="form-control" size="35"
														id="apmid" name="apmid" placeholder="Enter App ID">
												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">
														APM Name </label> <input type="text" class="form-control"
														size="35" id="appName" name="appName"
														placeholder="Enter Application Name">
												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">
														Application Description </label> <input type="text"
														class="form-control" size="35" id="appdesc" name="appdesc"
														placeholder="Enter Application Description">

												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">
														Application Owner </label> <input type="text" class="form-control"
														size="35" id="appowner" name="appowner"
														placeholder="Enter Application Owner">

												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">
														Business Owner </label> <input type="text" class="form-control"
														size="35" id="businessowner" name="businessowner"
														placeholder="Enter Business Owner">

												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">
														Development Owner or SME </label> <input type="text"
														class="form-control" size="35" id="sme" name="sme"
														placeholder="Enter the details">

												</div>

												<div class="form-group">
													<label class="control-label" for="oppourtunity">
														Billing code </label> <input type="text" class="form-control"
														size="35" id="billcode" name=""
														billcode"" placeholder="Enter Billing Code">

												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">Business
														Segment </label> <input type="text" class="form-control" size="35"
														id="businesssegment" name="businesssegment"
														placeholder="Enter Business Segment">

												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">Business
														Unit</label> <input type="text" class="form-control" size="35"
														id="businessunit" name="businessunit"
														placeholder="Enter Business Unit">
												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">Key
														Function</label> <input type="text" class="form-control" size="35"
														id="keyfunction" name="keyfunction"
														placeholder="Enter Keyfunction">
												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">Program
														or Segment Contact</label> <input type="text" class="form-control"
														size="35" id="pscontact" name="pscontact"
														placeholder="Enter Program or Segment Contact">
												</div>

												<div class="form-group">

													<label class="control-label" for="oppourtunity">
														Logical Grouping </label> <input class="form-control"
														list="GroupingOptions" name="lgroup" id="lgroup"
														placeholder="Select or enter">
													<datalist id="GroupingOptions">
														<option value="Decommision">
														<option value="Archive only">
														<option value="Archive & Decommision">
													</datalist>

												</div>
												<div class="form-group">
													<label class="control-label" for="oppourtunity">Preliminary
														CBA</label> <input type="text" class="form-control" size="35"
														id="preliminary" name="preliminary"
														placeholder="Enter Preliminary CBA">
												</div>

												<div class="form-group">
													<label class="control-label" for="oppourtunity">Funding
														available</label>
													<div class="col-md-1">
														<div class="form-check form-check-inline">
															<input class="form-check-input" type="radio"
																name="inlineRadioOptions" id="inlineRadio1"
																value="option1"> <label class="form-check-label"
																for="inlineRadio1">Yes</label>
														</div>
													</div>
													<div class="col-md-1">
														<div class="form-check form-check-inline">
															<input class="form-check-input" type="radio"
																name="inlineRadioOptions" id="inlineRadio2"
																value="option2"> <label class="form-check-label"
																for="inlineRadio2">No</label>
														</div>
													</div>
												</div>


												<div class="form-group">
													<button type="button"
														class="btn btn-primary btn-lg pull-right" id="create">Submit</button>
													&nbsp;
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
	<!-- Intake OpportunityTemplate modal-->
	<div class="modal fade bd-example-modal-lg" id="myFormModal"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Opportunity
						Template</h5>
					<button type="button" class="close" id="temp_close_id"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form name="myForm">
						<div class="form-group" id="TemplateFields">
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="apmid_temp" name="apmid_temp"
										class="Template_Field" value="" disabled="disabled" checked="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">APM ID</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="apmid_temp1" name="apmid">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="appName_temp" name="appName_temp"
										class="Template_Field" value="" disabled="disabled" checked="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">APM Name</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="appName_temp1" name="appName">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="creation_date_temp"
										name="creation_date_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Creation
										Date</label>
								</div>
								<div class="col-md-6">
									<input type="text"
										class="form-control datepicker1 hasDatepicker" size="35"
										id="creation_date_temp1" placeholder="mm/dd/yyyy"
										name="creation_date">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="source_temp" name="source_temp"
										class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Request
										Source</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="source_temp1" name="source">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="status_temp" name="status_temp"
										class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Status</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="status_temp1" name="status">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="request_type_temp"
										name="request_type_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Request
										Type</label>
								</div>
								<div class="col-md-6">
									<select style="width: 100%;" class="form-control"
										id="request_type_temp1" name="request_type_temp">
										<option label="Decommission" class="control-label"
											for="opportunity">Decommission</option>
										<option label="Archive" class="control-label"
											for="opportunity">Archive</option>
										<option label="To" be="" retrive="" class="control-label"
											for="opportunity">To be retrive</option>
									</select>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="requester_temp"
										name="requester_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Requester</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="requester_temp1" name="requester">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="appdesc_temp" name="appdesc_temp"
										class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Application
										Descrpition</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="appdesc_temp1" name="appdesc">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="appowner_temp" name="appowner_temp"
										class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Application
										Owner</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="appowner_temp1" name="appowner">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="businessowner_temp"
										name="businessowner_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Business
										Owner</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="businessowner_temp1" name="businessowner">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="sme_temp" name="sme_temp"
										class="Template_Field" value="" >
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Development
										Owner/SME</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="sme_temp1" name="sme">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="billcode_temp" name="billcode_temp"
										class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Billing
										Code</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="billcode_temp1" name="billcode">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="buisnesssegment_temp"
										name="buisnesssegment_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Buisness
										Segment</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="buisnesssegment_temp1" name="buisnesssegment">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="buisnessunit_temp"
										name="buisnessunit_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Buisness
										Unit</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="buisnessunit_temp1" name="buisnessunit">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="keyfunction_temp"
										name="keyfunction_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Key
										Function</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="keyfunction_temp1" name="keyfunction">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="pscontact_temp"
										name="pscontact_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Program
										or Segment Contact</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="pscontact_temp1" name="pscontact">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="date_type_temp" name="date_type_temp"
										class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Data
										Type</label>
								</div>
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
											for="opportunity">Other Dat</option>
									</select>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="if_other_data_temp"
										name="if_other_data_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">If Other
										Data</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="if_other_data_temp1" name="if_other_data">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="arcdecomm_temp"
										name="arcdecomm_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Please
										describe your needs for Archival and Decommission Service</label>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" size="35"
										id="arcdecomm_temp1" name="arcdecomm">
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-1">
									<input type="checkbox" id="completion_date_temp"
										name="completion_date_temp" class="Template_Field" value="">
								</div>
								<div class="col-md-2">
									<label class="control-label" for="opportunity">Desired
										Completion Date</label>
								</div>
								<div class="col-md-6">
									<input type="text"
										class="form-control datepicker1 hasDatepicker" size="35"
										id="completion_date_temp1" placeholder="mm/dd/yyyy"
										name="completion_date">
								</div>
							</div>
							<br>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="validateForm()">Add Template</button>
				</div>
			</div>
		</div>
	</div>

<!-------Add popup---------->

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
       
	<script src="js/Opportunity/AddFeatureFunctionality.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/AddFeatureAjaxCall.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/EditDeleteToggle.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/EditDeleteAjaxCall.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/TemplateFeature.js"></script>
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
	
	
</html>