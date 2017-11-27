<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>

label {
    /* Other styling.. */
    text-align: right;
    clear: both;
    float:left;
    margin-right:15px;
}
</style>

<script>
var count=0;
function openDialog()
{
document.getElementById("file1").click();
}
</script>
<script>

function pictureChange()
{
	var x=document.getElementById("file1").value;
	var y=x.replace(/^.*[\\\/]/, '')
	//window.alert("assets/images/"+y);
document.getElementById('theImage').src="assets/images/"+y;
}
</script>
<script>
function call(fname,lname,uname,email){
	var phonenum=document.getElementById('phonenum').value;
	var photo=document.getElementById("file1").value;
var f=document.form;
f.method="post";
f.action="uploadpic?fname="+fname+"&lname="+lname+"&uname="+uname+"&email="+email+"&phonenum="+phonenum+"&photo="+photo;
f.submit();
}
</script>
<body>
<%
HttpSession details=request.getSession();
String fname=(String)details.getAttribute("Fname");
String lname=(String)details.getAttribute("Lname");
String uname=(String)details.getAttribute("Uname");
String email=(String)details.getAttribute("Email");



%>
<form name="form" method="post" action="uploadpic" enctype="multipart/form-data">
<div class="container">
<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                
                  
                    <a class="navbar-brand" href="project.jsp">Onboarding Tool-Profile Page</a>
               
                    
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/Logo sized.jpg" class="img-rounded" height="50" width="80" alt="Avatar">
</li>
                        <li>
                            <a href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
<span style="text-align:center"><h2><i>PROFILE PAGE</i></h2></span>
<br/><br/><br/>
<div class="container">
<div class="col-lg-3">
<p>Click the Image to change</p>
<input type="file" id="file1" name="photo" style="display:none" multiple>
<a style="cursor:pointer;" onclick="openDialog()"><img id="theImage" src="assets/images/Decom.png" width="200" height="200" style="border:0.5px solid black;"></a>
<br/>
<button type="button" class="btn btn-primary" onclick="pictureChange()">Change</button>
    
    </div>
    <div class="container">
    <div class="col-lg-4">
            <label class="control-label required">FirstName</label>
            <input class="form-control" type="text" name="fname" value="<%=fname%>"><br/>
       
    <label>lastname</label>
    <input  class="form-control" type="text" name="lname" value="<%=lname%>"><br/>
    <label>username</label>
 <input class="form-control" type="text" name="uname" value="<%=uname%>"> <br/> 
  <label>email</label>
 <input class="form-control" type="text" name="email" value="<%=email%>">   <br/>
 <label>phoneno</label>
<input class="form-control" id="phonenum" type="text"><br/>
<input type="button" class="btn btn-primary" onclick="call('<%=fname%>','<%=lname%>','<%=uname%>','<%=email%>')" value="Save">
  </div>
</div>

</div>
</form>
</body>
</html>