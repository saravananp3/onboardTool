<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">


    <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css"/>
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css"/>

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script type="text/javascript" src="js_in_pages/technical.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="js_in_pages/technical.css" type="text/css"/>

    <style>
        body {
            font-family: Arial, sans-serif;

            background-size: cover;
            height: 100vh;
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

        /*END Form Wizard*/


    </style>


</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Intake_TechnicalDetails JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="onboard.DBconnection" %>
<%@ page import="java.util.*" %>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.

    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.html");
    }
%>

<%
    try {
        HttpSession details = request.getSession();
        String info = (String) details.getAttribute("intake");
        String Opportunityname=(String)session.getAttribute("SelectedOpportunity");
        String roles = (String) details.getAttribute("role");
        String det = (String) session.getAttribute("theName");
        String idd = (String) session.getAttribute("appidd");
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();
     //   String query3 = "select * from AppEmphazize_ProjectDetails where id = " + det;
     //   Statement st3 = conn.createStatement();
     //   ResultSet rs3 = st3.executeQuery(query3);
     //   String query4 = "select * from AppEmphazize_ApplicationInfo where appname ='" + idd + "'";
     //   Statement st4 = conn.createStatement();
     //   ResultSet rs4 = st4.executeQuery(query4);
     //   String imp_id = "";
     //   String sequenceNumber = "";
     //   int actualHours = 0, plannedHours = 0, actualHours1 = 0, plannedHours1 = 0;
     //   ArrayList<String> list = new ArrayList<String>();
        {
          //  if (rs3.next()) {
           //     String project_NAME = rs3.getString("projectname");
%>
<form class="form-signin" name="loginForm" method="post" action="Technical">

    <div class="main-wrapper">


        <!-- ========== TOP NAVBAR ========== -->
        <nav class="navbar top-navbar bg-white box-shadow">
            <div class="container-fluid">
                <div class="row">
                    <div class="navbar-header no-padding">
                        <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
                            <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                        </a>
                        <span class="small-nav-handle hidden-sm hidden-xs"><i class="fa fa-outdent"></i></span>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <i class="fa fa-ellipsis-v"></i>
                        </button>
                        <button type="button" class="navbar-toggle mobile-nav-toggle">
                            <i class="fa fa-bars"></i>
                        </button>
                    </div>
                    <!-- /.navbar-header -->

                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Decom3Sixty
                        Tool-<%=Opportunityname%>
                    </a>
                                    
                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">
                        <a class="navbar-brand" href="Project_List.jsp" id="sitetitle2">OPPORTUNITY NAME -<%=Opportunityname%>
                         
                            <li><%
                                String uid = (String) details.getAttribute("username");
                                String role = (String) details.getAttribute("role");%>
                                <p><span id="nav_userid"><%=uid%>&nbsp;logged in as &nbsp;</span><span
                                        id='nav_role'><%=role%></span></p>
                            </li>
                            <li><a href="Logout" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
                            </li>
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
                <div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                    <div class="sidebar-content" id='jqxWidget'>

                        <div class="sidebar-nav">
                            <ul class="side-nav color-gray">
                                <li class="nav-header">
                                    <span class="">Main Category</span>
                                </li>
                                <li id='home' item-selected='true'>
                                    <a href="Project_List.jsp"><i class="fa fa-home"></i> <span>Home</span> </a>
                                </li>

                                <%--   <li class="nav-header">
                                       <a href="AppEmphasize_EditProject.jsp"><span class="">Plan and pirority</span></a>
                                   </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_EditProject.jsp" class="active-menu"> <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp" class="active-menu"> <span>Application Information</span></a></li>
                                        <li><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                        <li><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
                                        <li><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
                                    </ul>
                                </li>
                                <%--<li class="has-children">
                                    <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                    </ul>
                                </li>--%>


                                <%--<li class="has-children">
                                    <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity </span></a></li>
                                    </ul>
                                </li>--%>

                                <%--<li>
                                    <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                </li>--%>

                                <%-- <li class="nav-header">
                                     <a href='Applications.jsp'><span class="">Intake Module</span></a>
                                 </li>

                                 <li class="has-children">
                                     <a href="Applications.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                     <ul class="child-nav">
                                         <li><a href="Applications.jsp"> <span>Application Information</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Legacy Retention Information</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Archive Data Management</span></a></li>
                                         <li><a href="Applications.jsp"> <span>System Requirements</span></a></li>
                                     </ul>
                                 </li>

                                 <li class="has-children">
                                     <a href="Applications.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                     <ul class="child-nav">
                                         <li><a href="Applications.jsp"> <span>Application Data Information</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Technical Information</span></a></li>
                                     </ul>
                                 </li>
                                 <li class="has-children">
                                     <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                     <ul class="child-nav">
                                         <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                     </ul>
                                 </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Applications.jsp" class="active-menu"> <span>Application Details</span></a></li>
                                        <li><a href="Intake_Business.jsp" > <span>Business Details</span></a></li>
                                        <li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a></li>
                                        <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                        <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>
                                    </ul>
                                </li>
                                <%--<li class="nav-header">
                                    <a href='Archive_Execution.jsp'><span class="">Archive Execution Module</span></a>
                                </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Archive_Execution.jsp" class="active-menu"> <span>Archive Execution</span></a></li>
                                        <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                    </ul>
                                </li>
                                <%--   <li class="nav-header">
                                       <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                   </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="RoleUIDashboard.jsp" class="active-menu"> <span>Reports Dashboard</span></a></li>
                                        <li><a href="RoleDashboard.jsp" class="active-menu"> <span>Role Dashboard</span></a></li>
                                        <li><a href="ProjectDashboard.jsp" > <span>Project Dashboard</span></a></li>
                                        <li><a href="ApplicationDashboard.jsp"> <span>Application Dashboard</span></a></li>
                                    </ul>
                                </li>
                            </ul>

                        </div>
                        <!-- /.sidebar-nav -->
                    </div>
                    <!-- /.sidebar-content -->
                </div>
                <!-- /.left-sidebar -->


                <script>
                    $(function () {
                        // 6 create an instance when the DOM is ready
                        $('#jstree').jstree();
                        // 7 bind to events triggered on the tree
                        $('#jstree').on("changed.jstree", function (e, data) {
                            console.log(data.selected);
                        });
                        // 8 interact with the tree - either way is OK
                        $('button').on('click', function () {
                            $('#jstree').jstree(true).select_node('child_node_1');
                            $('#jstree').jstree('select_node', 'child_node_1');
                            $.jstree.reference('#jstree').select_node('child_node_1');
                        });
                    });
                </script>


                <!-- Projects List Start -->


                <div class="main-page">

                    <section>

                        <div class="row">
                            <div class="container">

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
                                <br/><br/><br/>
                                <div class="row">

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Initiate</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped"
                                                     role="progressbar" id="prog_bar" style="width: <%=initiate%>%"
                                                     aria-valuenow="<%=initiate %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=initiate %>%</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Plan</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped"
                                                     role="progressbar" id="prog_bar1" style="width: <%=plan%>%"
                                                     aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100">
                                                    <span style="color:black;"><%=plan %>%</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Execute</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped"
                                                     role="progressbar" id="prog_bar2" style="width: <%=execute %>%"
                                                     aria-valuenow="<%=execute %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=execute %>%</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Closure</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-stripedss-bar"
                                                     role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%"
                                                     aria-valuenow="<%=hypercare %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=hypercare %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <%
                                        int dev = 0, test = 0;
                                        String requirements = (String) session.getAttribute("Requirements");
                                        String implement = (String) session.getAttribute("Implement");
                                        String development = String.valueOf(dev);
                                        String testing = String.valueOf(test);
                                        if (requirements == null)
                                            requirements = "0";
                                        if (implement == null)
                                            implement = "0";

                                    %>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Requirements</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar4"
                                                     style="width: <%=requirements%>%"
                                                     aria-valuenow="<%=requirements %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=requirements %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Development</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar5"
                                                     style="width: <%=development%>%" aria-valuenow="<%=development %>"
                                                     aria-valuemin="0" aria-valuemax="100"><span
                                                        style="color:black;"><%=development %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Testing</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar6"
                                                     style="width: <%=testing%>%" aria-valuenow="<%=testing %>"
                                                     aria-valuemin="0" aria-valuemax="100"><span
                                                        style="color:black;"><%=testing %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Deployment</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar7"
                                                     style="width: <%=implement%>%" aria-valuenow="<%=implement%>"
                                                     aria-valuemin="0" aria-valuemax="100"><span
                                                        style="color:black;"><%=implement %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <jsp:include page="progress_details1.jsp">
                                    <jsp:param name="Initiate" value="<%=initiate %>"/>
                                    <jsp:param name="Plan" value="<%=plan %>"/>
                                    <jsp:param name="Execute" value="<%=execute %>"/>
                                    <jsp:param name="Hypercare" value="<%=hypercare %>"/>
                                    <jsp:param name="Requirements" value="<%=requirements %>"/>
                                    <jsp:param name="Development" value="<%=development %>"/>
                                    <jsp:param name="Testing" value="<%=testing %>"/>
                                    <jsp:param name="Deployment" value="<%=implement %>"/>
                                </jsp:include>

                                <div class="row">

                                    <div class="row bs-wizard" style="border-bottom:0;">

                                        <div class="col-xs-2 bs-wizard-step active">
                                            <div class="text-center bs-wizard-stepnum">Intake Information</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot" style="color:white">1</a>

                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                            <div class="text-center bs-wizard-stepnum">Summary</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">2</a>
                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                            <div class="text-center bs-wizard-stepnum">Review</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">3</a>
                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Approval</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">4</a>
                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Final</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">5</a>
                                        </div>
                                    </div>

                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse1">Application
                                            Information</a></h4>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                        <div class="panel-body">
                                            
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198">

                                                </label>
                                                
                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup1"
                                                                                                        id="P1">Add</a>
                                            </button> &nbsp;
                                            
                                            <button type="button" class="btn btn-danger  pull-left" id="Del2"
                                                    style='display:none;' onclick="validateform9();">Delete
                                            </button>&nbsp;
                                            
                                            <button type="button" class="btn btn-primary  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btt"
                                                    onclick=" validateform()"> Next<span
                                                    class="glyphicon glyphicon-chevron-right"></span></button>
                                            <br/><br/>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    function deletee(id, Count_1, Del1, Del2) {
                                        var x = Count_1;
                                        for (var i = 0; i < x; i++) {
                                            document.getElementById(id + i).style.display = 'block';
                                        }
                                        document.getElementById(Del1).style.display = 'none';
                                        document.getElementById(Del2).style.display = 'block';

                                    }

                                    function edit_page(x, y) {
                                        var f = document.loginForm;
                                        f.method = "post";
                                        f.action = "Edit_Pages.jsp?label=" + x + "&idname=" + y + "&name='Technical'";
                                        f.submit();
                                    }

                                    function edit_form(d1, Count_1) {
                                        var x = Count_1;
                                        for (var i = 0; i < x; i++) {
                                            document.getElementById(d1 + i).style.display = 'block';
                                        }

                                    }


                                </script>

                                <script>

                                    function validateform() {
                                        var count = 0;
                                        if (count > 0)
                                            alert("fill the mandatory fields");
                                        else
                                            toggle();
                                    }

                                </script>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse2"
                                                                   onclick="switchColors();">Legacy Retention
                                            Information</a></h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse">
                                        <div class="panel-body">


                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup2">Add</a>
                                            </button>
                                            
                                            <button type="button" class="btn btn-danger  pull-left" id="Del21"
                                                    style='display:none;' onclick="validateform9();">Delete
                                            </button>&nbsp;
                                            
                                            <button type="button" class="btn btn-primary  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btt1"
                                                    onclick="validateform1()"> Next<span
                                                    class="glyphicon glyphicon-chevron-right"></span></button>
                                            <button type="button" class="btn btn-default  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btn_new"
                                                    onclick="switchColors0();"><a class="collapsed"
                                                                                  data-toggle="collapse"
                                                                                  data-parent="#panels1"
                                                                                  href="#collapse1"><span
                                                    class="glyphicon glyphicon-chevron-left"></span> Previous</a>
                                            </button>

                                        </div>
                                    </div>
                                </div>

                                <script>

                                    function validateform1() {
                                        var count1 = 0;
                                        
                                        if (count1 > 0)
                                            alert("fill the mandatory fields");
                                        else
                                            toggle1();
                                    }

                                </script>
                                
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse3"
                                                                   onclick="switchColors2();">Intake Download Attachment</a>
                                        </h4>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198">
                                                    
                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup3">Add</a>
                                            </button>
                                            
                                            <button type="button" class="btn btn-danger  pull-left" id="Del23"
                                                    style='display:none;' onclick="validateform9();">Delete
                                            </button>&nbsp;
                                            
                                            <button type="button" class="btn btn-default  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btn_new3"
                                                    onclick="validateform3()"><a class="collapsed"
                                                                                 data-toggle="collapse"
                                                                                 data-parent="#panels1"
                                                                                 href="#collapse3"
                                                                                 style="color:black"><span
                                                    class="glyphicon glyphicon-chevron-left"></span> Previous</a>
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="button" class="btn btn-primary btn pull-right" onclick="validateform9();">Save
                                & Continue...
                            </button>&nbsp;

                            <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel
                            </button>

                        </div>

                </div>


                <script>
                    function validateform9() {

                        var f = document.loginForm;
                        f.method = "post";
                        f.action = "Technical"
                        f.submit();
                    }
                </script>


                    <%
        
   
}
//}
 %>
</form>
<jsp:include page="samp_forms.jsp">
    <jsp:param name="ProjectName" value="<%=Opportunityname %>"/>
    <jsp:param name="AppName" value="<%=idd %>"/>
    <jsp:param name="number" value="3"/>
    <jsp:param name="servlet" value="Technical"/>
</jsp:include>
<%
            }
  //      }
  //  } 
    catch (Exception e) {
    }
%>


</div>
<!-- /.col-md-6 -->

</div>
<!-- /.row -->

</section>
<!-- /.section -->

</div>
<!-- /.main-page -->

<!-- Project List End -->

</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->


<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $(".lis").click(function () {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function () {
            $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
        });
    });
</script>


<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all"/>
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
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


<script>

    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod1" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod2" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
</script>


</body>
</html>