<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script>
var count=0;
function openDialog()
{
var x=document.getElementById("file1").value
if(x!=""){
	pictureChange();
}
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
<body style="background-color:#4169E1;">
<br/><br/><br/>

<div class="container">
&nbsp;&nbsp;<h2 style="color:white;"><i>PROFILE PAGE</i></h2><br/>
<div class="col-lg-6 well">
<div style="float:right">
    <label>firstnam</label>
    <input type="textbox" id="name"><hr/>
    <label>lastname</label>
    <input type="textbox" id="name"><hr/>
    <label>username</label>
    <input type="textbox" id="name"><hr/>
    <label>email</label>
    <input type="textbox" id="name"><hr/>
    <label>phoneno</label>
    <input type="textbox" id="name"><hr/>
    </div>
<p>Click the IMage to change</p>
<input type="file" id="file1" style="display:none" multiple>
<a style="cursor:pointer;" onclick="openDialog()"><img id="theImage" src="assets/images/Decom.png" width="200" height="200" style="border:3px solid black;"></a>
   
    
    </div>
</div>

</body>
</html>