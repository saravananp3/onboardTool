
<!DOCTYPE html>
<html lang="en">
<head>
<title>Project Information</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            $('#jqxTree').jqxTree({ height: '650px', width: '0px' });
            $('#jqxTree').css('visibility', 'visible');
            var contextMenu = $("#jqxMenu").jqxMenu({ width: '100px',  height: '56px', autoOpenPopup: false, mode: 'popup' });
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
.bs-wizard {margin-top: 40px;}

/*Form Wizard*/
.bs-wizard {border-bottom: solid 2px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #595959; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 17px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; text-align:center; text-decoration:none; z-index: 1; display: block;  background: #3276B1; top: 47px; left: 50%; padding: 5px 11px; font-weight: 700; margin-top: -14px; margin-left: -15px; border-radius: 50%;} 
.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 16px; height: 16px;  border-radius: 50px; position: absolute; top: 10px; left: 8px; } 
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 3px; box-shadow: none; margin: 25px 0;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background:#3276B1;}
.bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
.bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
.bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
.bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
.bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
.bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
.bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
/*END Form Wizard*/

</style>
<style>
  
  .sidebar{
  
  position:relative;
  left:5px;
  width:22%;
  
  background:#F7F7F7 ;
  }
  
  
  #panels1
  {
 
    width: 110%;
    
    display: inline-block;
    background: white;
    right:10%;
    border: 1px solid #E6E9ED;
   
    opacity: 1;
    transition: all .2s ease;
}
  
  
  
  .form-control{
  
  height:40px;
  }
  
  
 #descr{
  height:40px;
  }
  
  #projectname{
    height:40px;
  
  }
  #pid{
  height:40px;
  }
  </style>
  


<script>
    $(document).ready(function(){
      var date_input=$('input[name="Startdate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'yyyy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
    $(document).ready(function(){
      var date_input=$('input[name="Intdate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'yyyy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
    $(document).ready(function(){
      var date_input=$('input[name="Plandate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'yyyy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
    $(document).ready(function(){
      var date_input=$('input[name="Execdate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'yyyy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
    $(document).ready(function(){
      var date_input=$('input[name="Hyperdate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'yyyy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
    $(document).ready(function(){
      var date_input=$('input[name="Enddate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'yyyy/mm/dd',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
</script> 
<script type="text/javascript">
    function EnableDisableTextBox(chkROD) {
        var txtROD = document.getElementById("txtROD");
        txtROD.disabled = chkROD.checked ? false : true;
        if (!txtROD.disabled) {
            txtROD.focus();
        }
        
    }
</script>
<script type="text/javascript">

    var link,color;

 function disable_link() { 

  document.getElementById('testlink').disabled=true;

  link = document.getElementById('testlink').href;

  document.getElementById('testlink').removeAttribute('href');
  //document.getElementById('testlink').style.color = "grey";

   } 


 function enable_link() { 

  document.getElementById('testlink').setAttribute("href",link);

   } 


</script>
<style>.bar {
  background-color: lightblue;
  height: 100%;
  text-align:center;
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
<script type="text/javascript">
    function ShowHideDiv() {
        var adMigrated = document.getElementById("adMigrated");
        var adMigratedDet = document.getElementById("adMigratedDet");
        adMigratedDet.style.display = adMigrated.value == "Y" ? "block" : "none";
    }
</script>

<script type="text/javascript">
    function ShowHideDiv() {
        var arcNeed = document.getElementById("arcNeed");
        var arcReason = document.getElementById("arcReason");
        arcReason.style.display = arcNeed.value == "N" ? "block" : "none";
        var arcComment = document.getElementById("arcComment");
        arcComment.style.display = arcNeed.value == "O" ? "block" : "none";
    }
</script>
<script>
function checkk()
{
	
	document.getElementById('pid').readOnly = true;
	document.getElementById('projectname').readOnly = true;
	document.getElementById('descr').readOnly = true;
	document.getElementById('appno').readOnly = true;
	document.getElementById('Startdate').readOnly = true;
	document.getElementById('Intdate').readOnly = true;
	document.getElementById('Plandate').readOnly = true;
	document.getElementById('Execdate').readOnly = true;
	document.getElementById('Hyperdate').readOnly = true;
	document.getElementById('Enddate').readOnly = true;	
}
</script>
  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  <body style="background-color:#F7F7F7;margin-left:0px">

<%@page language="java"%>
<%@page import="java.sql.*"%>

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
if(rs.next()){
%>

 
<form class="form-signin" name="loginForm" method="post" action="EditProject">
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    
                    <% if(rs3.next()){
                    	details.setAttribute("appno",rs3.getString("appno"));
                    	details.setAttribute("projectname",rs3.getString("projectname"));
                    	%>
                    <a class="navbar-brand" href="project.jsp" style="color:white"id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
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
                        <img src="assets/images/logo1.png" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
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
       
           
                 <div class="row">
            <br>
               <div class="col-sm-3 sidebar">
                 <div class="col-md-2 sidebar" >
                 
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
                       <li> <a href="demo.jsp">ROI Calculation</a></li>
                        <li>Estimates</li>

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
                
                <div class="col-md-8">
                
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

<div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Initiate</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: <%=initiate%>%" aria-valuenow="<%=initiate %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=initiate %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div id="one" class="bar" role="progressbar" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: %" aria-valuenow="" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"></span></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Closure</label></center>
 <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"></span></div>
</div></div></div>
</div>
<div class="row">
		  <div class="panel-group" id="panels1" style="display:block;"> 
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-3 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Project Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">1</a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">2</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">3</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">4</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
            </div>
        
	
     
                   
                                              
            <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h2 class="panel-title"> <a  data-parent="#panels"   > Project Information  </a> </h2> 
                            </div>  
                                                       
                           
                                <div class="panel-body text-left">
                                <br/><br/>
                                
                                    
                                    
                                        <form role="form" class="form-horizontal">
                                        
                                         <div class="form-group form-group-sm" > 
                                         <div class="col-sm-2">
                                         </div>
                                            <label class="col-sm-2 control-label" for="pid">
                                               Project ID&nbsp;
</label>
<div class="col-sm-5">
                                            <input type="text"  class="form-control" id="pid"  placeholder="Project ID" name="pid" value="<%=rs3.getString("id")%>" >
                                        </div>
                                        </div>
                                        <br/><br/><br>
                                        <div class="form-group form-group-sm"> 
                                        
                                        <div class="col-sm-2">
                                        
                                         </div>
                                            <label class="col-sm-2 control-label" for="projectname">
                                               Project Name 
</label>
                            <div class="col-sm-5">
                                            <input type="text" class="form-control" size="35" id="projectname" placeholder="Project Name" name="projectname" value="<%=rs3.getString("projectname")%>" >
                                        </div>
                                        </div>
                                      <br/><br/><br>
                                      
                                      
                                        <div class="form-group form-group-sm"> 
                                       
                                        <div class="col-sm-2">
                                         </div>
                                            <label class="col-sm-2 control-label" for="descr">Description</label>
<div class="col-sm-5">
                                            <input type="text" class="form-control" id="descr" placeholder="Description" name="descr"  value="<%=rs3.getString("descr")%>">
                                        </div>
                                       
                                        </div>
                                         <br/><br/><br>
                                         
                                         
                                       <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label required">No of Applications</label>
            <div class="col-sm-5">
            <input placeholder="No of Applications" id="appno" name="appno" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("appno")%>">
          </div>
          </div>
          
        </div>  
        <br/>
        
                                         <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label required">Project Start Date</label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Startdate" name="Startdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Startdate")%>">
          </div>
          </div>
        </div>  
        <br>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label required"> Initiate Start Date</label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Intdate" name="Intdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Intdate")%>">
          </div>
          </div>
        </div>  
        <br>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label required">Plan Start Date</label>
            <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Plandate" name="Plandate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Plandate")%>">
          </div>
          </div>
        </div>    
        <br/>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label required">Execution Start Date</label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Execdate" name="Execdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Execdate")%>">
          </div>
          </div>
        </div>            
        <br>
        
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label required">Hypercare Start Date</label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Hyperdate" name="Hyperdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Hyperdate")%>">
          </div>
          </div>
         
        </div>  
        <br>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label required">Project End Date</label>
            <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Enddate" name="Enddate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Enddate")%>">
          </div>
          </div>
        </div> 
        <input type="text" id="pwqej" value="<%= info %>" hidden>                
                            
                                </div>                                 
                                                      
                       
                       <hr>
        <br/>
                       &nbsp;&nbsp;<button type="submit" class="btn btn-primary " >Save</button>&nbsp;
                       <button type="button" class="btn btn-default" onclick="location.href='appemp.jsp';">Back</button>
                       <button type="button"  class="btn btn-success  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="window.location.href='tree.jsp'"> Next<span class="glyphicon glyphicon-chevron-right"></span></button> &nbsp;&nbsp; 
              &nbsp;&nbsp; <br/>
               
              <br/>
               </form>                                                                                                               
 <script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>                             
        
                   
                  
  <%
}
}
catch(Exception e){}
%>    
           
 
 
                    
         </div>
       </div>
       </div>
   
</body>
</html>


