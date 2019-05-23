<!DOCTYPE html>
<html lang="en">
<head>

    <title>Project Information</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>


    <style type="text/css">

        body{

            background:#f5f5f5;

        }
        #sitetitle1{

            color:DodgerBlue;
            text-align:center;
            float:right;

        }


        .bs-wizard {margin-top: 40px;}

        /*Form Wizard*/
        .bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
        .bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
        .bs-wizard > .bs-wizard-step + .bs-wizard-step {}
        .bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #595959; font-size: 16px; margin-bottom: 5px;}
        .bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
        .bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background: #6dccff; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 50%;}
        .bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' ';width: 14px;height: 14px;background: 	#1E90FF;border-radius: 50px;position: absolute;top: 5px;left: 5px;}
        .bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
        .bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background:  #6dccff;}
        .bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
        .bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
        .bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
        .bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
        .bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
        .bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
        .bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
        .bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
        .bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
        /*END Form Wizard*/

        /* Style the buttons */
        .btn {
            border: none;
            outline: none;
            padding: 3px 14px;
            background-color: #3697e8;
            cursor: pointer;

        }
        .activ-pro{     font-size: 16px;
            margin-left: -15px;
            margin-right: 70px;}
        .active, .btn:hover {

            color: white;
        }
        .example-two {
            border-radius: 10px;
            border: 3px solid #e3e3e3;
        }

        /* Style the active class, and buttons on mouse-over */


    </style>

    <script src="js_in_pages/tree1.js"></script>

</head>
<body class="top-navbar-fixed">











<script type="text/javascript">
    var total;
    function updatesum() {
        var datasize=document.loginForm.data_size.value;
        var currentuser=document.loginForm.curnt_users.value;

        var temp,temp1,temp2,temp3,total,result;
        if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
        {
            document.loginForm.complexity.value ="Low";
        }
        if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='2')
        {
            document.loginForm.complexity.value ="Low";
        }
        if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='5')
        {
            document.loginForm.complexity.value ="Low to Medium";
        }
        if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='1'&&currentuser.length==4)
        {
            document.loginForm.complexity.value ="Low to Medium";
        }
        if(datasize.charAt(0)=='<' && currentuser.charAt(0)=='1')
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
        {
            document.loginForm.complexity.value ="Low";
        }
        if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='2')
        {
            document.loginForm.complexity.value ="Low to Medium";
        }
        if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='5')
        {
            document.loginForm.complexity.value ="Low to Medium";
        }
        if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='1'&&currentuser.length==4)
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='1' && currentuser.charAt(0)=='1')
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
        {
            document.loginForm.complexity.value ="Low to Medium";
        }
        if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='2')
        {
            document.loginForm.complexity.value ="Low to Medium";
        }
        if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='5')
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='1'&&currentuser.length==4)
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='2' && currentuser.charAt(0)=='1')
        {
            document.loginForm.complexity.value ="Medium to High";
        }
        if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
        {
            document.loginForm.complexity.value ="Low to Medium";
        }
        if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='2')
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='5')
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='1'&&currentuser.length==4)
        {
            document.loginForm.complexity.value ="Medium to High";
        }
        if(datasize.charAt(0)=='5' && currentuser.charAt(0)=='1')
        {
            document.loginForm.complexity.value ="Medium to High";
        }
        if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='2')
        {
            document.loginForm.complexity.value ="Medium";
        }
        if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='5')
        {
            document.loginForm.complexity.value ="Medium to High";
        }
        if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='1'&&currentuser.length==4)
        {
            document.loginForm.complexity.value ="Medium to High";
        }
        if(datasize.charAt(0)=='>' && currentuser.charAt(0)=='1')
        {
            document.loginForm.complexity.value ="High";
        }
        if(document.loginForm.complexity.value=="Low")
        {
//document.loginForm.est_archive.value =700;
            document.loginForm.est_scrn.value ="<=5";
            result=1;
        }
        if(document.loginForm.complexity.value=="Low to Medium")
        {
//document.loginForm.est_archive.value =1000;
            document.loginForm.est_scrn.value ="<=10";
            result=2;
        }
        if(document.loginForm.complexity.value=="Medium")
        {
//document.loginForm.est_archive.value =1400;
            document.loginForm.est_scrn.value ="<=20";
            result=3;
        }
        if(document.loginForm.complexity.value=="Medium to High")
        {
//document.loginForm.est_archive.value =1800;
            document.loginForm.est_scrn.value ="<=25";
            result=4;
        }
        if(document.loginForm.complexity.value=="High")
        {
//document.loginForm.est_archive.value =2500;
            document.loginForm.est_scrn.value ="<=30";
            result=5;
        }
        var appnumber=3;
        document.loginForm.est_db_size.value=(document.loginForm.no_of_app_complexity.value*0.001*document.loginForm.strg_est.value).toFixed(2);
        document.loginForm.est_hrs.value =(document.loginForm.no_of_app_complexity.value*document.loginForm.est_archive.value).toFixed(2);
        temp=(100*document.loginForm.est_hrs.value);
        document.loginForm.est_cst.value="$"+temptoFixed(2);
        temp1=document.loginForm.est_db_size.value*document.loginForm.IA_lic_cst.value;
        document.loginForm.ttl_IA_cst.value ="$"+temp1.toFixed(2);
        temp2=10000*document.loginForm.est_db_size.value;
        document.loginForm.ttl_infra_cst.value="$"+temp2.toFixed(2);
        temp3=5*temp3*0.01*document.loginForm.IA_maint_cst.value
        document.loginForm.ttl_IA_prdct_cst.value ="$"+temp3.toFixed(2);
        total=temp+temp1+temp2+temp3;
        document.loginForm.ttl.value="$"+total.toFixed(2);
        document.loginForm.tootal.value=total.toFixed(2);
        document.loginForm.ttl_cst_fr_app.value=0+(total.toFixed(2)-0);
        document.loginForm.est_archive_cst.value="$"+document.loginForm.ttl_cst_fr_app.value.toFixed(2);
    }
    function add()
    {
        var sum;
        sum=(document.loginForm.ttl_cst_fr_app.value-0)+(document.loginForm.add_cst_fr_contigenccurrentuser.value-0)+(document.loginForm.add_cst.value-0)+(document.loginForm.IA_app_sprt_cst.value-0);
        document.loginForm.est_archive_cst.value="$"+sum.toFixed(2);
    }
</script>

<form class="form-signin" name="loginForm" method="post" action="Displaydb">

    <div class="main-wrapper">

        <!-- ========== TOP NAVBAR ========== -->
        <nav class="navbar top-navbar bg-white box-shadow">
            <div class="container-fluid">

                <div class="row">
                    <div class="navbar-header no-padding">


                        <a class="navbar-brand" href="Project_list.jsp" id="sitetitle">
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



                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">
                            <a class="navbar-brand" href="Project_List.jsp" id="sitetitle1">PROJECT NAME-onboard1</a>

                            <li><a href="#"><span id="nav_userid">admin&nbsp;</span>logged in as &nbsp;<span id='nav_role'>admin</span></a></li>
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


                                <li class="has-children">
                                    <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav" id="myDIV">
                                        <li><a href="AppEmphasize_EditProject.jsp" > <span >Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp" > <span>Application Information</span></a></li>
                                        <li class="btn"><a href="AppEmphasize_CostCalculation.jsp" > <span class="activ-pro">Application Complexity</span></a></li>
                                        <li><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
                                        <li><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
                                    </ul>
                                </li>








                                <li class="has-children">
                                    <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Applications.jsp" > <span>Archive Intake</span></a></li>
                                        <li><a href="Decomm_Intake_Applications.jsp" > <span>Decomm Intake</span></a></li>

                                    </ul>
                                </li>

                                <li class="has-children">
                                    <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Archive_Execution.jsp" > <span>Archive Execution</span></a></li>
                                        <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                    </ul>
                                </li>

                                <li class="has-children">
                                    <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="RoleUIDashboard.jsp" > <span>Reports Dashboard</span></a></li>
                                        <li><a href="RoleDashboard.jsp" > <span>Role Dashboard</span></a></li>
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





                </script>

                <!-- Projects List Start -->
                <form>
                <section>

                <div class="row">
                    <div class="container">
                    <div class="col-md-12">



                    <br>
                    <div class="row">

                    <div class="col-md-3">
                    <div class="form-group">
                    <center><label >Initiate</label></center>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><span style="color:black;">0%</span></div>
                </div></div></div>

                <div class="col-md-3">
                    <div class="form-group">
                    <center><label >Plan</label></center>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><span style="color:black;">0%</span></div>
                </div></div></div>

                <div class="col-md-3">
                    <div class="form-group">
                    <center><label >Execute</label></center>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar2" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><span style="color:black;">0%</span></div>
                </div></div></div>

                <div class="col-md-3">
                    <div class="form-group">
                    <center><label >Closure</label></center>
                <div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-stripedss-bar" role="progressbar" id="prog_bar3" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"><span style="color:black;">0%</span></div>
                </div></div></div>
                </div>



                <script>document.getElementById('prog_bar').className='progress-bar progress-bar-danger progress-bar-striped'</script>


                <script>document.getElementById('prog_bar1').className='progress-bar progress-bar-danger progress-bar-striped'</script>


                <script>document.getElementById('prog_bar2').className='progress-bar progress-bar-danger progress-bar-striped'</script>


                <script>document.getElementById('prog_bar3').className='progress-bar progress-bar-danger progress-bar-striped'</script>






                <div class="container">


                    <div class="row bs-wizard" style="border-bottom:0;">

                        <div class="col-xs-3 bs-wizard-step complete">
                            <div class="text-center bs-wizard-stepnum">Project Information</div>
                            <div class="progress"><div class="progress-bar"></div></div>
                            <a href="#" class="bs-wizard-dot example-two"></a>
                            <div class="bs-wizard-info text-center"></div>
                        </div>

                        <div class="col-xs-3 bs-wizard-step active"><!-- active -->
                            <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>
                            <div class="progress"><div class="progress-bar"></div></div>
                            <a href="#" class="circle bs-wizard-dot example-two"></a>
                            <div class="bs-wizard-info text-center"></div>
                        </div>

                        <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                            <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                            <div class="progress"><div class="progress-bar "></div></div>
                            <a href="#" class=" bs-wizard-dot example-two"></a>
                            <div class="bs-wizard-info text-center"></div>
                        </div>

                        <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                            <div class="text-center bs-wizard-stepnum">Final</div>
                            <div class="progress"><div class="progress-bar"></div></div>
                            <a href="#" class="bs-wizard-dot example-two"></a>
                            <div class="bs-wizard-info text-center"> </div>
                        </div>
                    </div>





                </div>
                <br/>
                <div class="panel-group" id="panels1">
                    <!-- <div class="panel-heading">
                    <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1" onclick="switchColors0();"> Parameters   </a> </h4>
                </div>

                <div id="collapse1" class="panel-collapse collapse in">
                    <div class="panel-body text-left">



                    <div class="form-group">
                    <label class="control-label" for="formInput526"><div class="required">Project Name&nbsp;<span class="text-danger">*</span></div></label>
                <input type="text" class="form-control" id="prj_name"  name="prj_name" value="onboard1" required>
                </div>

                <div class="form-group">
                    <label class="control-label" for="formInput526"><div class="required">IA License cost per TB($)&nbsp;<span class="text-danger">*</span></div></label>
                <input type="text" class="form-control" id="IA_lic_cst"  name="IA_lic_cst" value=" " required>
                </div>
                <div class="form-group">
                    <label class="control-label" for="formInput526"><div class="required">IA Maintenance Cost Per Year(%)&nbsp;<span class="text-danger">*</span></div></label>
                <input type="text" class="form-control" id="IA_maint_cst"  name="IA_maint_cst" value=" " required>
                </div>
                <div class="form-group">
                    <label class="control-label" for="formInput316"><div class="required">Infra Structure Cost per TB($)&nbsp;<span class="text-danger">*</span></div></label>
                <input type="text" class="form-control" id="Infrastrct_cst"  name="Infrastrct_cst" value=" " required>
                </div>
                <div class="form-group">

                    <label class="control-label" for="formInput526"><div class="required">Storage Estimate(%)&nbsp;<span class="text-danger">*</span></div></label>
                <input type="text" class="form-control" id="strg_est"  name="strg_est" value=" " required>

                </div>
                <div class="form-group">
                    <label class="control-label" for="formInput526"><div class="required">Labor Cost Per Hour for IA Dev Team($)&nbsp;<span class="text-danger">*</span></div></label>
                <input type="text" class="form-control" id="lab_cst"  name="lab_cst" value=" " required>
                </div>
                <div class="form-group">
                    <label class="control-label" for="formInput526"><div class="required">Number of Applications based on Complexity&nbsp;<span class="text-danger">*</span></div></label>
                <input type="text" class="form-control" id="no_of_app_complexity"  name="no_of_app_complexity" value=" " required>
                </div>
                <div>
                <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                </div>
                </div>
                </div>
                </div> -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">    Application Complexity   </a> </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse ">
                            <div class="panel-body text-left">


                                <div class="table-responsive" id="table-scroll">

                                    <!-- Initialization
                                                * js-dynamitable => dynamitable trigger (table)
                                                -->
                                    <table class="js-dynamitable     table table-bordered" id="myTable">

                                        <!-- table heading -->
                                        <thead>

                                        <!-- Sortering
                                                        * js-sorter-asc => ascending sorter trigger
                                                        * js-sorter-desc => desending sorter trigger
                                                        -->
                                        <tr>
                                            <th>Application Name<span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction1()"></span></th>
                                            <th>Complexity <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction2()"></span></th>
                                            <th>Estimated Number of Screens <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction3()"></span></th>
                                        </tr>


                                        <!-- table body -->
                                        <tbody>




                                        <tr>

                                            <td class="edit_row" style="cursor:pointer" id="1">onboard1</td>
                                            <td class="row_s" style="cursor:pointer" id="2">null</td>
                                            <td class="row_t" style="cursor:pointer" id="3">null</td>



                                        </tr>


                                        </tbody>
                                    </table>
                                    <script>
                                        var edit_row = document.querySelectorAll('#myTable .edit_row');
                                        for(var i=0; i<edit_row.length; i++) {
                                            edit_row[i].addEventListener('click', function(e){
                                                var tr_parent = this.parentNode;
                                                document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
                                                var projectname_value=document.getElementById('proj_name').value;
                                                var knt=0;

                                                valuess=" ";
                                                if(valuess==projectname_value)
                                                {

                                                    knt++;

                                                    document.getElementById('complexity').value = " ";
                                                    document.getElementById('curnt_users').value = " ";
                                                    document.getElementById('data_size').value = " ";
                                                    document.getElementById('RO_DATE').value = " ";
                                                    document.getElementById('SME_DATE').value = " ";
                                                    document.getElementById('est_scrn').value = " ";
                                                }

                                                if(knt==0){
                                                    document.getElementById('complexity').value = " ";
                                                    document.getElementById('curnt_users').value = " ";
                                                    document.getElementById('data_size').value = " ";
                                                    document.getElementById('RO_DATE').value = " ";
                                                    document.getElementById('SME_DATE').value = " ";
                                                    document.getElementById('est_scrn').value = " ";
                                                }
                                            }, false);
                                        }
                                    </script>

                                </div>
                                <br />

                                <div class="form-group">
                                    <label class="control-label" for="formInput526"><div class="required">Project Name&nbsp;<span class="text-danger">*</span></div></label>
                                    <input type="text" class="form-control" id="prj_name"  name="prj_name" value="onboard1" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="formInput526"><div class="required">Number of Applications based on Complexity&nbsp;<span class="text-danger">*</span></div></label>
                                    <input type="text" class="form-control" id="no_of_app_complexity"  name="no_of_app_complexity" value=" " >
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="formInput664">Application Name</label>
                                    <input type="text" class="form-control" id="proj_name"  name="proj_name">
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="formInput26">Data Size&nbsp;<span class="text-danger">*</span></label>
                                    <select id="data_size" class="form-control" name="data_size" onChange="updatesum()" required>
                                        <option></option>
                                        <option><100 GB</option>
                                        <option>100 to 250 GB</option>
                                        <option>250 to 500 GB</option>
                                        <option>500 to 1 TB</option>
                                        <option>>1 TB</option>
                                    </select>
                                </div>


                                <div class="form-group">
                                    <label class="control-label" for="formInput664"><b>Data Source</b></label>
                                </div>
                                <div class="checkbox">
                                    <label class="Data Source">
                                        <input type="checkbox" name="data_source" value="regulardb"  >Regular DB</label><br />
                                    <label class="Data Source">     <input type="checkbox" name="data_source" value="erp"  >ERP</label><br />
                                    <label class="Data Source"> <input type="checkbox" name="data_source" value="product"  >Product based
                                    </label>  <br />
                                </div>


                                <div class="form-group">
                                    <label class="control-label" for="formInput26">Current users&nbsp;<span class="text-danger">*</span></label>
                                    <select id="curnt_users" class="form-control" name="curnt_users" onChange="updatesum()" required>
                                        <option></option>
                                        <option><10</option>
                                        <option><25</option>
                                        <option><50</option>
                                        <option><100</option>
                                        <option>100 to 500</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="formInput26">Complexity&nbsp;<span class="text-danger">*</span></label>
                                    <select id="complexity" class="form-control" name="complexity" onChange="updatesum()" required>
                                        <option></option>
                                        <option>Low</option>
                                        <option>Low to Medium</option>
                                        <option>Medium</option>
                                        <option>Medium to High</option>
                                        <option>High</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="formInput664">Read Only Date</label>
                                    <input placeholder="mm/dd/yyyy" type="text" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" id="RO_DATE"  name="read_date" onChange="updatesum()">
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="formInput664">SME Availability Date</label>
                                    <input placeholder="mm/dd/yyyy" type="text" class="form-control" id="SME_DATE"  name="sme_date" onChange="updatesum()">
                                </div>


                                <div class="form-group">
                                    <label class="control-label" for="formInput664">Estimated Number of Screen</label>
                                    <input type="text" class="form-control" id="est_scrn"  name="est_scrn" onChange="updatesum()" >
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="formInput664">Does the data needs to be Retained?</label>
                                    <p>
                                        <label class="radio-inline">

                                            <input type="radio" name="data_retained" class="radio" id="checkbox_id_yes" value="true"/>
                                            <b>Yes</b>
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="data_retained" class="radio" id="checkbox_id_no" value="false"/>
                                            <b>No</b>
                                        </label>
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label class="Q2" for="formInput664" hidden>If the data is retained , do we need to decommission the application?</label>

                                    <p class="Q2" hidden>
                                        <label class="radio-inline">

                                            <input type="hidden" id="yes" name="Decommission" class="radio1" value="true"/>
                                            <b>Yes</b>

                                        </label>
                                        <label class="radio-inline">

                                            <input type="hidden" id="no" name="Decommission" class="radio1" value="false"/>
                                            <b>  No </b>
                                        </label>
                                    </p>


                                </div>

                                <br>
                                <div>
                                    <button type="submit" class="btn btn-primary pull-right" onclick="OnButton1()" >Save & Continue</button>




                                    <a href="AppEmphasize_Application.jsp" class="btn btn-default" class="btn pull-right">Back</a>
                                </div>

                            </div>

                        </div>

                    </div>



                    <input type="text" id="pwqej" value="X" style="display:none">
                    <br/>








                </div>

            </div>
            <!-- /.col-md-6 -->

        </div>
        <!-- /.row -->

        </section>
        <!-- /.section -->
</form>
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
    if(document.getElementById('pwqej').value=="R")
        checkk();
</script>
<script>
    // Add active class to the current button (highlight it)
    var header = document.getElementById("myDIV");
    var btns = header.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
</script>


<!-- ========== COMMON JS FILES ========== -->
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
    function OnButton1()
    {
        var ProjectName=$('#prj_name').val();
        var no_of_app_complexity=$('#no_of_app_complexity').val();
        var data_size=$('#data_size').val();
        var current_user=$('#curnt_users').val();
        var complexity=$('#complexity').val();
        var q2id=$('#yes').attr('type');
        var check2=$('[name="Decommission"]:checked').val();
        var check1=$('[name="data_retained"]:checked').val();
        if(ProjectName==""||no_of_app_complexity==""||current_user==""||complexity==""||check1==undefined||q2id=="radio"&&check2==undefined)
        {
            alert("fill the manditory fields.");
        }
        else {
            document.loginForm.action = "Displaydb"
            document.loginForm.submit();
            document.loginForm.submit();
        }
    }
    $('.radio').on('change', function() {
        //alert( this.value );
        if(this.value=="true")
        {
            $(".Q2").show();
            $(".radio1").attr('type','radio');
        }
        else
        {
            $(".Q2").hide();
            $(".radio1").attr('type','hidden');


        }
    });

    /*$('.radio').on('click', function() {
        // in the handler, 'this' refers to the box clicked on
        var $box = $(this);
        if ($box.is(":checked")) {
            // the name of the box is retrieved using the .attr() method
            // as it is assumed and expected to be immutable
            var group = "input:checkbox[name='" + $box.attr("name") + "']";
            // the checked state of the group/box on the other hand will change
            // and the current value is retrieved using .prop() method
            $(group).prop("checked", false);
            $box.prop("checked", true);
        } else {
            $box.prop("checked", false);
        }
    });*/
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
