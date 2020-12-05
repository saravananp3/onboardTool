<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >

<title>Decom3Sixty - Archive Requirements</title>
<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
 <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
 <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
 <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
 <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
 <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >
<link rel="stylesheet" href="css/UserInfo/userinfo.css" >
<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen" >
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>   
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">
<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/businessReqInfo/businessReqDataRetrieveAjaxCall.js"></script>

<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqDataRetrieveAjaxCall.js"></script>

<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqDataRetrieveAjaxCall.js"></script>

<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="js_in_pages/requirements.css" type="text/css"/>

    


</head><!--from  w  w w  . ja  va 2 s.co  m-->

<style>
   body {
  background-color: #fff;
  margin: 0;
  padding: 0;
}

.page-title-div {
background:#1565c0;
padding: 15px; 
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
    .table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
	}
	.table-title .add-new i {
    margin-right: 4px;
	}
	table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
	}    
	table.table td a.add {
    color: #27C46B;
	}
	table.table td a.edit {
    color: #FFC107;
	}
	table.table td a.delete {
    color: #E34724;
	}
	table.table td i {
    font-size: 19px;
	}
	table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
	}    
	table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
	}
	table.table .form-control.error {
    border-color: #f50000;
	}
	table.table td .add {
    display: none;
	}

.panelSize {
  display: flex;
  justify-content: center;
}

/* table { 
	box-shadow: 5px 5px 5px #999; 
	} */
    /*END Form Wizard*/
   
   
</style>

<body class="top-navbar-fixed">

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed IntakeArchiveRequirements JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="onboard.DBconnection" %>


<%
    try {
        HttpSession details = request.getSession();
        String roles = (String) details.getAttribute("role");
        String det = (String) session.getAttribute("theName");
        String idd = (String) session.getAttribute("appidd");
        String Opportunityname=(String)session.getAttribute("SelectedOpportunity");
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();
        
%>
<form class="form-signin" name="loginForm" method="post">

    <div class="main-wrapper">

           <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Decomm3Sixty" class="logo">
                    </a>
                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                  <ul class="nav navbar-nav">
		              <li class="active"><a href="#" style="background:#1565c0;color:white;">Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp">Administration</a></li>
		              <li><a href="Archive_Execution.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li ><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right">
                      <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
      </div>
      <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                             <div class="col-sm-6">
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >> Archive Requirements</p>
                     
                    

                    </div>

                </div>
			</nav>
      
        </div>
        <!-- /.container-fluid -->
    </nav>
    
        <div class="content-wrapper">
            <div class="content-container">

      
                <!-- Projects List Start -->

                <div class="main-page">

                    <section>

                        <div class="row">
<div class="container" id="module_header">
                                <div class="panelSize col-md-12 col-sm-12">
										<div class="form-wizard">

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
                 

                         

                                           
                                  <div class="tab-pane" role="tabpanel" id="step4">
                                    
                                     <!-- Business Requirements Table -->
                                     
                            <div class="panel panel-default" style='width:1500px;'>
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse4">Business Requirements</a></h4>
                                        </div>
                                        
                                        <div id="collapse4" class="panel-collapse ">
                                          
                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsBusiness">
                                                 <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TemplateFields">
                            <div class="row changeText1 business" contenteditable='true'>
                                                 <ul>
													<li>Each requirement must be marked as In-Scope or Out-of-Scope for this project, with additional information specific to each requirement if necessary. </li>
													<li>Requirement ID's are linked to test script ID's to ensure traceability from requirement to test execution. Requirement ID's may be formatted according to client needs.</li>
												</ul>
													</div>
													</div>
												</form>	
												 </div>   
											    </div>
									              
                               <!-- Req in scope -->
							    <div class="panel panel-default">
                                        <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse6">Requirement In Scope</a></h4>
                                        </div>
                                        
                                            <div class="panel-body">
                                        		<div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                        			<div id="inputFieldsReqinscope">
                                               		
                                                 			<div>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>REQ IN-SCOPE(Y/N)</th>
																		<th style='text-align:center;vertical-align: middle;'>DESCRIPTION</th>
																		<th style='text-align:center;vertical-align: middle;'>ACTION</th>
																		
																	</tr>
																</thead>
																<tbody id ="reqinscope">
      												    												
      															</tbody>
																</table>
  																</div> 
												  
												 <div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 
												 <button type="submit" class="btn btn-success" id="SaveReqInScope">Save</button>
												 
                                       			 <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='archiveRequirementsLegacyDetails.jsp';"style="display:none;"></button>
                                       			</div>
                                            </div>
                                              
                                            </div> 
                                            </div> 
                                            </div> 
                                            
                                                      
                               <!-- Data Req -->
							    <div class="panel panel-default">
                                        <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse6">Functional Requirements</a></h4>
                                        </div>
                                        
                                            <div class="panel-body">
                                        		<div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                        			<div id="inputFieldsReqinscope">
                                               		
                                                 			<div>
                                                 			<h4 class="title1">4.1.1 Data Requirements</h4>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Req Id</th>
																		<th style='text-align:center;vertical-align: middle;'>Req In-Scope Y/N</th>
																		<th style='text-align:center;vertical-align: middle;'>Requirement Type</th>
																		<th style='text-align:center;vertical-align: middle;'>Requirement</th>
																		<th style='text-align:center;vertical-align: middle;'>Additional Info</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="DataReqId">
      												    												
      															</tbody>
																</table>
  																</div> 
												  
												 <div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 <button class="btn btn-primary addClass" type="button" id="dataReqAdd">Add</button>
												 <button type="submit" class="btn btn-success dataSaveClass" id="dataSaveReq">Save</button>
												 
                                       	
                                       			</div>
                                            </div>
                                            
                                            <div id="inputFieldsReqinscope">
                                               		
                                                 			<div>
                                                 			<h4 class="title1">4.1.2 Retention and Legal Requirements</h4>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Req Id</th>
																		<th style='text-align:center;vertical-align: middle;'>Req In-Scope Y/N</th>
																		<th style='text-align:center;vertical-align: middle;'>Requirement Type</th>
																		<th style='text-align:center;vertical-align: middle;'>Description</th>
																		<th style='text-align:center;vertical-align: middle;'>Additional Info</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="LegalReqId">
      												    												
      															</tbody>
																</table>
  																</div> 
												  
												 <div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 <button class="btn btn-primary addClass" type="button" id="legalReqSaveAdd">Add</button>
												 <button type="submit" class="btn btn-success dataSaveClass" id="legalReqSaveReq">Save</button>
												 
                                       	
                                       			</div>
                                            </div>
                                              
                                              <div id="inputFieldsReqinscope">
                                               		
                                                 			<div>
                                                 			<h4 class="title1">4.1.3 Security Requirements</h4>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Req Id</th>
																		<th style='text-align:center;vertical-align: middle;'>Req In-Scope Y/N</th>
																		<th style='text-align:center;vertical-align: middle;'>Requirement Type</th>
																		<th style='text-align:center;vertical-align: middle;'>Description</th>
																		<th style='text-align:center;vertical-align: middle;'>Additional Info</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="SecurityReqId">
      												    												
      															</tbody>
																</table>
  																</div> 
												  
												 <div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 <button class="btn btn-primary addClass" type="button" id="securityReqAdd">Add</button>
												 <button type="submit" class="btn btn-success dataSaveClass" id="securityReqSaveReq">Save</button>
												 
                                       	
                                       			</div>
                                            </div>
                                              
                                              <div id="inputFieldsReqinscope">
                                               		
                                                 			<div>
                                                 			<h4 class="title1">4.1.4 Usability Requirements</h4>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Req Id</th>
																		<th style='text-align:center;vertical-align: middle;'>Req In-Scope Y/N</th>
																		<th style='text-align:center;vertical-align: middle;'>Requirement Type</th>
																		<th style='text-align:center;vertical-align: middle;'>Description</th>
																		<th style='text-align:center;vertical-align: middle;'>Additional Info</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="UsabilityReqId">
      												    												
      															</tbody>
																</table>
  																</div> 
												  
												 <div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 <button class="btn btn-primary addClass" type="button" id="UsabilityReqAdd">Add</button>
												 <button type="submit" class="btn btn-success dataSaveClass" id="UsabilityReqSaveReq">Save</button>
												 
                                       	
                                       			</div>
                                            </div>
                                              
                                              <div id="inputFieldsReqinscope">
                                               		
                                                 			<div>
                                                 			<h4 class="title1">4.1.5 Audit Requirements</h4>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Req Id</th>
																		<th style='text-align:center;vertical-align: middle;'>Req In-Scope Y/N</th>
																		<th style='text-align:center;vertical-align: middle;'>Requirement Type</th>
																		<th style='text-align:center;vertical-align: middle;'>Description</th>
																		<th style='text-align:center;vertical-align: middle;'>Additional Info</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="AuditReqId">
      												    												
      															</tbody>
																</table>
  																</div> 
												  
												 <div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 <button class="btn btn-primary addClass" type="button" id="auditReqAdd">Add</button>
												 <button type="submit" class="btn btn-success dataSaveClass" id="auditReqSaveReq">Save</button>
												 
                                       	
                                       			</div>
                                            </div>
                                              
                                            </div> 
                                            </div> 
                                            </div> 
                                        
                                        <!-- Screen Requirements -->
							    <div class="panel panel-default">
                                        <div class="panel-heading">
                                        <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse6">Screen Requirements</a></h4>
                                        </div>
                                        
                                            <div class="panel-body">
                                        		<div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                        			<div id="inputFieldsReqinscope">
                                               		
                                                 			<div>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Req Id</th>
																		<th style='text-align:center;vertical-align: middle;'>Screen Display Name in Infoarchive</th>
																		<th style='text-align:center;vertical-align: middle;'>Purpose</th>
																		<th style='text-align:center;vertical-align: middle;'>Equivalent in the Legacy Application</th>	
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="screenReqInfo">
      												    												
      															</tbody>
																</table>
  																</div> 
  																<div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 
												 <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#screenReqAddPopUp">Add</button>
												 <button type="submit" class="btn btn-success" id="saveScreenReqId">Save</button>
												 
                                       			 <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='archiveRequirementsLegacyDetails.jsp';"style="display:none;"></button>
                                       			</div>
  																
  																<br/>
  																<br/>
  																<br/>
  																<div>
                                                   				<table class="table table-bordered">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Req Id</th>
																		<th style='text-align:center;vertical-align: middle;'>Search Form Name</th>
																		<th style='text-align:center;vertical-align: middle;'>Search Field Name</th>
																		<th style='text-align:center;vertical-align: middle;'>Field Format</th>	
																		<th style='text-align:center;vertical-align: middle;'>Data Type</th>
																		<th style='text-align:center;vertical-align: middle;'>Date Retrieval Requirement</th>
																		<th style='text-align:center;vertical-align: middle;'>Required Field</th>
																		<th style='text-align:center;vertical-align: middle;'>Search Field Additional Information</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="searchFormInfo">
      												    												
      															</tbody>
																</table>
  																</div> 
												  
												 <div class="col-md-6" style="padding-top: 10px; padding-right: 40px; float: right; width:21%;">
												 <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#searchFormAddPopUp">Add</button>
												 <button type="submit" class="btn btn-success" id="saveSearchFormId">Save</button>
												 
                                       			 <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='archiveRequirementsLegacyDetails.jsp';"style="display:none;"></button>
                                       			</div>
                                            </div>
                                              
                                            </div> 
                                            </div> 
                                            </div> 
                                            
                                            <button type="button" class="btn btn-primary pull-right" id="DataDeleteId" data-toggle="modal" data-target="#DataDeletePopUp" style="display: none;">Delete PopUp</button>
                                            
                                            <button type="button" class="btn btn-primary pull-right" id="screenInfoDeleteId" data-toggle="modal" data-target="#screenInfoDeletePopUp" style="display: none;">Delete PopUp</button>
                                        <div class="col-md-12">
                                        	<br/>
                                        <div class="col-md-1"> 
                                    
                                       <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="" >Prev</button></div>
                                       <div class="col-md-6 dropup" style=" padding-right: 10px; float: right; width:10%">
                                       
                                      <button class="form-wizard-next-btn float-right btn-info btn btn-info"  id="busreqNext" disabled="true">
                                                                 <a href="archiveReqAbbrevation.jsp">Next</a></button>
                                     
                                       </div>
                                     </div>
                                     
                                     
                                     
								</div>
					            </div>
                                  </div>
					            </div>
					        </div>
                        </div>
                </div>
                <!-- /.row -->
            </div>
            </div>
            
            </section>
            <!-- /.section -->

        </div>
        <!-- /.main-page -->

        <!-- Project List End -->

    </div>
    <!-- /.content-container -->

    <!-- /.main-wrapper -->
    <script>
        function validateform9() {

            var f = document.loginForm;
            f.method = "post";
            f.action = 'ArchivalRequirements';
            f.submit();

        }
    </script>


    <%
       //     }
    //    }
    %>
    </div></div></form>
   
 <!-- Data Req Delete PopUp -->  
  <div class="modal" id="DataDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="DataDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p>Do you want to delete this Row permanently?</p>
                    <input type="hidden" id="DataDeleteSeq"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="DataDeleteSubmit" class="btn btn-primary submitDisableData" >Yes</button>
        <button type="button" class="btn btn-default" id = "closeDataIdDelete" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>

<!-- Screen Req Info Add Popup  -->

<div class="modal" id="screenReqAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Field</h5>
        <button type="button" id="screenReqAddClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="Legacy">Screen Display Name in Infoarchive:</label>
                            <input type="text" class="form-control" id="screenReqAddId"  name="screenReqAddName" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="screenReqAddSeqNum" name="" value="" style="display:none;"/>
                <input type="text" id="screenReqAddSection" name="" value="" style="display:none;"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="screenReqAddSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" id = "closeIdScreenInfo" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div> 
   
   <!-- Search Form Add popup -->
   <div class="modal" id="searchFormAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Field</h5>
        <button type="button" id="searchFormAddClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="searchFormTypesId" class="form-control" name="searchFormTypesName" required >
                                
                            </select>
                        </div>
                    </div>
                </div>
                <br/>
                <input type="text" id="searchFormAddSeqNum" name="" value="" style="display:none;"/>
                <input type="text" id="searchFormAddSection" name="" value="" style="display:none;"/>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="searchFormAddSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" id = "closeIdsearchForm" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div> 

<!-- Screen Req Info Delete PopUp -->  
  <div class="modal" id="screenInfoDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="screenInfoDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p>Do you want to delete this Row permanently?</p>
                    <input type="hidden" id="screenInfoDeleteSeq"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="screenInfoDeleteSubmit" class="btn btn-primary submitDisableScreenInfo" >Yes</button>
        <button type="button" class="btn btn-default" id = "closeScreenInfoDelete" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>

<jsp:include page="samp_forms.jsp">
    <jsp:param name="ProjectName" value="<%=Opportunityname %>"/>
    <jsp:param name="AppName" value="<%=idd %>"/>
    <jsp:param name="number" value="2"/>
    <jsp:param name="servlet" value="Requirements"/>
</jsp:include>
<%
     //       }
    //    }
    } 
    catch (Exception e) {
    }
%>

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>

<script src="js/iscroll/iscroll.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/businessReqInfo/businessReqInScopeToDoList.js"></script>

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

<script id ="scripttag"></script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>

<script src="js/notification/notification.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/businessReqInfo/businessReqSave.js"></script>

<script type="text/javascript" src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqAddAjaxCall.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqDeleteAjaxCall.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqSaveAjaxCall.js"></script>

<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqAddAjaxCall.js"></script>
<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqSearchFormAddAjaxCall.js"></script>
<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqEditDeleteAjaxCall.js"></script>
<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqSaveAjaxCall.js"></script>
<script src = "js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqSearchFormSaveAjaxCall.js"></script>
</body>
</html>