
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <script type="text/javascript" src="js_in_pages/application.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>

   <link rel="stylesheet" href="js_in_pages/application.css" type="text/css" />
  
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
 
  </head>
  <body>
  
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
int sumcount=0;
Statement st1;
try {
	HttpSession details=request.getSession();
	String info=(String)details.getAttribute("app_emp");
	String det=(String)session.getAttribute("theName");
	String name="";
	String appl=(String)details.getAttribute("applications");
	String prj=(String)details.getAttribute("projects");
	System.out.println(prj);
	DBconnection d=new DBconnection();
	Connection con = (Connection)d.getConnection();

String query3 = "select * from projinfo where id = "+det;
Statement st3 = con.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
if(rs3.next())
name=rs3.getString("projectname");

System.out.println("name of the project is "+name);
String query1="";
if(prj.equals("all"))
	 query1 = "select * from appinfo where prjname = '"+name+"'";
else
	 query1 = "select * from appinfo where prjname = '"+prj+"' and appname='"+appl+"'";
st1 = con.createStatement();
ResultSet rs1 = st1.executeQuery(query1);


%>

 
<form class="form-signin" name="loginForm" method="post" action="IntsantApp">
<div class="container">
<nav class=" navbar-fixed-top" style="background:#3276B1">
            <div class="container-fluid">
                
                  
                    <a class="navbar-brand" href="project.jsp" style="color:white" id="sitetitle">Onboarding Tool-<%= name %></a>
                 <%   String q2="select * from archive_exec where level=1 and projects='"+name+"'order by seq_num";
Statement s2 = con.createStatement();
ResultSet rss = s2.executeQuery(q2);
while(rss.next())
{
	session.setAttribute(rss.getString(3),rss.getString(15));
}
                     %>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/logo1.png" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
</li>
                    
     <li><%
                         String uid=(String)details.getAttribute("username");
                         String roles=(String)details.getAttribute("role");%>
 <p style="color:white; padding-top:15px;"><%=uid%>&nbsp;logged in as &nbsp;<span><%=roles%></span></p>
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
              
                    <div class="col-md-3 sidebar">
                  <div id='jqxWidget'>
       <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; margin-right:30px; padding-left:10px '>

                    <ul class="nav nav-sidebar" id="sidemenu">
                        

            <ul>
                <li id='home' item-selected='true'> <a href="project.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'><a href="editproject.jsp">App Emphasize Module
                    <ul>
                       <li item-expanded='true'><a href="editproject.jsp">Project Details
                    <ul>
                        <li><a href="editproject.jsp">Project Information</a></li>
                        <li item-selected='true'><a href="application.jsp">Application Details</a></li>
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
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div>
<jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
                    <div class="panel-group" id="panels1"> 
                    <br/><br/><br/>
                                                       
<div class="panel panel-default">
        <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse2"> Application Information  </a> </h4> 
                            </div>  
                                                       
                            <div id="collapse2" class="panel-collapse"> 
                                <div class="panel-body text-left">
                                
                                
<div class="table-responsive" id="table-scroll"> 
 
    <table class="js-dynamitable     table table-bordered" id="myTable">
      
      <thead>
 
        <tr>
          <th>Application Name <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> </th>
         
        </tr>

       
      </thead>
      
      <tbody>
      <%
while(rs1.next()){
%>
        <tr>
        
          <td class="edit_row" style="cursor:pointer"><%=rs1.getString("appname") %></td>
         
         
        </tr>
      <%
}
%>      
      </tbody>
    </table>
  </div>
  <br />
                
                 
                                            <label class="control-label" for="formInput198">
                                               Application Name&nbsp;
</label>
                                            <input type="text" class="form-control" id="app_name" placeholder="Application Name" name="appname" >
                                            <input type="hidden" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs3.getString("projectname") %>" >
                                     </br>
                                                                               <input type="submit" id="bttn"  class="btn btn-primary btn pull-left" name ="p1" value="Add">
                
                            
                               <input type="text" id="pwqej" value="<%= info %>" hidden>  
                                </div>                                 
                            </div>                             
                        </div>         
                          </form>  
                       
                    <button type="button" class="btn btn-default" onclick="location.href='editproject.jsp';">Back</button>
                    <button type="button" class="btn btn-success pull-right" onclick="location.href='tree1.jsp';">Save & Continue...</button>
                                        
                                                                                                         
                                                                                                                       
 <script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>        
                                                                                        
                                
           <%

}
catch(Exception e){
e.printStackTrace();
}
%>
                   
           
 
                    
         
       </div>
 
</body>
</html>


