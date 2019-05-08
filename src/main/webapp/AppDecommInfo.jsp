<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App-DecommRequirements</title>
    <meta name="description" content="Blueprint: View Mode Switch" />


    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>



</head>
<style type="text/css">
    .breadcrumb-div {
        background-color: #e7e7e7;
        color: #010101; }
    #button1{

        padding:20px;


    }

    #return-to-top {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: rgb(0, 0, 0);
        background: rgba(0, 0, 0, 0.7);
        width: 50px;
        height: 50px;
        display: block;
        text-decoration: none;
        -webkit-border-radius: 35px;
        -moz-border-radius: 35px;
        border-radius: 35px;
        display: none;
        -webkit-transition: all 0.3s linear;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top i {
        color: #fff;
        margin: 0;
        position: relative;
        left: 16px;
        top: 13px;
        font-size: 19px;
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top:hover {
        background: rgba(0, 0, 0, 0.9);
    }
    #return-to-top:hover i {
        color: #fff;
        top: 5px;
    }



</style>

<body class="top-navbar-fixed">



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
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-ellipsis-v"></i>
                    </button>
                    <button type="button" class="navbar-toggle mobile-nav-toggle" >
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <!-- /.navbar-header -->
                <a class="navbar-brand" href="Project_List" id="sitetitle"></a>

                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="#"><span id="nav_userid">&nbsp;</span>logged in as &nbsp;<span id='nav_role'></span></a></li>
                        <li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a>
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

                            <li class="nav-header">
                                <a href="AppEmphasize_EditProject.jsp"><span class="">App Emphasize Module</span></a>
                            </li>
                            <li class="has-children">
                                <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                    <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                </ul>
                            </li>

                            <li class="has-children">
                                <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity</span></a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                            </li>

                            <li class="nav-header">
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
                            </li>
                            <li ><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
                            </li>
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
                            <h2 class="title">Decomm Intake Requirements</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i>Home</a></li>

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>
                <section>
                    <a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>
                    <br>
                    <form name="Decomm_Intake_Requirements">
                        <div class="row">

                            <div class="container">

                                <div class="panel-group" id="panels1">

                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"> <a  data-parent="#panels1" > App Decomm Info  </a> </h4>
                                        </div>
                                        <div id="collapse2" class="panel-collapse">
                                            <div class="panel-body text-left">
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Application Name</label>
                                                    <input type="text" class="form-control" id="app_name" placeholder="Application Name" name="appname" >
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Legacy Application Name</div></label>
                                                    <input type="text" class="form-control" id="legacyappname" placeholder="Legacy Application Name" name="legacyappname" required >
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Enterprise Team Decomm Project Number</label>
                                                    <input type="text" class="form-control" id="projectnumber" placeholder="Project Number" name="projectnumber" >
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Application Identification Number</div></label>
                                                    <input type="text" class="form-control" id="ain" placeholder="Tracking ID/Unique Application Id from Service Now or any relevant source" name="ain" >
                                                </div>
                                                <!-- Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Business Unit and Geographic Location Code(For decommission Project to charge back)</div></label>
                                                    <div class="table-responsive" id="table-scroll">

                                                        <table class="table table-bordered">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">Business Unit</th>
                                                                <th scope="col" style="color:white;">Operation Unit</th>
                                                                <th scope="col" style="color:white;">Location Unit</th>
                                                                <th scope="col" style="color:white;">Department</th>
                                                                <th scope="col" style="color:white;">Action</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td><input type="text" id ="business_unit_1"></td>
                                                                <td><input type="text" id ="operation_unit_1"></td>
                                                                <td><input type="text" id ="location_unit_1"></td>
                                                                <td><input type="text" id ="department_1"></td>

                                                                <td>
                                                                    <i class="fa fa-plus" aria-hidden="true" id="myBtn"></i>
                                                                    <i class="fa fa-trash-o" aria-hidden="true" id="delete"></i>
                                                                    <i class="fa fa-pencil-square-o" aria-hidden="true" id="modify"></i>

                                                                </td>
                                                            </tr>


                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>

                                                <!--End of Table Info -->
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Infrastructure Project Number</label>
                                                    <input type="text" class="form-control" id="infraprojectnumber" placeholder="Infrastructure Project Number" name="infraprojectnumber" >
                                                </div>
                                                <!-- Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Site Location of the Assets</div></label>
                                                    <div class="table-responsive">

                                                        <table class="table table-bordered">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">Country</th>
                                                                <th scope="col" style="color:white;">City</th>
                                                                <th scope="col" style="color:white;">State</th>
                                                                <th scope="col" style="color:white;">Office Designation</th>
                                                                <th scope="col" style="color:white;">Action</th>

                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <tr>

                                                                <td><input type="text" id ="country1"></td>
                                                                <td><input type="text" id ="city1"></td>
                                                                <td><input type="text" id ="state1"></td>
                                                                <td><input type="text" id ="office_designation1"></td>
                                                                <td>
                                                                    <i class="fa fa-plus" aria-hidden="true" id="myBtn1"></i>
                                                                    <i class="fa fa-trash-o" aria-hidden="true" id="delete1"></i>
                                                                    <i class="fa fa-pencil-square-o" aria-hidden="true" id="modify1"></i>
                                                                </td>


                                                            </tr>
                                                            <tr>

                                                                <td><input type="text" id ="country"></td>
                                                                <td><input type="text" id ="city"></td>
                                                                <td><input type="text" id ="state"></td>
                                                                <td><input type="text" id ="office_designation"></td>
                                                                <td>
                                                                    <i class="fa fa-plus" aria-hidden="true" id="myBtn2"></i>
                                                                    <i class="fa fa-trash-o" aria-hidden="true" id="delete2"></i>
                                                                    <i class="fa fa-pencil-square-o" aria-hidden="true" id="modify2"></i>
                                                                </td>


                                                            </tr>


                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>

                                                <!--End of Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label" for="formInput664"><div class="required_fie">Read Only Date</div></label>
                                                    <input placeholder="mm/dd/yyyy" type="text" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" id="RO_DATE"  name="read_date" onChange="updatesum()">
                                                </div>







                                                <br>
                                                <br>
                                                <button type="button" class="btn btn-primary pull-right" onclick="location.href='ContactInfo.jsp';">Save & Continue</button>
                                            </div>

                                        </div>







                                    </div>

                                </div>

                            </div>
                        </div>
                    </form>





                </section>


            </div>


        </div>


        <script>
            /*if(document.getElementById('Role_info').value=="R")
                checkk();*/
        </script>
        <script>
            var url_string=window.location.href;
            var url = new URL(url_string);
            var appname = url.searchParams.get("appname");
            console.log("application name",appname);
            function submit(appname)
            {
                var f=document.Decomm_Intake_Requirements;
                f.method = "post";
                f.action="DecommIntakeRequirements_db_update?appname&="+appname;
                f.submit();
            }
        </script>




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


        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>
        <script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/datepair.js"></script>
        <script type="text/javascript" src="js/date-picker/moment.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


        <!-- ========== THEME JS ========== -->

        <script type="text/javascript">
            $('.datepicker').datepicker({
                format: 'mm/dd/yyyy',
                startDate: '-3d'
            });
        </script>
        <script>


            $(window).scroll(function() {
                if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
                    $('#return-to-top').fadeIn(200);    // Fade in the arrow
                } else {
                    $('#return-to-top').fadeOut(200);   // Else fade out the arrow
                }
            });
            $('#return-to-top').click(function() {      // When arrow is clicked
                $('body,html').animate({
                    scrollTop : 0                       // Scroll to top of body
                }, 500);
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


</body>

</html>
