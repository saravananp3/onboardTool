<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">

<title>D3Sixty - Archive Requirements</title>
<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">
<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">

<!-- =========== Header Icon ========= -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">


<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="js_in_pages/requirements.css"
	type="text/css" />
<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">





</head>
<!--from  w  w w  . ja  va 2 s.co  m-->

<style>
body {
	background-color: #fff;
	margin: 0;
	padding: 0;
}

.page-title-div {
	background: #1565c0;
	padding: 15px;
}

h1 {
	text-align: center;
	font-family: Tahoma, Arial, sans-serif;
	color: #06D85F;
	margin: 80px 0;
}

.box {
	width: 40%;
	margin: 0 auto;
	background: rgba(255, 255, 255, 0.2);
	padding: 50px;
	border: 2px solid #fff;
	border-radius: 20px/50px;
	background-clip: padding-box;
	text-align: center;
}

.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
	transition: opacity 500ms;
	visibility: hidden;
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}

.popup {
	margin: 210px auto;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	width: 40%;
	position: relative;
}

.popup h2 {
	margin-top: 0;
	color: #333;
	font-family: Tahoma, Arial, sans-serif;
}

.popup .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: black;
}

.popup .close:hover {
	color: black;
}

.popup .content {
	max-height: 30%;
	overflow: auto;
}

.button {
	color: white;
}

@media screen and (max-width: 700px) {
	.box {
		width: 70%;
	}
	.popup {
		width: 70%;
	}
}

#nav_userid {
	color: green;
}

#nav_role {
	color: blue;
}

.ScrollStyle {
	max-height: 350px;
	overflow-y: scroll;
}

.table-title .add-new {
	float: right;
	height: 30px;
	font-weight: bold;
	font-size: 12px;
	text-shadow: none;
	min-width: 100px;
	border-radius: 50px;
	line-height: 13px;
}

.table-title .add-new i {
	margin-right: 4px;
}

table.table td a {
	cursor: pointer;
	display: inline-block;
	margin: 0 5px;
	min-width: 24px;
}

table.table td a.add {
	color: #27C46B;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

table.table td a.add i {
	font-size: 24px;
	margin-right: -1px;
	position: relative;
	top: 3px;
}

table.table .form-control {
	height: 32px;
	line-height: 32px;
	box-shadow: none;
	border-radius: 2px;
}

table.table .form-control.error {
	border-color: #f50000;
}

table.table td .add {
	display: none;
}

td {
	font-weight: bold;
}

/* table { 
	box-shadow: 5px 5px 5px #999; 
	} */
/*END Form Wizard*/
.active1 {
	background: #1565c0;
}

.page-title-div {
	background: #1565c0;
	padding: 15px;
}

.form-wizard .form-wizard-steps {
	margin: -6px 0;
}
</style>

<body class="top-navbar-fixed">

	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();
	System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Grid JSP PAGE-----[INFO]");
	%>
	<%@page language="java"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.text.DateFormat"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	<%@page import="onboard.DBconnection"%>
	<%@page import="java.util.Calendar"%>
	<%@page import="org.owasp.encoder.Encode"%>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	response.setHeader("Expires", "0"); // Proxies.
	DBconnection dBconnection = new DBconnection();

	if (session.getAttribute("username") == null) {
		response.sendRedirect("Login.jsp");

	} else {
		String name = (String) session.getAttribute("ID");
		HttpSession details = request.getSession();
		Connection con = null;
		session.setAttribute("theName", name);
		String roles = (String) details.getAttribute("role");
		String OpportunityName = (String) details.getAttribute("SelectedOpportunity");
		String s = OpportunityName;
		System.out.println("Welcome" + OpportunityName);

		int sumcount = 0;
		Statement st, st2;
		try {

			con = dBconnection.getConnection();
			Statement st1;
	%>

	<form class="form-signin" name="loginForm" method="post">

		<div class="main-wrapper">

			<!--            <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
				<div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/D3Sixty_logo.png" alt="D3Sixty" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                /.navbar-header
                <div class="tabs-content">
                  <ul class="nav navbar-nav headerTab navAlign">
		              <li class="active1"><a href="OpportunityList.jsp" style= "color:#fff;"><i class="fad fa-folders fa-2x iconAlign activeIcon"></i>Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
		              <li><a href="PhaseList.jsp"><i class="fad fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
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
                        
                       
                         <p class="sub-title" style="color:#fff ; margin-right: -26px; "> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a>  >> <a  href="ArchiveRequirementsIntroDetails.jsp" id="sitetitle1" style="color:#fff">
                           Introduction</a> >>
                           <a  href="archiveRequirementsLegacyDetails.jsp" id="sitetitle1" style="color:#fff">
                           Legacy Application Info</a> >>
                           <a  href="archiveRequirementsRetentionDetails.jsp" id="sitetitle1" style="color:#fff">
                           Retention Details</a> >> 
                           <a  href="ArchiveBusinessRequirements.jsp" id="sitetitle1" style="color:#fff">
                           Business Requirements</a> >>Abbreviations</p>
                    

                    </div>

                </div>
			</nav>
      
        </div>
        /.container-fluid
    </nav>
    <br/>
    <br/>
    <br/> -->
			<%@include file="Nav-Bar.jspf"%>
			<nav class="nav nav-height-70 nav-font" id="bg-color"
				style="font-size: 14px;">
				<div class="container-fluid" id="container-fluid-margin">
					<div class="row" id="d3s-mt-10">
						<div class="col-lg-12 col-md-12">
							<div class="sub-title" style="color: #fff">
								<a href="OpportunityList.jsp" id="sitetitle1"
									style="color: #fff"><span class="glyphicon glyphicon-home"></span>
									Home</a> >> <a href="OpportunityGrid.jsp" id="sitetitle1"
									style="color: #fff"><%=Encode.forHtml(OpportunityName)%></a> >>
								<a href="ArchiveDecommPage.jsp" id="sitetitle1"
									style="color: #fff">Requirements</a> >> <a
									href="ArchiveRequirementsIntroDetails.jsp" id="sitetitle1"
									style="color: #fff">Introduction</a> >> <a
									href="archiveRequirementsLegacyDetails.jsp" id="sitetitle1"
									style="color: #fff">Legacy Application Info</a> >> <a
									href="archiveRequirementsRetentionDetails.jsp" id="sitetitle1"
									style="color: #fff">Retention Details</a> >> <a
									href="ArchiveBusinessRequirements.jsp" id="sitetitle1"
									style="color: #fff"> Business Requirements</a> >> <a
									id="sitetitle1" style="color: #fff"> Abbreviations</a>
							</div>
						</div>
					</div>
				</div>
			</nav>


			<%
			} catch (Exception e) {
			e.printStackTrace();
			}

			}
			%>
			<div class="content-wrapper">

				<div class="col-md-12">
					<div style="margin-bottom: -138px;" class="form-wizard">
						<div class="form-wizard-header">

							<ul class="list-unstyled form-wizard-steps clearfix nav-font"
								style="margin-left: 23px;">
								<!-- <p class="nav-font" style="margin-bottom: -52px;">Fill all the required fields to go next step</p> -->

								<li class="activated"
									onclick="location.href='ArchiveRequirementsIntroDetails.jsp;'"><span>1</span><i>Introduction</i></li>
								<li class="activated"
									onclick="location.href='archiveRequirementsLegacyDetails.jsp;'"><span>2</span><i>Legacy
										Application Info</i></li>
								<li class="activated"
									onclick="location.href='archiveRequirementsRetentionDetails.jsp;'"><span>3</span><i>Retention
										Details</i></li>
								<li class="activated"
									onclick="location.href='ArchiveBusinessRequirements.jsp';"><span>4</span><i>Business
										requirements</i></li>
								<li class="active"
									onclick="location.href='archiveReqAbbrevation.jsp;'"><span>5</span><i>Abbreviations</i></li>
								<li
									onclick="location.href='archiveRequirementsDocumentRevisions.jsp;'"><span>6</span><i>Revisions</i></li>
								<li onclick="location.href='archiveRequirementsAddendum.jsp;'"><span>7</span><i>Addendum</i></li>
								<li
									onclick="location.href='archiveRequirementsReviewDetails.jsp;'"><span>8</span><i>Review</i></li>
								<li
									onclick="location.href='archiveRequirementsApprovalDetails.jsp;'"><span>9</span><i>Approval</i></li>

							</ul>
						</div>
					</div>
				</div>
				<br /> <br />

				<div class="content-container">


					<!-- Projects List Start -->

					<div class="main-page">

						<section>

							<div class="row">
								<div class="container" id="module_header">
									<div>
										<div class="form-wizard">

											<%
											String initiate = (String) session.getAttribute("Ideation and Initiate");
											String plan = (String) session.getAttribute("Plan");
											String execute = (String) session.getAttribute("Execute");
											String hypercare = (String) session.getAttribute("Closure");
											if (initiate == null)
												initiate = "0";
											if (plan == null)
												plan = "0";
											if (execute == null)
												execute = "0";
											if (hypercare == null)
												hypercare = "0";
											%>
											<br /> <br /> <br />





											<div class="tab-pane" role="tabpanel" id="step4">

												<!-- Business Requirements Table -->

												<div class="card-container-2 card">
													<div class="card-header" id="cd-header">
														Abbreviations, Acronyms, Definitions</div>

													<div id="collapse4" class="panel-collapse ">

														<div id="collapse1" class="panel-collapse "
															name="collapse">
															<div class="panel-body">
																<div id="inputFieldsBusiness">
																	<div class="modal-body">
																		<form name="myForm">
																			<div class="form-group" id="TemplateFields">
																				<div>
																					<table class="table-bordered" style="width: 100%;">
																						<thead>
																							<tr>
																								<th
																									style='text-align: center; vertical-align: middle; display: none;'>Sequence
																									Number</th>
																								<th
																									style='text-align: center; vertical-align: middle; width: 35%;'>Abbreviation/Acronym</th>
																								<th
																									style='text-align: center; vertical-align: middle; width: 50%;'>Description</th>
																								<th
																									style='text-align: center; vertical-align: middle; width: 15%;'
																									class="useractionheader" scope="col">Action</th>
																							</tr>
																						</thead>
																						<tbody id="abbreviationlist"></tbody>

																					</table>
																				</div>
																			</div>
																		</form>
																	</div>
																</div>

																<button type="button" class="btn btn-primary pull-right"
																	id="DataDeleteId" data-toggle="modal"
																	data-target="#DataDeletePopUp" style="display: none;">Delete
																	PopUp</button>


																<div class="col-12">
																	<br />
																	<div class="col-4">

																		<button type="button" class="btn btn-secondary"
																			style="padding-top: 5px; padding-left: 10px; float: left;"
																			onclick="location.href='ArchiveBusinessRequirements.jsp';">Prev</button>
																	</div>
																	<div class="col-12" align="end">
																		<button class="btn btn-secondary" type="button"
																			id="addabbreviationbtn" href="#"
																			data-bs-toggle="modal"
																			data-bs-target="#addabbreviationModal">Add</button>
																		<button class="btn btn-secondary" type="button" hidden
																			id="editabbreviationbtn" href="#"
																			data-bs-toggle="modal"
																			data-bs-target="#editabbreviationModal">Edit</button>
																		<button class="btn btn-secondary" type="button" hidden
																			id="dltabbreviationbtn" href="#"
																			data-bs-toggle="modal"
																			data-bs-target="#dltabbreviationModal">Delete</button>

																		<button class="btn btn-primary"
																			onclick="location.href='archiveRequirementsDocumentRevisions.jsp';"
																			id="busreqNext">
																			<a href="archiveRequirementsDocumentRevisions.jsp">Next</a>
																		</button>

																	</div>
																</div>
																<div class="modal" id="addabbreviationModal"
																	tabindex="-1" aria-labelledby="exampleModalLabel"
																	aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header"
																				style="background-color: #1565c0;">
																				<h5 class="modal-title" id="exampleModalLabel"
																					style="color: white;">Add New Abbreviation</h5>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal" aria-label="Close"></button>
																			</div>
																			<div class="modal-body">
																				<form name="PopUpform">
																					<div class="row">
																						<div class="form-group">
																							<div class="col-lg-12">
																								<label class="control-label" for="formInput526" style="color:black;">Abbreviation/Acronym:</label>
																								<input type="text" class="form-control"
																									id="abbreviation_acronym"
																									name="abbreviation/acronym" required>
																							</div>
																							<div class="col-lg-12">
																								<label class="control-label" for="formInput526" style="color:black;">Description:</label>
																								<textarea class="form-control"
																									id="abb_description" name="abb_description"
																									rows="4" required></textarea>
																							</div>
																						</div>
																					</div>


																				</form>
																			</div>
																			<div class="modal-footer">

																				<button type="button" class="btn btn-primary"
																					id="add_abbreviation_submit" data-dismiss="modal"
																					style="font-size: 12px;">Add</button>
																				<button type="button" class="btn btn-secondary"
																					data-bs-dismiss="modal" style="font-size: 12px;">Cancel</button>
																			</div>
																		</div>
																	</div>
																</div>
																<div class="modal" id="editabbreviationModal"
																	tabindex="-1" aria-labelledby="exampleModalLabel"
																	aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header"
																				style="background-color: #1565c0;">
																				<h5 class="modal-title" id="exampleModalLabel"
																					style="color: white;">Update
																					Abbreviation/Acronym Details</h5>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal" aria-label="Close"></button>
																			</div>
																			<div class="modal-body">
																				<form name="PopUpform">
																					<div class="row">
																						<div class="form-group">
																							<div class="col-lg-12">
																								<label class="control-label" for="formInput526" style="color:black;">Abbreviation:</label>
																								<input type="text" class="form-control"
																									id="abbreviation_acronym_modify"
																									name="abbreviation_acronym_modify" required>
																								<label class="control-label" for="formInput526" style="color:black;">Description:</label>
																								<textarea class="form-control"
																									id="description_modify"
																									name="description_modify" rows="4" required></textarea> <input
																									type="text" hidden class="form-control"
																									id="seq_no_modify" name="seq_no_modify"
																									required> <input type="text" hidden
																									class="form-control" id="app_id_modify"
																									name="app_id_modify" required>

																							</div>
																						</div>
																					</div>
																					<input type="text" id="random_id_modify"
																						name="random_id" value="" style="display: none;">
																				</form>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-primary"
																					id="update_abbreviation_submit">Update</button>
																				<button type="button" class="btn btn-secondary"
																					data-bs-dismiss="modal">Cancel</button>

																			</div>
																		</div>
																	</div>
																</div>
																<div class="modal" id="dltabbreviationModal"
																	tabindex="-1" aria-labelledby="exampleModalLabel"
																	aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header"
																				style="background-color: #1565c0;">
																				<h5 class="modal-title" id="exampleModalLabel"
																					style="color: white;">Delete
																					Abbreviation/Acronym</h5>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal" aria-label="Close"></button>
																			</div>
																			<div class="modal-body">
																				<form name="DeleteForm">
																					<div class="modal-body">
																						<p style="font-size: 14px; color:black;">Do you want to
																							delete this Abbreviation/Acronym permanently?</p>
																						<input type="text" class="form-control"
																							id="seq_no_dlt" name="seq_no" required style="display:none;"><input
																							type="text" id="random_id" style="display: none;" />
																					</div>
																				</form>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-primary"
																					data-bs-dismiss="modal"
																					id="delete_abbreviation_submit">Yes</button>
																				<button type="button" class="btn btn-secondary"
																					data-bs-dismiss="modal">No</button>
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
									</div>
									<!-- /.row -->
								</div>
							</div>

						</section>
						<!-- /.section -->

					</div>
					<!-- /.main-page -->

					<!-- Project List End -->

				</div>
				<!-- /.content-container -->

				<!-- /.main-wrapper -->
				<script>
					function validateform9() {

						var f = document.loginForm;
						f.method = "post";
						f.action = 'ArchivalRequirements';
						f.submit();

					}
				</script>


				<%
				//     }
				//    }
				%>
			</div>
		</div>
	</form>



	<%-- <jsp:include page="samp_forms.jsp">
    <jsp:param name="ProjectName" value="<%=Opportunityname %>"/>
    <jsp:param name="AppName" value="<%=idd %>"/>
    <jsp:param name="number" value="2"/>
    <jsp:param name="servlet" value="Requirements"/>
</jsp:include>
<%
     //       }
    //    }
    } 
    catch (Exception e) {
    }
%> --%>

	<!-- Active Icon Color changes  -->
	<script>
		$(document).on('mouseenter', '.active1', function() {

			$('.activeIcon').css('color', '#1565c0');

		});

		$(document).on('mouseleave', '.active1', function() {

			$('.activeIcon').css('color', '#fff');

		});
	</script>
	<%@include file="Footer.jspf"%>
	<!-- ========== COMMON JS FILES ========== -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/jquery-ui/jquery-ui.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/pace/pace.min.js"></script>

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

	<script id="scripttag"></script>

	<!-- ========== PAGE JS FILES ========== -->
	<script src="js/prism/prism.js"></script>
	<script type="text/javascript"
		src="js/date-picker/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="js/date-picker/jquery.timepicker.js"></script>
	<script type="text/javascript" src="js/date-picker/datepair.js"></script>
	<script type="text/javascript" src="js/date-picker/moment.js"></script>
	<script src="js/notification/notification.js"></script>
	<script src="js/navigation/navigation.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Add_Abbreviation.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Delete_Abbreviation.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Retrieve_Abbreviations.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Update_Abbreviation.js"></script>

	<!-- ========== Toastr ========== -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link
		href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
		rel="stylesheet">
</body>
</html>