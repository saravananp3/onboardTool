<!DOCTYPE html>
<html lang="en">
<head>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   <meta charset="utf-8">
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
   <link rel="stylesheet" href="css/style.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
  
   <script src="js/jquery.js"></script>
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
    
    $(function() {
    $( "#P_S_date" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Project_end_date" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Hyper_care_date" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Exec_start_date" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Initiate_start_date" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    $(function() {
    $( "#Project_Start_Date" ).datepicker({
        format: "dd/mm/yyyy",
        autoclose: true
    });
});
    
    
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
    <style>
    .bar {
  background-color: lightblue;
  height: 100%;
  text-align:center;
} 

p.field-wrapper input {
    float: right;
}
p.required-field::before { 
    content: "*";
    float: right;
    color: red;
}

</style>
    
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
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
    
    
    
    
    $(function() {
        $( "#datepicker_1" ).datepicker();
    });
</script>
  
 
    
</head>
<body class='default'>


<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.html");
}
%>

 
<form class="form-signin" name="loginForm" method="post" >

<script>

function valid1()
{
 
var project_name = document.getElementsByName("projectname")[0].value;
 
var descr = document.getElementsByName("descr")[0].value;
var appno = document.getElementsByName("appno")[0].value;
var Startdate = document.getElementsByName("Startdate")[0].value;
var Intdate = document.getElementsByName("Intdate")[0].value;
var Plandate = document.getElementsByName("Plandate")[0].value;
var Execdate = document.getElementsByName("Execdate")[0].value;
var Hyperdate = document.getElementsByName("Hyperdate")[0].value;
var Enddate = document.getElementsByName("Enddate")[0].value;
var flag=0;
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%
String[] values_name = new String[5];
ArrayList<String> zoom = new ArrayList<String>();
int i=0;
int count=0;
    String project_name=request.getParameter("projectname"); 
    HttpSession details=request.getSession();
    String roles=(String)details.getAttribute("role");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 
Statement st= con.createStatement(); 

/*ResultSet rs1=st.executeQuery("select count(*) from projinfo ");
while (rs1.next())
{
count= Integer.parseInt(rs1.getString(1));
}
*/

ResultSet rs=st.executeQuery("select projectname from projinfo ");
while (rs.next())
{

//values_name[i] = rs.getString(1);
zoom.add(rs.getString(1));
    
    //i++;
}   


for (String z : zoom) {
    //System.err.println("FDFD "+z);
%>

if (project_name == "<%= z %>" ) 
 
{
flag=1;
 
}

<% } %> 

 

if (project_name == "" || descr == "" || Startdate == "" || Enddate == "" )
{
alert("Please fill the mandatory fields");
return false;
}
 
else if (flag == 1)
{
alert("Project Already Exists");
return false;
}
else
{
var f=document.loginForm;
    f.method="post";
    f.action='Project';
    f.submit();   
}
}


function validation(pro_name)
{

if (project_name == Pro_name)
{
alert("Project Already Exists");
}
else
{
var f=document.loginForm;
    f.method="post";
    f.action='Project';
    f.submit(); 
}
 
 
}
</script>
<style>
 .required_fie:after
  {
   content:" *";
    color: red; 
   }
</style>
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                    
                    <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool</a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">&nbsp;
</li>
 <li><%
                         String uid=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=role%></span></p>
</li>                     <a href="logout.jsp" style="color:white; background:#3276B1">Logout</a>
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
         <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; margin-right:30px; padding-left:10px '>
                    <ul class="nav nav-sidebar" id="sidemenu">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="editproject.jsp">App Emphasize Module</a>
                    <ul>
                       <li item-expanded='true'><a href="editproject.jsp">Project Details</a>
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</a></li>
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
                <a href='firstinsert.jsp'>
                <li>Application Information</li>
                <li>Legacy Retention Information</li>
                <li>Archive Data Management</li>
                <li>System Requirements</li>
                </a>
                </ul></li>
                <li item-expanded='true'>Technical
                <ul>
                <a href='firstinsert.jsp'>
                <li>Application Data Information</li>
                <li>Infrastructure & Environment Inforamation</li>
                <li>Technical Information</li>
                </a>
                </ul>
                </li>
                
                <a href='firstinsert.jsp'>
                 <li item-expanded='true'>Archival Requirements
                 <ul>
                 <li>Screen/Report Requirements</li>
                 <li>Archive Requirements</li>
                 </a>
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
              
         
          <br/><br/><br/>
                    <div class="panel-group" id="panels1"> 
                   
                                                <div class="panel panel-default">
        <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1" > Project Information  </a> </h4> 
                            </div>  
                                                       
                            <div id="collapse1" class="panel-collapse "> 
                                <div class="panel-body text-left">
                                
                                
                                    
                                    
                                        <form role="form">
                                        
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput198">
                                           <div class="required_fie">   Project Name&nbsp; </div> 
</label>
               <input type="text" class="form-control" id="formInput198" placeholder="Project Name" name="projectname" required/>
              
                                        </div>
                                        <%@ page import="java.sql.*"%>

                                
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput229">
                                            <div class="required_fie">Description&nbsp;</div>
</label>
                                            <input type="text" class="form-control" id="formInput229" placeholder="Description" name="descr" >
                                        </div>
                                       <div class="form-group row log-date">
          <div class="col-md-12">
            <label >No of Applications</label>
            <input placeholder="No of Applications" id="date" name="appno" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label  "><div class="required_fie">Project Start Date&nbsp;</div></label>
            <input placeholder="dd/mm/yyyy" id="Project_Start_Date" name="Startdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" required/>
          </div>
          
        </div>  
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label "> Initiate Start Date</label>
            <input placeholder="dd/mm/yyyy" id="Initiate_start_date" name="Intdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Plan Start Date</label>
            <input placeholder="dd/mm/yyyy" id="P_S_date" name="Plandate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>    
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Execution Start Date</label>
            <input placeholder="dd/mm/yyyy" id="Exec_start_date" name="Execdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>            
        
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Hypercare Start Date</label>
            <input placeholder="dd/mm/yyyy" id="Hyper_care_date" name="Hyperdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
        <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required"><div class="required_fie">Project End Date&nbsp;</div></label>
            <input placeholder="dd/mm/yyyy" id="Project_end_date" name="Enddate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>                 
                            
                                </div>                                 
                            </div>                             
                        </div>         
                        <br/>                
                       <button type="button" class="btn btn-primary btn pull-left" onclick="valid1()">Save</button>&nbsp;
                    <button type="button" class="btn btn-default" onclick="location.href='appemp.jsp';">Back</button>
                                        
                                                                           </form>                               
               



</body>
</html>