<!DOCTYPE html>  
<html>  
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-animate.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
 
  <script src="js/jstree.min.js"></script>

    <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView" />
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property." />

    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            // Create jqxTree
            $('#jqxTree').jqxTree({ height: '550px', width: '300px' });
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
  
  

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
<style>
input
{
border:none;
border-color:transparent;
width:200px;
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
function remove(x,y)
{
	
		var f=document.loginForm;
	    f.method="post";
	    f.action='execution1?p='+x+'&q='+y;
	       f.submit();
		
		}

</script>
<script>
function sub()
{document.loginForm.action = "executionup";
	  document.loginForm.submit();   
// document.Form1.target = "_blank";    // Open in a new window
document.loginForm.submit(); 
	
	}
</script>
<script>
function got(x,y,z)
{
	var f=document.loginForm;
    f.method="post";
    f.action='execution?sub_task_id='+x+'&subtask_name='+y+'&task_id='+z;
    f.submit();
	}
</script>
<script>
function gott(x)
{
	var f=document.loginForm;
    f.method="post";
    f.action='execution?r='+x;
    f.submit();

	}
</script>
  
</script>
<script>
function addsubtask(a,b,c)
{
	var f=document.loginForm;
	var task ="";
	var subtask="";
	var subid=c;
	var tsid="";
	var subsubid=a;
	var subsubname=b;
	
    f.method="post";
    f.action='execution?subsubid='+subsubid+'&subsubname='+subsubname+'&sub_task_id='+subid+'&newtask='+task+'&subtask_name='+subtask+'&task_id'+tsid;
    f.submit();
	
    
	}
</script>
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

<body>  
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%
try {
	String det=(String)session.getAttribute("theName");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query3 = "select * from execution where subtask is null";
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query = "select * from projinfo where id = "+det;
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query4 = "select * from dummy";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
if(rs4.next())
{
%>
<form class="form-signin" name="loginForm" method="post" action="execution">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
                    <% if(rs.next()){ %>
                    <a class="navbar-brand" href="#">Onboarding Tool-<%=rs.getString("projectname") %></a>
                    <%} %>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>
                        <li>
                            <a href="#">Settings</a>
                        </li>
                        <li>
                            <a href="#">Profile</a>
                        </li>
                        <li>
                            <a href="Login.html">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
               
               
               
               <div class="col-md-3 sidebar">
                  <div id='jqxWidget'>
        <div id='jqxTree' style='visibility: hidden;  padding-top:40px; float:left;  margin-left: -45px; padding-left:0 '>
                    <ul class="nav nav-sidebar">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp">Home </a></li>
                <li item-expanded='true'>App Emphasize Module
                    <ul>
                       <li item-expanded='true'><input type="text" value="project details"/>
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true' item-selected='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                               
                            </ul>
                        </li>
                         <li><a href="applnprior.jsp">Application-Prioritized</a></li>
                       <li ><a href="demo.jsp">ROI Calculation</a></li>
                       

                    </ul>
                </li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
               <ul>
               <li item-expanded='true'> <a href="#" data-toggle="tooltip" title="Select Intake Module">               <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
               Business</div></a>
                <ul>
                <li>  <a href="#" data-toggle="tooltip" title="Select Intake Module">              <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                Application Information</div></a></li>
                <li><a href="#" data-toggle="tooltip" title="Select Intake Module">                <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                Legacy Retention Information</div></a></li>
                <li> <a href="#" data-toggle="tooltip" title="Select Intake Module">               <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                Archive Data Management</div></a></li>
                <li> <a href="#" data-toggle="tooltip" title="Select Intake Module">               <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                System Requirements</div></a></li>
                
                </ul></li>
                <li item-expanded='true'><a href="#" data-toggle="tooltip" title="Select Intake Module">                <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                Technical</div></a>
                <ul>
                <li> <a href="#" data-toggle="tooltip" title="Select Intake Module">               <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                Application Data Information</div></a></li>
                <li>   <a href="#" data-toggle="tooltip" title="Select Intake Module">             <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                Infrastructure & Environment Inforamation</div></a></li>
                <li> <a href="#" data-toggle="tooltip" title="Select Intake Module">               <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                Technical Information</div></a></li>
                </ul>
                </li>
                
                 <li item-expanded='true'> <a href="#" data-toggle="tooltip" title="Select Intake Module">               <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                 Archival Requirements</div></a>
                 <ul>
                 <li> <a href="#" data-toggle="tooltip" title="Select Intake Module">               <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                 Screen/Report Requirements</div></a></li>
                 <li>  <a href="#" data-toggle="tooltip" title="Select Intake Module">              <div style="background-color:white;border-color:white;cursor:not-allowed;" class="draggable jqx-rc-all jqx-rc-all-name=Project1 jqx-tree-item jqx-tree-item-name=Project1 jqx-item jqx-item-name=Project1 jqx-fill-state-pressed jqx-fill-state-pressed-name=Project1 jqx-tree-item-selected jqx-tree-item-selected-name=Project1">
                 Archive Requirements</div></a></li>
                 </ul>
                 </li>
                </ul>
                </li>
                <li item-selected='true'>Archive Execution Module</li>
               
                          </ul>
    
     </ul>
         </div>
   </div>
                </div>
               
               
     <script>
     function expand(x){
    		 for(var j=0;j<5;j+=1){
    	 document.getElementById('subta'+x+j).style.display='table-row';
    	 }
    	 document.getElementById('subsub').style.display='table-row';
    	
              }
      function collapse(x){
    		 for(var j=0;j<5;j+=1){
    	 document.getElementById('subta'+x+j).style.display='none';
    	 }
    		
    	 document.getElementById('subsub').style.display='table-row';
    	
              }
      </script>  
      <script>
      function expan(x,y){
 		for(var j=0;j<5;j++){
 			if(y==j)
 				document.getElementById('subsubsub'+x+j).style.display='table-row';	 	 
 	
           }
 		for(var i=0;i<5;i++)
 			document.getElementById('subtak'+x+y+i).style.display='table-row';
      }
      function collap(x,y)
      {
    	  for(var j=0;j<5;j++){
               if(y==j)   
    		  document.getElementById('subsubsub'+x+j).style.display='none';	 	
   	
             }
    	  for(var i=0;i<5;i++)
   			document.getElementById('subtak'+x+y+i).style.display='none';
      }
      
      
      </script>
               
               
               
               
               
               
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
                                
                 <div class="col-md-8">
                 
                 
                             

<div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Initiate</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div id="one" class="bar" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 30%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Hypercare</label></center>
 <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 30%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div></div></div>
</div>
         
                 
                     <br/><br/><br/> 
                     <script>
                     $(function(){
                    	    $.contextMenu({
                    	        selector: '.context-menu-one', 
                    	        items: $.contextMenu.fromMenu($('#html5menu'))
                    	    });
                    	});
                     </script>
                    
<div ng-app="myapp" ng-controller="myctrl">
<table class="table table-bordered pagin-table" style="align:center">
<thead>
<tr>
<th style="width:200px;">Tasks </th> 
<th>Resource Assigned</th>
<th>Actual start date</th>
<th>Actual End date</th>
<th>Plan start date</th>
<th>Plan End date</th>
<th>Actual Hours</th>
<th>Progress %</th>
<th>Comments</th>
<th></th>
</tr>
</thead>
<tbody>

         <%
         int i=0,z=0;
         
while(rs3.next()){
	

%>
<tr style="text-align:center;" >
<td style="width:200px;"><button type="button" style="float:left;" onClick="expand('<%=i%>')">></button>
<button type="button" style="float:left;" onClick="collapse('<%=i%>')">v</button>
<span style="color:#3071a9;"><%=rs3.getString(1)%></span></td>
<td><input  type="text"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(2) %>" /></td>
<td><input type="date" name="act_srt_date<%=i %>" value="<%=rs3.getString(3) %>" /></td>
<td><input  type="date" name="act_end_date<%=i %>" value="<%=rs3.getString(4) %>"  /></td>
<td><input  type="date" name="pln_srt_date<%=i %>" value="<%=rs3.getString(5) %>"  /></td>
<td><input  type="date" name="pln_end_date<%=i %>" value="<%=rs3.getString(6) %>"/></td>
<td><input  type="text" placeholder="enter" name="hrs<%=i %>" value="<%=rs3.getString(8) %>" /></td>
<td><div class="progressTSK">
  <span class="progressTSK-val">0%</span>
  <span class="progressTSK-bar"><span class="progressTSK-in" style="width: 0%"></span></span>
</div></td>
<td></td>
<td><input type="button"  class="delete" onClick="remove('<%=rs3.getString(1) %>','0')" value="Delete"></td>
<td style="display:none"><input type="text" name="taks<%=i %>" value="<%=rs3.getString(1) %>" hidden /></td>
<td style="display:none"><input type="text" name="tas" value="<%=rs3.getString(1) %>" hidden /></td>

</tr>
<script>
 var volume = { 

		    init: function(){
		        $('.progressTSK-in').on('click', volume.change);
		        $('.progressTSK-in').on('mousedown', volume.drag);
		    },
		      
		    change: function(e){
		        e.preventDefault();
		        var percent = helper.getFrac(e, $(this)) * 100;

		        $('.progressTSK-in').animate({ width: percent+'%' }, 100);
		        volume.update(percent);
		    },
		  
		    update: function(percent){
		      $('.progressTSK-val').text(Math.round(percent)+'%');
		      //console.log(percent);
		    },

		    drag: function(e){
		        e.preventDefault();
		        $(document).on('mousemove', volume.moveHandler);
		        $(document).on('mouseup', volume.stopHandler);
		    },

		    moveHandler: function(e){
		        var holderOffset = $('.progressTSK').offset().left,
		            sliderWidth = $('.progressTSK').width(),
		            posX = Math.min(Math.max(0, e.pageX - holderOffset), sliderWidth);

		        $('.progressTSK-in').width(posX);
		        volume.update(posX / sliderWidth * 100);
		    },

		    stopHandler: function(){
		        $(document).off('mousemove', volume.moveHandler);
		        $(document).off('mouseup', volume.stopHandler);
		    }
		  
		}

		var helper = {
		    getFrac: function(e, $this){
		        return ( e.pageX - $this.offset().left ) / $this.width();
		    }
		}

		volume.init();
 </script>
 
<%
String query2 = "select * from subtask where taskid = '"+rs3.getString(10)+"'";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
int j=0;
while(rs2.next()){
%>
<tr style="display:none;text-align:center;background-color:lightyellow;"  id="subta<%=i %><%=j%>">
<td ><button type="button" onClick="expan('<%=i%>','<%=j %>')">></button>
<button type="button"  onClick="collap('<%=i%>','<%=j %>')">v</button>
<%=rs2.getString(3)%></td>
<td><input  type="text"   placeholder="enter" name="mem_ass<%=i %><%=j %>"  onClick="style='border:1px grey';" value="<%=rs2.getString(4) %>" /></td>
<td><input type="date" name="act_srt_date<%=i %><%=j %>" value="<%=rs2.getString(5) %>" /></td>
<td><input  type="date" name="act_end_date<%=i %><%=j %>" value="<%=rs2.getString(6) %>"  /></td>
<td><input  type="date" name="pln_srt_date<%=i %><%=j %>" value="<%=rs2.getString(7) %>"  /></td>
<td><input  type="date" name="pln_end_date<%=i %><%=j %>" value="<%=rs2.getString(8) %>"/></td>
<td><input  type="text" placeholder="enter" name="hrs<%=i %><%=j %>" value="<%=rs2.getString(9) %>" /></td>
<td><progress value="20" max="100"></progress></td>
<td></td>
<td><input type="button"  class="delete" onClick="remove('<%=rs2.getString(3) %>','1')" value="Delete"></td>
<td style="display:none"><input type="text" name="subtaks<%=i %><%=j %>" value="<%=rs2.getString(3) %>" hidden /></td>
</tr>
<%
String query5 = "select * from subsubtask where subid = '"+rs2.getString(2)+"'";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
int k=0;
while(rs5.next()){
%>
<tr style="display:none;text-align:center;background-color:lightgreen;"  id="subtak<%=i %><%=j%><%=k %>">
<td >

<%=rs5.getString(3)%></td>
<td><input  type="text"   placeholder="enter" name="mem_ass<%=i %><%=j %><%=k %>"  onClick="style='border:1px grey';" value="<%=rs5.getString(4) %>" /></td>
<td><input type="date" name="act_srt_date<%=i %><%=j %><%=k %>" value="<%=rs5.getString(5) %>" /></td>
<td><input  type="date" name="act_end_date<%=i %><%=j %><%=k %>" value="<%=rs5.getString(6) %>"  /></td>
<td><input  type="date" name="pln_srt_date<%=i %><%=j %><%=k %>" value="<%=rs5.getString(7) %>"  /></td>
<td><input  type="date" name="pln_end_date<%=i %><%=j %><%=k %>" value="<%=rs5.getString(8) %>"/></td>
<td><input  type="text" placeholder="enter" name="hrs<%=i %><%=j %><%=k %>" value="<%=rs5.getString(9) %>" /></td>
<td><progress value="20" max="100"></progress></td>
<td></td>
<td><input type="button"  class="delete" onClick="remove('<%=rs3.getString(1) %>','<%=rs2.getString(9) %>')" value="Delete"></td>
<td style="display:none"><input type="text" name="subsubtaks<%=i %><%=j %><%=k %>" value="<%=rs5.getString(3) %>" hidden /></td>
</tr>
<%
k++;
}
z=i*2+j;
%>
<tr id="subsubsub<%=i %><%=j %>" style="display:none;">
<td><input type="text" name="subsubtask" id="subsubtask" placeholder="+ Enter the subsubtask" style="width:200px;"><br/><input type="button" style="width:50px;float:right;" onClick="addsubtask('<%=rs4.getString(3) %>',document.getElementsByName('subsubtask')['<%=z%>'].value,'<%=rs2.getString(2) %>')" value="Add"></td>
</tr>
<%
j++;
}
%>
<tr id="subsub">
<td><input type="text" style="display:inline" id="newsubtask" name="newsubtask" placeholder="+ Enter the subtask" style="width:100px;"><br/><input type="button" style="width:50px;float:right;" onClick="got('<%=rs4.getString(2) %>',document.getElementsByName('newsubtask')['<%=i %>'].value,'<%=rs3.getString(10) %>')"  value="Add"></td>
</tr>
<%
i++;
}
%>

</tbody>
</table>
<div>
<input type="text" class="another" name="newtask" style="margin-left:10px;width:200px;cursor:auto;" placeholder="+ Enter Some text">
<input type="button"  class="btn" onClick="sub('<%=i %>')" value="submit">
<input type="submit" class="btn" onClick="gott('<%=rs4.getString(1) %>')" value="Add">

</div>
</div>
<script type="text/javascript">

  $('tbody').sortable();

</script>
                                              </div>                             
                        </div>                       
       <%


}}
catch(Exception e){}
%>
</form>
</body>
</html>
