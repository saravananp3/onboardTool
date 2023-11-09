<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Governance List</title>
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
<link rel="stylesheet" href="css/threeDots/threeDots.css" media="screen">
<!-- =========== Header Icon ========= -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css">
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/governance/waveList/waveList.js"></script>
<!-- <script src="js/governance/phaseList/FilteringList.js"></script> -->
<style type="text/css">
body {
	background: #fff;
}
/* .active{
        background:#1565c0;
         } */
.page-title-div {
	background: #1565c0;
	padding: 15px;
}

.fixed-top {
	width: 100%;
	padding-left: 0px;
	padding-right: 0px;
}

hr {
	border-top: 3px solid #dce8f1;
}

input[type=search] {
	outline: 0;
	border-width: 0 0 3px 0;
	border-color: #d2d2d2;
}

input[type=search]:focus {
	border-color: #1565c0;
}

.cbp-vm-switcher {
	padding: 42px;
}

.cbp-vm-options {
	text-align: right;
	padding-bottom: 10px;
}

.cbp-vm-options a {
	display: inline-block;
	width: 30px;
	height: 30px;
	overflow: hidden;
	white-space: nowrap;
	color: #d0d0d0;
	margin-top: 2px;
}

.cbp-vm-options a:hover, .cbp-vm-options a.cbp-vm-selected {
	color: #47a3da;
}

.cbp-vm-options a:before {
	width: 20px;
	height: 20px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	display: inline-block;
}
/* General style of switch items' list */
.cbp-vm-switcher ul {
	list-style: none;
	padding: 0;
	margin: 0;
}
/* Clear eventual floats */
.cbp-vm-switcher ul:before, .cbp-vm-switcher ul:after {
	content: " ";
	display: table;
}

.cbp-vm-switcher ul:after {
	clear: both;
}

.cbp-vm-switcher ul li {
	display: block;
	position: relative;
}

.cbp-vm-image {
	display: block;
	margin: 0 auto;
}

.cbp-vm-image img {
	display: inline-block;
	max-width: 100%;
}

.cbp-vm-title {
	margin: 0;
	padding: 0;
}

.cbp-vm-price {
	color: #c0c0c0;
}

.cbp-vm-add {
	color: #fff;
	background: #47a3da;
	padding: 10px 20px;
	border-radius: 2px;
	margin: 20px 0 0;
	display: inline-block;
	transition: background 0.2s;
}

.cbp-vm-add:hover {
	color: #fff;
	background: #02639d;
}

.cbp-vm-add:before {
	margin-right: 5px;
}
/* Common icon styles */
.cbp-vm-icon:before {
	font-family: 'fontawesome';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}
/* Individual view mode styles */
/* Large grid view */
.cbp-vm-view-grid ul {
	text-align: center;
}

.cbp-vm-view-grid ul li {
	padding-top: 68px;
	width: 23%;
	text-align: center;
	box-shadow: 5px 5px 5px 5px #dbdbdb;
	display: inline-block;
	vertical-align: top;
}

.col-md-12 {
	flex: 0 0 auto;
	width: 100%;
}

.cbp-vm-view-grid .cbp-vm-title {
	font-size: 21px;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
	text-overflow: ellipsis;
}

.cbp-vm-view-grid .cbp-vm-details {
	max-width: 300px;
	min-height: 70px;
	margin: 0 auto;
}

.cbp-vm-view-grid .cbp-vm-price {
	margin: 10px 0;
	font-size: 1.5em;
}

.cbp-vm-view-list .right-col {
	float: left;
	width: 25%;
}

.cbp-vm-view-list .cbp-vm-title {
	font-size: 1.3em;
	padding: 13px 30px;
	white-space: normal;
	width: 60%;
}

.cbp-vm-view-list .center-col {
	float: left;
	width: 20%;
	margin-right: 51px;
}

.cbp-vm-view-list .center-col {
	float: left;
	width: 20%;
	margin-right: 51px;
}

.cbp-vm-view-list li {
	padding: 12px 0;
	white-space: nowrap;
	background-color: #fff;
	box-shadow: 5px 5px 5px 5px #dbdbdb;
	margin: 13px;
	padding-top: 10px;
}

.cbp-vm-view-list li:focus {
	display: block;
	border: 2px solid red;
}

@media screen and (max-width: 66.7em) {
	.cbp-vm-view-list .cbp-vm-details {
		width: 30%;
	}
}

@media screen and (max-width: 57em) {
	.cbp-vm-view-grid ul li {
		width: 49%;
	}
}

@media screen and (max-width: 47.375em) {
	.cbp-vm-view-list .cbp-vm-image {
		width: 20%;
	}
	.cbp-vm-view-list .cbp-vm-title {
		width: auto;
	}
	.cbp-vm-view-list .cbp-vm-details {
		display: block;
		width: 100%;
		margin: 10px 0;
	}
	.cbp-vm-view-list .cbp-vm-add {
		margin: 10px;
	}
}

@media screen and (max-width: 40.125em) {
	.cbp-vm-view-grid ul li {
		width: 100%;
	}
}

.grid {
	margin-top: 80px;
}

.cbp-vm-view-list li:focus {
	display: block;
	border: 2px solid red;
}

.progress {
	margin-top: 5px;
}

.cologen {
	color: #1c95f8 !important;
}

.options {
	color: #000000;
}

.right-side {
	position: absolute;
	right: 10%;
	top: 80px;
	z-index: 1;
}

#button {
	height: 50px;
	width: 50px;
	border-radius: 50%;
	border: 1px solid #dd6a2c;
	background-color: #dd6a2c;
	color: #fff;
	outline-width: 0;
	font-size: 20px;
	padding: 12px;
	text-align: center;
}

.form-row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -5px;
	margin-left: -5px;
}

.search-input {
	min-width: 150px;
	max-width: 290px;
	flex: 1;
	position: relative;
}

.topBarInput {
	border: none;
	border-bottom: 1px solid #959595;
	-o-border-image: initial;
	border-image: initial;
	border-radius: 0;
	color: #fff !important;
	font-size: .875rem;
	text-indent: 12px;
	background-color: transparent !important;
	box-shadow: none;
	height: 25px;
	margin-top: 5px;
	padding-bottom: 3px;
}

.selectInput {
	border-bottom: 1px solid #959595;
	color: #fff !important;
	background-color: transparent !important;
}

.fa-search {
	color: #fff;
}

#apptype {
	font-size: .875rem;
	color: #fff;
}

.vertical-alignment-helper {
	display: table;
	height: 100%;
	width: 100%;
	pointer-events: none;
}

.vertical-align-center {
	/* To center vertically */
	display: table-cell;
	vertical-align: middle;
	pointer-events: none;
}

.modal-content {
	/* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
	width: inherit;
	max-width: inherit;
	/* For Bootstrap 4 - to avoid the modal window stretching 
full width */
	height: inherit;
	/* To center horizontally */
	margin: 0 auto;
	pointer-events: all;
}

.active1 {
	background: #1565c0;
}

.page-title-div {
	background: #1565c0;
	padding: 15px;
}
</style>
</head>
<body class="top-navbar-fixed">
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed OpportunityList JSP PAGE-----[INFO]"); %>
	<%@page language="java"%>
	<%@page import="java.text.DateFormat"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	<%@page import="java.sql.*"%>
	<%@ page import="onboard.DBconnection"%>
	<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username")==null){
        response.sendRedirect("Login.jsp");
    }
%>
	<%	PreparedStatement visit_st=null;
	ResultSet visit_rs=null;
    HttpSession role_ses=request.getSession();
    String frole=(String)role_ses.getAttribute("role");
    int sumcount=0;
    Statement st,st1;
    try{
        String query;
        HttpSession details=request.getSession();
        String Projets=(String)details.getAttribute("projects");
        String phaseId=(String)details.getAttribute("phaseId");
        String phaseName=(String)details.getAttribute("phaseName");
        System.out.println("phaseId-------------"+phaseId);
        System.out.println("phaseName-------------"+phaseName);
        System.out.println("projects-------------"+Projets);
        String roles=(String)details.getAttribute("role");
        DBconnection d=new DBconnection();
        Connection con = (Connection)d.getConnection();
        String visit_query="select * from visits";
        visit_st = con.prepareStatement(visit_query);
        visit_rs = visit_st.executeQuery();
        int flag=1,knt=0;
        Date date = new Date();
        SimpleDateFormat ft,ft1;
        String username=(String)details.getAttribute("username");
        ft=new SimpleDateFormat ("yyyy-MM-dd");
        ft1=new SimpleDateFormat ("hh:mm:ss");
        String strDate=ft.format(date);
        String strTime=ft1.format(date);
        while(visit_rs.next())
        {
            if(visit_rs.getString(6)!=null)
            {
                if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Logged in"))
                {
                	 String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in'  and date =?";
                     PreparedStatement stmtt = con.prepareStatement(queryy);
         			 stmtt.setString(1, strTime);
         			 stmtt.setString(2, username);
         			 stmtt.setString(3, strDate);
                     int count = stmtt.executeUpdate();
                    flag=0;
                    break;
                }
            }
        }
        //System.out.println("the flag value is "+flag);
        if(flag==1)
        {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(ins_query);
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, strDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");
            // execute the preparedstatement
            preparedStmt.execute();
        }%>
	<%
                            String uname=(String)details.getAttribute("username");
                            String role=(String)details.getAttribute("role");%>
	<!-- main wrapper -->
	<div class="main-wrapper">
		<%--   <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                 <div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/D3Sixty_logo.png" alt="D3Sixty" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                   <ul class="nav navbar-nav headerTab navAlign">
                      <li><a href="OpportunityList.jsp"><i class="fad fa-folders fa-2x iconAlign iconColor"></i>Applications</a></li>
                      <li><a href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
                      <li class="active1"><a href="PhaseList.jsp" style= "color:#fff;"><i class="fad fa-desktop iconAlign activeIcon fa-2x"></i>Governance</a></li>
                      <li><a href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
                      <li ><a href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
                      <li><a href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
                  </ul>
                 <ul class="nav navbar-nav navbar-right" style = "margin-top:45px;">
                        <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
            </div> --%>
		<!-- /.row -->
		<%@include file="Nav-Bar.jspf"%>
		<nav class="nav nav-down-height" id="bg-color">
			<div class="container-fluid" id="container-fluid-margin">
				<div class="row" id="d3s-mt-10">
					<div class="col-lg-12 col-md-12">
						<div class="sub-title" style="color: #fff">
							<a href="DashBoard.jsp" id="sitetitle1" style="color: #fff"><span
								class="glyphicon glyphicon-home"></span> Home</a> >><a
								href="Governance_Home.jsp" id="sitetitle1" style="color: #fff">Governance</a> >> <a
								href="applicationList.jsp" id="sitetitle1" style="color: #fff">Plan and Priority</a> >> Waves
								
						</div>
					</div>
				</div>
				<div class="row" id="d3s-mt-10">
					<div class="col-lg-12 col-md-12">
						<h5 id="title">Waves</h5>
					</div>
				</div>
				<div class="row" id="d3s-mt-10">
					<div class="col-lg-3 col-md-6">
						<div class="row align-items-center">
							<div class="col-auto">
								<i class="fa fa-search search-icon" aria-hidden="true"></i>
							</div>
							<div class="col-auto">
								<input class="searchbox-input" id="appFilter" type="text"
									placeholder="Search the wave...">
							</div>
						</div>
					</div>
					<!-- <div class="col-lg-3 col-md-6">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label" id="title">Phase</label>
                        </div>
                        <div class="col-auto">
                            <select class="selectInput filter phase-dropDown-width" id="phase"></select>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label" id="title">Wave</label>
                        </div>
                        <div class="col-auto">
                            <select class="selectInput filter phase-dropDown-width" id="wave"></select>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="row align-items-center flex-nowrap">
                        <div class="col-auto">
                            <label class="col-form-label" id="title">Application</label>
                        </div>
                        <div class="col-auto">
                            <select class="selectInput filter phase-dropDown-width" id="application"></select>
                        </div>
                    </div>
                </div> -->
				</div>
				<div class="col-lg-6 right-side">
					<button type="button" class="btn btn-primary pull-right"
						id="button" style="color: DodgerBlue;" name="newpr"
						onclick="location.href='NewGovernance.jsp';">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-primary pull-right"
						id="addWaveBtnId" style="color: DodgerBlue; display: none;"
						name="newpr" data-bs-toggle='modal'
						data-bs-target='#existWavePopUp'></button>
					<button type="button" class="btn btn-primary pull-right"
						id="deleteBtn" style="color: DodgerBlue; display: none;"
						name="newpr" data-bs-toggle='modal' data-bs-target='#deletePopUp'>
					</button>
				</div>
			</div>
		</nav>
		<!--  
            <nav class="navbar navbar-down">
                  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-2">
                             <h5 class="title" style="color:#fff">Application</h5>
                              <p class="sub-title">Create and manage your Opportunities here</p>
                        </div>
                         <div class="col-md-12">
                             <div class="row form-row">
                               <div class="col-md-2 search-input">
                                        <div class="row form-row">
                                       <div class="col-md-1">
                                       <i class="fa fa-search" aria-hidden="true"></i>
                                       </div>
                                       <div class="col-md-10">
                                       <input class="form-control topBarInput"  id="appFilter" type="text" placeholder="Search the Phase.."></div>
                                       </div>
                               </div>
                                       <label class = "PhaseRow" style="color:#fff;">Phase </label>
                               <div class="row form-row PhaseRow">
                                       <div class="col-md-10">
                                       <select class="filter selectInput" id="phase" style ="width:200px;">
                                       </select></div>
                                       </div>
                                       <label class="WaveRow" style="color:#fff;">Wave </label>
                                       <div class="row form-row WaveRow">
                                       <div class="col-md-10">
                                       <select class="filter selectInput" id="wave" style ="width:200px;">
                                       </select></div>
                                       </div>
                                       <label class="ApplicationRow" style="color:#fff;">Application </label>
                                       <div class="row form-row ApplicationRow">
                                       <div class="col-md-10">
                                       <select  class="filter selectInput" id="application" style ="width:200px;">
                                       </select></div>
                                       </div>
                               <div class="col-md-6 ">
                                        <div class="row ">
                                       <div class="col-md-5">
                                      <label class="col-md-2" id="apptype" title="Application Type"></label>
                                       </div>
                               </div>
                               </div>
                             </div>
                        </div>
                         <div class="container-fluid ">
                         <ul class="nav navbar-nav" >
                              <li ></li>
                                <li ></li>
                           </ul>
                         </div>
                        <div class="col-sm-6 right-side">
                            <button type="button" class="btn btn-primary pull-right" id="button" style="color:DodgerBlue;" name="newpr" onclick="location.href='NewGovernance.jsp';" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                            <button type="button" class="btn btn-primary pull-right" id="addWaveBtnId" style="color:DodgerBlue; display:none;" name="newpr" data-toggle='modal' data-target='#existWavePopUp'>
                            </button>r
                            <button type="button" class="btn btn-primary pull-right" id="deleteBtn" style="color:DodgerBlue; display:none;" name="newpr" data-toggle='modal' data-target='#deletePopUp'>
                            </button>
                            <button type="button" class="btn btn-primary pull-right" id="deletePhaseBtn" style="color:DodgerBlue; display:none;" name="newpr" data-toggle='modal' data-target='#deletePhasePopUp'>
                            </button>
                            <button type="button" class="btn btn-primary pull-right" id="deleteWaveBtn" style="color:DodgerBlue; display:none;" name="newpr" data-toggle='modal' data-target='#deleteWavePopUp'>
                            </button>
                        </div>
                        /.col-sm-6 text-right
                    </div>
                </div>
            </nav>
        </div> -->
		<!-- /.container-fluid -->

		<div class="col-sm-6 right-side">
			<!--  <button type="button" class="btn btn-primary pull-right" id="button" style="color:DodgerBlue;" name="newpr" onclick="location.href='NewGovernance.jsp';" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button> -->
			<button type="button" class="btn btn-primary pull-right"
				id="addWaveBtnId" style="color: DodgerBlue; display: none;"
				name="newpr" data-bs-toggle='modal' data-bs-target='#existWavePopUp'>
			</button>
			<button type="button" class="btn btn-primary pull-right"
				id="deleteBtn" style="color: DodgerBlue; display: none;"
				name="newpr" data-bs-toggle='modal' data-bs-target='#deletePopUp'>
			</button>
			<button type="button" class="btn btn-primary pull-right"
				id="deletePhaseBtn" style="color: DodgerBlue; display: none;"
				name="newpr" data-bs-toggle='modal'
				data-bs-target='#deletePhasePopUp'></button>
			<button type="button" class="btn btn-primary pull-right"
				id="deleteWaveBtn" style="color: DodgerBlue; display: none;"
				name="newpr" data-bs-toggle='modal'
				data-bs-target='#deleteWavePopUp'></button>
		</div>
		</nav>
		<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
		<div class="content-wrapper">
			<div class="content-container">
				<!-- Projects List Start -->
				<%
                {
                    int application_count=0;
                    PreparedStatement projectCountst=null;
                    ResultSet projectCountqyery=null;
                    if(Projets.equals("all")) {
                        String projectCount = "select count(*) from appemphazize_projectdetails";
                        projectCountst = con.prepareStatement(projectCount);
                        projectCountqyery = projectCountst.executeQuery();
                        if (projectCountqyery.next()) {
                            application_count = Integer.parseInt(projectCountqyery.getString(1));
                        }
                    }
                    else
                    {
                        String ProjCountQuery="select * from admin_userdetails where uname=?";
                        PreparedStatement statement1 = con.prepareStatement(ProjCountQuery);
                        statement1.setString(1, uname);
            			ResultSet resultSet = statement1.executeQuery();
                        if(resultSet.next())
                        {
                            String[] prjs=(resultSet.getString("projects")).split(",");
                            application_count=prjs.length;
                        }
           	         }
            %>
				<%
             projectCountst.close();
             projectCountqyery.close();
                } %>
				<div class="main-page">
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
											<div class='col-md-12 d3s-ml-10 card-m-align'>
												<ul id="ul_id">
												</ul>
											</div>
											<%
                                        visit_st.close();
                                        visit_rs.close();
                                                con.close();
                                               
    }
                                            catch(Exception e){
                                                e.printStackTrace();
                                            }
                                        %>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- /.row -->
						</section>
					</form>
				</div>
				<!-- /.mainPage -->
				<!-- Project List End -->
			</div>
			<!-- /.content-container -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- end of main wrapper -->
	<!-- Add to Existing Wave Popup -->
	<div class="modal" id="existWavePopUp" tabindex="-1" role="dialog">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Add To Existing Wave</h5>
						<button type="button" id="existWaveClose" class="close"
							data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form name="PopUpform">
							<div class="row">
								<div class="form-group">
									<div class="col-lg-8">
										<label class="control-label" for="formInput526">Select
											Wave Name:</label> <select id="existWaveTypesId" class="form-control"
											name="existWaveTypesName" required>
										</select>
									</div>
								</div>
							</div>
							<br /> <input type="text" id="existWaveSeqNum" name="" value=""
								style="display: none;" /> <input type="text" id="oppNameId"
								name="" value="" style="display: none;" />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="existWaveSubmit" class="btn btn-primary">Submit</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="closeIdExistWave" aria-label="Close">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Application Delete Pop Up -->
	<div class="modal" id="deletePopUp" tabindex="-1" role="dialog">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Delete
							Application</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="PopUpform">
							<div class="row">
								<div class="form-group">
									<div class="col-lg-8">
										<!-- <label class="control-label" for="formInput526">Select Wave Name:</label>
                            <select id="existWaveTypesId" class="form-control" name="existWaveTypesName" required >
                            </select>
    -->
										<p>Are you sure, want to delete the Application
											permanently?</p>
									</div>
								</div>
							</div>
							<br />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="deleteYesBtn" class="btn btn-primary"
							data-bs-dismiss="modal">Yes</button>
						<button type="button" class="btn btn-secondary"
							id="closeIdDeleteApp" aria-label="Close">No</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Wave Delete Pop Up -->
	<div class="modal" id="deleteWavePopUp" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Delete Wave</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="PopUpform">
							<div class="row">
								<div class="form-group">
									<div class="col-lg-10">
										<!-- <label class="control-label" for="formInput526">Select Wave Name:</label>
                            <select id="existWaveTypesId" class="form-control" name="existWaveTypesName" required >
                            </select> -->

										<p>Are you sure, want to delete the Wave permanently?</p>
										<input type="checkbox" id="includeWaveAll" value="true" />&nbsp;&nbsp;Include
										Wave content (Associated Applications) <input type="textbox"
											id="waveIndex" value="" style="display: none;" />
									</div>
								</div>
							</div>
							<br />
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="deleteWaveYesBtn"
							class="btn btn-primary" data-bs-dismiss="modal">Yes</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" id="closeIdDeleteApp" aria-label="Close">No</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="Footer.jspf"%>
	<!-- ========== COMMON JS FILES ========== -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/jquery-ui/jquery-ui.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/pace/pace.min.js"></script>
	<script src="js/lobipanel/lobipanel.min.js"></script>
	<script src="js/iscroll/iscroll.js"></script>
	<script type="text/javascript">
    $('#list').click(function()
    {
        $('#grid').removeClass('cologen');
        $('#list').addClass('cologen');
    });
    $('#grid').click(function()
    {
        $('#list').removeClass('cologen');
        $('#grid').addClass('cologen');
    });
    $(document).ready(function() {
        $(".lis").click(function() {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function() {
            $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
        });
    });
</script>
	<script>
$(document).on('mouseenter','.active1', function(){
         $('.activeIcon').css('color','#1565c0');
     });
     $(document).on('mouseleave','.active1', function(){
         $('.activeIcon').css('color','#fff');
     });
</script>
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
	<!-- ========== PAGE JS FILES ========== -->
	<script src="js/prism/prism.js"></script>
	<script type="text/javascript"
		src="js/date-picker/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="js/date-picker/jquery.timepicker.js"></script>
	<script type="text/javascript" src="js/date-picker/datepair.js"></script>
	<script type="text/javascript" src="js/date-picker/moment.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="js/governance/phaseList/phaseCategorySelection.js"></script>
	<script type="text/javascript"
		src="js/governance/waveList/waveDropdownSelection.js"></script>
	<!-- <script type="text/javascript" src="js/governance/phaseList/phaseFilterByApp.js"></script> -->
	<script type="text/javascript"
		src="js/governance/waveList/governanceEditFunctionality.js"></script>
	<script type="text/javascript"
		src="js/governance/waveList/selectWave.js"></script>
	<script type="text/javascript"
		src="js/threeDotOptions/threeDotOptions.js"></script>
	<script src="js/notification/notification.js"></script>
	<!-- 
<script src="js/Opportunity/OpportunityList/addToExistWaveAjaxCall.js"></script>
<script src="js/Opportunity/OpportunityList/deleteOpportunity.js"></script> -->
	<script>
$(document).ready(function() {
    $('.searchbox-input').keyup(function(){
        search_text($(this).val());
    });
    function search_text(value){
        $('#ul_id .cbp-vm-title').each(function(){
            var found = 'false';
            $(this).each(function(){
                if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                {
                    found = 'true';
                }
            });
            if(found == 'true'){
                $(this).parent().css('display','');
            }
            else {
                $(this).parent().css('display','none');
            }
        })
    }
});
</script>
	<script src="js/navigation/navigation.js"></script>
	<!-- ========== Toastr ========== -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link
		href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
		rel="stylesheet">
</body>
</html>