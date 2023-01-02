<head>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<script type="text/javascript" src="js_in_pages/project.js"></script>

<link rel="stylesheet" href="css/headerIconnectCon/headerIcon.css"
	media="screen">

<link rel="stylesheet" href="css/threeDots/threeDots.css" media="screen">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<!-- ========== BootstrapV5 ========== -->
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<style>
.icon:hover
{
cursor:pointer;

}
#new_pwd_togglePassword
{
position: absolute; 
margin-top: 22px;
margin-left: 308px;
}
#conf_new_pwd_togglePassword
{
position: absolute; 
margin-top: 22px;
margin-left: 249px;
}
#prev_pwd_togglePassword{
position: absolute;
margin-top: 22px;
margin-left: 247px;
}
</style>
</head>

<body>

	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
	SimpleDateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date newDate1 = new Date();
	System.out.println("[INFO]-----" + formatter1.format(newDate1) + "-----Accessed OpportunityList JSP PAGE-----[INFO]");
	%>
	<%@page language="java"%>
	<%@page import="java.text.DateFormat"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	<%@page import="java.sql.*"%>
	<%@ page import="onboard.DBconnection"%>
	<%@page import="org.owasp.encoder.Encode"%>
	<%@ page import="java.util.ResourceBundle"%>
	<%
	ResourceBundle resource1 = ResourceBundle.getBundle("VersionInfo");
	String versioninfo1 = resource1.getString("VERSION");
	ResourceBundle resource8 = ResourceBundle.getBundle("Configuration");
	String authtype8 = resource8.getString("AUTHTYPE");
	System.out.println("Version" + versioninfo1);
	%>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	if (session.getAttribute("username") == null) {
		response.sendRedirect("Login.jsp");
	}
	%>
	<%
	HttpSession role_session = request.getSession();
	String frole1 = (String) role_session.getAttribute("role");
	//int sumcount1=0;
	Statement sDate, sTime;
	try {
		//String query;
		PreparedStatement visit_start = null;
		ResultSet visit_reset = null;
		HttpSession sessionDetails = request.getSession();
		String Projects = (String) sessionDetails.getAttribute("projects");
		System.out.println("projects-------------" + Projects);
		String rolesList = (String) sessionDetails.getAttribute("role");
		DBconnection db = new DBconnection();
		Connection connectCon = (Connection) db.getConnection();
		String visit_query1 = "select * from visits";
		visit_start = connectCon.prepareStatement(visit_query1);
		visit_reset = visit_start.executeQuery();
		int flag1 = 1, knt1 = 0;
		Date newDate = new Date();
		SimpleDateFormat fDate, fTime;
		String userName = (String) sessionDetails.getAttribute("username");

		fDate = new SimpleDateFormat("yyyy-MM-dd");
		fTime = new SimpleDateFormat("hh:mm:ss");
		String startDate = fDate.format(newDate);
		String startTime = fTime.format(newDate);
		while (visit_reset.next()) {
			if (visit_reset.getString(6) != null) {
		if (visit_reset.getString(1).equals(userName) && visit_reset.getString(2).equals(startDate)
				&& visit_reset.getString(3).equals("Logged in")) {
			String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in'  and date =?";
			PreparedStatement stmtt = connectCon.prepareStatement(queryy);
			stmtt.setString(1, startTime);
			stmtt.setString(2, userName);
			stmtt.setString(3, startDate);
			int count = stmtt.executeUpdate();
			flag1 = 0;
			break;
		}
			}

		}
		//System.out.println("the flag value is "+flag);
		if (flag1 == 1) {
			String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = connectCon.prepareStatement(ins_query);
			preparedStmt.setString(1, userName);
			preparedStmt.setString(2, startDate);
			preparedStmt.setString(3, "Logged in");
			preparedStmt.setString(4, "1");
			preparedStmt.setString(5, startTime);
			preparedStmt.setString(6, "None");
			preparedStmt.setString(7, "");

			// execute the preparedstatement
			preparedStmt.execute();
		}
	%>

	<script>
		let tooltipTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
			return new bootstrap.Tooltip(tooltipTriggerEl, {
				container : 'body',
				trigger : 'onClick'
			});

		});
	</script>

	<div class="modal" id="changepwd" tabindex="-1"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #1565c0;">
					<h5 class="modal-title" id="exampleModalLabel1"
						style="color: white;">Change Password</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="PopUpform">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-12">
									<label class="control-label" for="formInput526">Enter
										Current Password:</label> <i class="fa fa-eye-slash icon"
										aria-hidden="true" id="prev_pwd_togglePassword"
										></i>
									<input type="password" class="form-control" id="prev_pwd"
										name="prev_pwd" required />
								</div>
								<div class="col-lg-12">
									<label class="control-label" for="formInput526">New
										Password:</label> <i class="fa fa-eye-slash icon" aria-hidden="true"
										id="new_pwd_togglePassword"
										></i>
									<input type="password" class="form-control" id="new_pwd"
										name="new_pwd" required>
								</div>
								<div class="col-lg-12">
									<label class="control-label" for="formInput526">Confirm
										New Password:</label><i class="fa fa-eye-slash icon" aria-hidden="true"
										id="conf_new_pwd_togglePassword"
										></i>
									<input type="password" class="form-control" id="conf_new_pwd"
										name="conf_new_pwd" required>
								</div>
								<div class="col-lg-12" style="display: none;">
									<label class="control-label" for="formInput526">Username:</label>
									<input type="text" class="form-control" id="user_Name"
										name="user_Name"
										value="<%=Encode.forHtmlAttribute(userName)%>" required>
								</div>

								<div class="col-lg-12" style="display: none;">
									<label class="control-label" for="formInput526">Auth
										Type:</label> <input type="text" class="form-control" id="auth_type"
										name="auth_type"
										value="<%=Encode.forHtmlAttribute(authtype8)%>" required>
								</div>

							</div>
						</div>


					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" id="change_PWD"
						 style="font-size: 12px;">Change
						Password</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="font-size: 12px;">Close</button>
				</div>
			</div>
		</div>
	</div>

	<%
	visit_start.close();
	visit_reset.close();
	connectCon.close();

	}

	catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
<script>
$(document).ready(function() {
 console.log($('#auth_type').val());
 if($('#auth_type').val()=="SSO")
	 {
	 $('.changepwwd').hide();
	 }
});
</script>

<script>
        const togglePassword = document
            .querySelector('#new_pwd_togglePassword');
  
        const password = document.querySelector('#new_pwd');
  
        togglePassword.addEventListener('click', () => {
            const type = password
                .getAttribute('type') === 'password' ?
                'text' : 'password';
                  
            password.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword.classList.remove("fa-eye");
                togglePassword.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword.classList.remove("fa-eye-slash");
                togglePassword.classList.add("fa-eye");

        	}
           
        });
    </script>
<script>
        const togglePassword1 = document
            .querySelector('#prev_pwd_togglePassword');
  
        const password1 = document.querySelector('#prev_pwd');
  
        togglePassword1.addEventListener('click', () => {
            const type = password1
                .getAttribute('type') === 'password' ?
                'text' : 'password';
                  
            password1.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword1.classList.remove("fa-eye");
                togglePassword1.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword1.classList.remove("fa-eye-slash");
                togglePassword1.classList.add("fa-eye");

        	}
           
        });
    </script>
<script>
        const togglePassword2 = document
            .querySelector('#conf_new_pwd_togglePassword');
  
        const password2 = document.querySelector('#conf_new_pwd');
  
        togglePassword2.addEventListener('click', () => {
            const type = password2
                .getAttribute('type') === 'password' ?
                'text' : 'password';
                  
            password2.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword2.classList.remove("fa-eye");
                togglePassword2.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword2.classList.remove("fa-eye-slash");
                togglePassword2.classList.add("fa-eye");

        	}
           
        });
    </script>
<script src="js/admin_modify_module/admin_role.js"></script>
<script src="js/admin_modify_module/changepwd.js"></script>
<script src="js/notification/notification.js"></script>
<script src="js/BindWave.js"></script>