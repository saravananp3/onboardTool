<!DOCTYPE html>  
<html>  
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script> 

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.js"></script> 
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />   
 
 
		<script type="text/javascript" src="js/jquery-ui-1.8.13.custom.min.js"></script>
		<script src="http://code.jquery.com/jquery-2.0.3.js"></script>
		<script type="text/javascript" src="js/jqueryprogressbar.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
         <script src="https://docraptor.com/docraptor-1.0.0.js"></script>
		<link type="text/css" href="css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />	
		<link type="text/css" rel="stylesheet" href="css/progressbar.css" />
		<script src="js/treeTable.js"></script>

		 <script src="js/jstree.min.js"></script>
 

    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
     <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
      	
	
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
		  
 
    <script>
	  function getID(lev,pln_srt,pln_end,act_srt,status,pln_hrs,act_hrs,progressbar,actual_enddate)
	  {
		 // window.alert(pln_srt+" "+pln_end+" "+act_srt+" "+status.id+" "+pln_hrs.id+" "+act_hrs.id+" "+progressbar.id);
		 var startDate =pln_srt;
		  var endDate =pln_end;
		  var actual_startdate =act_srt;
		  var percentage;
		  var date_count=0;

		  if (pln_srt!="" && pln_end!="" && act_srt!= "") {
		  var minDate = new Date(convertStringToDate(pln_srt));
		  var today = new Date();
		  var maxDate = new Date(convertStringToDate(pln_end));
		  var actual_minDate = new Date(convertStringToDate(act_srt));
		  var nbPastDays = Math.floor((today.getTime() - actual_minDate.getTime()) / 86400000);

		  var actual_Hours= (nbPastDays*24)/3;

		  var total_days = (minDate-maxDate)-86400000;

		  var total_hours =(Math.round(Math.abs(total_days/(60*60*1000))))/3;

		  var percent = (actual_Hours/total_hours) * 100;

		  //alert("minDate "+minDate);
		  //alert("maxDate "+maxDate);
		  percentage=100;
		  console.log("actual_Hours : "+actual_Hours);
		  console.log("total_hours : "+total_hours);
		  var first,last;
		  if(lev!=1){
		  document.getElementById(pln_hrs.id).value=total_hours;
		  document.getElementById(act_hrs.id).value=actual_Hours;
		  }
		/*  if(seq_no>initiate_seqno)
			  {
			  if(seq_no>plan_seqno)
				  {
				  if(seq_no>execute_seqno)
					  {
					  if(seq_no>hypercare_seqno)
						  {
						  first=hypercare_seqno;
						  last=hypercare_seqno+7;
						  }
					  else
						  {
						  first=execute_seqno;
						  last=hypercare_seqno;
						  }
					  }
				  else
				  {
				  first=plan_seqno;
				  last=execute_seqno;
				  }
				  }
			  else
			  {
			  first=initiate_seqno;
			  last=plan_seqno;
			  }
			  }
		  window.alert("first "+first+" last "+last);
		  for(var i=first;i<last-1;i++)
			  {
			  var q=document.getElementById("pln_srt_date"+first).value;
			  if(q!="")
				  date_count++;
			  }
		  window.alert(date_count+" "+(last-1-first));
		  
		  
		  if(date_count==(last-1-first)){
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
		  }*/
		   if (percent < 0 ) {
		  percent=0;
		  $('#'+progressbar.id).reportprogress(percent);
		  } 
		  else if(percent>100)
		  {
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
		  }  
		  else if (percent < 20) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'red'});
		  }
		  else if (percent > 20) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'yellow'});
		  }
		               else if (percent < 75) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'orange'});
		  }
		               else if (percent >76 ) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'green'});
		  }
		  }
	
		  }
	  </script>

	  
	  <script>
	  
	  function getDetID(total_hours,actual_Hours,progressbar,status,actual_enddate,datecount)
	  {
		  if(datecount=="True")
			  {
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
			  }
		  else{
		  var percent = (actual_Hours.value/total_hours.value) * 100; 
		  percentage=100;
		   if (percent < 0 ) {
			  percent=0;
			  $('#'+progressbar.id).reportprogress(percent);
			  } 
			  else if(percent>100)
			  {
				  percent=100;
				  $('#'+progressbar.id).reportprogress(percent);
				  $('#'+status.id).css({background:'green'});
			  }  
			  else if (percent < 20) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'red'});
			  }
			  else if (percent > 20) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'yellow'});
			  }
			               else if (percent < 75) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'orange'});
			  }
			               else if (percent >76 ) 
			  { $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
			  }
		  }
		  
			  }

	  </script>
	
    <script type="text/javascript">
        $(document).ready(function () {
            // Create jqxTree
            $('#jqxTree').jqxTree({ height: '650px', width: '0px' });
            $('#jqxTree').css('visibility', 'visible');
            var contextMenu = $("#jqxMenu").jqxMenu({ width: '120px',  height: '56px', autoOpenPopup: false, mode: 'popup' });
            var clickedItem = null;
            
            var attachContextMenu = function () {
                // open the context menu when the user presses the mouse right button.
                $("#jqxTree li").on('mousedown', function (event) {
                    var target = $(event.target).parents('li:first')[0];
                    var rightClick = isRightClick(event);
                    if (rightClick && target != null) {
                        $("#jqxTree").jqxTree('selectItem', target);
                        var scrollTop = $(window).scrollTop();
                        var scrollLeft = $(window).scrollLeft();
                        contextMenu.jqxMenu('open', parseInt(event.clientX) + 5 + scrollLeft, parseInt(event.clientY) + 5 + scrollTop);
                        return false;
                    }
                });
            }
            attachContextMenu();
            $("#jqxMenu").on('itemclick', function (event) {
                var item = $.trim($(event.args).text());
                switch (item) {
                    case "Add Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('addTo', { label: 'Item' }, selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                    case "Remove Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('removeItem', selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                }
            });
            // disable the default browser's context menu.
            $(document).on('contextmenu', function (e) {
                if ($(e.target).parents('.jqx-tree').length > 0) {
                    return false;
                }
                return true;
            });
            function isRightClick(event) {
                var rightclick;
                if (!event) var event = window.event;
                if (event.which) rightclick = (event.which == 3);
                else if (event.button) rightclick = (event.button == 2);
                return rightclick;
            }
        });
    </script>
  <style>.bar {
  background-color: lightblue;
  height: 100%;
  text-align:center;
} 
  </style>

<style>
input
{
border:none;
border-color:transparent;
width:200px;
}
.in
{
border:none;
border-color:transparent;
width:75px;
}
.task
{
width:250px;
}
.intask
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:200px;
}  
.intask1
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:150px;
} 
.intask2
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:50px;
} 
.task1
{
border:1px;
padding:10px;
margin-left:10%;
margin-bottom:0px;
background-color:lightblue;
border-left:5px solid black;
width:100px;
} 
.btn
{
  margin-top:20px;
  border-radius:10px;
  background-color:#00BFFF;
  padding:10px;
  border:none;
  width:100px;
  color:white;
  margin-right:10px;
}
.another
{
  border:1px solid black;
  padding:10px;
  border-left:5px solid black;
  width:250px;
}
input:hover
{
  cursor:pointer;
}
thead
{
  text-align:center;
}
th
{
  width:100px;
}
.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 0px;
    font-size: 36px;
    margin-right: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>

<script>

$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox").attr("disabled", "disabled");
        }
    });
});
$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox1").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox1").attr("disabled", "disabled");
        }
    });
});


</script>
 <style>
    body
    {
     margin:0; padding:0; 
    color:#73879C;
    font-family: "Helvetica Neue",Roboto,Arial,"Droid Sans",sans-serif;
    }
    .navbar-brand {
    
    padding: 10px;
  border: 0px;
  border-radius: 1px;
   font-size: 1.15em;
  font-weight: 400;
    }
    .
    
   .navbar-brand {
  color: black;
}

.navbar-brand:hover {
  color: #ffffff;
  text-shadow: 1px -1px 8px #b3e9ff;
}
    
    
    #sitetitle{
    
    font-size: 22px;
    margin:auto;
}


    
    

   #sidemenu
   {
   
   background:#3276B1 ;
   position: fixed;
	top: 45px;
	left: -1%;
	padding-left:0px;
	width:300px !important;
	bottom: 0px;
	overflow: auto;
	color:white;
	text-size:30%;
	} 
 


#sidemenu a:hover {
    background-color: #ddd;
    color: black;
    }

   </style>
 <style>
 
.progressTSK {
  overflow: hidden;
 
  padding: 0 15px;
  width: 220px;
  height: 34px;
  background: #d3d5d9;
  border-radius: 17px;
  background-image: -webkit-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: -moz-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: -o-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: linear-gradient(to bottom, #ebecef, #bfc3c7);
  -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.8), 0 2px 4px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(0, 0, 0, 0.1), 0 0 0 6px #b6babe, 0 7px rgba(255, 255, 255, 0.1);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.8), 0 2px 4px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(0, 0, 0, 0.1), 0 0 0 6px #b6babe, 0 7px rgba(255, 255, 255, 0.1);
}

.progressTSK-val {
  float: right;
  margin-left: 15px;
  font: bold 15px/34px Helvetica, Arial, sans-serif;
  color: #333;
  text-shadow: 0 1px rgba(255, 255, 255, 0.6);
}

.progressTSK-bar {
  display: block;
  overflow: hidden;
  height: 8px;
  margin: 13px 0;
  background: #b8b8b8;
  border-radius: 4px;
  background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: -moz-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.2), transparent 60%);
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.6);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.6);
}

.progressTSK-in {
  display: block;
  min-width: 3px;
  height: 20px;
  background: #1997e6;
  background-image: -webkit-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -webkit-linear-gradient(left, #147cd6, #24c1fc);
  background-image: -moz-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -moz-linear-gradient(left, #147cd6, #24c1fc);
  background-image: -o-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -o-linear-gradient(left, #147cd6, #24c1fc);
  background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), linear-gradient(to right, #147cd6, #24c1fc);
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px rgba(0, 0, 0, 0.2), inset 0 0 0 1px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 1px rgba(0, 0, 0, 0.2), inset 0 0 0 1px rgba(0, 0, 0, 0.2);
}
 
  </style>
 
  <script>
  function sub(x,y,z,w)
  {
	  var f=document.loginForm;
	    f.method="post";
	    f.action='archive_exec?s='+x+'&l='+y+'&r='+z+'&m='+w;
	    f.submit();
  	}
  </script>
  <script>
  function update()
  {
	  
	  var f=document.loginForm;
	    f.method="post";
	    f.action='archivesummary.jsp';
	    f.submit(); 
	 // document.loginForm.action = "update_view";
  	 // document.loginForm.submit();   
  // document.Form1.target = "_blank";    // Open in a new window
  //document.loginForm.submit(); 
	  
  }
  
  </script>
  <script>
  function call_fun(name,a,b,c,d,e,g,h,i,j,k,l)
  {
	 var f=document.loginForm;
	    f.method="post";
	    f.action='date_update?name='+name+'&sequence_no='+a+'&plan_start='+b+'&plan_end='+c+'&actual_start='+d+'&actual_hrs='+g+'&plan_hrs='+e+'&actual_end='+h+'&initiate_seqno='+i+'&plan_seqno='+j+'&execute_seqno='+k+'&hypercare_seqno='+l;
	    f.submit();  
  }
  </script>
  
<script>
function remove(x)
{
	var f=document.loginForm;
    f.method="post";
    f.action='remove?s='+x;
    f.submit();
}
</script>
<style>
/*input[type="text"]:disabled{background-color:white;}*/
</style>
<script>
function checkk()
{
 	   for(var i=0;i<1000;i++){
 	  document.getElementsByName("name"+i)[0].disabled=true;
 	  document.getElementsByName("mem_ass"+i)[0].disabled=true;
		  document.getElementsByName("act_srt_date"+i)[0].disabled=true;
		  document.getElementsByName("act_end_date"+i)[0].disabled=true;
		  document.getElementsByName("pln_srt_date"+i)[0].disabled=true;
		  document.getElementsByName("pln_end_date"+i)[0].disabled=true;
		  document.getElementsByName("hrs"+i)[0].disabled=true;
 	   }
 	
}
</script>
<script>
function init_disable()
{
 	   for(var i=6;i<1000;i++){
 	  document.getElementsByName("name"+i)[0].disabled=true;
 	  document.getElementsByName("mem_ass"+i)[0].disabled=true;
		  document.getElementsByName("act_srt_date"+i)[0].disabled=true;
		  document.getElementsByName("act_end_date"+i)[0].disabled=true;
		  document.getElementsByName("pln_srt_date"+i)[0].disabled=true;
		  document.getElementsByName("pln_end_date"+i)[0].disabled=true;
		  document.getElementsByName("hrs"+i)[0].disabled=true;
 	   }
 	
}
</script>
<body class='default'>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
<form class="form-signin" name="loginForm" method="post" action="archive_exec">
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
String info=(String)details.getAttribute("archive_exec");
	String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 

String query = "select * from projinfo where id = "+det;
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query9 = "select * from projinfo where id = "+det;
Statement st9 = conn.createStatement();
ResultSet rs9 = st9.executeQuery(query9);
String query4 = "select * from dummy";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
if(rs9.next()){
}
String query3 = "select * from archive_exec where projects='"+rs9.getString("projectname")+"' order by seq_num";
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query5 = "select * from archive_exec where projects='"+rs9.getString("projectname")+"' order by seq_num";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);

String query7 = "select * from projinfo where id = "+det;
Statement st7 = conn.createStatement();
ResultSet rs7 = st7.executeQuery(query7);

if(rs4.next()){
	%>
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    <% if(rs.next()){ %>
                    <a class="navbar-brand" href="project.jsp" style="color:white"id="sitetitle">Onboarding Tool-<%=rs.getString("projectname") %></a>
                    <%
                    String q2="select * from archive_exec where level=1 and projects='"+rs.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    	session.setAttribute(rss.getString(3),rss.getString(15));
                    	session.setAttribute((rss.getString(3)+"1"),rss.getString(1));
                    }
                    
                    %>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">&nbsp;
</li>
                     <li>
 <p style="color:white; padding-top:15px;">logged in as &nbsp;<span><%=roles%></span></p>
</li> 
                        <li>
                             <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
        <script>
function check_previous(seq_no,level,previous_level,true_count,initiate_seqno,plan_seqno,execute_seqno,hypercare_seqno,number)
{
	var task_number=[initiate_seqno,plan_seqno,execute_seqno,hypercare_seqno];
	var tasks=[];
	var count1=[];
	var x,y,z,index,count=0,cnt=1;
//	window.alert(seq_no+"   "+true_cnt);
//window.alert(initiate_seqno+" "+plan_seqno+" "+execute_seqno+" "+hypercare_seqno);
 if(level==previous_level)
		{
	 x=document.getElementById("pln_srt_date"+(seq_no-2)).value;
	 y=document.getElementById("pln_end_date"+(seq_no-2)).value;
	 z=document.getElementById("act_srt_date"+(seq_no-2)).value;
	 w=document.getElementById("act_end_date"+(seq_no-2)).value;
	if(x=="" && y=="" && z==""){
		cnt=0;
		window.alert("please fill the aboveeee text field");
	}
		}
 else
	 {
	 for(var i=0;i<4;i++){
		if(parseInt(task_number[i])<parseInt(seq_no))
			{
			tasks.push(task_number[i]);
			}
		else
			{
			continue;
			}
	  }
	 for(var i=tasks.length-1;i>=0;i--)
		 {
		    count++;
		    if (count<=2)
		    	{
		    	 x=document.getElementById("pln_srt_date"+(tasks[i]-1)).value;
		    	 y=document.getElementById("pln_end_date"+(tasks[i]-1)).value;
		    	 z=document.getElementById("act_srt_date"+(tasks[i]-1)).value;
		    	if(x=="" && y=="" && z==""){
		    		count1.push("FALSE");
		    		continue;
		    		
		    	}
		    	else
		    		{
		    		count1.push("TRUE");
		    		continue;
		    		}
		    	}
		    else
		    	{
		    	break;
		    	}
		 }
	 
	 
	 }
 if(count1[0]=="FALSE" && count1[1]=="FALSE"){
	 window.alert("please fill the above fields");
	 cnt=0;
 }
 if(cnt==1){
	$( "#pln_srt_date"+(seq_no-1)).datepicker({
        format: "mm/dd/yyyy",
        autoclose: true
    });
 $( "#pln_end_date"+(seq_no-1)).datepicker({
        format: "mm/dd/yyyy",
        autoclose: true
    });
 $( "#act_srt_date"+(seq_no-1)).datepicker({
        format: "mm/dd/yyyy",
        autoclose: true
    });
 $( "#act_end_date"+(seq_no-1)).datepicker({
        format: "mm/dd/yyyy",
        autoclose: true
    });
 if(number==1)
 $( "#pln_srt_date"+(seq_no-1)).datepicker('show');
 if(number==2)
$( "#pln_end_date"+(seq_no-1)).datepicker('show');
 if(number==3)
 $( "#act_srt_date"+(seq_no-1)).datepicker('show');
 if(number==4)
 $( "#act_end_date"+(seq_no-1)).datepicker('show');
}
}

</script>
       
            <div class="row">
            <br>
               
               
               
               <div class="col-md-3 sidebar">
               
                  <div id='jqxWidget'>
                  
        <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; '>
                    <ul class="nav nav-sidebar" id ="sidemenu" >
                        
                        

            <ul>
                  <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'>App Emphasize Module
                    <ul>
                       <li item-expanded='true'>Project Details
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
                <li item-expanded='true'>Business
                <ul>
                <li>Application Information</li>
                <li>Legacy Retention Information</li>
                <li>Archive Data Management</li>
                <li>System Requirements</li>
                
                </ul></li>
                <li item-expanded='true'>Technical
                <ul>
                <li>Application Data Information</li>
                <li>Infrastructure & Environment Inforamation</li>
                <li>Technical Information</li>
                </ul>
                </li>
                
                 <li item-expanded='true'>Archival Requirements
                 <ul>
                 <li>Screen/Report Requirements</li>
                 <li>Archive Requirements</li>
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
                                
                 <div class="col-md-7">
                 
 <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("Closure");
String initiate_seqno=(String)session.getAttribute("Ideation and Initiate1");
String plan_seqno=(String)session.getAttribute("Plan1");
String execute_seqno=(String)session.getAttribute("Execute1");
String hypercare_seqno=(String)session.getAttribute("Closure1");
if(initiate == null)
	initiate="0";
if(plan == null)
	plan="0";
if(execute == null)
	execute="0";
if(hypercare == null)
	hypercare="0";
System.out.println(plan);
%>                            

<div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Initiate</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" id="prog_bar" style="width: <%=initiate%>%" aria-valuenow="<%=initiate %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=initiate %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div class="bar" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" id="prog_bar2" style="width: <%=execute %>%" aria-valuenow="<%=execute %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=execute %>%</span></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Closure</label></center>
 <div class="progress">
  <div class="progress-bar" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div>
<jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
           
                     <script>
                     $(function(){
                    	    $.contextMenu({
                    	        selector: '.context-menu-one', 
                    	        items: $.contextMenu.fromMenu($('#html5menu'))
                    	    });
                    	});
                     </script>
               
              
 <%
 String true_count="";
 String queries="select count(Flag) from archive_exec where projects='Medtonic' and Flag='T'";
 Statement statment= conn.createStatement();
 ResultSet result = statment.executeQuery(queries);
 if(result.next())
	 true_count=result.getString(1);
 %>             
              
                      

<table class="table table-bordered" style="align:center" id="table">
<thead>
<tr>
<th style="width:70%;">Tasks </th> 
<th>Resource Assigned</th>
<th>Plan start date</th>
<th>Plan End date</th>
<th>Actual start date</th>
<th>Actual End date</th>
<th>Planned Hours</th>
<th>Actual Hours</th>
<th>Progress %</th>
<th style="width:20%;">Status</th>
<th>Comments</th>
<th></th>
</tr>
</thead>

<tbody >     
<%
 int i=0,count=0,pp=0;
String no="";
while(rs3.next()){
	if(Integer.parseInt(rs3.getString(2))==1)
	{
		pp++;
	%>
<tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>">
<td style="width:200px;"><b>
<span style="color:#3071a9;font-size:150%;"><input  type="text"   placeholder="enter" id="task" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly /></span> <span style="float:right;cursor:pointer;" class="glyphicon glyphicon-plus" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span></b></td>
<td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getInt(1) %>" hidden /></td>
<td style="display:none"><input type="text" id="level<%=i %>" name="level<%=i %>" value="<%=rs3.getInt(2) %>" hidden /></td>
<td><input  type="text" class="in"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td><input  type="text" class="in" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" readonly/></td>
<td><input  type="text" class="in" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" /></td>
<td><input type="text" class="in" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" /></td>
<td><input  type="text" class="in" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>"  /></td>
<td><input  type="text" class="in"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)" /></td>
<td><input  type="text" class="in"  id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)"/></td>
<td ><div class="progressbar" id="progressbar<%=i%>"></div></td>
	<td ><input type="text" style="background-color:transparent;width:20%;" id="status<%=i %>"  /></td>
<td></td>
<script>
getDetID(document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('status<%=i %>'),document.getElementById('act_end_date<%=i %>').value,'<%= rs3.getString(17)%>');
</script>
<%
int progress=0;
%>
</tr>
<%}
	else
	{
	
	%>
		<tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>" data-tt-parent-id="<%=rs3.getString(11) %>">
		&nbsp;&nbsp;<td style="width:200px;">
		<span style="color:#00BFFF;font-size:100%;"><input  type="text"   placeholder="enter" id="name<%=i %>" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly/></span> <span style="float:right;cursor:pointer;" class="glyphicon glyphicon-plus" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span></td>
		<td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getInt(1) %>" hidden /></td>
<td style="display:none"><input type="text" id="level<%=i %>" name="level<%=i %>" value="<%=rs3.getInt(2) %>" hidden /></td>
		<td><input  type="text" class="in"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td><input  type="text" class="in" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%= true_count %>','<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',1);"  /></td>
<td><input  type="text" class="in" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%= true_count %>','<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',2);"  /></td>
<td><input type="text" class="in" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%= true_count %>','<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',3);"  /></td>
<td><input  type="text" class="in" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%= true_count %>','<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',4);"  /></td>
<td><input  type="text" class="in"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13)%>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value,document.getElementById('act_end_date<%=i %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>');"/></td>
<td><input  type="text" class="in" id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value,document.getElementById('act_end_date<%=i %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>');" /></td>
<td ><div class="progressbar" id="progressbar<%=i%>"></div></td>
	<td ><input type="text" style="background-color:transparent;display:none;width:20%;" id="status<%=i %>"  /></td>
<td></td>
<% if((rs3.getString(3).equals("Requirements"))||(rs3.getString(3).equals("Build and Test"))){%>
<script>
getDetID(document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('status<%=i %>'),document.getElementById('act_end_date<%=i %>').value);
</script>
<%} %>
	
</tr>
<%
	}
i++;
}
%>




</tbody>

</table>
<input type="text" id="pwqej" value="<%= info %>" hidden> 
<script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>    
   <script type="text/javascript">
		com_github_culmat_jsTreeTable.register(this)

		treeTable($('#table'))
	</script>       
<div>
<%if(rs7.next()){ %>
    <input type="hidden" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs7.getString("projectname") %>" >
<%} %>
<input type="button" name="addbtn" class="btn btn-primary" onclick="sub(<%=i+1%>,1,'<%=rs4.getString(1) %>','<%=rs4.getString(1) %>');" value="Add" >
<input type="button" name="subbtn" class="btn btn-primary" value="Submit" onclick="update()" >
</div>
</div>

                                              </div>                             
                        </div>                         
                                  
       <%

                    }
}
%>
</form>
</body>
</html>
