<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Projects</title>
		<meta name="description" content="Blueprint: View Mode Switch" />
		<meta name="keywords" content="view mode, switch, css, style, grid, list, template" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
	
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 <script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   <!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script>
    $(document).ready(function(){
      var date_input=$('input[name="Startdate"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'mm/dd/yyyy',
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
        format: 'mm/dd/yyyy',
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

<script language="javascript">
function editRecord(id){
    var f=document.form;
    f.method="post";
    f.action='grid.jsp?id='+id;
    f.submit();
}
</script>
  
	
               <meta name="viewport" content="width=device-width, initial-scale=1.0">
               <meta name="description" content="Twitter Bootstrap Wizard Plugin">
               <meta name="author" content="Vincent Gabriel">
    <!-- Bootstrap -->
    <link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
               <style type="text/css">
                     body {
                       padding-top: 60px;
                       padding-bottom: 40px;
                     }
                     .sidebar-nav {
                       padding: 9px 0;
                     }
                   </style>
 
                              <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
                              <!--[if lt IE 9]>
                     <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                   <![endif]-->
  </head>
  <body>
  
 
                                             <div class="span11">
                                             <a name="demo"></a>
             
               <div id="rootwizard">
                                                                           <div class="navbar">
                                                                             <div class="navbar-inner">
                                                                               <div class="container">
                                                                                          <center>
                                                                           <ul>
                                                                                          <li><a href="#tab1" data-toggle="tab">Initiate</a></li>
                                                                                          <li><a href="#tab2" data-toggle="tab">Plan</a></li>
                                                                                          <li><a href="#tab3" data-toggle="tab">Execute</a></li>
                                                                                          <li><a href="#tab4" data-toggle="tab">Hypercase</a></li>
                                                                           </ul>
                                                                           </center>
                                                                           </div>
                                                                             </div>
                                                                           </div>
                                                                           <div id="bar" class="progress progress-striped active">
                                                                             <div class="progress-bar"></div>
                                                                           </div>
                                                                           <div class="tab-content">
                                                                               <div class="tab-pane" id="tab1">
                                                                                 25%
                                                                               </div>
                                                                               <div class="tab-pane" id="tab2">
                                                                                 50%
                                                                               </div>
                                                                                          <div class="tab-pane" id="tab3">
                                                                                                         75%
                                                                               </div>
                                                                                          <div class="tab-pane" id="tab4">
                                                                                                         100%
                                                                               </div>
 
                                                                                          <ul class="pager wizard">
                                                                                                         <li class="previous first" style="display:none;"><a href="javascript:;">First</a></li>
                                                                                                         <li class="previous"><a href="javascript:;">Previous</a></li>
                                                                                                         <li class="next last" style="display:none;"><a href="javascript:;">Last</a></li>
                                                                                                         <li class="next"><a href="javascript:;">Next</a></li>
                                                                                          </ul>
                                                                           </div>
                                                            </div>
            </div><!--/span-->
 
          </div><!--/row-->
        </div><!--/span-->
      </div><!--/row-->
 
 
 
      <hr>
 
     
    </div><!--/.fluid-container-->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
   <script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
               <script src="js/jquery.bootstrap.wizard.js"></script>
               <script>
               $(document).ready(function() {
                              $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                                             var $total = navigation.find('li').length;
                                             var $current = index+1;
                                             var $percent = ($current/$total) * 100;
                                             $('#rootwizard').find('.progress-bar').css({width:$percent+'%'});
                              }});
               });
               </script>
  </body>
</html>