var fieldName = "";
var columnName = "";
var status = "";
var valuePrev = "";

$(document).ready(function (){
	
	$(document).on('focusin', '.taskChange', function(){
		valuePrev = $(this).val();
	 	});
	
	$(document).on('focusin', 'select.assignedToDrop', function(){
		valuePrev = $(this).val();
	});
	
	
	
	$(document).on('change', '.taskChange', function(){
		fieldName = "";
		columnName = "";
		var className = $(this).attr('class');
		getFieldName(className);
		var index = $(this).index('.'+fieldName);
		var value = $('.'+fieldName).eq(index).val();
		var seqNo = parseInt(index)+1;
		//var valuePrev = $(this).data('val');
    var dateValidationFlag = dateValidation(fieldName, index, value);
    if (dateValidationFlag)
  	saveFunction(seqNo,columnName,value,valuePrev);
		});
    function dateValidation(fieldName, index, value) {
						if (fieldName.includes("Start")) {
							var startDate = new Date(DateConverter(value));
							if (fieldName.includes("plan")) {
								var end_date = DateConverter($('.planEnd').eq(index).val());
								var endDate = new Date(end_date);
								if (end_date == null || end_date == undefined
										|| end_date == "" || value == null
										|| value == undefined || value == "")
									return true;
								else if (startDate <= endDate)
									return true;
								else {
									notification("warning","Please fill the date lesser than or equal to plan end date.","Warning");
									$('.planStart').eq(index).val("");
									return false;
								}

							} else if (fieldName.includes("act")) {
								var end_date = DateConverter($('.actEnd').eq(
										index).val());
								var endDate = new Date(end_date);
								if (end_date == null || end_date == undefined
										|| end_date == "" || value == null
										|| value == undefined || value == "")
									return true;
								else if (startDate <= endDate)
									return true;
								else {
									notification("warning","Please fill the date lesser than or equal to actual end date.","Warning");
									$('.actStart').eq(index).val("");
									return false;
								}
							}
						} else if (fieldName.includes("End")) {
							var endDate = new Date(DateConverter(value));
							if (fieldName.includes("plan")) {
								var start_date = DateConverter($('.planStart')
										.eq(index).val());
								var startDate = new Date(start_date);
								if (start_date == null || start_date == undefined || start_date == "" || value == null || value == undefined || value == "")
									return true;
								else if (startDate <= endDate)
									return true;
								else {
									notification("warning","Please fill the date greater than or equal to plan start date.","Warning");
									$('.planEnd').eq(index).val("");
									return false;
								}
							} else if (fieldName.includes("act")) {
								var start_date = DateConverter($('.actStart').eq(index).val());
								var startDate = new Date(start_date);
								if (start_date == null || start_date == undefined || start_date == "" || value == null || value == undefined || value == "")
									return true;
								else if (startDate <= endDate)
									return true;
								else {
									notification("warning","Please fill the date greater than or equal to actual start date.","Warning");
									$('.actEnd').eq(index).val("");
									return false;
								}
							}
						}
						return true;
					}
					function DateConverter(date) {
						var convertedDate = "";
						var splittedDate = date.split("/");
						if (splittedDate.length == 3)
							convertedDate = splittedDate[2] + "-"
									+ splittedDate[0] + "-" + splittedDate[1];
						return convertedDate;
					}

	
function getFieldName(className){
			if(className.includes('taskTypeDrop')){
				 fieldName = 'taskTypeDrop';
				 columnName = 'taskType';
		     }
			else if(className.includes('assignedToDrop')){
				 fieldName = 'assignedToDrop';
				 columnName = 'assignedTo';
			}
		    
			else if(className.includes('planStart')){
				fieldName = 'planStart';
				columnName = 'planSrt';
			}
		    
			else if(className.includes('planEnd')){
				fieldName = 'planEnd';
				columnName = 'planEnd';
			}
		    
			else if(className.includes('actStart')){
				fieldName = 'actStart';
				columnName = 'actSrt';
			}
		    
		    else if(className.includes('actEnd')){
				fieldName = 'actEnd';
				columnName = 'actEnd';
		    }
		    else if(className.includes('majorDep'))
		    {
		    	fieldName = 'majorDep';
				columnName = 'majorDependencies';
		    }
		    else if(className.includes('RemarksPoints'))
		    {
		    	fieldName = 'remark';
				columnName = 'remark';
		    }
		  
	}
	$(".datepicker1").change(function()
		{
		    var className = $(this).attr("class");
		    getFieldName(className);
		    var index = $(this).index('.'+fieldName);
			var value = $('.'+fieldName).eq(index).val();
			var seqNo = parseInt(index)+1;
			//var valuePrev = $(this).data('val');
			saveFunction(seqNo,columnName,value,valuePrev);
		    
		});
		
		$('#updatedate').click(function() {      
        
         $.ajax({
        url: "ArchiveExecutionInfoDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Archive Exec Data Retrieve--->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
   
            $('#ArchiveExecutionList').html(data);
            
            /*var parentRow = ""*/
            appendRowFunction(data);
             $('.assignedToDrop').selectpicker();
            var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});"+
            "$('.datepicker2').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});<\/script>";
        $(".visibleBtn").hide(); 
        $('#scripttag').append(script);
        for(var i = 0; i<$('.datepicker1').length; i++){
            var className = $('.datepicker1').eq(i).attr('class');
            $('.datepicker1').eq(i).attr('class', className+" taskChange");
        }
        /*var className = $('.datepicker1').attr('class');
        $('.datepicker1').attr('class', className+" taskChange");*/
        $('#spinner').hide();
        },
        error: function (e) {
            console.log(e);
        }
           
   
   });
    });
              
   function userAppendFunction(data) {
    $.each(data, function(){
    })
}    
       
      function appendRowFunction(data){
    var collapse = "";
    var checkIndex = false;
    $.each(data, function(key, value){
        if(checkIndex){
        var seqNo = value.seq_no;
        var oppId = value.oppId;
        var oppName = value.oppName;
        var taskId = value.taskId;
        var level = value.level;
        var taskGroup = value.taskGroup;
        var taskName = value.taskName;
        var taskType = value.taskType;
        var majDep = value.majorDep;
        var assingedTo = value.assignedTo;
        var planStart = value.planStart;
        var planEnd = value.planEnd;
        var actStart = value.actStart;
        var actEnd = value.actEnd;
        var completion = !isNaN(value.completion)&&value.completion!=""?value.completion:0 ;
        var status = value.status;
        var remark = value.remark;
        var AssignedToOptions =userAppendFunction(data[0].user,assingedTo);
        var taskTypeOptions = Options(taskTypeArr,taskType);
        var status1=arcstatuscolor(completion);
        var lvlflag=levlflag(level);
        if (level == 1){        
            collapse = "collapse"+seqNo;
        var row = "<tr class='ArchiveList' role='button' data-toggle='collapse' data-parent='#accordion' href='."+collapse+"' aria-expanded='false' aria-controls='"+collapse+"'>"+
                "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskChange taskId' for='ArchiveExection'>"+taskId+"</label>" +
                        "<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' for='ArchiveExection'>"+taskGroup+"</label></td>"+
                  "<td><label class='control-label taskName' for='ArchiveExection'>"+taskName+"</label></td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<select class='taskTypeDrop taskChange' disabled>"+
                  taskTypeOptions+
                  "</select>" +
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='majorDep changeText' value='"+majDep+"' disabled></td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<select multiple data-live-search='true' class='assignedToDrop selectpicker' multiple data-actions-box='true' disabled>"+
                  AssignedToOptions+
                  "</select>" +
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control planStart' placeholder='mm/dd/yyyy' value='"+planStart+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control planEnd' placeholder='mm/dd/yyyy' value='"+planEnd+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control actStart' placeholder='mm/dd/yyyy' value='"+actStart+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control actEnd' placeholder='mm/dd/yyyy' value='"+actEnd+"' disabled/></td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<div class='clearfix completion'>"+
                  "<div class='c100 p"+completion+" small circle'>"+
                  "<span class='percentage' >"+completion+"%</span>"+
                  "<div class='slice'>"+
                  "<div class='bar'></div>"+
                 "<div class='fill'></div>"+
                 "</div>"+
                 "</div>"+
                 "<div class='visibleBtn arrow'>"+
                 "<div>"+
                 "<i style='vertical-align:top;position:relative;' role ='button' class='triangle up parentUp'></i>"+
                 "</div>"+
                 "<br/>"+
                 "<div>"+
                 "<i style='vertical-align:bottom;position:relative;' role='button' class='triangle down parentDown'></i>"+
                 "</div>"+
                 "</div>"+
                 "</div>"+
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'>"+
                  "<span class='"+arcstatuscolor(completion)+" statusCode colorCode'></span>"+
                  "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon' style='color:#87CEEB;' role='button' ></i><input type='hidden' class ='remark changeText' value='"+remark+"' disabled></td>"+
                  "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                  "<ul class='dropdown-menu'>"+
                  "<li><a  class='fa fa-plus AddRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Add</a></li>"+
                  "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                  "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                  "</ul>"+
                  "</div>"+
                  "</td>"+
                  "</tr>";
                  $("#ArchiveExecutionList").append(row);
        }
        else {
            var row = "<tr class='ArchiveList panel-collapse collapse out "+collapse+"' role='tabpanel' aria-labelledby='headingOne'>"+
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskId' for='ArchiveExection'>"+taskId+"</label>" +
            "<input type = 'hidden' class = 'archiveLevel' value = '"+level+"'/>"+      
            "</td>"+
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label taskGroup' for='ArchiveExection'>"+taskGroup+"</label></td>"+
              "<td><label class='control-label taskName' for='ArchiveExection'>"+taskName+"</label></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
              "<select class='taskTypeDrop taskChange'>"+
              taskTypeOptions+
              "</select>" +
              "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' class ='majorDep changeText' value='"+majDep+"'></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
              "<select multiple data-live-search='true' class='assignedToDrop selectpicker' multiple data-actions-box='true'>"+
            AssignedToOptions+
              "</select>" +
              "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planStart' placeholder='mm/dd/yyyy' value='"+planStart+"' maxlength='0' /></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 planEnd' placeholder='mm/dd/yyyy' value='"+planEnd+"' maxlength='0'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actStart' placeholder='mm/dd/yyyy' value='"+actStart+"' maxlength='0'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'><input type='text' Class='form-control datepicker1 actEnd' placeholder='mm/dd/yyyy' value='"+actEnd+"' maxlength='0'/></td>"+
              "<td style='text-align:center;vertical-align: middle;'>"+
             "<div class='clearfix completion'>"+
          "<div class='c100 p"+completion+" small circle'>"+
          "<span class='percentage'>"+completion+" %</span>"+
          "<div class='slice'>"+
         "<div class='bar'></div>"+
        "<div class='fill'></div>"+
        "</div>"+
        "</div>"+
        "<div class='visibleBtn arrow'>"+
        "<div>"+
        "<i style='vertical-align:top;position:relative;' role ='button' class='triangle up'></i>"+
        "</div>"+
        "<br/>"+
        "<div>"+
        "<i style='vertical-align:bottom;position:relative;' role='button' class='triangle down'></i>"+
        "</div>"+
        "</div>"+
        "</div>"+
          "</td>"+
              "<td style='text-align:center;vertical-align: middle;'><span class='colorCode' ></span></td>"+
              "<td style='text-align:center;vertical-align: middle;'><i class='fas fa-comment-alt fa-2x remarksIcon' style='color:#87CEEB;' role='button'></i><input type='hidden' class ='remark changeText' value='"+remark+"'></td>"+
          "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
          "<ul class='dropdown-menu'>"+
          "<li><a  class='fa fa-plus AddRow' style='font-size: 19px; color: black;"+lvlflag+"'>&nbsp;&nbsp;&nbsp;Add</a></li>"+
          "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
          "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
          "</ul>"+
          "</div>"+
          "</td>"+
              "</tr>";
              $("#ArchiveExecutionList").append(row);
        }
        }
        else {
           /* users =[];*/
            taskTypeArr = ['','Activity','Deliverable'];
            checkIndex = true;
            var headerOppId = value.Opp_Id == false ? "" : value.Opp_Id;
            var headerOppName = value.appName == false ? "" : value.appName;
            var headerstartDate=value.startDate == false ? "</br>" : value.startDate;
            var headerendDate=value.endDate == false ? "</br>" : value.endDate;
            $('#oppName').html("Opportunity Name : </br>"+headerOppName);
            $('#oppId').html("P3 Project Id : </br>"+headerOppId);
            $('#startDate').html("Start Date : </br>"+headerstartDate);
            $('#endDate').html("Estimated Completion : </br>"+headerendDate);
        }
    });
}
function Options(optionlist,value)
{
     var options = "";
     for(var i=0;i<optionlist.length;i++)
    {
      if(value.includes(optionlist[i].toString()))
          options += "<option value='"+optionlist[i]+"' selected>"+optionlist[i]+"</option>";
      else
          options += "<option value='"+optionlist[i]+"'>"+optionlist[i]+"</option>";
    }
     return options;
}
function userAppendFunction(optionlist,value1) {
    //console.log(optionlist);
    var userArrayList = optionlist.split(',').slice(1);
    //console.log(userArrayList);
    var options = "";
    $.each(userArrayList, function(key, value){
        //var getUser = "user"+count.toString();
        var userList = (value);
         if(value1.includes(userList.toString()))
          options += "<option value='"+userList+"' selected>"+userList+"</option>";
      else
          options += "<option value='"+userList+"'>"+userList+"</option>";
    });
    return options;
}		
	$(document).on('change','select.assignedToDrop',function()
	{
		var val=$(this).val();
		fieldName = "assignedToDrop";
		var value = MultiSelectDropDownValues(val);
		//var index = parseInt($(this).index('.assignedToDrop'))-2+1;
		var seqNo = $(this).index("select.assignedToDrop")+1;
		var columnName = 'assignedTo';
		
		saveFunction(seqNo,columnName,value,valuePrev);
	});
	
	var typingTimer;                //timer identifier
	var doneTypingInterval = 1000;  //time in ms, 5 second for example
	
	//on keyup, start the countdown
	
	$(document).on('keyup','.changeText', function () {
	      clearTimeout(typingTimer);
		  var Obj_this = this;
		  //typingTimer = setTimeout(doneTyping(this), doneTypingInterval);
		  typingTimer=setTimeout(function (){
	          doneTyping(Obj_this);
	          },  doneTypingInterval);
	});

	//on keydown, clear the countdown 
	$(document).on('keydown','.changeText',function () {
		clearTimeout(typingTimer);
	});

	//user is "finished typing," do something
	function doneTyping (event) {
		fieldName="";
		columnName="";
 	    var value = $(event).val();
	    var classname = $(event).attr('class');
	    getFieldName(classname);
	    var index = $(event).index("."+fieldName);
	    var value ="";
	    if(fieldName=="remark"){
	    value = getRemarksValue();
	    index = $("#ArchiveRemarksSeq").val();
	    }
	    else
	    value = $('.'+fieldName).eq(index).val();
		var seqNo = parseInt(index)+1;
	    saveFunction(seqNo, columnName, value,"");
	} 
	
	$(document).on("mouseenter", ".statusCode", function() {
		var index = $(this).index('.colorCode');
		$('.ArchiveList').eq(index).attr('data-toggle','');
	});

	$(document).on("mouseleave", ".statusCode", function() {
		var index = $(this).index('.colorCode');
		$('.ArchiveList').eq(index).attr('data-toggle','collapse');
	});
	

	});

function getRemarksValue(){
	var value="";
	var length=$(".RemarksPoints").eq(0).find("li").length;
	for(var i=0; i<length; i++){
				value+=$(".RemarksPoints").eq(0).find("li").eq(i).html()+":=:";
				}
	value=value.substring(0,value.length-3);
   return value;
}
function MultiSelectDropDownValues(ValuesArray)
{
	var value ="";
	if(ValuesArray!=null)
	   {
			for(var i=0;i<ValuesArray.length;i++)
				{
					value += ValuesArray[i]+",";	
				}
			return value.substring(0,value.length-1);
	   }
	else
	   {
			return value;
	   }
	
}


function columnNameToClassName(columnName){
	
	var parentClassName;
	
	switch(columnName){
	
	case "planSrt":
		parentClassName = "planStart";
		break;
		
	case "planEnd":
		parentClassName = "planEnd";
		break;
		
	case "actSrt":
		parentClassName = "actStart";
		break;
		
	case "actEnd":
		parentClassName = "actEnd";
		break;
	
	}
	
	return parentClassName;
}

$(document).on('click','.colorCode',function()
{
	status = "";
	fieldName = 'colorCode';
	var class_name = $(this).attr('class');
	var index = $(this).index('.colorCode');
	$(".colorCode").eq(index).attr('class',changeColor(class_name));
	var seqNo = parseInt(index)+1;
	saveFunction(seqNo, "status", status,"");
});


function changeColor(classname)
{
	var colorClassName = "";
  classname =	classname.split(" ");
  var colorClass = classname[0].toString();
  if(colorClass=="statusRed")
	  {
		  colorClassName = "statusOrange statusCode colorCode"
		  status = "statusOrange";
	   }
  else if(colorClass=="statusOrange")
  	{
		  colorClassName = "statusGreen statusCode colorCode";
		  status = "statusGreen";
  	}
  else if(colorClass =="statusGreen")
  	{
		  colorClassName  = "statusRed statusCode colorCode";
		  status = "statusRed";
  	}
  return colorClassName;
}


function saveFunction(seqNo, columnName, value, valuePrev){
/*var JsonObj = [];
var checkPrevChild = checkPreviousRows(seqNo-1,true,value);
var checkPrevParent = checkPreviousRows(seqNo-1,false,value);
if(!checkPrevChild){
	notification("warning","Please fill the previous sub-task.","Warning");
}

 if(!checkPrevParent)
{
	notification("warning","Please fill atleast one of the previous parents sub-task.","Warning");
}
if(!checkPrevParent||!checkPrevChild)
{
	var prev = getPreviousValue(valuePrev, columnName, fieldName, seqNo-1);
}
 if(checkPrevChild&&checkPrevParent){*/
	$.ajax({
        url: "archiveExecutionSaveServlet",
        type: 'POST',
        data: {seqNum:seqNo, colName:columnName, Value:value},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Data : " ,data);
        	if(data.checkSave)
        		{
        		if(columnName == "planSrt" || columnName == "planEnd" || columnName == "actSrt" || columnName == "actEnd"){
        			if(data.CheckParentDate){
        			updateParentDate(seqNo, columnName, data.ResultDate);
        			}
        			else if(data.CheckChildDate){
        			updateChildDate(seqNo, columnName, data.ResultDate);
        		}
        		else if(data.CheckChildParentDate)
        		{
				updateChildParentDate(seqNo, columnName, data.ResultDate);
				}
        		}
        		if(fieldName != 'colorCode'&&fieldName!="")
        		$("."+fieldName).eq(seqNo-1).val(value);
	        		SaveInfoNotification(seqNo, columnName, value);
	        		
	        		 $('#updatedate').click();   
	        		notification("success","changed field saved successfully.","Note:");
	        		//window.setTimeout(function(){location.reload()},220)
	        		appendRowFunction(data);
        		}
        		else
        			notification("error","error while saving the chnaged field.","Error:");
        		
        	        },
        
        error: function (e) {
            console.log(e);
        }
        
	});
	updateGovArchiveExec(seqNo, columnName, value);
//}



	
	//if(JsonObj.checkSave)
    	

	//alert(seqNo + " " + columnName + " " + value);
}


function updateGovArchiveExec(seqNo,columnName,value){
	$.ajax({
        url: "governanceArchiveExecutionSaveServlet",
        type: 'POST',
        data: {seqNum:seqNo, colName:columnName, Value:value},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Data : " ,data);
        },
        error: function (e) {
            console.log(e);
        }
        
	});
}

function updateParentDate(seqNum, columnName, value){
	
	var currentIndex = parseInt(seqNum-1);

	var parentClassName = columnNameToClassName(columnName)
	for(var i = currentIndex; i >= 0; i--){
		var level = $('.archiveLevel').eq(i).val();
			if(level == "1"){
				$('.'+parentClassName).eq(i).val(value); 
				break;
			}
	}
}

function updateChildParentDate(seqNum, columnName, value){
	
	var currentIndex = parseInt(seqNum-1);

	var parentClassName = columnNameToClassName(columnName)
	for(var i = currentIndex; i >= 0; i--){
		var level = $('.archiveLevel').eq(i).val();
			if(level == "1"){
				$('.'+parentClassName).eq(i).val(value); 
				break;
			}
	}
}

function updateChildDate(seqNum, columnName, value){
	var currentIndex = parseInt(seqNum-1);
	var curlevel=$('.archiveLevel').eq(currentIndex).val();
	var parentClassName = columnNameToClassName(columnName)
	if(curlevel=="3"){
		var subchildflag=false;
		for(var i = currentIndex; i >= 0; i--){ 
		var level = $('.archiveLevel').eq(i).val();
			if(level == "2" && subchildflag==false){
				$('.'+parentClassName).eq(i).val(value); 
				subchildflag=true;
				}
			}
			}
	}

function getPreviousValue(valuePrev, columnName, fieldName, index){
	
	var prevValue = "";
	
	switch(columnName){
	
	case 'taskType':
		/*prevValue = (valuePrev == '')? 'Activity': valuePrev;	
		//$("."+fieldName).eq(index).find("option[value='"+prevValue+"']").attr("selected","selected");
		$("."+fieldName).eq(index).val(prevValue);
		break;*/
		
	case 'planSrt':
		
	case 'planEnd':
		
	case 'actSrt':
		
	case 'actEnd':
		
	case 'majorDependencies':
		
	case 'remark':
		$("."+fieldName).eq(index).val(prevValue);
		break;
		
	case 'status':
		var class_name = $(".colorCode").eq(index).attr('class');
		$(".colorCode").eq(index).attr('class',"statusRed statusCode colorCode");
		break;
		
	case 'assignedTo':
		var option  = Options(user,prevValue);
		$("select.assignedToDrop").eq(index).html(option);
		$('select.assignedToDrop').eq(index).selectpicker("refresh");
		$('select.assignedToDrop').eq(index).selectpicker();
		//$("div.assignedToDrop").eq(index).find("button.bs-deselect-all").eq(1).click();
		//$('.select.assignedToDrop').selectpicker('refresh');
		/*var valArr = prevValue.split(",");
		for(var i = 0; i<valArr.length; i++){
			var text = $("select.assignedToDrop option[value='"+valArr[i]+"']").eq(index).text();
			
			$('select.assignedToDrop .filter-option').eq(index).text(text);
			
			$('select.assignedToDrop').eq(index).val(valArr[i]);
		}*/
		break;
	}
	return 	prevValue;
}

 function SaveInfoNotification(seqNo, columnName, value)
 {
	/* var taskId =$(".taskId").eq(seqNo-1).html();
	   if (columnName=="taskType") 
		   notification("info","In Task id "+taskId+" taskType changed to "+value,"Info:");
	   
	   else if (columnName=="assignedTo") 
		   notification("info","Task Id"+taskId+"assigned to "+value,"Info:");
	   
	   else if (columnName=="planSrt") 
		   notification("info","In Task id "+taskId+" plan start date changed to "+value,"Info:");
	   
	   else if(columnName=="planEnd")
		   notification("info","In Task id "+taskId+" plan end date changed to "+value,"Info:");
	   
	   else if(columnName=="actSrt") 
		   notification("info","In Task id "+taskId+" actual start date changed to "+value,"Info:");
	   
	   else if(columnName=="actEnd")
		   notification("info","In Task id "+taskId+" actual end date changed to "+value,"Info:");
	   
	   else if(columnName=="completion")
		   notification("info","In Task id "+taskId+" % completion changed to "+value+"%","Info:");
	   
	   else if(columnName=="status")
		   notification("info","In Task id "+taskId+" Changed "+value+" for status.","Info:");
	   
	   else if (columnName=="majorDependencies")
		   notification("info","In Task id "+taskId+" major dependencies filled with "+value,"Info:");
	   
	   else if (columnName=="remark")
		   notification("info","In Task id "+taskId+" remarks filled with "+value,"Info:");*/
 }
 
 function userAppendFunction(optionlist,value1) {
    //console.log(optionlist);
    var userArrayList = optionlist.split(',').slice(1);
    //console.log(userArrayList);
    var options = "";
    $.each(userArrayList, function(key, value){
        //var getUser = "user"+count.toString();
        var userList = (value);
         if(value1.includes(userList.toString()))
          options += "<option value='"+userList+"' selected>"+userList+"</option>";
      else
          options += "<option value='"+userList+"'>"+userList+"</option>";
    });
    return options;
}

function levlflag(level){
	var lvl=level;
	var displayflag="";
	if(lvl==3)
        {
		var displayflag="display:none;";
		console.log("METHOD INVOKES in 3rd Level");
		}
		else
		{
			var displayflag="display:block;";	
			console.log("METHOD INVOKES in 1st & 2nd Level");
		}
		
	return displayflag;
}


