function editRecord(){
    var f=document.form;
    f.method="post";
    f.action='Intake_NewApplication.jsp';
    f.submit();
}
function edit(id){
    var f=document.form;
    f.method="post";
    f.action='Intake_Business.jsp?appname='+id;
    f.submit();
}
function decomm_intake_edit(id){
    var f=document.form;
    f.method="post";
    f.action='AppDecommInfo.jsp?appname='+id;
    f.submit();
}
