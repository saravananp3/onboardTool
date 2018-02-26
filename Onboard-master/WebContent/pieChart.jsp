<!DOCTYPE html>
<html lang="en-US">
<body>

<%@page language="java"%>
<%@page import="java.sql.*"%>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/strutsdb", "root", "password123");
String query1 = "select * from user_details where roles='ArchivalAdmin' and uname='bala'";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
%>
<h1>My Web Page</h1>

<div id="piechart"></div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
	var dataTable = new google.visualization.DataTable();
    dataTable.addColumn('string', 'Year');
    dataTable.addColumn('number', 'Sales');
    // A column for custom tooltip content
    dataTable.addColumn({type: 'string', role: 'tooltip'});
    dataTable.addRows([
  <% while(rs1.next()){ 
  System.out.println(rs1.getString(6));
  String query2 = "select * from archive_exec where projects='"+rs1.getString("projects")+"' and level=1";
	Statement st2 = conn.createStatement();
	ResultSet rs2 = st2.executeQuery(query2);

	while(rs2.next())
	{
	if(rs2.getString("progressbar")=="100")
	continue;
	else
	break;
	}

	String status=rs2.getString("name");
	String progressBar=rs2.getString("progressbar");
	if(progressBar.equals("0"))
		progressBar="1";
	  String query3 = "select sum(count) from visits where projects='"+rs1.getString("projects")+"'";
		Statement st3 = conn.createStatement();
		ResultSet rs3 = st3.executeQuery(query3);
		String ttl_visits="",CurntDay_visits="",last_visited_Module="",last_visited_App="";
		while(rs3.next())
			 ttl_visits=rs3.getString(1);
		 String query4 = "select count(*) from visits where date=CURDATE() and projects='"+rs1.getString("projects")+"'";
			Statement st4 = conn.createStatement();
			ResultSet rs4 = st4.executeQuery(query4);
			while(rs4.next())
				CurntDay_visits=rs4.getString(1);
		String query5 = "select module from visits where projects='"+rs1.getString("projects")+"' order by date desc,time desc";
				Statement st5 = conn.createStatement();
				ResultSet rs5 = st5.executeQuery(query5);
				if(rs5.next())
					last_visited_Module=rs5.getString(1);
  
				String query10 = "select Applications from visits where projects='"+rs1.getString("projects")+"' and module='Intake Module' order by date desc,time desc";
				Statement st10 = conn.createStatement();
				ResultSet rs10 = st10.executeQuery(query10);
				if(rs10.next())
					last_visited_App=rs10.getString(1);
	
	String query6 = "select seq_num from archive_exec where projects='"+rs1.getString("projects")+"' and name='"+rs1.getString("application")+"'";
	Statement st6 = conn.createStatement();
	ResultSet rs6 = st6.executeQuery(query6);
	String seqnum="";
	if(rs6.next())
	seqnum=rs6.getString(1);

	System.out.println(seqnum);
	String query7="select * from archive_exec where projects='"+rs1.getString("projects")+"' and seq_num>"+seqnum+" and seq_num<="+(Integer.parseInt(seqnum)+70)+" and level=3 order by seq_num";
	//System.out.println(query3);
	Statement st7 = conn.createStatement();
	ResultSet rs7 = st7.executeQuery(query7);

	String Stats="",ProgresBar="";
	while(rs7.next())
	{
	if(rs7.getString("name").equals("Requirements") && Integer.parseInt(rs7.getString("progressbar"))<100 ){
	Stats="Requirements";
	ProgresBar=rs7.getString("progressbar");
	break;
	}
	if(rs7.getString("name").equals("Build and Test") && Integer.parseInt(rs7.getString("progressbar"))<100){
	Stats="Development";
	ProgresBar=rs7.getString("progressbar");
	break;
	}
	if(rs7.getString("name").equals("Implement") && Integer.parseInt(rs7.getString("progressbar"))<100 ){
	Stats="Implement";
	ProgresBar=rs7.getString("progressbar");
	break;
	}
	}
			
	System.out.println(Stats);

		
	
    %>
    ['<%= rs1.getString(6) %>', <%= progressBar %>, "Total Visits : <%= ttl_visits %>\nVisits in current day : <%= CurntDay_visits %>\n Last Visited Module : <%= last_visited_Module %>\n Last Visited Application : <%= last_visited_App %>\n Application : <%= rs1.getString(11)%>,Status : <%= Stats %>,Percentage of Completion : <%= ProgresBar %>%"],
  <% }  %>
]);

  // Optional; add a title and set the width and height of the chart
  var options = {
		  'title':'My Average Day',
		  'width':550,
		  'height':400,
		  pieSliceText: 'label',
		  legend : 'none'
  };
  

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(dataTable, options);
}
</script>

</body>
</html>
