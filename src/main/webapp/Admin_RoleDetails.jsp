<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Role Configuration</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
   
   
   
 <link rel="stylesheet" href="styles/styles.css" type="text/css" />
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
     <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
    <link rel="stylesheet" href="css/archive_add/archive_add.css" media="screen" >
        <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
   <style>
.switch {
  position: relative;
  display: inline-block;
  width: 40px;
  height: 16px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 9px;
  width: 9px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 30px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
    <style type="text/css">
            .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
       
			.glyphicon.glyphicon-asterisk
			{
			color:red;
			font-size:6px;
			}
 	</style>
 	
      <script>
	function calls()
	{
		    var x = document.getElementById('myDiv1');
		    if (x.style.display === 'none') {
		        x.style.display = 'block';
		    } 
		    else {
		        x.style.display = 'none';
		    }
		
	}
	</script>
	<script>
	function edit_serv()
	{
		 var f=document.loginForm;
		    f.method="post";
		    f.action='Role_details';
		    f.submit(); 
	}
	
	</script>
	<script>
function checkk()
{
	document.getElementById('sub_btn').disabled = true;
	}
</script>  

</head>

<body class="top-navbar-fixed">

<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%@page import="onboard.DBconnection"%>
		<%@page import="org.owasp.encoder.Encode" %>
		<%
		DBconnection dBconnection=new DBconnection();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Admin_RoleDetails JSP PAGE-----[INFO]");  %>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
	response.sendRedirect("Login.jsp");
}
%>
<%
PreparedStatement s=null,s1=null;
ResultSet rs=null,rs1=null;
HttpSession details=request.getSession();
String info=(String)details.getAttribute("admin");
String prjname=(String)details.getAttribute("nameofproject");
java.sql.Connection conn = dBconnection.getConnection(); 
String query="select * from Role_Details";
String query1="select * from Admin_UserDetails";
s=conn.prepareStatement(query);
s1=conn.prepareStatement(query1);
rs=s.executeQuery();
rs1=s1.executeQuery();
int count=0;
%>

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
                         <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=Encode.forHtml(prjname)%></a>

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
       <%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
	<li ><a href="#"><span id="nav_userid"><%=Encode.forHtmlAttribute(uname)%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=Encode.forHtmlAttribute(role)%></span></a></li>
	<li ><a href="#"><span id="nav_userid"><%=Encode.forHtmlContent(uname)%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=Encode.forHtmlContent(role)%></span></a></li>	
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


<form class="form-signin" name="loginForm" method="post" action="Role_details">

            <div class="content-wrapper">
                <div class="content-container">
            
           
                    <!-- ========== LEFT SIDEBAR for UserConfiguration ========== -->
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
                                        <a><span class="">User Module</span></a>
                                    </li>
                                    <li>
                                        <a href="User_Configuration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span> </a>
                                    </li>

                                    <li>
                                        <a href="Admin_Userslist.jsp"><i class="fa fa-paint-brush"></i> <span>Users List</span> </a>
                                    </li>

                                    <li>
                                        <a href="Admin_RoleDetails.jsp"><i class="fa fa-map-signs"></i> <span>Authorization </span> </a>
                                    </li>
                                </ul>
										
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                 <!-- /.left-sidebar -->
            
			
<!-- Projects List Start -->

                    <div class="main-page">
                        
                        <section>

                                <div class="row">
                                    <div class="col-md-12">
                        
<br/>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Authorization List</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
  <th>Role</th>
  <th>Admin</th>
  <th>AppEmphasize</th>
  <th>Intake</th>
  <th>Archival Execution</th>
  <th>Decommision</th>
  <th>Program governance</th>
  <th>Reporting</th>
  <th>Finance</th>
                                    </thead>
                                    <tbody>
                                      <%
                                  
                                      int i=0;
                                      while(rs.next()){ 
                                      %>
                                     
                                      <tr>
                                      <td><input class="act" style="width:170px;" type="text" name="role<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(1)) %>"></td>
                                      <td><label class="switch"><input type="checkbox" id="slideradmin<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("admin<%=Encode.forHtml(String.valueOf(i)) %>","slideradmin<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="admin<%=Encode.forHtml(String.valueOf(i)) %>" name="admin<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(2)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderapp_emp<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("app_emp<%=Encode.forHtml(String.valueOf(i)) %>","sliderapp_emp<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="app_emp<%=Encode.forHtml(String.valueOf(i)) %>" name="app_emp<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(3)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderintake<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("intake<%=Encode.forHtml(String.valueOf(i)) %>","sliderintake<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="intake<%=Encode.forHtml(String.valueOf(i)) %>" name="intake<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(4)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderarch_exe<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("arch_exe<%=Encode.forHtml(String.valueOf(i)) %>","sliderarch_exe<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="arch_exe<%=Encode.forHtml(String.valueOf(i)) %>" name="arch_exe<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(5)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderdecomm<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("decomm<%=Encode.forHtml(String.valueOf(i)) %>","sliderdecomm<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="decomm<%=Encode.forHtml(String.valueOf(i)) %>" name="decomm<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(6)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderprgm_gov<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("prgm_gov<%=Encode.forHtml(String.valueOf(i)) %>","sliderprgm_gov<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="prgm_gov<%=Encode.forHtml(String.valueOf(i)) %>" name="prgm_gov<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(7)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderreport<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("report<%=Encode.forHtml(String.valueOf(i)) %>","sliderreport<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="report<%=Encode.forHtml(String.valueOf(i)) %>" name="report<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(8)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderfinance<%=Encode.forHtml(String.valueOf(i)) %>" onclick=chk("finance<%=Encode.forHtml(String.valueOf(i)) %>","sliderfinance<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="finance<%=Encode.forHtml(String.valueOf(i)) %>" name="finance<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(9)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      </tr> 
                                      
                                       <tr>
                                      <td><input class="act" style="width:170px;" type="text" name="role<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(1)) %>"></td>
                                      <td><label class="switch"><input type="checkbox" id="slideradmin<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("admin<%=Encode.forHtml(String.valueOf(i)) %>","slideradmin<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="admin<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="admin<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(2)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderapp_emp<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("app_emp<%=Encode.forHtml(String.valueOf(i)) %>","sliderapp_emp<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="app_emp<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="app_emp<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(3)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderintake<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("intake<%=Encode.forHtml(String.valueOf(i)) %>","sliderintake<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="intake<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="intake<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(4)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderarch_exe<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("arch_exe<%=Encode.forHtml(String.valueOf(i)) %>","sliderarch_exe<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="arch_exe<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="arch_exe<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(5)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderdecomm<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("decomm<%=Encode.forHtml(String.valueOf(i)) %>","sliderdecomm<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="decomm<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="decomm<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(6)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderprgm_gov<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("prgm_gov<%=Encode.forHtml(String.valueOf(i)) %>","sliderprgm_gov<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="prgm_gov<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="prgm_gov<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(7)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderreport<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("report<%=Encode.forHtml(String.valueOf(i)) %>","sliderreport<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="report<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="report<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(8)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      <td><label class="switch"><input type="checkbox" id="sliderfinance<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" onclick=chk("finance<%=Encode.forHtml(String.valueOf(i)) %>","sliderfinance<%=Encode.forHtml(String.valueOf(i)) %>") ><span class="slider round"></span></label><input class="act" type="text" id="finance<%=Encode.forHtmlAttribute(String.valueOf(i)) %>" name="finance<%=Encode.forHtml(String.valueOf(i)) %>" value="<%= Encode.forHtmlAttribute(rs.getString(9)) %>" style="background-color:lightgrey; " readonly="readonly"/></td>
                                      </tr> 
                                      <%
                                      i++;
                                      }
                                 
%>  
                                                                           </tbody>
                                </table><%
s.close();
rs.close();
s1.close();
rs1.close();
%>
 <input type="hidden" id="rolecheck" value="<%= info %>" hidden>
 &nbsp;&nbsp;&nbsp;
 <button type="button" id="sub_btn" class="btn btn-primary" onclick="edit_serv()">Submit</button>                           </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

    </div>
</div>

  <script>
 if(document.getElementById('rolecheck').value=="R")
	 checkk();
 function chk(textbox_id,slider_id)
 {
	 
	 var boolean_val = document.getElementById(slider_id).checked;
	 if(boolean_val==false)
		 {
		 document.getElementById(textbox_id).style.backgroundColor = "lightgrey";
		 document.getElementById(textbox_id).readOnly = true;
		 }
	 else
		 {
		 document.getElementById(textbox_id).style.backgroundColor = "white";
		 document.getElementById(textbox_id).removeAttribute('readonly');
		 }
	 
 }
 </script>   
</form>

				    </div>
                                    <!-- /.col-md-6 -->

                                </div>
                                <!-- /.row -->

                        </section>
                        <!-- /.section -->

                    </div>
                    <!-- /.main-page -->
                 
<!-- Project List End -->

                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /.main-wrapper -->
            
		
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


