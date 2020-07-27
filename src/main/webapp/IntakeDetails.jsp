<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decom3Sixty - Intake</title>

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
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/Intake/Intake.css" type="text/css" />
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script>
<script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummary.js"></script>
</head>
<body class="top-navbar-fixed">
    <form class="form-signin" name="loginForm" method="post">
        <div class="main-wrapper">
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
                <div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                            <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                                <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                            </a> <span class="small-nav-handle hidden-sm hidden-xs"><i
                                class="fa fa-outdent"></i></span>
                            <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse" data-target="#navbar-collapse-1"
                                aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span> <i
                                    class="fa fa-ellipsis-v"></i>
                            </button>
                            <button type="button" class="navbar-toggle mobile-nav-toggle">
                                <i class="fa fa-bars"></i>
                            </button>
                        </div>

                        <input type="text" id="project_name" name="project_name"
                            style="display: none;"> <input type="text"
                            id="appln_name" name="appln_name" style="display: none;">
                        <div class="collapse navbar-collapse" id="navbar-collapse-1">
                            <!-- /.nav navbar-nav -->
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#"><span id="nav_userid"></span>logged in
                                        as &nbsp;<span id='nav_role'></span></a></li>
                                <li><a href="logout.jsp" class=" text-center"><i
                                        class="fa fa-sign-out"></i> Logout</a></li>
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
                    <div
                        class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                        <div class="sidebar-content" id='jqxWidget'>
                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header"><span class="">Main Category</span>
                                    </li>
                                    <li id='home' item-selected='true'><a
                                        href="OpportunityList.jsp"><i class="fa fa-home"></i> <span>Home</span>
                                    </a></li>
                                    <%--   <li class="nav-header">
                                       <a href="AppEmphasize_EditProject.jsp"><span class="">Plan and pirority</span></a>
                                   </li>--%>
                                    <li class="has-children"><a href=""><i
                                            class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp" class="active-menu"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp" class="active-menu"> <span>Application Information</span></a></li>
                                            <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity</span></a></li>
                                            <li><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span>
                                            </a></li>
                                            <li><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
                                        </ul></li>
                                    <li class="has-children"><a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp" class="active-menu"> <span>Application Details</span> </a></li>
                                            <li><a href="Intake_Business.jsp"> <span>Business Details</span></a></li>
                                            <li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a></li>
                                            <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                            <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>
                                        </ul></li>
                                    <li class="has-children"><a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Archive_Execution.jsp" class="active-menu"> <span>Archive Execution</span>
                                            </a></li>
                                            <li><a href="archivesummary.jsp"> <span>Archive summary</span></a></li>
                                        </ul></li>
                                    <li class="has-children"><a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="RoleUIDashboard.jsp" class="active-menu"> <span>Reports Dashboard</span> </a></li>
                                            <li><a href="RoleDashboard.jsp" class="active-menu"> <span>Role Dashboard</span> </a></li>
                                            <li><a href="ProjectDashboard.jsp"> <span>Project Dashboard</span></a></li>
                                            <li><a href="ApplicationDashboard.jsp"> <span>Application Dashboard</span></a></li>
                                        </ul></li>
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
                                    <h2 class="title">Intake Information</h2>
                                </div>
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="OpportunityList.jsp"><i class="fa fa-home"></i>
                                                Home</a></li>
                                        <li><a href="AppEmphasize_EditProject.jsp">Intake</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /.row -->
                        </div>
                        <section>
                            <div class="row">
                                <div class="container">
                                    <div class="main">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse"
                                                        data-parent="#panels1" href="#collapse1">Opportunity</a> </h4>
                                            </div>
                                            <div id="collapse1" class="panel-collapse collapse in"
                                                name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFields">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                                                    </div>                                                
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="btn btn-primary" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button>
                                                            </div>
                                                            <div class="col-md-4 dropup" style="padding-top: 10px; padding-right: 10px; float: right;">
                                                                <button type="button" class="btn btn-primary" id="template" data-toggle="modal" data-target=".bd-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#AddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="Edit" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="Delete" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                                <button type="submit" class="btn btn-primary" id="create">Save</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#EditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#DeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                                    </div>
                                                    <!--  <div class="form-group">
                   <button type="button" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary  pull-right" id="create">Use Exists Que</button>
                   </div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"> Questions :</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <div class="form-check form-check-inline">
                                                                <div class="col-md-1">
                                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-check-label" for="inlineCheckbox1">Add developer Name</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Add</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">Triage Information</a>  </h4>
                                        </div>
                                        <div id="collapse2" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="inputValue">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                                             </div>
                                            <div class="col-md-12">
                                                <div class="col-md-1">
                                                     <button type="button" class="btn btn-primary" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button> </div>
                                                            <div class="col-md-4 dropup" style="padding-top: 10px; padding-right: 10px; float: right;">
                                                                <button type="button" class="btn btn-primary" id="template" data-toggle="modal" data-target=".triage-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span> </button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#AddTriagePopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditTriage" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteTriage" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                                <button type="submit" class="btn btn-primary" id="createbtn">Save</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn1" data-toggle="modal" data-target="#EditTriagePopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn1" data-toggle="modal" data-target="#DeleteTriagePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                            </div>    
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Triage Summary -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" onclick="switchColors();">Triage Summary</a></h4>
                                        </div>
                                        <div id="collapse3" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="inputFieldsSummary">
                                                    <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/> </div>
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsSummary">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/></div>                                           
                                                    <div class="col-md-12">
                                                       <div class="col-md-1">
                                                          <button type="button" class="btn btn-primary" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button></div>
                                                       <div class="col-md-4 dropup" style="padding-top: 10px; padding-right: 10px; float: right;">
                                                          <button type="button" class="btn btn-primary" id="template" data-toggle="modal" data-target=".triage-summary-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="addSummary" data-toggle="modal" data-target="#TiageSummAddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditSummary" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteSummary" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                                <button type="submitBtn" class="btn btn-primary" id="createTriSummary">Save</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopupSummary_btn" data-toggle="modal" data-target="#TriSummEditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopupSummary_btn" data-toggle="modal" data-target="#TriageSummaryDeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                                        </div>
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
    <!-- Intake OpportunityTemplate modal-->
    <div class="modal fade bd-example-modal-lg" id="myFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Opportunity Template</h5>
                    <button type="button" class="close" id="temp_close_id" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TemplateFields">
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="apmid_temp" name="apmid_temp" class="Template_Field" value="" disabled="disabled" checked=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Id</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="apmid_temp1" name="apmid"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appName_temp" name="appName_temp" class="Template_Field" value="" disabled="disabled" checked=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Name</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appName_temp1" name="appName"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="creation_date_temp" name="creation_date_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Creation Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" id="creation_date_temp1" placeholder="mm/dd/yyyy" name="creation_date"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="source_temp" name="source_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Request Source</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="source_temp1" name="source"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="status_temp" name="status_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Status</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="status_temp1" name="status"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="request_type_temp" name="request_type_temp" class="Template_Field" value="" disabled="disabled" checked ="">  </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Request Type</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control" id="request_type_temp1" name="request_type_temp">
                                        <option label="Decommission" class="control-label" for="opportunity">Decommission</option>
                                        <option label="Archive" class="control-label" for="opportunity">Archive</option>
                                        <option label="To" be="" retrive="" class="control-label" for="opportunity">To be retrive</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="requester_temp" name="requester_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Requester</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="requester_temp1" name="requester"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appdesc_temp" name="appdesc_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Descrpition</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appdesc_temp1" name="appdesc"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appowner_temp" name="appowner_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appowner_temp1" name="appowner"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="businessowner_temp" name="businessowner_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Business Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="businessowner_temp1" name="businessowner"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="sme_temp" name="sme_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Development Owner/SME</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="sme_temp1" name="sme"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="billcode_temp" name="billcode_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Billing Code</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="billcode_temp1" name="billcode"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="buisnesssegment_temp" name="buisnesssegment_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Buisness Segment</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="buisnesssegment_temp1" name="buisnesssegment"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="buisnessunit_temp" name="buisnessunit_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Buisness Unit</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="buisnessunit_temp1" name="buisnessunit"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="keyfunction_temp" name="keyfunction_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Key Function</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="keyfunction_temp1" name="keyfunction"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="pscontact_temp" name="pscontact_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Program or Segment Contact</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="pscontact_temp1" name="pscontact"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="date_type_temp" name="date_type_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Data Type</label> </div>
                                <div></div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control"
                                        id="date_type_temp1" name="date_type_temp">
                                        <option label="EMR" system="" class="control-label"
                                            for="opportunity">EMR System</option>
                                        <option label="ERP" data="" class="control-label"
                                            for="opportunity">ERP Data</option>
                                        <option label="Financial" data="" class="control-label"
                                            for="opportunity">Financial Data</option>
                                        <option label="HealthCare" data="" class="control-label"
                                            for="opportunity">HealthCare Data</option>
                                        <option label="HR" data="" class="control-label"
                                            for="opportunity">HR Data</option>
                                        <option label="MR/HR" data="" class="control-label"
                                            for="opportunity">MR/HR Data</option>
                                        <option label="Other" dat="" class="control-label"
                                            for="opportunity">Other Data</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="if_other_data_temp" name="if_other_data_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">If Other Data</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="if_other_data_temp1" name="if_other_data"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="arcdecomm_temp" name="arcdecomm_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Please describe your needs for Archival and Decommission Service</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="arcdecomm_temp1" name="arcdecomm"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="completion_date_temp" name="completion_date_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Desired Completion Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" id="completion_date_temp1" placeholder="mm/dd/yyyy" name="completion_date"> </div>
                            </div>
                            <br>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary submitDisable" onclick="validateForm()">Add Template</button>
                </div>
            </div>
        </div>
    </div>    
   <!-- Triage Template modal-->
        <div class="modal fade triage-example-modal-lg" id="myFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Triage Template</h5>
                    <button type="button" class="close" id="triage_temp_close_id" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="Templatevalues" >
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appId_temp" name="appId" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">APM Id</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>        
                            </div>        
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationName_temp" name="appName" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">APM Name</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationDesc_temp" name="appDesc" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application Description</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
							</div>
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationOwner_temp" name="appOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="busOwner_temp" name="busOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Business Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="devOwner_temp" name="devOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Developement Owner or SME</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>   
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="billing_Code_temp" name="billing_Code" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Billing Code</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>           
                            <br>   
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="business_Segment_temp" name="biling_Segment" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Billing Segement</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" name="biling_Segment"> </div>
                             </div>           
                             <br> 
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="busUnit_temp" name="busUnit" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Business Unit</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
						    </div>    
                             <br>
							<div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="segment_contact_temp" name="segment_contact" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Program or Segement Contact</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
							</div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="logic_Grp_temp" name="logic_Grp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Logical Grouping</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br> 
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Preliminary_CBA_temp" name="Preliminary_CBA" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Preliminary CBA</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="funding_Avl_temp" name="funding_Avl" class="Template_Values" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Funding available</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                    </select>
                               </div>
                            </div>     
							<br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="prgFunder_temp" name="prgFunder" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Program Funder</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
							<div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="PrjInfo_temp" name="PrjInfo" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Project Portfolio Information</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Decom_date_temp" name="Decom_date" class="Template_Values" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Project Decomission Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" placeholder="mm/dd/yyyy"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="infrastructure_impact_temp" name="infrastructure_impact" class="Template_Values" value="" >  </div>
                                <div class="col-md-2">  <label class="control-label" for="Triage">Infrastructure Impact</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                        </select> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="nmbr_of_infrastructure_components_temp" name="nmbr_of_infrastructure_components" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Number of Infrastructure Components</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                             </div>    
                             <br>
                             <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="archival_Sol_temp" name="archival_Sol" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Archival Solution</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                    </select> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Status_temp" name="Status" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Status/Notes</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="decomAnalyst_temp" name="decomAnalyst" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Decom Analyst</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="rationalization_type_temp" name="rationalization_type" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Rationalization Type</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Replace" class="control-label" for="Triage">Replace</option>
                                        <option label="Retire" class="control-label" for="Triage">Retire</option>
                                        <option label="Combine" class="control-label" for="Triage">Combine</option>
                                        <option label="Other" class="control-label" for="Triage">Other</option>
                                    </select> </div>
                            </div>    
                             <br>
                             <div class="row" style = "display:none;">
                                <div class="col-md-1"> <input type="hidden" id="If_other_please_describe_temp" name="If other_pleasedescribe " class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If other, please describe </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                             </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appPlatfrm_temp" name="appPlatfrm" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application platform</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Mainframe" class="control-label" for="Triage">Mainframe</option>
                                        <option label="Distibuted - Unix" class="control-label" for="Triage">Distibuted - Unix</option>
                                        <option label="Windows" class="control-label" for="Triage">Windows</option>
                                        <option label="hybrid" class="control-label" for="Triage">hybrid</option>
                                        <option label="Others" class="control-label" for="Triage">Others</option>
                                     </select>  </div>
                            </div>            
                            <br>
                            <div class="row" style="display:none;">
                                <div class="col-md-1"> <input type="hidden" id="If_Other_describe_temp" name="If_Other_describe" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If Other,please describe </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="app_and_data_hosted_temp" name="appData" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Is application and Data hosted externally?</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No           </div>        
                            </div>           
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="vendor_temp" name="vendor " class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If yes,vendor?Location?</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="compliance_temp" name="complianceLegal" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any compliance or legal drivers determining retirement by a certain date </label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row">
								<div class="col-md-1"><input type="checkbox" id="describe_temp" name="describe " class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If yes above,please describe</label></div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Financialdate_temp" name="Financialdate" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any business or financial drivers determining retirement by a certain date?Eg.,contract expiring</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row">
                                    <div class="col-md-1"><input type="checkbox" id="plsdescribe_temp" name="plsdescribe " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">If Yes above,please describe</label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="TechincalDeterminingdate_temp" name="TechincalDeterminingdate" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any technical drivers determining retirement by a certain date?.(Eg server end of life ,support,software,end of life,support)</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row">
                             <div class="col-md-1"> <input type="checkbox" id="pls_describe_temp" name="pls_describe" class="Template_Values" value="" > </div>
                            <div class="col-md-2"> <label class="control-label" for="Triage">If Yes above,please describe</label> </div>
                            <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="useforArchival_temp" name="useforArchival " class="Template_Values" value=""> </div> 
								<div class="col-md-2"> <label class="control-label" for="Triage">Please describe business need/use for Archival</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> </div>    
                             <br>
                             <div class="row">
                                <div class="col-md-1">
                                     <input type="checkbox" id="highlevelapplicationdata_temp" name="highlevelapplicationdata " class="Template_Values" value="" > </div>
                                     <div class="col-md-2"> <label class="control-label" for="Triage">Please describe at high-level your applications data </label> </div>
                                     <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="ideaNmbr_temp" name="ideaNmbr " class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Idea Number</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35">  </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="DemandNmbr" name="DemandNmbr " class="Template_Values" value="" > </div> <div class="col-md-2"> <label class="control-label" for="Triage">Demand Number </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" name="DemandNmbr"> </div>
                            </div>    
                            <br>
                            <div class="row">
									<div class="col-md-1"> <input type="checkbox" id="PrjNmbr_temp" name="PrjNmbr " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Project Number </label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                    <div class="col-md-1"> <input type="checkbox" id="PrjctTaskNmbr_temp" name="PrjctTaskNmbr " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Project Task Number </label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                             <div class="row">
                                     <div class="col-md-1"> <input type="checkbox" id="Bigrock_temp" name="Bigrock " class="Template_Values" value="" > </div>
                                     <div class="col-md-2"> <label class="control-label" for="Triage">Big Rock </label> </div>
                                     <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>
                              </div>
                             <br>
                            <div class="row">
                                   <div class="col-md-1"> <input type="checkbox" id="DenialRsn_temp" name="DenialRsn " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Denial Reason </label>  </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>     <br> </div>
                                       </form>
                                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary submitDisable" onclick="validateTriage()">Add Template</button>
                </div>
		</div>
		</div>
		</div>
	<!-- Triage Ssummary Template modal-->                                        
	 <div class="modal fade triage-summary-example-modal-lg" id="myFormModal"
                   tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                      aria-hidden="true">
                   <div class="modal-dialog modal-lg" role="document">
                     <div class="modal-content">
                      <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Triage Summary Template</h5>
                    <button type="button" class="close" id="TriageTempSummaryCloseId" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TriSummTemplate" >
                                   <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="ideaNumber_temp" name="ideaNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Idea Number</label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DemandNumber_temp" name="DemandNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Demand Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35" name="DemandNmbr"> </div>
									</div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjNumber_temp" name="PrjNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjctTaskNumber_temp" name="PrjctTaskNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Task Number </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
									</div>    
                                     <br>
                                    <div class="row">
                                            <div class="col-md-1"> <input type="checkbox" id="BigrockSumm_temp" name="BigrockSumm_temp" class="Template_Summary_Values" value="" ></div>
                                            <div class="col-md-2"> <label class="control-label" for="Triage">Big Rock </label> </div>
                                            <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No</div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DenialReason_temp" name="DenialReason_temp" class="Template_Summary_Values" value="" ></div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Denial Reason </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>     <br> </div>
                                       </form>
                                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary SubmitDisableTriSumm" onclick="validateTriageSummary()">Add Template</button>
                </div>
		</div>
		</div>
		</div>                                     
<!-------Oppurtunity Add popup---------->
    <div class="modal" id="AddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "add_close_id" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
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

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="types" class="form-control" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidefield" id="check" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="number"  name="number1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="rdo" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="radio_number"  name="radio_number">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="drop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="drop_number"  name="drop_number">
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
                <div id="options">
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
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="submit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>    
<!-------Triage Add popup---------->
    <div class="modal" id="AddTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "add_Triage_close_id" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Triagelabel"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="Triage_project_name" name="project_name" value="">
                <input type="text" id="Triage_appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="Triage_servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="Triageidname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="Triagetypes" class="form-control" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row TriageHideField" id="TriageCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriageNumber"  name="TriageNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriageRadioNumber"  name="TriageRadioNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="TriageDropNumber"  name="TriageDropNumber">
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
                <div id="TriageOptions">
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
                            <select id="Triagemandatory" class="form-control" name="mandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="submitTriage" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
    <!-------Triage Summary Add popup---------->
    <div class="modal" id="TiageSummAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "TriageSummAddCloseId" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabel"  name="TriSummLabel" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">
                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Type:</label>
                            <select id="TriSummTypes" class="form-control" name="TriSummTypes" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidefield" id="TriSummCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriSummNumber"  name="TriSummNumber1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriSummRadioNbr"  name="TriSummRadioNbr">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of Options:</label>
                            <input type="text" class="form-control" id="TriSummDropNbr"  name="TriSummDropNbr">
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
                <div id="TriageSummaryOptions">
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
                            <label class="control-label" for="TriageSummary">Mandatory:</label>
                            <select id="TriSummMandatory" class="form-control" name="TriSummMandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>   
      </div>
      <div class="modal-footer">
        <button type="button" id ="TriSummSubmit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
  <!--Delete pop up-->
         <div class="modal" id="DeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="delete_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequence1"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="submit2" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>   
<!--Triage Delete pop up-->
         <div class="modal" id="DeleteTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="TriageDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequenceTriageDelete"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>                                      
   <!-- Triage Summary Delete Pop up -->
        <div class="modal" id="TriageSummaryDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="TriSummDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="TriSummSequence"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>    
<!-- Edit pop up -->
    <div class="modal" id="EditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="edit_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Label_modify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="text" id="seq_num" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="submit1" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  
 <!--Triage Edit pop up -->
    <div class="modal" id="EditTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="TriageEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="TriageLabelModify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="TriageEditMandatory" class="form-control" name="TraigeEditMandatory" required >
                                <option value = "Yes" >Yes</option>
                            </select>
                        </div>
                    </div>
                </div>   <input type="text" id="TriageEditSeqNum" name="TriageEditSeqNum" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

  <!-- Triage Summary Edit pop up -->
    <div class="modal" id="TriSummEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="TriSummEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabelModify"  name="TriSummlabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="TriSummSeqNum" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

    <!-- Date picker --> 
    
       <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="js/Opportunity/AddFeatureFunctionality.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/AddFeatureAjaxCall.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/EditDeleteToggle.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/EditDeleteAjaxCall.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/TemplateFeature.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/IntakeDetailsOpportunitySave.js"></script>
    
    <!-- Triage js file -->
    
    <script src="js/IntakeDetails/IntakeTriage/IntakeTriage.js"></script>
    <script src="js/IntakeDetails/IntakeTriage/AddTemplateTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/AddFeatureAjaxCallTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/EditDeleteToggleTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/EditDeleteAjaxCallTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/AddFeatureFunctionalityTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/IntakeTriageSave.js"></script>
     
     <!-- Intake triage Summary -->
     
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeletAjaxCallTriageSummary.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummarySave.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/AddFeatureFunctionality.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/TriageSummaryAddFeatureAjaxCall.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeleteToggle.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummaryTemplate.js"></script>     
    <!-- <script>
        function myFunction() {
            let today = new Date().toISOString().substr(0, 10);
            document.getElementById('creation_date').value = today;
        }
    </script> -->
    </body>
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
    <script id ="scripttag"></script>
    
</html>
