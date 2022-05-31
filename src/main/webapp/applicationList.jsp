<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application List</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
    
    <!-- ========== Header Icon ========== -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <link rel="stylesheet" href="css/headerIcon/headerIcon.css" media="screen" >
 
    <link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
		media="screen">
	<link rel="stylesheet" href="css/Responsive/responsive.css"
		media="screen">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script src="js/multiplepages.js"></script>
    <script src ="js/Opportunity/OpportunityGrid/OpportunityGrid.js"></script>
    
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
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>

	
<!-- ========== BootstrapV5 ========== -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<%-- <%@ page import="java.text.SimpleDateFormat"%>
    <%@ page import="java.util.Date"%>
    <%
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]");  %>
    <%@page language="java"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.text.DateFormat" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.util.Calendar" %>
    <%@ page import="onboard.DBconnection"%>

    
    <%
         DBconnection dBconnection = new DBconnection();

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.

        if (session.getAttribute("username")==null)
        {
            response.sendRedirect("Login.jsp");

        }
        else{
            String name=(String)session.getAttribute("ID");
            HttpSession details=request.getSession();
            Connection con = null;
            session.setAttribute("theName", name);
            String roles=(String)details.getAttribute("role");
            String waveName = (String)details.getAttribute("selectedWaveName");
            int sumcount=0;
            Statement st,st2;
            try{
                con = dBconnection.getConnection();
                Statement st1;


                /* String query1 = "select * from AppEmphazize_ProjectDetails where id = "+name;
                st1 = con.createStatement();
                ResultSet rs = st1.executeQuery(query1);
                if(rs.next())
                { */

    %> --%>

  <%@include file="Nav-Bar.jspf"%> 
             <nav class="nav" id="bg-color" style="height: 75px;">
        <div class="container-fluid" id="container-fluid-margin">
            <div class="row" id="d3s-mt-20">
                <div class="col-lg-12 col-md-12">
                    <h5 class="title" style="color:#fff">Modules</h5>
                    </div>
                    </div>
                              <!-- <p class="sub-title">Create and manage your Opportunities here</p>-->
                        <%--  <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >><%=waveName%></p> --%>
                      <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="sub-title" style="color: #fff">
                            <a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
                                class="glyphicon glyphicon-home"></span> Home</a> >> Applications List
                            <%-- <%=waveName%> --%>
                        </div>
                       </div>
                    </div>
                </div>
            </nav>

		<div class="card-container-5 card d3s-mt-50">
             <div class="card-header d3s-pl-15" id="cd-header">Applications List
             	<button id="appChange" class="btn btn-primary align-right" style="margin-top: -4px;">Change
                </button>
             </div>
             <div class="card-body">
             <div class="withPhase display" id="withPhase">
             	<table class="table table-bordered table-responsive" id="appTable" style="width: 100%; font-size: 12px;">									
    				<thead>
      					<tr>						
      					 	<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Application Name</th>
        					<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Phase</th>
        					<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Wave</th>
        					<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Resources</th>
      					</tr>
    				</thead>
    				<tbody id="applicationList">		    											
      				</tbody>
  				</table>
  				
  				<div class="col-md-12 text-center">
					<ul class="pagination pagination-lg pager pagination-align"
						id="developer_page_3"></ul>
				</div>
  				<div class="row">
             		<div class="col-md-12" align="end">
             			<button class="btn btn-primary" id="saveApplicationList">Submit</button>
             		</div>
             	</div>
  				</div>
  				<div class="withoutPhase" id="withoutPhase">
  				<table class="table table-bordered table-responsive" id="example4" style="width: 100%; font-size: 12px;">									
    				<thead>
      					<tr>						
      					 	<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Application Name</th>
        					<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Phase</th>
        					<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Wave</th>
        					<th style='text-align:center;vertical-align: middle;width:25%;'scope="col">Resources</th>
      					</tr>
    				</thead>
    				<tbody>		    											
      				</tbody>
  				</table>
  				<div class="row">
             		<div class="col-md-12" align="end">
             			<button class="btn btn-primary" id="">Submit</button>
             		</div>
             	</div>
  				</div>
  				
             </div>
            
        </div>
<script>
$("#appChange").on('click', function(e) {             
	  $('#withPhase, #withoutPhase').toggleClass('display');
	});

</script>

















<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="js/navigation/navigation.js"></script>   
<script src="js/application_list/applicationList.js"></script>
<link href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" rel="stylesheet">
<link href="//code.jquery.com/jquery-3.6.0.min.js" rel="stylesheet">
<link href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" rel="stylesheet">
<!-- ========== Pagination ========== -->
<script src="js/paging/pagination.js"></script>

</body>
</html>