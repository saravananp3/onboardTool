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
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css" />

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
    #ScrollBar
    {
        overflow-x: scroll;
    }
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
                            <h2 class="title">Infrastructure Component CheckList</h2>
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
                    <div class="row">

                        <div class="container-fluid">

                            <div class="panel-group" id="panels1">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Infrastructure   </a> </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse">
                                        <div class="panel-body text-left">
                                            <form name="LegacyForm">
                                                <div id="ScrollBar">
                                                    <table class="table table-bordered hidetable" id="mytable_infra">
                                                        <tr style="color:white;background-color:DodgerBlue;">
                                                            <th scope="col" style="color:white;">Infrastructure Component Type </th>
                                                            <th scope="col" style="color:white;">Component Name </th>
                                                            <th scope="col" style="color:white;">Managed/Legacy </th>
                                                            <th scope="col" style="color:white;"> Is the Server Shared with other applications </th>
                                                            <td>
                                                                <table class="table table-bordered hidetable">
                                                                    <tr style="color:white;background-color:DodgerBlue;">
                                                                        <td scope="col" style="width:5px; float:center;" colspan="4">ENVIRONMENTS</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td scope="col" style="color:black;">Dev</td>
                                                                        <td scope="col" style="color:black;">Test</td>
                                                                        <td scope="col" style="color:black;">Stage</td>
                                                                        <td scope="col" style="color:black;">Prod</td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td scope="col" style="color:white;"> Additional Comments</td>



                                                        </tr>
                                                        <tr>
                                                            <td> <input type="text" value="" placeholder="Infrastructure Component"> </td>
                                                            <td> <input type="text" value="" placeholder=" Component Name"> </td>
                                                            <td>
                                                                <select style="width:200px; height:34px;">
                                                                    <option value="Managed">Managed</option>
                                                                    <option value="Legacy">Legacy</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="radio" value="yes">yes
                                                                <input type="radio" value="No">No
                                                            </td>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>

                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td><textarea maxlength="120"></textarea></td>
                                                        </tr>

                                                        <tr>
                                                            <td> <input type="text" value="" placeholder="Infrastructure Component"> </td>
                                                            <td> <input type="text" value="" placeholder=" Component Name"> </td>
                                                            <td>
                                                                <select style="width:200px; height:34px;">
                                                                    <option value="Managed">Managed</option>
                                                                    <option value="Legacy">Legacy</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="radio" value="yes">yes
                                                                <input type="radio" value="No">No
                                                            </td>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>

                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td><textarea maxlength="120"></textarea></td>
                                                        </tr>

                                                        <tr>
                                                            <td> <input type="text" value="" placeholder="Infrastructure Component"> </td>
                                                            <td> <input type="text" value="" placeholder=" Component Name"> </td>
                                                            <td>
                                                                <select style="width:200px; height:34px;">
                                                                    <option value="Managed">Managed</option>
                                                                    <option value="Legacy">Legacy</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="radio" value="yes">yes
                                                                <input type="radio" value="No">No
                                                            </td>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>

                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td><textarea maxlength="120"></textarea></td>
                                                        </tr>


                                                        <tr>
                                                            <td> <input type="text" value="" placeholder="Infrastructure Component"> </td>
                                                            <td> <input type="text" value="" placeholder=" Component Name"> </td>
                                                            <td>
                                                                <select style="width:200px; height:34px;">
                                                                    <option value="Managed">Managed</option>
                                                                    <option value="Legacy">Legacy</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="radio" value="yes">yes
                                                                <input type="radio" value="No">No
                                                            </td>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>

                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td><textarea maxlength="120"></textarea></td>
                                                        </tr>

                                                        <tr>
                                                            <td> <input type="text" value="" placeholder="Infrastructure Component"> </td>
                                                            <td> <input type="text" value="" placeholder=" Component Name"> </td>
                                                            <td>
                                                                <select style="width:200px; height:34px;">
                                                                    <option value="Managed">Managed</option>
                                                                    <option value="Legacy">Legacy</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="radio" value="yes">yes
                                                                <input type="radio" value="No">No
                                                            </td>
                                                            <td>
                                                                <table>
                                                                    <tr>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>
                                                                        <td> <input type="text" value=""> </td>

                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td><textarea maxlength="120"></textarea></td>
                                                        </tr>


                                                    </table>
                                                </div>
                                        </div>

                                        <!-- <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="addothers();">Add</button> -->
                                        <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="">Add</button>
                                        <button type="button" style="margin:5px;" class="btn btn-warning pull-left" onclick="">Modify</button>
                                        </form>

                                        <button type="button" style="margin:5px;" class="btn btn-danger  pull-left" id="visible_del"
                                                onclick="">Delete
                                        </button>

                                        <button type="button" class="btn btn-primary pull-right" onclick="Submit();">Save & Continue</button>
                                    </div>

                                    <!--End of Table Info -->

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
</div>

</div>



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


<!-- ========== THEME JS ========== -->









</body>

</html>