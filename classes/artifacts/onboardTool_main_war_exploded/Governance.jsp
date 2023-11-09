<!DOCTYPE html>

<html lang="en">
<head>
    <title>D3Sixty Modules List</title>
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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
    <link rel="stylesheet" href="css/headerIcon/headerIcon.css" media="screen" >
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script src="js/multiplepages.js"></script>
    <script src ="js/Opportunity/OpportunityGrid/OpportunityGrid.js"></script>   
     <style>
  body{
     
     background-color: #fff;
   
   
    }
   .active{
        background:#1565c0;
         }
      .page-title-div {
	 background:#1565c0;
	  padding: 15px;
	  
	  
	}
	.fixed-top{
	width:100%;
	padding-left: 0px;
    padding-right: 0px;
	}
  
  .title {
  color:#fff;
  } 
  
 #module_header{
 
 margin-top:200px;
 }



/* Steps timeline*/


.step-title,
.step-description {
  margin: 0;
  display: block;
  text-align: center;
}

.step-title{
  font-size: 16px;
  line-height: 22px;
  font-weight: bold;
  margin-bottom: 10px;
}

.ste-description {
  overflow: hidden;
  line-height:20px;
}



.img-rounded{

padding-top:20px;
transition: width 2s, height 2s, transform 2s;
}

.step-milestone1{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 15px auto;
  box-sizing: border-box;
  transition: width 2s, height 2s, transform 2s;
}




.step-milestone2{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 15px auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}
.step-milestone3{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 15px auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}
.step-milestone4{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 15px auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}

.step-milestone5{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 15px auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}



 img.filtered {
			filter: sepia(100%) hue-rotate(190deg) saturate(1000%);
		}

        .icon{
            
            filter: blue(100%);
        }
        
        
.container {
    display: block;
    position: relative;
}
.flow {
    width: 1300px;
    height: 100px;
}
.process{
    width: 180px;
    height: 180px;
    border-radius: 50%;
    border: 1px solid #fff;
    float: left;
    margin: 10px;
    
    background-color: #fff;
}
.flow .process{
    position: absolute;
}
.report .process{
    position: relative;
    margin-right: 50px;
}

.process .name {
    width: 100%;
    padding: 5px;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
}
.process .action {
    width: 100%;
    text-align: center;
}
.process .action a {
    padding: 5px 5px;
    color: #ba0a3b;
    font-weight: bold;
    cursor: pointer;
    display: inline-block;
}
.process .action a:hover {
    color: #0abab5;
}
.process:hover {
    background-color: #e2e2e2;
}
.process.endpoint {
    width: 30px;
    height: 30px;
    border: 2px solid #2179a5;
}
.process.endpoint .name{
    width: 100%;
    height: 100%;
    font-size: 12px;
    line-height: 30px;
    padding: 0px;
}
.arrow {
    padding: 0px 5px;
    position: absolute;
}
.arrow.vert{
    transform: rotate(90deg);
}
.arrow.vert .line{
    width: 30px;
}
.arrow .line {
    width: 60px;
    height: 11px;
    border-bottom: 4px solid #999;
    border-radius: 230px 0 0 150px;
    float: left;
}
.arrow .triangle {
    border-top: 10px solid white;
    border-left: 10px solid #999;
    border-bottom: 10px solid white;
    float: left;
}
.process.start {
    top: 0px;
    left: 75px;
}
.process.job, .process.candidate {
    top: 95px;
}
.process.job {
    left: 0px;
}
.process.candidate {
    left: 290px;
}
.process.interview, .process.assessment, .process.finalDecision {
    top: 95px;
}
.process.interview {
    left: 580px;
}
.process.assessment {
    left: 870px;
}
.process.finalDecision {
    left: 1170px;
}
.process.finish {
    top: 595px;
    left: 368px;
}
.arrow.job {
    top: 65px;
    left: 78px;
}
.arrow.candidate{
    top: 190px;
    left: 200px;
}
.arrow.assessment, .arrow.finalDecision,.arrow.final{
    top: 190px;
}
.arrow.assessment{
    left: 490px;
}
.arrow.finalDecision{
    left: 780px;
}
.arrow.final{
    left: 1070px;
}
.arrow.interview, .arrow.finish{
    left: 370px;
}
.arrow.interview{
    top: 310px;
}
.arrow.finish{
    top: 560px;
}        
        
        
        
        
    </style>
</head>
<body class="top-navbar-fixed">
<script>
    $(document).ready(function() {

        $('#testDecom').attr('disabled', true);
    });
</script>
<div class="main-wrapper">
    <%@ page import="java.text.SimpleDateFormat"%>
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
	<%@page import="org.owasp.encoder.Encode" %>
    
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
            String OpportunityName = (String)details.getAttribute("SelectedOpportunity");
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

    %>

    <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                    </a>

                   


                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                  <ul class="nav navbar-nav">
		              <li><a href="OpportunityList.jsp"><i class="fad fa-folders fa-2x iconAlign iconColor"></i>Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
		              <li class="active"><a href="GovernanceList.jsp" style="color:#fff"><i class="fad fa-desktop iconAlign activeIcon fa-2x"></i>Governance</a></li>
		              <li><a href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
		              <li><a href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
		              <li><a href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
		    </ul>
		         <ul class="nav navbar-nav navbar-right">
                        <%
                            String uname=(String)details.getAttribute("username");
                            String role=(String)details.getAttribute("role");%>

                        
                      <%--   <li><a href="#"><span id="nav_userid"><%=Encode.forHtml(uname)%> </span>logged in as <span id='nav_role'><%=Encode.forHtml(role)%></span></a></li> --%>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div>
            <!-- /.row -->
            <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                        
                             <h4 class="title" style="color:#fff">Modules</h4>
                              <!-- <p class="sub-title">Create and manage your Opportunities here</p>-->
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a></p>
                        </div>
                       
                    </div>

                </div>
			</nav>
        </div>
        <!-- /.container-fluid -->
    </nav >
    <div class="content-wrapper">
        <div class="content-container">

            <!-- ========== LEFT SIDEBAR ========== -->
            <div class="main-page">
                
                <!-- /.container-fluid -->
              <div class="container-fluid" id="module_header">

                <%
                    if(roles.equals("admin")){
                %>
                <!--  admin Role -->
                <section>
 <div class="flow container">
   <div class="process job">
        <div class="step">
    <div class="step-milestone1"/>
    
                                   <a id="IntakeNavigation" href="PhaseList.jsp">
                                        <center>
                                            <img src="images/governance/Govern.png" class="img-rounded filtered" height="100" width="100" alt="Avatar">

                                        </center>

                                    </a>
    </div>
    <br>
   <span class="step-title">
      Governance  
    </span>
    
    
     </div>
    </div>
     </div>
    
    </div>
     </div>
    </div>
    
 
 
 

</div>    
                </section>
                <!-- /.section -->


               
                        <%
}
else if(roles.equals("ArchivalDeveloper"))
{
%>
                    <section>

                      </section>
                        
                        <%} %>


            </div>

        </div>





        </br>
    </div>
    <!-- /.main-page -->

    <!-- Project List End -->

</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->


<%
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
%>

<script>
    $(document).ready(function() {

        $('#testDecom').attr('disabled', true);
    });
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



</body>
</html>