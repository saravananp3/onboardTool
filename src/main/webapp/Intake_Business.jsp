<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Onboard</title>

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
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script type="text/javascript" src="js_in_pages/business.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="js_in_pages/business.css" type="text/css"/>


</head>
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


<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----" + formatter.format(date1) + "-----Accessed Intake_Business JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
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
        String role_info = (String) details.getAttribute("intake");
        String roles = (String) details.getAttribute("role");
        String ID = (String) session.getAttribute("theName");
		String Opportunityname=(String)session.getAttribute("SelectedOpportunity");
        String app_Name = request.getParameter("appname");
        if (app_Name != null && !app_Name.isEmpty()) {
            session.setAttribute("appidd", app_Name);
        }
        app_Name = (String) session.getAttribute("appidd");
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();
        String Projects = (String) details.getAttribute("projects");
        String Applications = (String) details.getAttribute("applications");
        String username = (String) details.getAttribute("u_Name");
        String Project_Name = (String) details.getAttribute("nameofproject");
        String visit_query = "select * from visits";
        Statement visit_st = conn.createStatement();
        ResultSet visit_rs = visit_st.executeQuery(visit_query);
        int flag = 1;

        Date date = new Date();
        SimpleDateFormat ft, ft1;
        ft = new SimpleDateFormat("yyyy-MM-dd");
        ft1 = new SimpleDateFormat("hh:mm:ss");
        String strDate = ft.format(date);
        String strTime = ft1.format(date);


    %>

<form class="form-signin" name="loginForm" method="post">

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
                         
                        <li>
                            <%
                         String uname=(String)details.getAttribute("username");
                         String roles1=(String)details.getAttribute("role");%>
                            <li><a href="#"><span id="nav_userid"><%=username%>&nbsp;</span>logged in as &nbsp;<span
                                    id='nav_role'><%=roles%></span></a></li>

                            <li><a href="logout.jsp" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
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


                <section>

                    <div class="row">
                        <div class="container">

                            <div class="main">
                                <br>
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

                                <br/>

                                <div class="row m0a">

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

                                            <button type="button" class="btn btn-success  pull-left"><a class="button" href="#popup1" id="P1">Add</a>
                                            </button> &nbsp;
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
                                        f.action = "Edit_Pages.jsp?label=" + x + "&idname=" + y + "&name=Business";
                                        f.submit();
                                    }

                                    function edit_form(d1, Count_1) {
                                        var x = Count_1;
                                        for (var i = 0; i < x; i++) {
                                            document.getElementById(d1 + i).style.display = 'block';
                                        }

                                    }


                                </script>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">Legacy Retention Information</a></h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse">
                                        <div class="panel-body">
											<button type="button" class="btn btn-success  pull-left">
											<a class="button" href="#popup2">Add</a>
                                            </button>
                                            <button type="button" class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt1"
                                                    onclick="validateform1()">Next<span class="glyphicon glyphicon-chevron-right"></span></button>
                                            <button type="button" class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new"
                                                    onclick="switchColors0();">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1">
                                                    <span class="glyphicon glyphicon-chevron-left"></span> Previous</a>
                                            </button>

                                        </div>
                                    </div>
                                </div>

                                
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3"
                                             onclick="switchColors1();">Archive Data Management</a></h4>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse">
                                        <div class="panel-body">
													 <button type="button" class="btn btn-success  pull-left"><a class="button" href="#popup3">Add</a>
                                            </button>
                                            
                                            <button type="button" class="btn btn-primary  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btt2"
                                                    onclick="validateform3()"> Next<span
                                                    class="glyphicon glyphicon-chevron-right"></span></button>
                                            <button type="button" class="btn btn-default  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btn_new2"
                                                    onclick="switchColors();">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:black">
                                                    <span class="glyphicon glyphicon-chevron-left"></span> Previous</a>
                                            </button>

                                        </div>
                                    </div>
                                </div>

                                
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse4"
                                                                   onclick="switchColors2();">Privacy Classification</a>
                                        </h4>
                                    </div>
                                    <div id="collapse4" class="panel-collapse collapse">
                                        <div class="panel-body">
                                           
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198">
                                                  
                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup4">Add</a>
                                            </button>
                                            
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
                            
                            <button type="button" class="btn btn-primary btn pull-right" onclick="validateform2();">Save
                                & Continue...
                            </button>&nbsp;

                            <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel
                            </button>

                        </div>

                    </div>

                    <script>
                        function validateform2() {
                            var count = 0;
                            
                            if (count > 0)
                                alert("fill the mandatory fields");
                            else
                                validateform9();
                        }

                    </script>
                    <script>
                        function validateform9() {
                            var f = document.loginForm;
                            f.method = "post";
                            f.action = "Business_sam"
                            f.submit();
                        }
                    </script>

                        <%
        
   
// }
    //                }
                     %>
</form>
<jsp:include page="samp_forms.jsp">
    <jsp:param name="ProjectName" value="<%=Opportunityname%>"/>
    <jsp:param name="AppName" value="<%=app_Name%>"/>
    <jsp:param name="number" value="4"/>
    <jsp:param name="servlet" value="Business"/>
</jsp:include>
<%
           }
      //  }
   // } 
   catch (Exception e) {
    }
%>

<!-- /.row -->
</section>
<!-- /.section -->

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


<!-- ========== THEME JS ========== -->
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
    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod3" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
</script>
<!-- ========== THEME JS ========== -->


</body>
</html>
