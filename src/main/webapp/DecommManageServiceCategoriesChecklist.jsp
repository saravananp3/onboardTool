<!DOCTYPE html>
<html lang="en">
<head id ="link_id">
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>UserConfiguration Page</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" href="styles/styles.css" type="text/css"/>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
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
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css"/>
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
    <link rel="stylesheet" href="css/admin_module/admin_module_send_invites.css" media="screen">
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css"/>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script>
$(document).click(function())
{

	alert("hi");
$("input[type='radio']").change(function()
{
if($(this).val()="answer_yes")
{
$(".add_question").show();
}
else
{
$(".add_question").hide();
}
});
});
</script> -->



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
                            <h2 class="title">Service Categories Checklist</h2>
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
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Service Categories Checklist  </a> </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse">
                                        <div class="panel-body text-left">
                                            <form name="LegacyForm">
                                            <div id="inputFields">
                                                <%--
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198">Service Categories</label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="UNIX / Linux Server">UNIX / Linux Server</option>
                                                        <option value="Windows Server">Windows Server</option>
                                                    </select>


                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><b>Data Bases</b> </label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="DB2">DB2</option>
                                                        <option value="MS SQL">MS SQL</option>
                                                        <option value="MySQL">MySQL</option>
                                                        <option value="Oracle">Oracle</option>
                                                        <option value="Sybase">Sybase</option>
                                                    </select>

                                                </div>

                                                <div>
                                                    <label class="control-label" for="formInput198"><b>Storage</b></label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;
                                                    >
                                                        <option value="Storage - SAN">Storage - SAN</option>
                                                        <option value="Storage - NAS">Storage - NAS</option>
                                                        <option value="Storage - NAS Mounts">Storage - NAS Mounts</option>
                                                    </select>
                                                </div>
                                                <br>

                                                <div>
                                                    <label class="control-label" for="formInput198"><b>Products</b></label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="AWS">AWS</option>
                                                        <option value="Azure">Azure</option>
                                                        <option value="Backups">Backups</option>
                                                        <option value="Citrix">Citrix</option>
                                                        <option value="DataStage (ETL)">DataStage (ETL)</option>
                                                        <option value="Desktop Software">Desktop Software</option>
                                                    </select>
                                                </div>
                                                <br>
                                                <div>
                                                    <label class="control-label" for="formInput198"><b>Services</b></label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="DNS Entries">DNS Entries</option>
                                                        <option value="ECG - Electronic Customer Gateway (File Transfer)"> ECG - Electronic Customer Gateway (File Transfer) </option>
                                                        <option value="F5 / Load Balancing">F5 / Load Balancing</option>
                                                        <option value="Firewall Rules">Firewall Rules</option>
                                                        <option value="HA (High Availability)">HA (High Availability)</option>
                                                        <option value="IIS">IIS</option>
                                                        <option value="Job Control ">Job Control </option>
                                                        <option value="SharePoint">SharePoint</option>
                                                        <option value="SQL Analysis Services">SQL Analysis Services</option>
                                                        <option value="SQL Reporting Services  (SRS)">SQL Reporting Services  (SRS)</option>
                                                        <option value="SQL Server Integration Services  (SSIS)">SQL Server Integration Services  (SSIS)</option>
                                                        <option value="SSL Certificates">SSL Certificates</option>
                                                        <option value="Team Foundation Server (TFS)">Team Foundation Server (TFS)</option>
                                                        <option value="URLs">URLs</option>
                                                        <option value="Vignette (Web Content Management)">Vignette (Web Content Management)</option>
                                                        <option value="Web Analytics">Web Analytics</option>
                                                        <option value="WebSphere">WebSphere</option>
                                                        <option value="WMB">WMB</option>
                                                        <option value="WMQ">WMQ</option>
                                                    </select>
                                                </div>
                                                <br>
                                                <div class="multiple_entry">
                                                    <label><b>Others</b></label></br>
                                                    <input type="checkbox" class="mainframe_checkbox" value="mainframe_value" name="others1" onchange="valueChanged()">Mainframe </br>
                                                    <input type="checkbox" class="support_readiness_checkbox" value="support_readiness_value" name="others2" onchange="valueChanged2()">Support Readiness </br>
                                                    <input type="checkbox" class="desktop_software_checkbox" value="desktop_software_value" name="others3" onchange="valueChanged3()">Desktop Software </br>
                                                    <input type="checkbox" class="disaster_recovery_checkbox" value="disaster_recovery_value" name="others4" onchange="valueChanged4()">Disaster Recovery </br>
                                                    <input type="checkbox" class="citrix_checkbox" value="citrix_value" name="others5" onchange="valueChanged5()">Citrix </br>
                                                    <input type="checkbox" class="application_security_checkbox" value="application_security_value" name="others6" onchange="valueChanged1()">Application Security </br>
                                                    <input type="checkbox" class="final_backup_checkbox" value="final_backups_value" name="others7" onchange="valueChanged6()">Final Backups

                                                </div>--%>
                                            </div>                                     <!-- <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="addothers();">Add</button> -->
                                                <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="">Add</button>
                                                <button type="button" style="margin:5px;" class="btn btn-warning pull-left" onclick="">Modify</button>
                                                <button type="button" style="margin:5px;" class="btn btn-danger  pull-left" id="visible_del"
                                                        onclick="">Delete
                                                </button>
                                                <button type="button" class="btn btn-primary pull-right" onclick="Submit();">Save & Continue</button>
                                            </form>
                                        </div>

                                        <!--End of Table Info -->
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
<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->

<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("projectname");
    console.log("Application:",appname,"Project:",projname);
    $(document).ready(function(){
        $.ajax({
            url: "DecommManageServiceCategoriesDataRetrieveServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data Retrieve json array----->",data);
                if (!$.isArray(data)) {
                    data = [data];
                }

                $.each(data, function(key, value){
                    /*console.log("FULL NAME " + value.Type);*/
                    var manadatory="class='required_fie'";
                    var Type=value.Type;
                    var ColumnName=value.ColumnName;
                    var LabelName=value.LabelName;
                    var Value=value.Value;
                    //var options=data[i].options.split(',');
                    if(value.Mandatory=="No")
                    {
                        manadatory="";
                    }
                    if(Type=="Text box")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group'>" +
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                            "</div>";
                        $('#inputFields').append(inputdate);

                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group'><label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                            "<select style = 'width:100%;' name='"+ColumnName+"'>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for(var i=0;i<option.length;i++) {
                            inputdrop += "<option label=" + option[i] + " class='control-label' for= 'formInput198' >" + option[i] + "</option>";
                        }
                        inputdrop +="</select></div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="Check box")
                    {
                        var inputcheck= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for (var i=0; i<option.length; i++) {

                            inputcheck += "<label class = 'control-label others' for = 'fromInput198'><input type='checkbox'  value = '"+option[i]+"' class = 'form-comtrol' id="+((option[i]+(i + 1)).replace(/\s/g,''))+ "' placeholder ='"+option[i]+"' name= '"+ColumnName+"'/>" +
                                option[i]+"</label>";
                        }
                        inputcheck +="</div>";
                        $('#inputFields').append(inputcheck);
                        if (LabelName=="Others" && ColumnName=="ServiceCategories6"){

                        var others= "<div class='form-group'>\n" +
                            "<table  class='Mainframe hidetable' style='display:none;'>\n" +
                            "<tr>\n" +
                            "<td><b>MAINFRAME</b></td>\n" +
                            "<td>\n" +
                            "<select class=\"multiselect-ui form-control\" multiple>\n" +
                            "<option value='CICS Regions'>CICS Regions</option>\n" +
                            "<option value='DB2'>DB2</option>\n" +
                            "<option value='Endevor Flows'>Endevor Flows</option>\n" +
                            '<option value="HLQ\'s (high level qualifiers) to be eliminated">HLQ\'s (high level qualifiers) to be eliminated</option>\n' +
                            "<option value='IMS Regions'>IMS Regions</option>\n" +
                            "<option value='Mainframe  Storage '>Mainframe  Storage </option>\n" +
                            "<option value='Mainframe Batch Processing'>Mainframe Batch Processing</option>\n" +
                            "<option value='Mainframe Capacity'>Mainframe Capacity </option>\n" +
                            "<option value='Tape Media'>Tape Media</option>\n" +
                            "<option value='VSAM'>VSAM</option>\n" +
                            "</select>\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Support_Readiness hidetable'>\n" +
                            "<tr><td><b>SUPPORT READINESS</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td>\n" +
                            "<font color='blue'>  Is the application supported by the United Support Center (Help Desk) and/or\n" +
                            "IT Service Management (service/infrastructure performance monitoring)? </font></td>\n" +
                            "</td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='support' value='yes'>yes\n" +
                            "<input type='radio' name='support' value='No'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Disaster_Recovery hidetable'>\n" +
                            "<tr>\n" +
                            "<td><b>DISASTER RECOVERY</b></td>\n" +
                            "<td>\n" +
                            "<select style='width:100%'\n>\n" +
                            "<option value='Rapid Recovery '>Rapid Recovery </option>\n" +
                            "<option value='SRM'>SRM</option>\n" +
                            "<option value='Tier 0'>Tier 0</option>\n" +
                            "<option value='Tier 1'>Tier 1</option>\n" +
                            "<option value='Tier 2'>Tier 2</option>\n" +
                            "<option value='Legacy Recovery'>Legacy Recovery</option>\n" +
                            "<option></option>\n" +
                            "</select>\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Desktop_Software hidetable'>\n" +
                            "<tr>\n" +
                            "<td> <b>DESKTOP SOFTWARE</b> </td>\n" +
                            "<td></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td><font color='blue';> Is there any desktop or supporting desktop software? </font> </td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='desktop' value='yes'>yes\n" +
                            "<input type='radio' name='desktop' value='No'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Citrix hidetable' style='display:none;'>\n" +
                            "<tr>\n" +
                            "<td><b>CITRIX</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td> <font color='blue';> Does the application utilize any Citrix environments? </font> </td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix' value='yes'>yes\n" +
                            "<input type='radio' name='citrix' value='No'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Application_Security hidetable' style='display:none;'>\n" +
                            "<tr>\n" +
                            "<td><b>APPLICATION SECURITY</b></td>\n" +
                            "</tr>\n" +
                            "<tr >\n" +
                            "<td> <font color='blue';> Does the application utilize Global Groups?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix' class='citrix' value='answer_yes'>yes\n" +
                            "<input type='radio' name='citrix'  class='citrix' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "<tr class='add_question' style='display:none;'>\n" +
                            "<td><font color='blue';>Is the application in SECURE?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix_1' class='citrix_1' value='answer_second_yes'>yes\n" +
                            "<input type='radio' name='citrix_1' class='citrix_1' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "<tr class='add_question_2' style='display:none;'>\n" +
                            "<td> <font color='blue';> Does the application have an Internally supported access mechanism or other not listed above\n" +
                            "( e.g., your own directory)?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix_2' class='citrix_2' value='answer_thrid_yes' >Yes\n" +
                            "<input type='radio' name='citrix_2' class='citrix_2' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Final_Backups hidetable'>\n" +
                            "<tr>\n" +
                            "<td><b>FINAL BACKUPS</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td><font color='blue';> Are Final Backups Required?     </font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='backup' class='backup' value='yes'>yes\n" +
                            "<input type='radio' name='backup' class='backup' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "</div>";
                            $('#inputFields').append(others);
                        }

                    }
                    else if(Type=="Radio box")
                    {
                        var inputdrop= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for (var i=0; i<option.length; i++){
                            inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' name='"+ColumnName+"'/>"+
                                option[i]+"</label>";
                        }
                        inputdrop +="</div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="file")
                    {
                        inputfile="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div class='required_fie'>"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                            "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                            "</div>";
                        $('#inputFields').append(inputfile);

                    }
                    else if(Type=="Text area")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                            "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'></textarea>"+
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }

                });
                var script="<script>$('.datepicker1').datepicker({\n" +
                    "format: \"mm/dd/yyyy\",\n"+
                    "autoclose: true\n"+
                    "});<\/script>";
                script+="<script>\n" +
                    "$('.editpopup').click(function() {\n" +
                    "var seqnum=$(this).index('.editpopup');"+
                    "$('#seq_num').val(seqnum);"+
                    "modal1.style.display = \"block\";\n" +
                    "});"+
                    "<\/script>";
                script+="<script> $('.deletepopup').click(function() {\n" +
                    "var seqnum=$(this).index('.deletepopup');"+
                    //   "alert('sequence number '+seqnum);"+
                    "$('#sequence1').val(seqnum);"+
                    "modal2.style.display = \"block\";\n" +
                    "});<\/script>";
                script+="<script> $('input[name=ServiceCategories6]').change(function(){" +
                    "var answer = [];\n" +
                    "$.each($('input[name=ServiceCategories6]:checked'), function(){\n" +
                    "answer.push($(this).val());\n" +
                    "});" +
                        "$('.hidetable').hide();"+
                        "for(var i=0;i<answer.length;i++)" +
                    "{"+
                    "$('.'+answer[i].replace(' ','_')).show();}});<\/script>";
                $('#scripttag').append(script);

            },
            error: function (e) {
                console.log(e);
            }
        });
    });

</script>
<div id ='scripttag'>

</div>

</body>

</html>