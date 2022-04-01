<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Decom3Sixty - IntakeOpportunity</title>
<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

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

<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script>
<link rel="stylesheet" href="css/Intake/IntakeOpportunity.css" media="screen" > 

<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">

</head>
<body class="top-navbar-fixed">

<div class="main-wrapper">
 <!-- ========== TOP NAVBAR ========== -->
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
		              <li><a href="GovernanceList.jsp">Governance</a></li>
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
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >>
                         
                         <a  href="ArchiveDecommPage.jsp" id="sitetitle1" style="color:#fff">
                           Decom Requirements</a> >>
                         </p>
                     
                    

                    </div>

                </div>
			</nav>
      
        </div>
        <!-- /.container-fluid -->
    </nav >
<div class="content-wrapper">
 <div class="content-container" >
  <div class="main-page">
       <section class="wizard-section">
		<div class="container" id="module_header">
			<div class=" col-md-12">
				<div class="form-wizard">
					<form action="" method="post" role="form">
						<div class="form-wizard-header">
							<p>Fill all the required fields to go next step</p>
							<ul class="list-unstyled form-wizard-steps clearfix" style = "width: 140%; margin: auto;">
								<li class="active"><span>1</span><i>App Decomm Info</i></li>
								<li><span>2</span><i>Contact Info</i></li>&nbsp;&nbsp;
								<li><span>3</span><i>Legacy Retention Info</i></li>
								<li><span>4</span><i>Review</i></li>
								<li><span>5</span><i>Approval</i></li>
							</ul>
						</div>
						<fieldset class="wizard-fieldset show" style="border-style: none">
							   <div class="tab-pane active" role="tabpanel" id="step1">
                                       <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse"
                                                        data-parent="#panels1" >App Decomm Info</a> </h4>
                                            </div>
                                            
                                            <div id="collapse1" class="panel-collapse "
                                                name="collapse">
                                                <div class="panel-body">
                                                    <div>
                                                       <form name="Decomm_Intake_Requirements">
                                        <div id="collapse2" class="panel-collapse">
                                            <div class="panel-body text-left">
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Opportunity Name</label>
                                                    <input type="text" class="form-control" id="app_name" placeholder="Opportunity Name" name="appname" readonly >
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

                                                <!--End of Table Info -->
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Infrastructure Project Number</label>
                                                    <input type="text" class="form-control" id="infraprojectnumber" placeholder="Infrastructure Project Number" name="infraprojectnumber" >
                                                </div>

                                                <!--End of Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label" for="formInput664"><div class="required_fie">Read Only Date</div></label>
                                                    <input placeholder="mm/dd/yyyy" type="text" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" id="RO_DATE"  name="read_date" onChange="updatesum()" readonly>
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
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id ="business_unit_and_geographic_location">

                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary" onclick="addrow_bussiness();">Add</button>
                                                    </div>

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
                                                                <th scope="col" style="color:white;"></th>

                                                            </tr>
                                                            </thead>
                                                            <tbody id="SiteLocation">
                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary" onclick="addrow_sitelocation();">Add</button>
                                                    </div>
                                                </div>


                                                <br>
                                                <br>
                                            </div>

                                        </div>
                                    </form>
                                                    </div>                                                
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button>
                                                            </div>
                                                            <div class="col-md-6 dropup" style="padding-right: 10px; float: right;  width: 20%;">
                                                                
                                                                <button type="submit" class="btn btn-success" id="create">Save</button>
                                                                 <button class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeTriage.jsp';" id="next" disabled="true">
                                                                 
                                                                 <a href="javascript:;">Next</a>
                                                                 
                                                                 </button>
                                                              
                                                                 </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
                               
                                
                                
                                
                                
                                
						</fieldset>	
				 <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button" ><i class="fa fa-arrow-up"></i></a> 					
						
					</form>
					
					
					
					 
				</div>
			</div>
		</div>
	</section>

  </div> <!-- main-page -->
 </div>  <!-- content-container -->
</div>   <!-- content-wrapper -->

</div> <!-- main-wrapper -->

<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
 <script src="js/toastr/toastr.min.js"></script>
 
 




 <script>
    $(document).ready(function(){
    	$(window).scroll(function () {
    			if ($(this).scrollTop() > 50) {
    				$('#back-to-top').fadeIn();
    			} else {
    				$('#back-to-top').fadeOut();
    			}
    		});
    		// scroll body to 0px on click
    		$('#back-to-top').click(function () {
    			$('body,html').animate({
    				scrollTop: 0
    			}, 400);
    			return false;
    		});
    });
    </script>


 <script>
            /*if(document.getElementById('Role_info').value=="R")
                checkk();*/
        </script>
        <script>
           
             $(document).ready(function(){

                $.ajax({
                    url: "DecommIntakeFRequirementsDataRetrieveServlet",
                    type: 'POST',
                    dataType: "json",
                    success: function (data) {
                        console.log("json object of array--->", data[0].CheckExistance);
                        var trid = $("#business_unit_and_geographic_location");
                        if (data[0].CheckExistance == false) {
                            var input_fields = "<tr id='Row_id0' name = 'Row0'><td><input type='text' id ='business_unit_0' class='BusinessUnit' name='BusinessUnit0'></td>\n" +
                                "<td><input type='text' id ='operation_unit_0' class='OperationUnit' name='OperationUnit0'></td>\n" +
                                "<td><input type='text' id ='location_unit_0' class='LocationUnit' name='LocationUnit0'></td>\n" +
                                "<td><input type='text' id ='department_0' class='Department' name='Department0'></td>\n" +
                                "<td> <img src='images/Delete.png' id='Delete0' name = 'Delete0' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this.id);'></td>"+
                                "</tr>";
                            trid.append(input_fields);
                        } else {

                            for (var i = 1; i <= data.length-1; i++) {
                                var input_fields = "<tr id='Row_id"+(i-1)+"' name = 'Row"+(i-1)+"'><td><input type='text' id ='business_unit_" + (i - 1) + "' class='BusinessUnit' name='BusinessUnit" + (i - 1) + "' value='" + data[i].BusinessUnit + "'></td>\n" +
                                    "<td><input type='text' id ='operation_unit_" + (i - 1) + "' class='OperationUnit' name='OperationUnit" + (i - 1) + "' value='" + data[i].OperationUnit + "'></td>\n" +
                                    "<td><input type='text' id ='location_unit_" + (i - 1) + "' class='LocationUnit' name='LocationUnit" + (i - 1) + "' value='" + data[i].LocationUnit + "'></td>\n" +
                                    "<td><input type='text' id ='department_" + (i - 1) + "' class='Department' name='Department" + (i - 1) + "' value='" + data[i].Dept + "' ></td>\n" +
                                    "<td> <img src='images/Delete.png' id='Delete"+(i-1)+"'  name = 'Delete"+(i-1)+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunctionUnit(this.id);'></td>"+
                                    "</tr>";
                                trid.append(input_fields);
                                console.log("Testing", data[i].BusinessUnit);
                            }
                        }
                    }
                });

                $.ajax({
                    url: "DecommIntakeSiteRequirementsDataRetrieveServlet",
                    type: 'POST',
                    dataType: "json",
                    success: function (data) {
                        console.log("json object of array1--->", data);
                        var trid1=$("#SiteLocation");
                        if(data[0].CheckExistance==false)
                        {
                            var input_fields1="<tr id='row_id0' name = 'row0'><td><input type='text' id ='Country_0' class='Country' name='Country0'></td>\n" +
                                "<td><input type='text' id ='City_0' class='City' name='City0'></td>\n" +
                                "<td><input type='text' id ='State_0' class='State' name='State0'></td>\n" +
                                "<td><input type='text' id ='office_designation0' class='office_designation' name='OfficeDesignation0'></td>\n" +
                                "<td> <img src='images/Delete.png' id='delete0' name = 'delete_0' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this);'></td>"+
                                "</tr>";
                            trid1.append(input_fields1);
                        }
                        else {
                            for(var i=1;i<=data.length-1;i++)
                            {
                                var input_fields1='<tr id="row_id'+(i-1)+'" name = "row'+(i-1)+'"><td><input type="text" id ="country'+(i-1)+'" class="Country" name="Country'+(i-1)+'" value="'+data[i].Country+'"></td>'+
                                    '<td><input type="text" id ="City_'+(i-1)+'" class="City" name="City'+(i-1)+'" value="'+data[i].City+'"></td>'+
                                    '<td><input type="text" id ="State_'+(i-1)+'" class="State" name="State'+(i-1)+'" value="'+data[i].State+'"></td>'+
                                    '<td><input type="text" id ="office_designation'+((i-1))+'" class="OfficeDesignation" name="OfficeDesignation'+(i-1)+'" value="'+data[i].OfficeDesignation+'"></td>'+
                                    "<td> <img src='images/Delete.png' id='delete"+(i-1)+"' name = 'delete_"+(i-1)+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this.id);'></td>"+
                                    '</tr>';
                                trid1.append(input_fields1);
                                console.log("Testing", data[i].Country);
                            }
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });

          
                $.ajax({
                    url: "DecommIntakeRequirementServlet",
                    type: 'POST',
                    dataType: "json",
                    success: function (data) {
                        console.log("json object--->", data);
                        if(data.CheckExistance==false) {
                            $('#legacyappname').val("");
                            $('#projectnumber').val("");
                            $('#ain').val("");
                            $('#infraprojectnumber').val("");
                            $('#RO_DATE').val(data.Read_Only);
                        }
                        else{
                            $('#app_name').val(data.App_Name);
                            $('#legacyappname').val(data.Legacy_App_Name);
                            $('#projectnumber').val(data.Enterprise_Team_Decomm_Prj_No);
                            $('#ain').val(data.App_Identification_No);
                            $('#infraprojectnumber').val(data.Infra_Prj_No);
                            $('#RO_DATE').val(data.Read_Only);
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });

            }); 

            function submit()
            {
                var url_string=window.location.href;
                var url = new URL(url_string);
                var appname = url.searchParams.get("appname");
                var projname=url.searchParams.get("projectname");
                var classlength=$('.BusinessUnit').length;
                var site_classlength=$('.Country').length;
                console.log("class length",classlength,projname);
                console.log("Site class length",site_classlength,projname);
                var f=document.Decomm_Intake_Requirements;
                f.method = "post";
                f.action="DecommIntakeRequirements_db_update?appnames="+appname+"&projectname="+projname+'&BULUClassLength='+classlength+'&SLAClassLength='+site_classlength;
                f.submit();
            }

        </script>


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
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="js/amcharts/themes/light.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>
<script id ="scripttag"></script>


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
            /* $(function($) {
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
 */        </script>

        <script>
            function SomeDeleteRowFunction(o) {
                var classlength = $('.Country').length;
                var id = parseInt(o.substring(o.lastIndexOf('e')+1,o.length));
                $('#row_id'+id).remove();
                for(var i=id+1;i<classlength;i++)
                {
                    $('#country'+i).removeAttr("name");
                    $('#country'+i).attr('name','Country'+(i-1));
                    $('input[name=Country'+(i-1)+']').removeAttr("id");
                    $('input[name=Country'+(i-1)+']').attr('id','country'+(i-1));
                    $('#City_'+i).removeAttr("name");
                    $('#City_'+i).attr('name','City'+(i-1));
                    $('input[name=City'+(i-1)+']').removeAttr("id");
                    $('input[name=City'+(i-1)+']').attr('id','City_'+(i-1));
                    $('#State_'+i).removeAttr("name");
                    $('#State_'+i).attr('name','State'+(i-1));
                    $('input[name=State'+(i-1)+']').removeAttr("id");
                    $('input[name=State'+(i-1)+']').attr('id','State_'+(i-1));
                    $('#office_designation'+i).removeAttr("name");
                    $('#office_designation'+i).attr('name','OfficeDesignation'+(i-1));
                    $('input[name=OfficeDesignation'+(i-1)+']').removeAttr("id");
                    $('input[name=OfficeDesignation'+(i-1)+']').attr('id','office_designation'+(i-1));
                    $('#delete'+i).removeAttr("name");
                    $('#delete'+i).attr('name','delete_'+(i-1));
                    $('img[name=delete_'+(i-1)+']').removeAttr("id");
                    $('img[name=delete_'+(i-1)+']').attr('id','delete'+(i-1));
                    $('#row_id'+i).removeAttr("name");
                    $('#row_id'+i).attr('name','row'+(i-1));
                    $('tr[name=row'+(i-1)+']').removeAttr("id");
                    $('tr[name=row'+(i-1)+']').attr('id','row_id'+(i-1));
                }
            }
        </script>

<script>
            function SomeDeleteRowFunctionUnit(o) {
                var classlength = $('.BusinessUnit').length;
                var id = parseInt(o.substring(o.lastIndexOf('e')+1,o.length));
                $('#Row_id'+id).remove();
                for(var i=id+1;i<classlength;i++)
                {
                    $('#business_unit_'+i).removeAttr("name");
                    $('#business_unit_'+i).attr('name','BusinessUnit'+(i-1));
                    $('input[name=BusinessUnit'+(i-1)+']').removeAttr("id");
                    $('input[name=BusinessUnit'+(i-1)+']').attr('id','business_unit_'+(i-1));
                    $('#operation_unit_'+i).removeAttr("name");
                    $('#operation_unit_'+i).attr('name','OperationUnit'+(i-1));
                    $('input[name=OperationUnit'+(i-1)+']').removeAttr("id");
                    $('input[name=OperationUnit'+(i-1)+']').attr('id','operation_unit_'+(i-1));
                    $('#location_unit_'+i).removeAttr("name");
                    $('#location_unit_'+i).attr('name','LocationUnit'+(i-1));
                    $('input[name=LocationUnit'+(i-1)+']').removeAttr("id");
                    $('input[name=LocationUnit'+(i-1)+']').attr('id','location_unit_'+(i-1));
                    $('#department_'+i).removeAttr("name");
                    $('#department_'+i).attr('name','Department'+(i-1));
                    $('input[name=Department'+(i-1)+']').removeAttr("id");
                    $('input[name=Department'+(i-1)+']').attr('id','department_'+(i-1));
                    $('#Delete'+i).removeAttr("name");
                    $('#Delete'+i).attr('name','Delete'+(i-1));
                    $('img[name=Delete'+(i-1)+']').removeAttr("id");
                    $('img[name=Delete'+(i-1)+']').attr('id','Delete'+(i-1));
                    $('#Row_id'+i).removeAttr("name");
                    $('#Row_id'+i).attr('name','Row'+(i-1));
                    $('tr[name=Row'+(i-1)+']').removeAttr("id");
                    $('tr[name=Row'+(i-1)+']').attr('id','Row_id'+(i-1));
                }
            }
        </script>

 <script>
            function addrow_sitelocation()
            {

                var rowlength=$('.Country').length;

                var i=rowlength;
                var element='<tr><td><input type="text" id ="country'+i+'" class="Country" name="Country'+i+'" value=""></td>'+
                    '<td><input type="text" id ="city'+i+'" class="City" name="City'+i+'" value=""></td>'+
                    '<td><input type="text" id ="state'+i+'" class="State" name="State'+i+'" value=""></td>'+
                    '<td><input type="text" id ="office_designation'+i+'" class="OfficeDesignation" name="OfficeDesignation'+i+'" value=""></td>'+
                    "<td> <img src='images/Delete.png' id='delete'"+i+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this);'></td>"+
                    '</tr>';
                $('#SiteLocation').append(element);

            }

            function addrow_bussiness()
            {

                var rowlength=$('.BusinessUnit').length;

                var i=rowlength;
                var element="<tr><td><input type='text' id ='business_unit_"+i+"' class='BusinessUnit' name='BusinessUnit"+i+"' value=''></td>\n"+
                    "<td><input type='text' id ='operation_unit_"+i+"' class='OperationUnit' name='OperationUnit"+i+"' value=''></td>\n"+
                    "<td><input type='text' id ='location_unit_"+i+"' class='LocationUnit' name='LocationUnit"+i+"' value=''></td>\n"+
                    "<td><input type='text' id ='department_"+i+"' class='Department' name='Department"+i+"' value='' ></td>\n"+
                    "<td> <img src='images/Delete.png' id='delete'"+i+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this);'></td>"+
                    "</tr>";
                $('#business_unit_and_geographic_location').append(element);

            }
        </script>



</body>
</html>
