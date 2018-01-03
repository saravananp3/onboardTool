<!DOCTYPE html>
<html lang="en">
<head>
<title>Project Information</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="js_in_pages/edit_project.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/edit_project.css" type="text/css" />
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
  
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
     
  </head>
  <body style="background-color:#F7F7F7;margin-left:0px">

<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>

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
DBconnection d=new DBconnection();
Connection conn = (Connection)d.getConnection();
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
                        <img src="assets/images/logo1.png" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
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
                        <li><a href="application.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="tree1.jsp">Application Prioritization</a>
                         <ul>
                                <li >Parameters</li>
                                <li>Archival Complexity Calculation</li>
                                <li>Archival Cost Estimate</li>
                             
                            </ul>
                        </li>
                        <li><a href="applnprior1.jsp">Application-Prioritized</li>
                   

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
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar" style="width: <%=initiate%>%" aria-valuenow="<%=initiate %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=initiate %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar2" style="width: <%=execute %>%" aria-valuenow="<%=execute %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=execute %>%</span></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Closure</label></center>
 <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-stripedss-bar" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div><jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
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
                                              <div class="required"> Project Name </div>
</label>
                            <div class="col-sm-5">
                                            <input type="text" class="form-control" size="35" id="projectname" placeholder="Project Name" name="projectname" value="<%=rs3.getString("projectname")%>" required>
                                        </div>
                                        </div>
                                      <br/><br/><br>
                                      
                                      
                                        <div class="form-group form-group-sm"> 
                                       
                                        <div class="col-sm-2">
                                         </div>
                                            <label class="col-sm-2 control-label" for="descr"> <div class="required">Description</div></label>
<div class="col-sm-5">
                                            <input type="text" class="form-control" id="descr" placeholder="Description" name="descr"  value="<%=rs3.getString("descr")%>" required>
                                        </div>
                                       
                                        </div>
                                         <br/><br/><br>
                                         
                                         
                                       <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label ">No of Applications</label>
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
            <label class="col-sm-2 control-label "><div class="required">Project Start Date</div></label>
             <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Startdate" name="Startdate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Startdate")%>" required>
          </div>
          </div>
        </div>  
        <br>
        <div class="form-group row log-date">
          <div class="col-md-12">
          <div class="col-sm-2">
                                         </div>
            <label class="col-sm-2 control-label "> Initiate Start Date</label>
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
            <label class="col-sm-2 control-label ">Plan Start Date</label>
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
            <label class="col-sm-2 control-label ">Execution Start Date</label>
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
            <label class="col-sm-2 control-label ">Hypercare Start Date</label>
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
            <label class="col-sm-2 control-label "><div class="required">Project End Date</div></label>
            <div class="col-sm-5">
            <input placeholder="dd/mm/yyyy" id="Enddate" name="Enddate" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text" value="<%=rs3.getString("Enddate")%>" required>
          </div>
          </div>
        </div> 
        <input type="text" id="pwqej" value="<%= info %>" hidden>                
                            
                                </div>                                 
                                                      
                       
                       <hr>
        <br/>
                      &nbsp;&nbsp;  &nbsp;&nbsp;<button type="submit" class="btn btn-success pull-right" >Save & Continue...</button>&nbsp;
                       <button type="button" class="btn btn-default">Back</button>
                       
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