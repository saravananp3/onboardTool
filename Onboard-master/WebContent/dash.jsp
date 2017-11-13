<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>List Page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    
		<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css" />
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
    	<script>
	var har=[];
	var his=[];
	function oop(name)
	{
		
		if(har.indexOf(name)>=0)
			{
			var i = har.indexOf(name);
			if(i != -1) {
				har.splice(i, 1);
			}
			}
		else
			har.push(name);
	}
	function ops(name)
	{
		
		if(his.indexOf(name)>=0)
			{
			var i = his.indexOf(name);
			if(i != -1) {
				his.splice(i, 1);
			}
			}
		else
			his.push(name);
	}
	
	
	function servlet_call()
	{
		var f=document.loginForm;
	    f.method="post";
	    f.action='deactivate?values='+har+'&values2='+his;
	    f.submit(); 
	}
	</script>
	<script>
	var arr="";
	function ooo()
	{
		var e=document.getElementById("dates-field2");
	for(i=0;i<9;i++)
		{
		if(e[i].selected==true){
			arr=arr+(e[i].value);
		}
		}
	
		}
	function qq()
	{				 var f=document.loginForm;
				    f.method="post";
				    f.action="sendMail?roless="+arr+"&mailid="+email;
				    f.submit();
			
	}
	</script>
	<script>
	var pops="";
	function del(cnt)
	{
	for(var i=0;i<cnt;i++){
		if(document.getElementsByName('delete_check')[i].checked){
			var name=document.getElementsByName('name_user'+i)[0].value;
				pops=pops+name+",";	
				
		}
	}
	}
	function ww()
	{
		
		var f=document.loginForm;
	    f.method="post";
	    f.action='delete_users?array='+pops;
	    f.submit(); 
		
	}
	
	</script>
    
</head>
<body>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
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
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb","root","password123"); 
String query="select * from user_details";
Statement s=conn.createStatement();
ResultSet rs=s.executeQuery(query);

%>
<form class="form-signin" name="loginForm" method="post">
<div class="wrapper">
    <div class="sidebar" data-color="blue">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	<div class="sidebar-wrapper">
                       <ul class="nav">
                <li><br/><br/><br/>
                    <a href="project.jsp">
                        <i class="glyphicon glyphicon-home"></i>
                        <p>Home</p>
                    </a>
                </li>
                <li>
                    <a href="Registration.jsp">
                        <i class="pe-7s-user"></i>
                        <p>User Configuration</p>
                    </a>
                </li>
                <li class="active">
                    <a href="dash.jsp">
                        <i class="pe-7s-note2"></i>
                        <p>Users List</p>
                    </a>
                </li>
                <li>
                    <a href="roledetails.jsp">
                        <i class="pe-7s-news-paper"></i>
                        <p>Authorization List</p>
                    </a>
                </li>
                         </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color:blue">
            <div class="container-fluid">
                
    
                 
                    <a class="navbar-brand">Onboarding Tool</a>
              
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
                            <a href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
<br/><br/><br/>
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">List Of Users</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th></th>
  <th >UserName</th>
  <th>FirstName</th>
  <th>LastName</th>
  <th>Email</th>
  <th>Role</th>
  <th>Status</th>
  <th>Deactivate</th>
                                    </thead>
                                    <tbody>
                                      <%
                                      int count=0;
  while(rs.next()){ 
	  if(rs.getString(8).equals("active")){
		  %>
<tr style="background-color:white;">
  <td><input type="checkbox" name="delete_check" id="delete_check" ></td>
  <td><%= rs.getString(1) %></td>
  <td><%= rs.getString(2) %></td>
  <td><%= rs.getString(3) %></td>
  <td><%= rs.getString(4) %></td>
  <td><%= rs.getString(7) %></td>
  <td style="background-color:lightgreen"><%=rs.getString(8) %></td>
  <td style="text-align:center;"><input type="checkbox" name="chek" onChange="oop('<%=rs.getString(1) %>');"></td>
  <td style="display:none;"><input type="text" name="name_user<%=count%>" value="<%= rs.getString(1) %>"></td>
  </tr> 
  <%
  count++;
  } else{
		  %>
		  <tr style="background-color:#ccc;cursor:not-allowed;">
		  <td><input type="checkbox" name="delete_check" id="delete_check" ></td>
		  <td><%= rs.getString(1) %></td>
		  <td><%= rs.getString(2) %></td>
		  <td><%= rs.getString(3) %></td>
		  <td><%= rs.getString(4) %></td>
		  <td><%= rs.getString(7) %></td>
		<td> <%=rs.getString(8) %></td>
    <td style="text-align:center;background-color:white;"><input type="checkbox" name="chek" onChange="ops('<%=rs.getString(1) %>')" checked></td>
		  <td style="display:none;"><input type="text" name="name_user<%=count%>" value="<%= rs.getString(1) %>"></td>
		  </tr> 
 <%  
 count++;
 }
  }
%>  
                                                                           </tbody>
                                </table>

 &nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="window.location.href='Registration.jsp'">Add User</button>&nbsp;&nbsp;
  <input type="button" class="btn btn-primary" onclick="del(<%=count %>);ww();" value="DeleteUser">&nbsp;&nbsp;
  <button type="button" class="btn btn-primary" onclick="servlet_call();">Submit</button>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

     


    </div>
</div>
 </form>

</body>


    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>


</html>
