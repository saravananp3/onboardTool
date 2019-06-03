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
                    <div class="row">

                        <div class="container">

                            <div class="panel-group" id="panels1">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Legacy Retention Information  </a> </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse">
                                        <div class="panel-body text-left">
                                         <form name="LegacyForm">
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198"><div class="required_fie">Retention Code</div></label>
                                                <input type="text" class="form-control" id="retention_code" placeholder="Retention Code" name="retention_code" >
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198"><div class="required_fie">Trigger Date Field </div></label>
                                                <input type="text" class="form-control" id="trigger_date_field" placeholder="mm/dd/yyyy" name="trigger_date_field" required >
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198"><div class="required_fie">Period Of Retention </div> </label>
                                                <input type="text" class="form-control" id="period_of_retention" placeholder="period of retention" name="period_of_retention" >
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198"><div class="required_fie"> Table Name/Is Retention need to apply </div></label>
                                                <input type="file" name="pic" accept="image/*" id ="choosen_file_name">
                                            </div>
                                            <!-- Table Info -->

                                            <div class="form-group">
                                                <label class="control-label" for="formInput198"><div class="required_fie">Name the Legacy Retention & E-Discovery SME</div></label>
                                                <input type="text" class="form-control" id="sme"  name="e_dicovery" >

                                            </div>

                                            <!--End of Table Info -->
                                            <div class="form-group=">
                                                <label class="control-label" for="formInput198">Does any Records Have Legal Holds/Tax Holds or Any Indication</label>
                                                <select class="col-sm-12" style="height:35px;" id = "legal_tax_holds" name = "legal_tax_holds">
                                                    <option>yes</option>
                                                    <option>No</option>

                                                </select>
                                            </div>

                                            <div>
                                                <label class="control-label" for="formInput198"><div class="required_fie">Who or What entity provided legal or tax hold identification</div></label>
                                                <input type ="text" class="form-control" id="tax_holds" name = "tax_holds">
                                            </div>
                                            <div>
                                                <label class="control-label" for="formInput198">Should this Application's Data to be Archived?</label>
                                                <select class="col-sm-12" style="height:35px;" id ="data_archived" name = "data_archived">
                                                    <option>yes</option>
                                                    <option>no</option>
                                                </select>

                                            </div>
                                            <br>
                                            <div>
                                                <label class="control-label" for="formInput198">Brief Explanation</label>
                                                <input type ="text" class="form-control" id="brief" name = "brief">
                                            </div>
                                            <br>
                                            <br>

                                            <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="addothers();">Add</button>
                                            <button type="button" style="margin:5px;" class="btn btn-warning pull-left">Modify</button>
                                         </form>
                                            <button type="button" style="margin:5px;" class="btn btn-danger pull-left">Delete</button>
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
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <form>
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


            <div class="row">
                <div class="form-group">
                    <div class="col-lg-8">
                        <label class="control-label" for="formInput526">Column name:</label>
                        <input type="text" class="form-control" id="idname"  name="idname" required>
                    </div>
                </div>
            </div><br/>
            <div class="row">
                <div class="form-group">
                    <div class="col-lg-8">
                        <label class="control-label" for="formInput526">Type:</label>
                        <select id="types" class="form-control" name="types" onChange="call()" required >
                            <option value="Text box">Text box</option>
                            <option value="Check box">Check box</option>
                            <option value="Radio box">Radio box</option>
                            <option value="Dropdown">Dropdown</option>
                            <option value="Datepicker">Datepicker</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row" id="check" style="display:none;">
                <div class="form-group">
                    <div class="col-sm-4">
                        <label class="control-label" for="formInput526">Number of check boxes:</label>
                        <input type="text" class="form-control" id="number"  name="number" onChange="chk">
                    </div>
                </div>
                <br/>
            </div>
            <div class="row" id="rdo" style="display:none;">
                <div class="form-group">
                    <div class="col-sm-4">
                        <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                        <input type="text" class="form-control" id="radio_number"  name="radio_number" onChange="radio()">
                    </div>
                </div>
                <br/>
            </div>
            <div class="row" id="drop" style="display:none;">
                <div class="form-group">
                    <div class="col-sm-4">
                        <label class="control-label" for="formInput526">Number of Options:</label>
                        <input type="text" class="form-control" id="drop_number"  name="drop_number" onChange="drp_dwn()">
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
            <input type="text" name="panel" value="" style="display:none;">
            <button type="submit" class="btn btn-primary" >Submit</button>
            <button type="button" onclick="window.location.href='samp_business.jsp'" class="btn btn-default">Cancel</button>
    </div>
</div>
</div>
</form>
</div>

</div>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<script>
        if(document.getElementById('Role_info').value=="R")
            checkk();
    </script>
<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("prjname");
    console.log("Application:",appname,"Project:",projname);
    $(document).ready(function(){
        $('#trigger_date_field').datepicker({});
        $.ajax({
            url: "LegacyRetentionDataRetrieveServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data----->",data);
                if(data.CheckExistance==true){
                    $('#retention_code').val(data.Retention_Code);
                    $('#trigger_date_field').val(data.Tigger_Date);
                    $('#period_of_retention').val(data.Period_Retention);
                    $('#sme').val(data.E_Discovery_SME);
                    $('#legal_tax_holds').val(data.Legal_Tax_Holds);
                    $('#tax_holds').val(data.Legal_Tax_Identification);
                    $('#data_archived').val(data.App_Data_Archived);
                    $('#brief').val(data.Brief_Explain);
                }
                else{
                    $('#retention_code').val("");
                    $('#trigger_date_field').val("");
                    $('#period_of_retention').val("");
                    $('#sme').val("");
                    $('#legal_tax_holds').val("");
                    $('#tax_holds').val("");
                    $('#data_archived').val("");
                    $('#brief').val("");
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    });
    </script>
<script>
    function Submit(){
        //alert("Hello");
        var f = document.LegacyForm;
        f.method = "post";
        f.action = "LegacyRetentionDbUpdataServlet?appname="+appname+"&prjname="+projname;
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
        var url_string=window.location.href;
        var url = new URL(url_string);
        var appname = url.searchParams.get("appname"); $('#app_name').val(appname);
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
<script>



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
    /* function addrow_country()
    {

          var rowlength=$('.country').length;
            //alert("hi"+rowlength);
          var i=rowlength+1;
        var element='<tr class="country">'+
       '<td><input type="text" id ="country'+i+'"></td>'+
    '<td><input type="text" id ="city'+i+'"></td>'+
    '<td><input type="text" id ="state'+i+'"></td>'+
    '<td><input type="text" id ="office_designation'+i+'"></td>'+
    '<td> <img src="images/delete.png" style="height:30px; width:30px;" id="delete'+i+'" onclick="SomeDeleteRowFunction()">'+
         '</tr>';
    $('#tablecountry').append(element);

    } */
    </script>



    </body>

    </html>