<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Opportunity List</title>
<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
	media="screen">

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
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<script type="text/javascript" src="js_in_pages/project.js"></script>

<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">

<link rel="stylesheet" href="css/threeDots/threeDots.css" media="screen">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<!-- ========== BootstrapV5 ========== -->
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
</head>

<body>

	<%-- <nav
		class="navbar navbar-expand-md navbar-light bg-white nav-height nav-font">
		<div class="container-fluid" id="container-fluid-margin">
			<a class="navbar-brand" href="Opportunity-List.jsp"> <img
				src="images/Decom360-logo.png" class="d3s-logo" alt="Decom3Sxity">
			</a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto d3s-ml-80">
					<li class="nav-item active selected"><a
						class="nav-link active" id="title" aria-current="page" href="#"><i
							class="fas fa-folders fa-2x iconAlign iconColor activeIcon"></i>Applications</a>
					</li>
					<li class="nav-item"><a class="nav-link active iconColor1"
						aria-current="page" href="Admin_Module_Send_Invites.jsp"><i
							class="fas fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a>
					</li>
					<li class="nav-item"><a class="nav-link active iconColor1"
						aria-current="page" href="PhaseList.jsp"><i
							class="fas fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
					<li class="nav-item"><a class="nav-link active iconColor1"
						aria-current="page" href="#"><i
							class="fas fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
					<li class="nav-item"><a class="nav-link active iconColor1"
						aria-current="page" href="DashBoard.jsp"><i
							class="fas fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a>
					</li>
					<li class="nav-item"><a class="nav-link active iconColor1"
						aria-current="page" href="#"><i
							class="fas fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a>
					</li>

				</ul>

			</div>
			<%
			HttpSession details = request.getSession();
			String uname = (String) details.getAttribute("username");
			%>
			<div class="dropdown" align="end">
				<a class="dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-bs-toggle="dropdown"
					aria-expanded="false"><i
					class="fas fa-user-circle iconAlign iconColor fa-3x"></i></a>
				<ul class="dropdown-menu" id="dropDownMenu"
					aria-labelledby="dropdownMenuLink">
					<li><a class="dropdown-item" href="#" id="textAlign"><i
							class="fas fa-user-circle iconAlign iconColor fa-3x"></i><br/>Signed
							in as <br/><b><%=uname%></b></a></li>
					<hr/>
					<li><a class="dropdown-item li-align" href="#" id="textAlign"
						onclick="location.href='Login.jsp';"><i
							class="fa fa-sign-out iconColor fa-1x"></i>Logout</a></li>
				</ul>
			</div>

		</div>
	</nav>
 --%>	
   <%@include file="Nav-Bar.jspf"%>
 
 <nav class="nav nav-down-height" id="bg-color">
		<div class="container-fluid" id="container-fluid-margin">
			<div class="row" id="d3s-mt-20">
				<div class="col-lg-12 col-md-12">
					<h5 id="title">Applications</h5>
				</div>
			</div>
			<div class="row" id="d3s-mt-10">
				<div class="col-lg-3 col-md-6">
					<div class="row align-items-center">
						<div class="col-auto">
							<i class="fa fa-search search-icon" aria-hidden="true"></i>
						</div>
						<div class="col-auto">
							<input id="appFilter" type="text" placeholder="Search the application...">
						</div>
					</div>
				</div>


				<div class="col-lg-3 col-md-6">
					<div class="row align-items-center">
						<div class="col-auto">
							<label class="col-form-label" id="title">Category</label>
						</div>

						<div class="col-auto">
							<select class="selectInput filter" id="category dropDown-width">
								<option class='options' value='All'>All</option>
								<option class='options' value='Intake'>Intake</option>
								<option class='options' value='Triage'>Triage</option>
								<option class='options' value='Assessment'>Assessment</option>
								<option class='options' value='Archive_Requirement'>Archive
									Requirement</option>
								<option class='options' value='Decomm_Requirement'>Decomm
									Requirement</option>
								<option class='options' value='DecommissionExecution'>Decommission
									Execution</option>
								<option class='options' value='ArchiveExecution'>Archive
									Execution</option>
								<option class='options' value='Closure'>Closure</option>
							</select>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="row align-items-center">
						<div class="col-auto">
							<label class="col-form-label" id="title">Phase</label>
						</div>
						<div class="col-auto">
							<select class="selectInput filter" id="dropDown-width">
								<option class='options' value='All'>All</option>
							</select>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6">
					<div class="row align-items-center">
						<div class="col-auto">
							<label class="col-form-label" id="title">Wave</label>
						</div>
						<div class="col-auto">
							<select class="selectInput filter" id="dropDown-width">
								<option class='options' value='All'>All</option>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-6 right-side">
				<button type="button" class="btn btn-primary pull-right" id="button"
					style="color: DodgerBlue;" name="newpr"
					onclick="location.href='Intake-NewOpportunity.jsp';">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>

				</button>

				<button type="button" class="btn btn-primary pull-right"
					id="addWaveBtnId" style="color: DodgerBlue; display: none;"
					name="newpr" data-toggle='modal' data-target='#existWavePopUp'>
				</button>
				<button type="button" class="btn btn-primary pull-right"
					id="deleteBtn" style="color: DodgerBlue; display: none;"
					name="newpr" data-toggle='modal' data-target='#deletePopUp'>
				</button>
			</div>
		</div>
	</nav>'

	<!-- <div class="main-page" id="container-fluid-margin">
		<div class="container"></div>

		<form method="post" name="form" action="Appin">
			<section>

				<div class="row">
					<div class="container-fluid grid">
						<div class="main">
							<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
								<div class="cbp-vm-options">
									<a href="#" id="grid" title="Grid View"
										class="cbp-vm-icon cbp-vm-grid cologen gr"
										data-view="cbp-vm-view-grid"></a> <a href="#" id="list"
										title="List" class="cbp-vm-icon cbp-vm-list lis"
										data-view="cbp-vm-view-list"></a>
								</div>

								<div class='col-md-12'>
									<ul id="ul_id">

									</ul>
								</div>

							</div>
						</div>
					</div>

				</div>
			</section>

		</form>

	</div> -->
	<script>
		
	</script>
<script src="js/navigation/navigation.js"></script>
</body>
</html>