<!DOCTYPE html>
<html lang="en">
<head>
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
     <style>
    .bar {
  background-color: lightblue;
  height: 100%;
  text-align:center;
} 

</style>
  
<script type="text/javascript">
    function EnableDisableTextBox(chkROD) {
        var txtROD = document.getElementById("txtROD");
        txtROD.disabled = chkROD.checked ? false : true;
        if (!txtROD.disabled) {
            txtROD.focus();
        }
        
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
<style>
.bs-wizard {margin-top: 40px;}

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #428bca; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background:#428bca; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 100%;} 
.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 14px; height: 14px; background: lightblue; border-radius: 50px; position: absolute; top: 8px; left: 8px; } 
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background: #428bca;}
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
    
<script>
function switchColors()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("b");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = 'white' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#999";
element.style.background="#d1d1d1";
var list = document.getElementsByTagName("OL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = 'black' ; 


} 
</script>
<script>
function switchColors1()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("c");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = 'white' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#999";
element.style.background="#d1d1d1";
var list = document.getElementsByTagName("OL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = 'black' ; 


} 
</script>
<script>
function switchColors0()  
{  
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("a");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = 'white' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#999";
element.style.background="#d1d1d1";
var list = document.getElementsByTagName("OL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = 'black' ; 


} 
</script>


  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  <body>
  <script>
function checkk()
{



document.getElementById('checkbox').disabled = true;
document.getElementById('checkbox1').disabled = true;
document.getElementById('checkbox2').disabled = true;
document.getElementById('pname').readOnly = true;
document.getElementById('reason_for_access').disabled = true;
document.getElementById('format').readOnly = true;
document.getElementById('language').disabled = true;
document.getElementById('archive').disabled = true;
document.getElementById('range').disabled = true;
document.getElementById('Documentation').disabled = true;
document.getElementById('userdoc').readOnly = true;
document.getElementById('techdoc').readOnly = true;
document.getElementById('traindoc').readOnly = true;
document.getElementById('supportdoc').readOnly = true;
document.getElementById('datadic').readOnly = true;
document.getElementById('testcasedoc').readOnly = true;
document.getElementById('testrec').readOnly = true;
document.getElementById('designspec').readOnly = true;
document.getElementById('reqSpeci').readOnly = true;
document.getElementById('validityplan').readOnly = true;
document.getElementById('checkbox3').disabled = true;
document.getElementById('servername').readOnly = true;
document.getElementById('prodinstance').readOnly = true;
document.getElementById('prodinstanceloc').readOnly = true;
document.getElementById('infraengage').readOnly = true;
document.getElementById('checkbox4').disabled = true;
document.getElementById('reason_for_access1').disabled = true;
document.getElementById('retenduration').readOnly = true;
document.getElementById('clientapp').readOnly = true;
document.getElementById('extcustfacing').readOnly = true;
document.getElementById('url').readOnly = true;
document.getElementById('dbsize').readOnly = true;
document.getElementById('nooftable').readOnly = true;
document.getElementById('noofrec').readOnly = true;
document.getElementById('xmlcount').readOnly = true;
document.getElementById('anyvpn').readOnly = true;
document.getElementById('checkbox5').disabled = true;
document.getElementById('checkbox6').disabled = true;
document.getElementById('appintegrate').readOnly = true;
document.getElementById('integname').readOnly = true;
document.getElementById('btt').disabled = true;
document.getElementById('btn_new').disabled = true;
document.getElementById('file').disabled = true;
document.getElementById('file1').disabled = true;
document.getElementById('file2').disabled = true;
document.getElementById('file3').disabled = true;
}
</script>
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
try {
	HttpSession details=request.getSession();
	String info=(String)details.getAttribute("intake");
	System.out.println("IntakeModule    "+ info);
String det=(String)session.getAttribute("theName");
String idd=(String)session.getAttribute("appidd");
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query4 = "select * from appinfo where appname ='"+idd+"'";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
{
%>
<form class="form-signin"name="loginForm" method="post" action="Technical">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
                    
                   <% if(rs3.next()){ %>
                    <% if(rs4.next()){ %>
                    <a class="navbar-brand" href="project.jsp">Onboarding Tool-<%=rs3.getString("projectname") %>-<%=rs4.getString("appname") %></a>
                    <%} }%>
                <div id="navbar" class="navbar-collapse collapse">
                    <ol class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li><li>
                            <a href="logout.jsp">Logout</a>
                        </li>
                    </ol>
                    
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
                       <li item-expanded='true'>Project Details
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li > Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                  
                            </ul>
                        </li>
                         <li><a href="applnprior.jsp">Application-Prioritized</a></li>
                       <li> <a href="demo.jsp">ROI Calculation</a></li>
                        <li>Estimates</li>

                    </ul>
                </li>
                <li item-expanded='true'><a href='firstinsert.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'><a href="business.jsp">Business</a>
                <ul>
                <li>Application Information</li>
                <li>Legacy Retention Information</li>
                <li>Archive Data Management</li>
                <li>System Requirements</li>
                
                </ul></li>
                <li item-expanded='true'><a href="component.jsp">Technical</a>
                <ul>
                <li id='a'> Application Data Information</li>
                <li id='b'> Infrastructure & Environment Information</li>
                <li id='c'>Technical Information</li>
                </ul>
                </li>
                
                 <li item-expanded='true'><a href="requirements.jsp">Archival Requirements</a>
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
                    
                
                <div class="col-md-8">
                <br><br><br>
                <div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Requirement</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">100%</div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Development</label></center>
  <div class="progress">
  <div id="one" class="bar" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Testing</label></center>
  <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 30%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Deployement</label></center>
 <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 30%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div></div></div>
</div>

<div class="row">
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-2 bs-wizard-step active">
                  <div class="text-center bs-wizard-stepnum">Intake Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Summary</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Review</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Approval</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                 <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
            </div>
        
        
        
</div>


<script>
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("a");
for (var i = 0 ; i < links.length ; i ++)  
links.item(i).style.backgroundColor = 'white' ; 
element.style.borderRadius="5px";
element.style.marginRight = "70px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#999";
element.style.background="#d1d1d1";
var list = document.getElementsByTagName("OL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
x.item(i).style.backgroundColor = 'black' ; 

</script>

<div class="panel-group" id="panels1"> 
<br><br>
                        <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1" onclick="switchColors0();">                            Application Data Information                            </a> </h4> 
                            </div>                             
                            <div id="collapse1" class="panel-collapse collapse in"> 
                                <div class="panel-body text-left">
                               
                                  <form role="form"> 
                          <div class="form-group"> 
                                            <label class="control-label"> 
                                                Datatype Characteristics
                                            </label>      
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;<input id="checkbox" type="checkbox">Structured &nbsp;      
                                            <input id="checkbox1" type="checkbox">Unstructured &nbsp;
                                            <input id="checkbox2" type="checkbox">Hybrid      &nbsp;                         
                                        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">If the Data Type is Unstructured or Hybrid, process for extracting unstructured data? </label>
            <input placeholder="Process Name"  id= "pname" name="pname" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>
         <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Does Unstructured or Hybrid business objects needs to be archived?</label>                                             
                                            <select id="reason_for_access" class="form-control" name="reason_for_access" > 
                                           
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                                
                                            </select>
                                        </div>  
       
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Please specify the formats</label>
            <input placeholder="Format Name" id="format" name="vendor" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
          <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="language" type="checkbox">Any Special/ Multi Language characters or Foreign Language contained in the application?
                                            </label>                                             
                                        </div> 
                                          <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="archive" type="checkbox">If the legacy application contains local language, should the local language be maintained in the archive? 
                                            </label>                                             
                                        </div> 
                                          <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="range" type="checkbox">Based on the application data and date range of the data, is all or part of the data required to be retained beyond application retirement or repurposing?
                                            </label>                                             
                                        </div> 
         <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="Documentation" type="checkbox">System Documentation and its Location
                                            </label>                                             
                                        </div> 
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">User Documentation</label>
            <input placeholder="User Documentation" id="userdoc" name="userdoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Technical Documentation</label>
            <input placeholder="Technical Documentation" id="techdoc" name="techdoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Training Documentation</label>
            <input placeholder="Training Documentation" id="traindoc" name="traindoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Support Documentation</label>
            <input placeholder="Support Documentation" id="supportdoc" name="supportdoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Data Dictionary</label>
            <input placeholder="Data Dictionary" id="datadic" name="datadic" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Test Case Documentation</label>
            <input placeholder="Test Case Documentation" id="testcasedoc" name="testcasedoc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Testing Records</label>
            <input placeholder="Testing Records" id="testrec" name="testrec" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Design Specification</label>
            <input placeholder="Design Specification" id="designspec" name="designspec" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Requirements Specification</label>
            <input placeholder="Requirements Specification" id="reqSpeci" name="reqSpeci" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Validation Plan</label>
            <input placeholder="Validation Plan" id="validityplan" name="validityplan" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                                     <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                        
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">Infrastructure & Environment Information</a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse"> 
                                <div class="panel-body">
                                    <form role="form">
                                    
                                    <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox3" type="checkbox">&nbsp;Location of Data                       
                                            </label>                                             
                                        </div>
                                        
                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Server Name</label>
            <input placeholder="Server Name" id="servername" name="servername" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Production Instances</label>
            <input placeholder="Production Instances" id="prodinstance" name="prodinstance" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Location of Production Instances</label>
            <input placeholder="Location of Production Instances" id="prodinstanceloc" name="prodinstanceloc" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        
        
        
        
                                      <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Contact Name or Entity for Infrastructure Engagement </label>
            <input placeholder="Contact Name or Entity for Infrastructure Engagement " id="infraengage" name="infraengage" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        
        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                &nbsp;Do you need to archive source code?   <input id="checkbox4" type="checkbox">                    
                                            </label>                                             
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Is this Application a Hosted Service ?</label>                                             
                                            <select id="reason_for_access1" class="form-control" name="reason_for_access" > 
                                            <option></option>
                                                <option>Yes</option>                                                 
                                                <option>No</option>  
                                                                                         
                                            </select>
                                        </div>  
                                           
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Duration for retention agreements with the vendor</label>
            <input placeholder="" id="retenduration" name="retenduration" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Does the legacy application’s data need to be archived in the client archive application </label>
            <input placeholder="" id="clientapp" name="clientapp" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Is the Application external customer facing or have a component of being external customer facing</label>
            <input placeholder="" id="extcustfacing" name="extcustfacing" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
          
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">If external facing, web apps/website URLs</label>
            <input placeholder="" id="url" name="url" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                                        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Database size of the application</label>
            <input placeholder="" id="dbsize" name="dbsize" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Estimated No of Table in the application</label>
            <input placeholder="" id="nooftable" name="nooftable" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Estimated No of Records(volume) in the application</label>
            <input placeholder="" id="noofrec" name="noofrec" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
     
   
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">XML counts for the database</label>
            <input placeholder="" id="xmlcount" name="xmlcount" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Does this application utilize any VPN environments (E.g. Citrix) for access</label>
            <input placeholder="" id="anyvpn" name="anyvpn" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
        
       <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox5" type="checkbox">&nbsp;VPN access required for application access                        
                                            </label>                                             
                                        </div>
                                        <div class="checkbox"> 
                                            <label class="control-label"> 
                                                <input id="checkbox6" type="checkbox">&nbsp;Does data in the Application integrate to or from other systems?                        
                                            </label>                                             
                                        </div>
      
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Specify the application to integrate</label>
            <input placeholder="" id="appintegrate" name="appintegrate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div> 
                       <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Ready Date for Complete Server decommission and Application Retirement</label>
            <input placeholder="dd/mm/yyyy" id="integname" name="integname" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>                    
         <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="switchColors1();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
        <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors0();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                                                    
                                    </form>
                                    
                                </div>                                 
                            </div>                             
                        </div>
                        <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" onclick="switchColors1();">Technical Information</a> </h4> 
                            </div>                             
                            <div id="collapse3" class="panel-collapse collapse"> 
                                <div class="panel-body">
                                    <form role="form"> 
                                        <label text-align:"left">Downloadable Attachment1</label>
    <input type="file" id="file" name="file" size="60" />
   
    <label text-align:"left">Downloadable Attachment2</label>
    <input type="file" id="file1" name="file" size="60" />
   
    <label text-align:"left">Downloadable Attachment3</label>
    <input type="file" id="file2" name="file" size="60" />
   
    <label text-align:"left">Downloadable Attachment4</label>
    <input type="file"  id="file3" name="file" size="60" />   
    <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                                            
                                    </form>
                                </div>                                 
                            </div>                             
                        </div>
          
                    </div>
       <input type="text" id="pwqej" value="<%= info %>" hidden>
       <button type="submit" class="btn btn-primary btn pull-left" >Save</button>&nbsp;
    
                    <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel</button> 
                    <script>
 if(document.getElementById('pwqej').value=="RX" || document.getElementById('pwqej').value=="R")
 
checkk();
 
 </script>        
            
       </div>
                
            </div>
            
            
      
        <%
}
}
catch(Exception e){}
%>
</form>
  </body>
  
</html>