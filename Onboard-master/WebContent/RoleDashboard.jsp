<!DOCTYPE html>
<html lang="en">
<head>
<title>Role Information</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/RoleDashboard.css">
    <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
     <script type="text/javascript" src="js/RoleDashboard.js"></script>
      <script type="text/javascript" src="js/Chart.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<style>.x_panel {
    width: 200%;
    padding: 10px 17px;
    display: inline-block;
    background: #fff;
    border: 1px solid #E6E9ED;
    -webkit-column-break-inside: avoid;
    -moz-column-break-inside: avoid;
    column-break-inside: avoid;
    opacity: 1;
    transition: all .2s ease;
}
custom.min.css:1
.x_panel, .x_title {
    margin-bottom: 30px;
}
</style>
 
    
</head><!--from  w  w w  . ja  va 2 s.co  m-->
 <body>

<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.html");
}
%>

<%

HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String info=(String)details.getAttribute("app_emp");
try {
String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query = "select * from projinfo";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query2 = "select * from logs";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
String query1 = "SELECT DISTINCT(roles) FROM logs";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
String query4 = "select count(USER_ID) from logs";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query5 = "select count(roles) from logs";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
String query6 = "select count(roles) from logs";
Statement st6 = conn.createStatement();
ResultSet rs6 = st6.executeQuery(query6);
if(rs.next()){
%>
<form id="form1" name="loginform">
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    
                    <% if(rs3.next()){
                    details.setAttribute("appno",rs3.getString("appno"));
                    details.setAttribute("projectname",rs3.getString("projectname"));
                    %>
                    <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
                    <%
                    String q2="select * from archive_exec where level=1 and projects='"+rs3.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    session.setAttribute(rss.getString(3),rss.getString(15));
                    }
                    
                    } %>
                    
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo_sized.jpg" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
</li>
 <li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li>     

<li>               <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
           
                 <div class="row">
            <br>
               <div class="col-sm-3 sidebar">
                 <div class="col-md-2 sidebar" >
                 
        <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; '>
                    <ul class="nav nav-sidebar" id ="sidemenu" >
                        
                        

            <ul>
                  <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="editproject.jsp">App Emphasize Module
                    <ul>
                       <li item-expanded='true'><a href="editproject.jsp">Project Details
                    <ul>
                        <li item-selected='true'><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                             
                            </ul>
                        </li>
                        <li><a href="applnprior.jsp">Application-Prioritized</li>
                   

                    </ul>
                </li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'><a href='firstinsert.jsp'>Business</a>
                <ul>
                <li><a href='firstinsert.jsp'>Application Information</a></li>
                <li><a href='firstinsert.jsp'>Legacy Retention Information</a></li>
                <li><a href='firstinsert.jsp'>Archive Data Management</a></li>
                <li><a href='firstinsert.jsp'>System Requirements</a></li>
                
                </ul></li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Technical</a>
                <ul>
                <li><a href='firstinsert.jsp'>Application Data Information</a></li>
                <li><a href='firstinsert.jsp'>Infrastructure & Environment Inforamation</a></li>
                <li><a href='firstinsert.jsp'>Technical Information</a></li>
                </ul>
                </li>
                
                 <li item-expanded='true'><a href='firstinsert.jsp'>Archival Requirements</a>
                 <ul>
                 <li><a href='firstinsert.jsp'>Screen/Report Requirements</a></li>
                 <li><a href='firstinsert.jsp'>Archive Requirements</a></li>
                 </ul>
                 </li>
                </ul>
                </li>
                <li><a href="archive_exec_samp.jsp">Archive Execution Module</a>
               </li>                
               
                          </ul>
    
     </ul>
         </div>
   </div>
                </div>
               
   <script>
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree();
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
  </script>

                    <br/><br/><br/>
                
                <div class="col-md-4">
                
<%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("Closure");
if(initiate == null)
initiate="0";
if(plan == null)
plan="0";
if(execute == null)
execute="0";
if(hypercare == null)
hypercare="0";
%>   

<div class="container"> 
      
        <div class="ui-widget">
  <h1 class="ui-value"><%  while(rs4.next()){ %><%= rs4.getString(1) %><%}%> </h1>
  <span class="ui-label">Users</span>
</div>

<div class="ui-widget">
  <h1 class="ui-value">142</h1>
  <span class="ui-label">Visit</span>
</div>

<div class="ui-widget">
  <h1 class="ui-value"><%  while(rs5.next()){ %><%= rs5.getString(1) %><%}%></h1>
  <span class="ui-label">Roles</span>
</div>
       

<div class="panel panel-primary">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="row">
            <label>Roles :</label>
          <select id="slct1" name="slct1" onchange="getValue(this.value)">
  <option disabled selected>Please Select any Option</option>
   <%  
   

    while(rs1.next()){
    
    	
    
    	    	 %>
            <option value="<%= rs1.getString("roles") %>"><%= rs1.getString("roles") %></option>
     
      <%} %>
    
    
  </select>
  
  
  
  
 <label>UserName :</label>
 <span id="state">
      <select name='state' id="username" onchange="filter(this.id,'slct1')">  
     <option disabled selected>Please Select any Option</option>
      </select>  
    </span>
    
  <label>Activity :</label>
   <select id="filterText">
   
       <option selected="selected" value="10">last 10 days</option>
       <option value="20">last 20 days</option>
       <option value="30">last 30 days</option>
    </select>   
</div>

          </div>
          <div class="col-xs-9 col-sm-9 col-md-9">
            <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="col-xs-12 col-md-4">
               
                <div class="form-group">
                 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="panel-body table-responsive">
        <table class="table table-hover" id="MyTable" >
          <thead>
            <tr>
              <th class="text-center">User Name</th>
              <th class="text-center"> Role </th>
              <th class="text-center">Date </th>
              <th class="text-center">Details </th>
             
            </tr>
          </thead>
          <%
while(rs2.next())
{

%>
          <tbody>
          
            <tr class="content">
              <td  class="text-center"><%=rs2.getString(1)%></td>
              <td  class="text-center"> <%=rs2.getString(6) %> </td>
              <td class="text-center"><%=rs2.getString(2) %></td>
              <td  class="text-center"><%=rs2.getString(5)%></td>
             
            </tr>

<%} %>
                      </tbody>
        </table>
      </div>

      <div class="panel-footer">
        <div class="row">
          <div class="col-lg-12">
            <div class="col-md-8">
              </div>
              <div class="col-md-4">
              <p class="muted pull-right"><strong> © 2018 All rights reserved </strong></p>
            </div>
          </div>
        </div>
        
      </div>
    </div>
      <h2>Roles Pie Chart</h2>
    <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                  
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content"><iframe class="chartjs-hidden-iframe" style="width: 200%; display: block; border: 0px; height: 100px; margin: 10px; position: absolute; left: 30px; right: -10px; top: 0px; bottom: 0px;"></iframe>
                  
                    <div id="chartContainer" style="width: 500px; height: 380px;"></div>

                  </div>
                </div>
              </div>
    <div class="chart-container">
		<canvas id="line-chartcanvas"></canvas>
	</div>
  </div>
  </div>

  <%
}
}
catch(Exception e){}
%>    
           
 
 
                    
         </div>
       </div>
       
       </div>
      

   </form>
    </body>
<script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function getValue(str){
    	  var input,filter, table, tr, td, i;
    	 
    	  
    	 
    	  
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      
      var url="state.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      
            }

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("username").innerHTML=xmlHttp.responseText   
 
     
      }   
      
  	  
      }
      
      
      </script>  
      <script>
      function filter(input,s2) {
    	  // Declare variables 
    	  var input, filter, table, tr, td, i;
    	  input = document.getElementById("username").value;
    	  s2 = document.getElementById("slct1").value;
    	  console.log("s2:" + input);
    	  table = document.getElementById("MyTable");
    	  tr = table.getElementsByTagName("tr");

    	  // Loop through all table rows, and hide those who don't match the search query
    	  for (i = 0; i < tr.length; i++) {
    	    td = tr[i].getElementsByTagName("td")[1];
    	    console.log(td);
    	    
    	    if (td) {
    	    	
    	      if (td.innerHTML.indexOf(s2)> -1) {
    	        tr[i].style.display = "";
    	      } else {
    	        tr[i].style.display = "none";
    	      }
    	    } 
    	  }
    	}
      </script>
    <script>
window.onload = function() {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title: {
		text: "Role Info"
	},
	data: [{
		type: "pie",
		startAngle: 240,
		yValueFormatString: "##0.00\"%\"",
		indexLabel: "{label} {y}",
		dataPoints: [
			{y: 79.45, label: "archivaladmin"},
			{y: 7.31, label: "admin"},
			{y: 7.06, label: "archivalDeveloper"},
			{y: 4.91, label: "legacy"},
			{y: 1.26, label: "SME"}
		]
	}]
});
chart.render();

}
</script>
<script>
$(document).ready(function() {

	/**
	 * call the data.php file to fetch the result from db table.
	 */
	$.ajax({
		url : "http://localhost/onboard/WebContent/chartjs2/api/data.php",
		type : "GET",
		success : function(data){
			console.log(data);

			var score = {
				TeamA : [],
				TeamB : []
			};

			var len = data.length;

			for (var i = 0; i < len; i++) {
				if (data[i].team == "TeamA") {
					score.TeamA.push(data[i].score);
				}
				else if (data[i].team == "TeamB") {
					score.TeamB.push(data[i].score);
				}
			}

			//get canvas
			var ctx = $("#line-chartcanvas");

			var data = {
				labels : ["match1", "match2", "match3", "match4", "match5"],
				datasets : [
					{
						label : "TeamA score",
						data : score.TeamA,
						backgroundColor : "blue",
						borderColor : "lightblue",
						fill : false,
						lineTension : 0,
						pointRadius : 5
					},
					{
						label : "TeamB score",
						data : score.TeamB,
						backgroundColor : "green",
						borderColor : "lightgreen",
						fill : false,
						lineTension : 0,
						pointRadius : 5
					}
				]
			};

			var options = {
				title : {
					display : true,
					position : "top",
					text : "Line Graph",
					fontSize : 18,
					fontColor : "#111"
				},
				legend : {
					display : true,
					position : "bottom"
				}
			};

			var chart = new Chart( ctx, {
				type : "line",
				data : data,
				options : options
			} );

		},
		error : function(data) {
			console.log(data);
		}
	});

});
</script>
</html>