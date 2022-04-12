<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<meta charset="utf-8" />
<link rel="icon" type="image/png" href="assets/img/favicon.ico">


<title>List Page</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet" href="styles/styles.css" type="text/css" />
<script src="js/jquery/jquery-2.2.4.min.js"></script>

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
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">

<!-- =========== Header Icon ========= -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">


<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
<style type="text/css">
body {
	background: #f1f1f1;
}
.active-1 {
	background: #1565c0;
}
.page-title-div {
	background: #1565c0;
	padding: 15px;
}
.fixed-top {
	width: 100%;
	padding-left: 0px;
	padding-right: 0px;
}
#nav_userid {
	color: green;
}
#nav_role {
	color: blue;
}
.btn {
	margin-left: 50px;
}
.card .card-body {
	padding: 1.88rem 1.81rem;
}
.grid-margin {
	margin-bottom: 1.875rem;
}
.col-12 {
	flex: 0 0 100%;
	max-width: 100%;
}
.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.3125rem;
}
.card-body {
	flex: 1 1 auto;
	padding: 1.25rem;
}
.card-title {
	margin-bottom: 0.75rem;
}
.navbar-nav-1 #nav-link {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 4px solid transparent;
}
.navbar-nav-1 #nav-link.active-1 {
	/* border-top: none; */
	border-left: none;
	border-right: none;
	border-bottom: 4px solid rgba(255, 255, 255, .5) !important;
}
.navbar-nav #nav-link {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 4px solid transparent;
}
.link:hover {
	background: #1565c0 important;
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

<%@include file="Nav-Bar.jspf"%>
        <nav class="nav nav-height-70 nav-font" id="bg-color" style="margin-top: -20px;">
            <div class="container-fluid">
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav-1 mt-3">
                        <li class="active-1" id="nav-link"><a class="link"
                            href="Admin_Userslist.jsp"
                            style="color: #fff; padding: 7px 10px; height: 35px;">UserList</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    <div class="main-wrapper">
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
                   <ul class="nav navbar-nav headerTab navAlign">
                      <li><a href="OpportunityList.jsp"><i class="fad fa-folders fa-2x iconAlign iconColor"></i>Applications</a></li>
                      <li class="active1"><a href="Admin_Module_Send_Invites.jsp" style= "color:#fff;"><i class="fad fa-user-cog iconAlign activeIcon fa-2x"></i>Administration</a></li>
                      <li><a href="PhaseList.jsp"><i class="fad fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
                      <li><a href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
                      <li ><a href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
                      <li><a href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
                  </ul> 
                 <ul class="nav navbar-nav navbar-right" style = "margin-top:45px;">
                        <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin</span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
            </div>
            /.row
            <nav class="navbar navbar-down">
                  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-12">
                              <h4 class="title" style="color:#fff">User Configuration</h4>
                               <p class="sub-title">Create and manage your Opportunities here</p>
                               <ul class="nav navbar-nav " >
                              <li class=" nav-link "><a class="link" href="Admin_Module_Send_Invites.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Send Invites</a></li>
                              <li class="nav-link" ><a class="link" href="Modify_Admin_Users_list.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Modify User</a></li>
                              <li class="nav-link active"><a class="link" href="Admin_Userslist.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">UserList</a></li>
                                <li class="nav-link "><a class="link" href="Admin_Role_Details.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Permissions</a></li>
            </ul>
                        </div>
                         <div class="container-fluid ">
                         <ul class="nav navbar-nav" >
                              <li ></li>
                                <li ></li>
                           </ul>
                         </div>
                    </div>
                </div>
            </nav>
        </div>
        /.container-fluid
    </nav > -->
    <form class="form-signin" name="loginForm" method="post">
            <div class="content-wrapper">
                <div class="content-container">
                    <!-- Projects List Start -->
                    <div class="main-page">
                        <div class="container-fluid"></div>
                        <section class="section">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="container-fluid">
                                        <div class="col-12 grid-margin">
                                            <div class="card">
                                                <div class="card-body">
                                                    <br>
                                                    <form class="form-sample">
                                                        <p class="card-description"></p>
                                                        <div class="content table-responsive">
                                                            <table class="table table-bordered table-striped"
                                                                id="datatable">
                                                                <thead>
                                                                    <th style="text-align:center;">UserName</th>
                                                                    <th style="text-align:center;">FirstName</th>
                                                                    <th style="text-align:center;">LastName</th>
                                                                    <th style="text-align:center;">Email</th>
                                                                    <th style="text-align:center;">Role</th>
                                                                    <th style="text-align:center;">Action</th>
                                                                </thead>
                                                                <tbody id ="Userslist">
                                                    </tbody>
                                                                                                                    <div class="modal" id="addModal" tabindex="-1"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color:#1565c0;">
                                <h5 class="modal-title" id="exampleModalLabel" style="color:white;">Add New User</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form name="PopUpform">
                                    <div class="row">
                                        <div class="form-group">
                                        <div class="col-lg-12">
                                                <label class="control-label" for="formInput526">UserName:</label>
                                                <input type="text" class="form-control" id="uname"
                                                    name="uname" required>
                                            </div>
                                            <div class="col-lg-12">
                                                <label class="control-label" for="formInput526">FirstName:</label>
                                                <input type="text" class="form-control" id="ufname"
                                                    name="fname" required>
                                            </div>
                                            <div class="col-lg-12">
                                                <label class="control-label" for="formInput526">LastName:</label>
                                                <input type="text" class="form-control" id="ulname"
                                                    name="lname" required>
                                            </div>
                                            <div class="col-lg-12">
                                                <label class="control-label" for="formInput526">E-Mail:</label>
                                                <input type="text" class="form-control" id="u_email"
                                                    name="u_email" required>
                                            </div>
                                            <div class="col-lg-12">
                                                <label class="control-label" for="formInput526">Password:</label>
                                                <input type="password" class="form-control" id="u_pwd"
                                                    name="u_pwd" required>
                                            </div>
                                            <div class="col-lg-12">
                                                <label class="control-label" for="formInput526">Role/Group:</label>
                                                <input type="text" class="form-control" id="u_role"
                                                    name="u_role" required>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="add_usersubmit" data-bs-dismiss="modal">Add User</button>
                                <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Close</button>
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
<button type="button" id="add_btn" class="btn btn-primary"
                                                            href="#" data-bs-toggle="modal" data-bs-target="#addModal"
                                                            style="margin: 5px">Add User</button>
                                                                        <button type="button"
                                                                        class="btn btn-primary pull-right" id="editpopup_btn"
                                                                        data-bs-toggle="modal" data-bs-target="#EditPopUp"
                                                                        style="display: none;">Edit PopUp</button>
                                                                        <button type="button"
                                                                        class="btn btn-primary pull-right"
                                                                        id="deletepopup_btn" data-bs-toggle="modal"
                                                                        data-bs-target="#DeletePopUp" style="display: none;">Delete
                                                                        PopUp</button>
                                                        <%--<button type="button" id="edit_button" name="edit_button"
                                                            class="btn btn-primary" style="margin:5px">
                                                        Delete User
                                                    </button>
                                                    <button type="button" id="delete_button" name="delete_button"
                                                            class="btn btn-primary" style="margin:5px">
                                                        Submit
                                                    </button>--%>
                                                        <!-- <input type="button" id="del_btn" class="btn btn-primary"
                                                            onclick="del();" value="Delete User"
                                                            style="margin: 5px"> --> &nbsp;&nbsp;
                                                        <!-- <button type="button" id="sub_btn" class="btn btn-primary"
                                                            onclick="servlet_call();" style="margin: -5px">Submit</button> -->
                </div>
            </div>
            <script>
            if(document.getElementById('role_conf').value=="R")
                checkk();
        </script>
        </form>
    </div>
    <div class="modal" id="EditPopUp" tabindex="-1"
                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header" style="background-color:#1565c0;">
                                                        <h5 class="modal-title" id="exampleModalLabel" style="color:white;">Update User Details</h5>
                                                        <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form name="PopUpform">
                                                            <div class="row">
                                                                <div class="form-group">
                                                                    <div class="col-lg-12">
                                                                        <label class="control-label" for="formInput526">Username:</label>
                                                                        <input type="text" class="form-control"
                                                                            id="uname_modify" name="uname" required>
                                                                            <label class="control-label" for="formInput526">Firstname:</label>
                                                                        <input type="text" class="form-control"
                                                                            id="ufname_modify" name="ufname" required>
                                                                            <label class="control-label" for="formInput526">Lastname:</label>
                                                                        <input type="text" class="form-control"
                                                                            id="ulname_modify" name="ulname" required>
                                                                            <label class="control-label" for="formInput526">User E-Mail:</label>
                                                                        <input type="text" class="form-control"
                                                                            id="u_email_modify" name="u_email" required>
                                                                            <label class="control-label" for="formInput526">User Role:</label>
                                                                        <input type="text" class="form-control"
                                                                            id="u_role_modify" name="u_role" required>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <input type="text" id="seq_num" name="" value=""
                                                                style="display: none;">
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary" id="update_submit"
                                                            data-bs-dismiss="modal">Update</button>
                                                        <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Delete pop up-->
                                        <div class="modal" id="DeletePopUp" tabindex="-1"
                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header" style="background-color:#1565c0;">
                                                        <h5 class="modal-title" id="exampleModalLabel" style="color:white;">Delete User</h5>
                                                        <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form name="DeleteForm">
                                                            <div class="modal-body">
                                                                <p style="font-size: 16px;">Do you want to Delete
                                                                    this User Permanently?</p>
                                                                <input type="text" id="seq_num"  style="display:none;"/>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary"
                                                            data-bs-dismiss="modal" id="delete_submit">Yes</button>
                                                        <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">No</button>
                                                    </div>
                                                </div>
                                            </div>
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
    <script>
$(document).on('mouseenter','.active1', function(){
         $('.activeIcon').css('color','#1565c0');
     });
     $(document).on('mouseleave','.active1', function(){
         $('.activeIcon').css('color','#fff');
     });
</script>
    <!-- ========== COMMON JS FILES ========== -->
    <script src="js/admin_modify_module/admin_retrieve_users.js"></script>
    <script src="js/admin_modify_module/EditAjaxCall.js"></script>
    <script src="js/admin_modify_module/DeleteAjaxCall.js"></script>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/jquery-ui/jquery-ui.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/pace/pace.min.js"></script>
    <script src="js/lobipanel/lobipanel.min.js"></script>
    <script src="js/iscroll/iscroll.js"></script>
    <script type="text/javascript">
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
    <script src="js/admin_modify_module/admin_add_user.js"></script>
    <script src="js/admin_modify_module/admin_retrieve_users.js"></script>
    <script src="js/admin_modify_module/DeleteAjaxCall.js"></script>
    <script src="js/admin_modify_module/EditAjaxCall.js"></script>
    <script type="text/javascript"
        src="js/date-picker/bootstrap-datepicker.js"></script>
    <script type="text/javascript"
        src="js/date-picker/jquery.timepicker.js"></script>
    <script type="text/javascript" src="js/date-picker/datepair.js"></script>
    <script type="text/javascript" src="js/date-picker/moment.js"></script>
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript"
        src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
    <script type="text/javascript"
        src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript"
        src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="js/notification/notification.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    <!-- ========== THEME JS ========== -->
    <script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>
    <!-- ========== THEME JS ========== -->
    <script>
    $(function($) {
        // 1st  datepicker
        $('#basicExample .time').timepicker({
            'showDuration': true,
            'timeFormat': 'g:ia'
        });
        $('#basicExample .date').datepicker({
            'format': 'm/d/yyyy',
            'autoclose': true
        });
        var basicExampleEl = document.getElementById('basicExample');
        var datepair = new Datepair(basicExampleEl);
        // 2nd  datepicker
        $('#datetimepicker1').datetimepicker({
            debug: true
        });
        // 3rd  datepicker
        $('#datetimepicker9').datetimepicker({
            viewMode: 'years'
        });
        // 4th  datepicker
        $('#datetimepicker10').datetimepicker({
            viewMode: 'years',
            format: 'MM/YYYY'
        });
        // 5th  datepicker
        $('#datetimepicker11').datetimepicker({
            daysOfWeekDisabled: [0, 6]
        });
        // 6th  datepicker
        $('#datetimepicker12').datetimepicker({
            inline: true,
            sideBySide: true
        });
    });
</script>
    <script>
$(document).ready(function() {
    $('#datatable').DataTable( {
        "pagingType": "full_numbers"
    } );
} );
</script>
    <script src="js/navigation/navigation.js"></script>
    <!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    
</body>
</html>