<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
   
   
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <script type="text/javascript" src="js_in_pages/project.js"></script>

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    
        
    
    
    
    <style type="text/css">
         
         
        
         
         body{
            background:#fff;
            zoom:250%%;
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
	
	h1 { 
        color: green; 
    } 
            
    /* toggle in label designing */
    .toggle { 
        position: absolute;
    display: inline-block;
    width: 85px;
    margin-top: 115px;
   margin-left: 1205px;
    height: 36px;
   background-color: #ffffff;
    border-radius: 30px;
    border: 2px solid #1287ea; 
    } 
            
    /* After slide changes */
    .toggle:after { 
        content: '';
    position: absolute;
    width: 31px;
    height: 30px;
    border-radius: 50%;
    background-color: #1389eb;
    top: 1px;
    left: 1px;
    transition: all 0.5s;
    } 
            
    /* Toggle text */
    p { 
        font-family: Arial, Helvetica, sans-serif; 
        font-weight: bold; 
    } 
            
    /* Checkbox cheked effect */
    .checkbox:checked + .toggle::after { 
        left : 49px;  
    } 
            
    /* Checkbox cheked toggle label bg color */
    .checkbox:checked + .toggle { 
      background-color: #ffffff;
    } 
            
    /* Checkbox vanished */
    .checkbox {  
        display : none; 
    } 
	

hr{

border-top: 3px solid #dce8f1;
}
 input[type=search]{
  outline: 0;
  
  border-width: 0 0 3px 0;
  border-color: #d2d2d2;
}
input[type=search]:focus {
  border-color: #1565c0;
}
.cbp-vm-switcher {
	padding: 42px;
	
}




.cbp-vm-options {
	text-align: right;
	padding-bottom: 10px;
	
}

.cbp-vm-options a {
	display: inline-block;
	width: 30px;
	height: 30px;
	overflow: hidden;
	white-space: nowrap;
	color: #d0d0d0;
	margin: 2px;
}

.cbp-vm-options a:hover,
.cbp-vm-options a.cbp-vm-selected {
	color: #47a3da;
}

.cbp-vm-options a:before {
	width: 20px;
	height: 20px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	display: inline-block;
}

/* General style of switch items' list */

.cbp-vm-switcher ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

/* Clear eventual floats */
.cbp-vm-switcher ul:before, 
.cbp-vm-switcher ul:after { 
	content: " "; 
	display: table; 
}

.cbp-vm-switcher ul:after { 
	clear: both; 
}

.cbp-vm-switcher ul li {
	display: block;
	position: relative;
}

.cbp-vm-image {
	display: block;
	margin: 0 auto;
}

.cbp-vm-image img {
	display: inline-block;
	max-width: 100%;
}

.cbp-vm-title {
	margin: 0;
	padding: 0;
}

.cbp-vm-price {
	color: #c0c0c0;
}

.cbp-vm-add {
	color: #fff;
	background: #47a3da;
	padding: 10px 20px;
	border-radius: 2px;
	margin: 20px 0 0;
	display: inline-block;
	transition: background 0.2s;
}

.cbp-vm-add:hover {
	color: #fff;
	background: #02639d;
}

.cbp-vm-add:before {
	margin-right: 5px;
}

/* Common icon styles */
.cbp-vm-icon:before {
	font-family: 'fontawesome';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}



/* Individual view mode styles */

/* Large grid view */
.cbp-vm-view-grid ul {
	text-align: center;
}

.cbp-vm-view-grid ul li {
	width: 20%;
	text-align: center;
	  box-shadow:5px 5px 5px 5px  #dbdbdb;
	
	display: inline-block;
	
	vertical-align: top;
}

.cbp-vm-view-grid .cbp-vm-title {
	font-size: 21px;
}

.cbp-vm-view-grid .cbp-vm-details {
	max-width: 300px;
	min-height: 70px;
	margin: 0 auto;
} 

.cbp-vm-view-grid .cbp-vm-price {
	margin: 10px 0;
	font-size: 1.5em;
}

.cbp-vm-view-list .right-col {
            float: left;
            width: 25%;
        }
        .cbp-vm-view-list .cbp-vm-title {
            font-size: 1.3em;
            padding: 0 30px;
            white-space: normal;
            width: 25%;
        }
        .cbp-vm-view-list .center-col {
            float: left;
            width: 20%;
            margin-right: 51px;
        }
        .cbp-vm-view-list .center-col {
            float: left;
            width: 20%;
            margin-right: 51px;
        }
        .cbp-vm-view-list li {
            padding: 12px 0;
            white-space: nowrap;
            background-color: #fff;
            box-shadow:5px 5px 5px 5px  #dbdbdb;
            margin:13px;
            padding-top:10px;
        }


        .cbp-vm-view-list li:focus {
            display: block;
            border:2px solid red;
        }

@media screen and (max-width: 66.7em) {
	.cbp-vm-view-list .cbp-vm-details  {
		width: 30%;
	}
} 

@media screen and (max-width: 57em) {
	.cbp-vm-view-grid ul li {
		width: 49%;
	}
}

@media screen and (max-width: 47.375em) {
	.cbp-vm-view-list .cbp-vm-image {
		width: 20%;
	}

	.cbp-vm-view-list .cbp-vm-title {
		width: auto;
	}

	.cbp-vm-view-list .cbp-vm-details  {
		display: block;
		width: 100%;
		margin: 10px 0;
	}

	.cbp-vm-view-list .cbp-vm-add  {
		margin: 10px;
	}
}

@media screen and (max-width: 40.125em) {
	.cbp-vm-view-grid ul li {
		width: 100%;
	}
}
        
       
        .grid{
  margin-top:80px;
  
  }
	.cbp-vm-view-list li:focus {
            display: block;
            border:2px solid red;
        }
        .progress{

            margin-top:5px;
        }

         .cologen{
             color: #1c95f8 !important;
         }
         
         
         
    .right-side{
    
     position: absolute;
    right: 10%;
    top: 80px;
    z-index: 1;
    }    
    
    #button{
    height: 50px;
    width: 50px;
    border-radius: 50%;
    border: 1px solid #dd6a2c;
    background-color: #dd6a2c;
    color: #fff;
    outline-width: 0;
    font-size: 20px;
    padding: 12px;
    text-align: center;
    
        
    
    } 
    
    .form-row {
    display: flex;
    flex-wrap: wrap;
    margin-right: -5px;
    margin-left: -5px;
}

.search-input {
    min-width: 150px;
    max-width: 290px;
    flex: 1;
    position: relative;
}


#myInput{


    border: none;
    border-bottom: 1px solid #959595;
    -o-border-image: initial;
    border-image: initial;
    border-radius: 0;
    color: #fff!important;
    font-size: .875rem;
    text-indent: 12px;
    background-color: transparent!important;
    box-shadow: none;
    height: 25px;
    margin-top: 5px;
    padding-bottom: 3px;


}


.fa-search{

color:#fff;

}
/* toggle */

/* toggle */
#apptype{

 font-size: .875rem;
 color:#fff;
}
      
      .paneldashboard{box-shadow: 0 1px 7px rgb(76 89 103);
    margin-top: 14px;
      }
     
      .font_icon{
      font-size: 20px;
      }
      .totcounter{
      font-size: 25px;
    margin-bottom: 14px;
    text-align: center;}
    .headercharts{
    margin-left: 22px; margin-bottom: 21px;
    }
    </style>

</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed OpportunityList JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@page import="org.owasp.encoder.Encode"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username")==null){
        response.sendRedirect("Login.jsp");
    }
%>
<%
    HttpSession role_ses=request.getSession();
    String frole=(String)role_ses.getAttribute("role");
    int sumcount=0;
    Statement st,st1;
    try{PreparedStatement visit_st=null;
    	ResultSet visit_rs=null;
        String query;
        HttpSession details=request.getSession();
        String Projets=(String)details.getAttribute("projects");
        System.out.println("projects-------------"+Projets);
        String roles=(String)details.getAttribute("role");
        DBconnection d=new DBconnection();
        Connection con = (Connection)d.getConnection();
        String visit_query="select * from visits";
        visit_st = con.prepareStatement(visit_query);
        visit_rs = visit_st.executeQuery();
        int flag=1,knt=0;
        Date date = new Date();
        SimpleDateFormat ft,ft1;
        String username=(String)details.getAttribute("username");

        ft=new SimpleDateFormat ("yyyy-MM-dd");
        ft1=new SimpleDateFormat ("hh:mm:ss");
        String strDate=ft.format(date);
        String strTime=ft1.format(date);
        while(visit_rs.next())
        {
            if(visit_rs.getString(6)!=null)
            {
                if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Logged in"))
                {
                	String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in'  and date =?";
                    PreparedStatement stmtt = con.prepareStatement(queryy);
        			stmtt.setString(1, strTime);
        			stmtt.setString(2, username);
        			stmtt.setString(3, strDate);
                    int count = stmtt.executeUpdate();
                    flag=0;
                    break;
                }
            }

        }
        //System.out.println("the flag value is "+flag);
        if(flag==1)
        {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(ins_query);
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, strDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");

            // execute the preparedstatement
            preparedStmt.execute();
        }%>



<!-- main wrapper -->
<div class="main-wrapper">


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
		              <li ><a href="OpportunityList.jsp">Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp">Administration</a></li>
		              <li><a href="GovernanceList.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li class="active"><a href="#" style="color:#fff">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right">
                        <%
                            String uname=(String)details.getAttribute("username");
                            String role=(String)details.getAttribute("role");%>

                       <%--  <li><a href="#"><span id="nav_userid"><%=Encode.forHtml(uname)%> </span>logged in as <span id='nav_role'><%=Encode.forHtml(role)%></span></a></li> --%>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div>
            <!-- /.row -->
            <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                             <h5 class="title" style="color:#fff">Dashboard</h5>
                             
                              <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >> Dashboard</p>
                        </div>
                        
                        </div>
                      

                    </div>

                </div>
			</nav>
        </div>
        <!-- /.container-fluid -->
    </nav >
    <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
   
    <div class="content-wrapper">
     
        
        

        <div class="content-container">
           
            <div class="main-page">
               <div class="paneldashboard" style="margin-top: 21px;  margin-bottom: 75px;">
                             <input type="checkbox" id="switch"
                    class="checkbox" /> 
        <label for="switch" class="toggle"> 
        </label>                           
                                                    </div> 
                 
              <div style="margin-top: 80px;"class="col-md-12 ">
                                                        <div class="paneldashboard">
              
                            <div class="container-fluid grid">
                                <div class="main">
                                
                                    <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
                                       
                                 <div class ="row">
                                <div style="margin-bottom: 38px;" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat" style="background-color:orange;color:white;" href="#">
                                      <img src="images/dashboard/phase.png" style="float:left" />
                                       <p class="totcounter" >Phase</p>
                                         
                                        <span style="float:right;" class="font_icon">Total Phases : 10</span><br/>
                                        
                                        <span style="float:right;" class="font_icon">Phases inprogress : 6</span><br/>
                                        <span style="float:right;" class="font_icon">Phases completed : 4</span>
                                        
                                    </a>
                               
                                </div>
                                <div style="margin-bottom: 38px;" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat" style="background-color:green;color:white;" href="#">
                                       <img src="images/dashboard/wave.png" style="float:left" />
                                       <p class="totcounter" >Wave</p>
                                       
                                         
                                        <span class="font_icon" style="float:right;">Total Waves : 16</span><br/>
                                        
                                        <span class="font_icon" style="float:right;">Waves inprogress : 6</span><br/>
                                        <span class="font_icon" style="float:right;">Waves completed : 10</span>
                                        
                                    </a>
                               
                                </div>
                                <div style="margin-bottom: 38px;" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat" style="background-color:red;color:white;" href="#">
                                       <img src="images/dashboard/application.png" style="float:left" />
                                       <p class="totcounter" >Applications</p>
                                         
                                        <span class="font_icon" style="float:right;">Total  Application: 16</span><br/>

                                        <span class="font_icon" style="float:right;">Application inprogress : 6</span><br/>
                                        <span class="font_icon" style="float:right;">Applications completed : 10</span>
                                        
                                    </a>
                               
                                </div>
                                </div>
                                <div class="row">
                               <div style="margin-bottom: 38px;width:450px;" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat" style="background-color:blue;color:white;" href="#">
                                       <img src="images/dashboard/in.png" style="float:left" />
                                       <p class="totcounter" >Intake</p>
                                       <span class="font_icon" style="float:right;">Applications Inprogress : 6</span><br/>
                                        <span class="font_icon">Applications completed : 10</span><br/>
                                        <span class="font_icon" style="float:right;">Applications in Triage: 3</span><br/>
                                        <span class="font_icon" style="float:right;">Applications in Assessment: 3</span><br/>
                                        
                                        
                                    </a>
                               
                                </div>
                                
                                <div style="margin-bottom: 38px;width:450px;" class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat" style="background-color:purple;color:white;" href="#">
                                       <img src="images/dashboard/requirement.png" style="float:left" />
                                       <p class="totcounter">Requirements</p>
                                         
                                         <span class="font_icon">Applications in Inprogress : 6</span><br/>
                                        <span class="font_icon">Applications completed : 10</span><br/>
                                        <span class="font_icon">Applications in ArchiveReq : 3</span><br/>
                                        
                                        <span class="font_icon">Applications in DecomReq : 3</span><br/>
                                         
                                        
                                    </a>
                               
                                </div>
                                <div style="margin-bottom: 38px;width:450px;" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat" style="background-color:gold;color:white;" href="#">
                                       <img src="images/dashboard/archive.png" style="float:left" />
                                       <p class="totcounter" style="folat:left;">Archive Execution</p>
                                        <span class="font_icon">Applications Inprogress : 6</span><br/>
                                        <span class="font_icon">Applications completed : 10</span><br/> 
                                        <span class="font_icon">Applications in Infra structure: 16</span><br/>
                                        <span class="font_icon">Applications in Implementation: 16</span><br/>
                                        
                                        
                                    </a>
                               
                                </div>
                                <div style="margin-bottom: 38px;width:450px;" class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat" style="background-color:darkblue;color:white;" href="#">
                                       <img src="images/dashboard/decommissionExecution.png" style="float:left" />
                                       
                                       <p class="totcounter">Decommission Execution</p>
                                        <span class="font_icon">Applications Inprogress : 6</span><br/>
                                        <span class="font_icon">Applications completed : 10</span><br/>
                                        <span class="font_icon">Applications in Infra structure: 4</span><br/>
                                        <span class="font_icon">Applications in Implementation: 2</span>
                                        
                                    </a>
                                </div>
                                </div>
                                
               
                            </div> 
                            </div>
                  
                                      </div>
                                        <%		visit_st.close();
                                        		visit_rs.close();
                                                con.close();
                                               
    }


                                            catch(Exception e){
                                                e.printStackTrace();
                                            }
                                        %>


                                        </ul>

                                    </div>
                                </div>
                                
                                       <div class="col-md-12 ">
                                                        <div class="paneldashboard">
                                                            <!-- <div>
                                                                <h4 class="headercharts">Application Statistics</h4>
                                                                <div class="col-md-6">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 col-form-label">Project</label>
                                                                        <div class="col-md-9">
                                                                            <select class="form-control">
                                                                                <option>BPCS</option>
                                                                                <option>Microsiga</option>
                                                                                <option>SEEKGIT</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div> -->
                                                            <br>
                                                            <br>
                                                            <div class="content col-md-offset-4" >
                                                                  <div class="row text-center">    
                                                                <div id="columnchart_material" style="margin-left: 30px;width: 800px; height: 500px;"></div>
																<div>
														        <label class="control-label" for="GanttChart" style="margin-left: 30px;">Select Phase:</label>
														        <select id="" class="form-control" name="ganttChartTypesName" style = "width:250px;margin-left: 30px;" required >
														        <option>overall</option>
														        <option>phase1</option>
														        <option>phase2</option>   
														        </select>
														        </div>
														        <div id="barChart" style="margin-left: 30px;width: 800px; height: 500px;">
														        </div>
														        </div>
                                                            </div>
                                                            
														                        
                                                        </div>
                                                    </div> 
                                                    
                                               

												<div class="col-md-12">
		
		                                                        <div class="paneldashboard">
		                                                            <div>
		                                                                <h4 class="headercharts"></h4>
																		
		                                                            <div class="content col-md-offset-4">
		                                                                
														                    
														                            <label class="control-label" for="GanttChart" style="margin-left: 30px;">Select Phase:</label>
														                            <select id="" class="form-control" name="ganttChartTypesName" style = "width:250px;margin-left: 30px;" required >
														                             <option>overall</option>
														                             <option>phase1</option>
														                             <option>phase2</option>   
														                            </select>
														                    
														                    <div id="pie_chart_div" style="height: 400px;"></div>
														                
																	
		
		                                                            </div>
		                                                        
		                                                            </div>
		
		                                                            
		                                                        </div>
		                                                    </div>
                        
                                        <div class="col-md-12">
                                            <div class="card">


                                                
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="paneldashboard">
                                                            <div >
                                                                <h4 class="headercharts"></h4>
																
                                                        </div>

                                                            </div>

                                                            
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                                    
                                              
                                                    <!-- <div class="col-md-12">
                                                        <div class="paneldashboard">
                                                            <div >
                                                                <h4 class="headercharts">Project Statistics</h4>

                                                            </div>
                                                            <div class="content">
                                                                <div id="container"
                                                                     style="width: 550px; height: 400px; margin: 0 auto"></div>


                                                            </div>
                                                        </div>
                                                    </div> -->
                                                    
                                                </div>
                     
                    

   					</div>
  					  </div>
					  
		
		
		
					  
		
    <!-- /.content-wrapper -->

</div>
<!-- end of main wrapper -->

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $('#list').click(function()
    {
        $('#grid').removeClass('cologen');
        $('#list').addClass('cologen');
    });
    $('#grid').click(function()
    {
        $('#list').removeClass('cologen');
        $('#grid').addClass('cologen');
    });
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
  
 
 <script>
$(document).ready(function() {
    $('.searchbox-input').keyup(function(){
        search_text($(this).val());
    });

    function search_text(value){
        $('#ul_id .cbp-vm-title').each(function(){
            var found = 'false';
            $(this).each(function(){
                if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                {
                    found = 'true';
                }
            });
            if(found == 'true'){
                $(this).parent().css('display','');
            }
            else {
                $(this).parent().css('display','none');
            }
        })
    }
});
</script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Phases', 'Number of Waves', 'Number of Applications'],
          ['phase1', 3, 5],
          ['phase2', 4, 3],
          ['phase3', 2, 2],
          ['phase4', 1, 6]
        ]);

        var options = {
          chart: {
            title: 'Phase details',
            subtitle: 'overall details',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Waves', 'Intake', 'Plan and Priority', 'Requirements', 'Archive Execution', 'Decommission Execution'],
          ['wave1', 3, 4, 2, 1, 4],
          ['wave2', 4, 3, 5, 1, 2],
          ['wave3', 2, 2, 4, 1, 6],
          ['wave4', 1, 6, 3, 3, 4]
        ]);

        var options = {
          chart: {
            title: 'Phase Perspective',
            subtitle: 'overall details',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('barChart'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>

    <script>
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'completed part');
      data.addColumn('number', 'pending part');
      data.addRows([
        ['Completed part', 60],
        ['Incomplete part', 40],
       ]);

      var options = {
        title: 'Phase progress',
        sliceVisibilityThreshold: .2
      };

      var chart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
      chart.draw(data, options);
    }
    </script>
</body>
</html>
