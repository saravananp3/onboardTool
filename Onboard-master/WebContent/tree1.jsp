<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
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
  
   <script src="js/jquery.js"></script>
  <script src="js/jstree.min.js"></script>
<link rel="stylesheet" href="css/style.min.css">
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
    
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/> 
    
    <script type="text/javascript">

    
    $(function() {
	    $( "#RO_DATE" ).datepicker({
	        format: "dd/mm/yyyy",
	        autoclose: true
	    });
	});
    
    $(function() {
	    $( "#SME_DATE" ).datepicker({
	        format: "dd/mm/yyyy",
	        autoclose: true
	    });
	});
   </script>
    
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
      <style>
input,
select { width: 100%; }


#table-scroll {
  height:150px;
  overflow:auto;  
  margin-top:20px;
}
.bar {
  background-color: lightblue;
  height: 100%;
  text-align:center;
} 
.selec{color:red;}

.disble{
color:black;
cursor:not-allowed;
}

</style>
   <script>
function myFunction1() {
    var x = document.getElementById('myDiv1');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
function myFunction2() {
    var x = document.getElementById('myDiv2');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
function myFunction3() {
    var x = document.getElementById('myDiv3');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
function myFunction4() {
    var x = document.getElementById('myDiv4');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } 
    else {
        x.style.display = 'none';
    }
}
</script>
  
  <script>
    function kk2()
  {
      document.getElementById("complexity").disabled  = false;
      document.getElementById("est_archive").disabled  = false;
      document.getElementById("est_scrn").disabled  = false;
      document.getElementById("est_db_size").disabled  = false;
      document.getElementById("est_hrs").disabled  = false;
      document.getElementById("est_cst").disabled  = false;
      document.getElementById("ttl_IA_cst").disabled  = false;
      document.getElementById("ttl_infra_cst").disabled  = false;
      document.getElementById("ttl_IA_prdct_cst").disabled  = false;
      document.getElementById("ttl").disabled  = false;

  }
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
  <script >
  var bala=10;
  </script>
  <script>
function checkk()
{
	document.getElementById('prj_name').readOnly = true;
	document.getElementById('IA_lic_cst').readOnly = true;
	document.getElementById('IA_maint_cst').readOnly = true;
	document.getElementById('Infrastrct_cst').readOnly = true;
	document.getElementById('strg_est').readOnly = true;
	document.getElementById('lab_cst').readOnly = true;
	document.getElementById('proj_name').readOnly = true;
	document.getElementById('data_size').disabled = true;
	document.getElementById('curnt_users').disabled = true;
	document.getElementById('complexity').disabled = true;
	document.getElementById('RO_DATE').readOnly = true;
	document.getElementById('SME_DATE').readOnly = true;
	document.getElementById('est_archive').readOnly = true;
	document.getElementById('est_scrn').readOnly = true;
	document.getElementById('est_db_size').readOnly = true;
	document.getElementById('est_hrs').readOnly = true;
	document.getElementById('est_cst').readOnly = true;
	document.getElementById('ttl_IA_cst').readOnly = true;
	document.getElementById('ttl_infra_cst').readOnly = true;
	document.getElementById('ttl_IA_prdct_cst').readOnly = true;
	document.getElementById('ttl').readOnly = true;
	document.getElementById('ttl_cst_fr_app').readOnly = true;
	document.getElementById('add_cst_fr_contigency').readOnly = true;
	document.getElementById('add_cst').readOnly = true;
	document.getElementById('IA_app_sprt_cst').readOnly = true;
	document.getElementById('est_archive_cst').readOnly = true;
	
}
</script>
 
    
</head>
<body class='default'>
    <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>

<%
double ans=0.0;
try {
	HttpSession details=request.getSession();
	String info=(String)details.getAttribute("app_emp");
	String appno=(String)details.getAttribute("appno");
	String projectname=request.getParameter("name");
	String det=(String)session.getAttribute("theName");
	System.out.println("-- "+info+"-- "+appno+"---"+projectname+"---"+det);
	
Class.forName("org.gjt.mm.mysql.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query = "SELECT * from app_prior where prj_name='"+projectname+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);


String query3 = "select * from projinfo where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);

String query1= "SELECT * from appinfo where prjname='"+projectname+"'";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);


String query2= "SELECT * from app_prior where prj_name='"+projectname+"'";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);


PreparedStatement statement =  conn.prepareStatement("select sum(ttl_cst_fr_app) from app_prior where prj_name='"+projectname+"'");
ResultSet result = statement.executeQuery();
result.next();
String sum=result.getString(1);
{
%>


<script type="text/javascript">
  var e;
 function updatesum() {
	 var x=document.loginForm.data_size.value;
	  var y=document.loginForm.curnt_users.value;

var a,b,c,d,z;
if(x.charAt(0)=='<' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low";
}
if(x.charAt(0)=='<' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low";
}
if(x.charAt(0)=='<' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='<' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='<' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='1' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low";
}
if(x.charAt(0)=='1' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='1' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='1' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='1' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='2' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='2' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='5' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(x.charAt(0)=='5' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='5' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='5' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='5' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='>' && y.charAt(1)=='1'&&y.length<=3)
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='>' && y.charAt(1)=='2')
{
document.loginForm.complexity.value ="Medium";
}
if(x.charAt(0)=='>' && y.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='>' && y.charAt(1)=='1'&&y.length==4)
{
document.loginForm.complexity.value ="Medium to High";
}
if(x.charAt(0)=='>' && y.charAt(0)=='1')
{
document.loginForm.complexity.value ="High";
}
if(document.loginForm.complexity.value=="Low")
	{
	document.loginForm.est_archive.value =700;
	document.loginForm.est_scrn.value ="<=5";
	z=1;
	}
if(document.loginForm.complexity.value=="Low to Medium")
{
document.loginForm.est_archive.value =1000;
document.loginForm.est_scrn.value ="<=10";
z=2;
}
if(document.loginForm.complexity.value=="Medium")
{
document.loginForm.est_archive.value =1400;
document.loginForm.est_scrn.value ="<=20";
z=3;
}
if(document.loginForm.complexity.value=="Medium to High")
{
document.loginForm.est_archive.value =1800;
document.loginForm.est_scrn.value ="<=25";
z=4;
}
if(document.loginForm.complexity.value=="High")
{
document.loginForm.est_archive.value =2500;
document.loginForm.est_scrn.value ="<=30";
z=5;
}
var qqq=<%=appno%>;
document.loginForm.est_db_size.value=(z*0.1*document.loginForm.strg_est.value).toFixed(2);
document.loginForm.est_hrs.value =(qqq*document.loginForm.est_archive.value).toFixed(2);
a=(100*document.loginForm.est_hrs.value);
document.loginForm.est_cst.value="$"+a.toFixed(2);
b=document.loginForm.est_db_size.value*document.loginForm.IA_lic_cst.value;
document.loginForm.ttl_IA_cst.value ="$"+b.toFixed(2);
c=10000*document.loginForm.est_db_size.value;
document.loginForm.ttl_infra_cst.value="$"+c.toFixed(2);
d=5*b*document.loginForm.IA_maint_cst.value
document.loginForm.ttl_IA_prdct_cst.value ="$"+d.toFixed(2);
e=(a*5)+(5*b)+(5*c)+d;
document.loginForm.ttl.value="$"+e.toFixed(2);
document.loginForm.tootal.value=e.toFixed(2);
document.loginForm.ttl_cst_fr_app.value=<%=sum%>+(e.toFixed(2)-0);
document.loginForm.est_archive_cst.value="$"+document.loginForm.ttl_cst_fr_app.value.toFixed(2); 
}
function add()
{
	var i;
	i=(document.loginForm.ttl_cst_fr_app.value-0)+(document.loginForm.add_cst_fr_contigency.value-0)+(document.loginForm.add_cst.value-0)+(document.loginForm.IA_app_sprt_cst.value-0);
	document.loginForm.est_archive_cst.value="$"+i.toFixed(2); 
}
</script>
<script>
function switchColors0()
{
	 
	links=document.getElementsByTagName("li") ;  
	var element=document.getElementById("xxx");
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
function switchColors()  
{  
	links=document.getElementsByTagName("li") ; 	 
var element=document.getElementById("xxz");
for (var i = 0 ; i < links.length ; i ++)  
	links.item(i).style.backgroundColor = 'white' ; 
element.style.borderRadius="5px";
element.style.marginRight = "85px";
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
var element=document.getElementById("xxy");
for (var i = 0 ; i < links.length ; i ++)  
	links.item(i).style.backgroundColor = 'white' ; 
element.style.borderRadius="5px";
element.style.marginRight = "150px";
element.style.boxSizing = "content-box";
element.style.borderColor = "#999";
element.style.background="#d1d1d1";
var list = document.getElementsByTagName("OL")[0];
var x=list.getElementsByTagName("LI");
for (var i = 0 ; i < x.length ; i ++)  
	x.item(i).style.backgroundColor = 'black' ; 


} 
</script>


 
<form class="form-signin" name="loginForm" method="post">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
            
            <%if (rs3.next()) {%>
                
                    
                    <a class="navbar-brand" href="project.jsp">Onboarding Tool-<%= projectname %></a>
             <%        String q2="select * from archive_exec where level=1 and projects='"+projectname+"'order by seq_num";
Statement s2 = conn.createStatement();
ResultSet rss = s2.executeQuery(q2);
while(rss.next())
{
	session.setAttribute(rss.getString(3),rss.getString(15));
}%>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ol class="nav navbar-nav navbar-right">
                        <li item-selected='true'>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>
                       
                        <li>
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
                                <li id="xxx">Parameters</li>
                                <li id="xxz">Archival Complexity Calculation</li>
                                <li id="xxy">Archival Cost Estimate</li>
                                
                            </ul>
                        </li>
                        <li><a href="applnprior.jsp">Application-Prioritized</a></li>
                        
                       <li> <a href="demo.jsp">ROI Calculation</a></li>
                      

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
                <li><a href="archive_exec_samp.jsp">Archive Execution Module</a>
               </li> 
                
               
                          </ul>
    
     </ul>
         </div>
   </div>
                </div>
                <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
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
  <div class="progress-bar" role="progressbar" style="width: <%=execute %>%" aria-valuenow="<%=execute %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=execute %>%</span></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Closure</label></center>
 <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div>
 <div class="row">
		
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-3 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Project Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                
                </div>
                
                <div class="col-xs-3 bs-wizard-step active"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot"></a>
                </div>
            </div>
        
        
        
	</div>
        
<script> 
links=document.getElementsByTagName("li") ;  
var element=document.getElementById("xxx");
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



              
                    <br/><br/><br/>
                    <div class="panel-group" id="panels1"> 
                                                <div class="panel panel-default">
        <div class="panel-heading"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1" onclick="switchColors0();"> Parameters   </a> </h4> 
                            </div>  
                                                       
                            <div id="collapse1" class="panel-collapse collapse in"> 
                                <div class="panel-body text-left">
                                
                                <%if(rs.next()){ %>
                                    
                                    
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Project Name</label>
                                            <input type="text" class="form-control" id="prj_name"  name="prj_name" value=<%=rs3.getString("projectname") %>>
                                        </div>
                                       
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">IA License cost per TB</label>
                                            <input type="text" class="form-control" id="IA_lic_cst"  name="IA_lic_cst" value="<%=rs.getString("IA_lic_cst")%>">
                                        </div>
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput526">IA Maintenance Cost Per Year</label>
                                            <input type="text" class="form-control" id="IA_maint_cst"  name="IA_maint_cst" value="<%=rs.getString("IA_maint_cst")%>">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput316">Infra Structure Cost per TB</label>
                                              <input type="text" class="form-control" id="Infrastrct_cst"  name="Infrastrct_cst" value="<%=rs.getString("Infrastrct_cst")%>"> 
                                         </div>
                                        <div class="form-group">
                                       
                                            <label class="control-label" for="formInput526">Storage Estimate</label>
                                            <input type="text" class="form-control" id="strg_est"  name="strg_est" value="<%=rs.getString("strg_est")%>">
                                      
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Labor Cost Per Hour for IA Dev Team</label>
                                            <input type="text" class="form-control" id="lab_cst"  name="lab_cst" value="<%=rs.getString("lab_cst")%>">
                                        </div>
                                        <div>
                                        <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                        </div>
                                                                        </div>                                 
                            </div>                             
                        </div> 
    
                               <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">    Archival Complexity Calculation    </a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                                
                                
  <div class="table-responsive" id="table-scroll"> 
    
    <!-- Initialization 
                * js-dynamitable => dynamitable trigger (table)
                -->
    <table class="js-dynamitable     table table-bordered" id="myTable">
      
      <!-- table heading -->
      <thead>
        
        <!-- Sortering
                        * js-sorter-asc => ascending sorter trigger
                        * js-sorter-desc => desending sorter trigger
                        -->
        <tr>
          <th>Application Name<span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction1()"></span></th>
          <th>Complexity <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction2()"></span></th>
          <th>Estimated Size of xDB <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction3()"></span></th>
          <th>Estimated Service Cost <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span><span class="glyphicon glyphicon-search pull-right" onClick="myFunction4()"> </span></th>
        </tr>
        
        <!-- Filtering
                        * js-filter => filter trigger (input, select)
                        -->
        <tr>
          <th> <!-- input filter -->
            
            <input  class="js-filter form-control" type="text" style="display:none" value="" id="myDiv1">
          </th>
          <th> <!-- select filter --
            
            <input  class="js-filter  form-control" type="text" style="display:none" value="" id="myDiv2">
          </th>
          <th><input class="js-filter  form-control" type="text" style="display:none" value="" id="myDiv3"></th>
          <th><input class="js-filter  form-control" type="text" style="display:none" value="" id="myDiv4"></th>
        </tr>
      </thead>
      
      <!-- table body -->
      <tbody>   
        
      
          <%
          
while(rs1.next()){

%>

        <tr>
        
          <td class="edit_row" style="cursor:pointer" id="1"><%=rs1.getString(1) %></td>
          <td class="row_s" style="cursor:pointer" id="2"><%=rs1.getString(2) %></td>
          <td class="row_t" style="cursor:pointer" id="3"><%=rs1.getString(3) %></td>
          <td class="row_d" style="cursor:pointer" id="4"><%=rs1.getString(4) %></td>
       
         
        </tr>
        <% } 
        
	
        %>
    </tbody>
    </table>
    <script>
// JavaScript script from: http://coursesweb.net/javascript/

// gets all the .edit_row cells, registers click to each one
var edit_row = document.querySelectorAll('#myTable .edit_row');
for(var i=0; i<edit_row.length; i++) {
  edit_row[i].addEventListener('click', function(e){
    // get parent row, add data from its cells in form fields
    var tr_parent = this.parentNode;
    document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
    document.getElementById('complexity').value = tr_parent.querySelector('.row_s').innerHTML;
    document.getElementById('est_db_size').value = tr_parent.querySelector('.row_t').innerHTML;
    document.getElementById('est_cst').value = tr_parent.querySelector('.row_d').innerHTML;
    }, false);
}

</script>
     
  </div>
  <br />
                                 
                                  
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput664">Project Name</label>
                                            <input type="text" class="form-control" id="proj_name"  name="proj_name" value="<%=rs.getString("proj_name")%>" >
                                        </div>                                         
                                         
                                      
                                              <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Data Size</label>                                             
                                            <select id="data_size" class="form-control" name="data_size" onChange="updatesum()" > 
                                            <option><%=rs.getString("data_size")%></option>
                                                <option><100 GB</option>                                                 
                                                <option>100 to 250 GB</option>
                                                <option>250 to 500 GB</option>
                                                <option>500 to 1 TB</option>
                                                <option>>1 TB</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                        
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664"><b>Data Source</b></label> 
                                            </div>
                                            <div class="checkbox"> 
                                            <label class="Data Source"> 
                                                <input type="checkbox" name="data_source" value="regulardb" <%=rs.getString("data_source")%>>Regular DB</label><br />
                                            <label class="Data Source">     <input type="checkbox" name="data_source" value="erp" <%=rs.getString("data_source")%>>ERP</label><br />
                                                <label class="Data Source"> <input type="checkbox" name="data_source" value="product" <%=rs.getString("data_source")%>>Product based 
                                                </label>  <br />                          
                                        </div>
                                        
                                      
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Current users</label>                                             
                                            <select id="curnt_users" class="form-control" name="curnt_users" onChange="updatesum()"> 
                                            <option><%=rs.getString("curnt_users")%></option>
                                                <option><10</option>                                                 
                                                <option><25</option>
                                                <option><50</option>
                                                <option><100</option> 
                                                <option>100 to 500</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Complexity</label>                                             
                                            <select id="complexity" class="form-control" name="complexity" onChange="updatesum()">
                                                <option></option>
                                                <option>Low</option>                                                 
                                                <option>Low to Medium</option>
                                                <option>Medium</option>
                                                <option>Medium to High</option> 
                                                <option>High</option>                                                 
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">Read Only Date</label>                                             
                                            <input type="text" class="form-control" id="RO_DATE"  name="read_date" onChange="updatesum()" value="<%=rs.getString("read_date")%>"> 
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">SME Date</label>                                             
                                            <input type="text" class="form-control" id="SME_DATE"  name="sme_date" onChange="updatesum()" value="<%=rs.getString("sme_date")%>"> 
                                        </div>          
                                        
                                    <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Archival Service Effort</label>                                             
                                            <input type="text" class="form-control" id="est_archive"  name="est_archive" onChange="updatesum()" value="<%=rs.getString("est_archive")%>"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Screen</label>                                             
                                            <input type="text" class="form-control" id="est_scrn"  name="est_scrn" onChange="updatesum()" value="<%=rs.getString("est_scrn")%>" > 
                                        </div>
                                     <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Size of xDB</label>                                             
                                            <input type="text" class="form-control" id="est_db_size"  name="est_db_size" onChange="updatesum()" value="<%=rs.getString("est_db_size")%>" > 
                                        </div>
                                      <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Hours</label>                                             
                                            <input type="text" class="form-control" id="est_hrs"  name="est_hrs" onChange="updatesum()"  value="<%=rs.getString("est_hrs")%>" >  
                                        </div>
                                                                                <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Total Service Cost</label>                                             
                                            <input type="text" class="form-control" id="est_cst"  name="est_cst" onChange="updatesum()" value="<%=rs.getString("est_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total IA License Cost</label>                                             
                                            <input type="text" class="form-control" id="ttl_IA_cst"  name="ttl_IA_cst" onChange="updatesum()" value="<%=rs.getString("ttl_IA_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total Infrastructure Storage Cost</label>                                             
                                            <input type="text" class="form-control" id="ttl_infra_cst"  name="ttl_infra_cst" onChange="updatesum()" value="<%=rs.getString("ttl_infra_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total Info Archive Product Maintenance Cost for 5 years</label>                                             
                                            <input type="text" class="form-control" id="ttl_IA_prdct_cst"  name="ttl_IA_prdct_cst" onChange="updatesum()"  value="<%=rs.getString("ttl_IA_prdct_cst")%>" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total</label>                                             
                                            <input type="text" class="form-control" id="ttl"  name="ttl"  value="<%=rs.getString("ttl")%>" > 
                                            <input type="text" class="form-control" id="tootal"  name="tootal"  style="display:none;" > 
                                        </div>   
                                        <div>
                                        <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors1();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" style="color:white">Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                        <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors0();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse1" style="color:black"><span class="glyphicon glyphicon-chevron-left"></span>  Previous</a></button>
                                        </div>                                                  
                                </div>                                 
                            </div>                             
                        </div>
                   
                        
                               <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse3" onclick="switchColors1();">    Archival Cost Estimate    </a> </h4> 
                            </div>                             
                            <div id="collapse3" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                                 
                                  
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput664">Total Cost for all applications in the project</label>
                                            <input type="text" class="form-control" id="ttl_cst_fr_app"  name="ttl_cst_fr_app" onChange="add()" value="<%=sum%>" >
                                        </div>                                         
                                          <div class="form-group">
                                            <label class="control-label" for="formInput664">Additional Cost for Contingency</label>
                                             <div class="input-group">
                                               <input type="text" class="form-control" id="add_cst_fr_contigency" name="add_cst_fr_contigency" onChange="add()" value="<%=rs.getString("add_cst_fr_contigency")%>"> 
                                                <div class="input-group-addon">
	                                           <a href="#" data-toggle="tooltip" title="Infra Setup/unplanned labor/travel Etc."> <span class="glyphicon glyphicon-info-sign" ></span></a> 
                                               </div>
                                               </div>                                     
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Additional Cost</label>     
                                             <div class="input-group">                                        
                                            <input type="text" class="form-control" id="add_cst" name="add_cst" onChange="add()" value="<%=rs.getString("add_cst")%>">
                                            <div class="input-group-addon">
	                                           <a href="#" data-toggle="tooltip" title="if there is a program team"> <span class="glyphicon glyphicon-info-sign" ></span></a> 
                                               </div>
                                               </div>    
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">IA Application Support Cost Labor</label>                                             
                                            <input type="text" class="form-control" id="IA_app_sprt_cst" name="IA_app_sprt_cst" onChange="add()" value="<%=rs.getString("IA_app_sprt_cst")%>"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Archival Cost for CAR Projection</label>                                             
                                            <input type="text" class="form-control" id="est_archive_cst" name="est_archive_cst" value="<%=rs.getString("est_archive_cst")%>"> 
                                        </div>
                                          <button type="button"  class="btn btn-default  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:black"> <span class="glyphicon glyphicon-chevron-left"></span> Previous</a></button>
                        
                         <input type="text" id="pwqej" value="<%= info %>" hidden>  
                        </div>
                        </div>
                        </div>
                        <br/>
                      <script>
                      function OnButton1()
                      {
                          document.loginForm.action = "Displaydb"
                        	  document.loginForm.submit();   
                          // document.Form1.target = "_blank";    // Open in a new window
                          document.loginForm.submit();             // Submit the page
                      }
                      </script>
         
                                                                                            
                                   
                                   
<button type="button" class="btn btn-primary" onclick="OnButton1()">Save</button>

        <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btn_new" onclick="window.location.href='applnprior.jsp'"> Next<span class="glyphicon glyphicon-chevron-right"></span></button>
                            
     
                    <a href="root1.jsp" class="btn btn-default" class="btn pull-right">Cancel</a>
                                      <% } %> 
                                      
                                </div>                                 
                            </div>
                            <script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>
                             <%
}
}}
catch(Exception e){}
%>
</body>
</html>