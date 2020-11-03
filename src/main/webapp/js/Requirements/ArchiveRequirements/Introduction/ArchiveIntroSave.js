var typingTimer;                //timer identifier
	var doneTypingInterval = 1000;  //time in ms, 5 second for example
	var classnameattr="";
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
		var classname=$(event).attr('class');
		var fieldname=getfieldname(classname);
		var value="";
		var checkValue = false;
		if(fieldname!="assumption"){
		value=$("."+classnameattr).val();
		if(value.length >= 100)
			checkValue = true;
			if(checkValue && fieldname == 'scope')
				$('#rolesNext').attr('disabled', false);
			else
				$('#rolesNext').attr('disable', true);
		}
		else{
			checkValue = true;
			var length=$("."+classnameattr).find("li").length;
			for(var i=0; i<length; i++){
						value+=$("."+classnameattr).find("li").eq(i).html()+"::";
						}
			value=value.substring(0,value.length-2);
		}
	
			if (!checkValue)
				notification("warning","Please fill the value more than 100 chars.","Warning:");
			
			else 
				ArchiveIntroSaveAjaxcall(fieldname,value.replace("<br>",""));
			
		
		//ArchiveIntroSaveAjaxcall(fieldname,value.replace("<br>",""));
	}
	function getfieldname(classname) {
		var fieldname="";
		if(classname.includes("Purpose")){
		fieldname="purpose";
		classnameattr="Purpose";
		}
		else if(classname.includes("Scope")){
		fieldname="scope";
		classnameattr="Scope";
		}
		else if(classname.includes("Assumption")){
		fieldname="assumption";
		classnameattr="Assumption";
		}
			
		return fieldname;
	}
	function ArchiveIntroSaveAjaxcall(columnName,value){
		var JsonObject=[];
		var checkAjax =false;
		
		$.ajax({
	        url: "ArchiveIntroSave",
	        type: 'POST',
	        data : {columnName:columnName, value : value},
	        async: false,
	        dataType: "json",
	        success: function (data) {
	        	console.log("SAVE DATA:",data);
	        	JsonObject = data;
	        	if(data.checkUpdate)
	        		notification("success","Saved successfully.","Note:");
	        	else
	        		notification("error","Error occured while saving.","Error:");
	        },
	        error: function (e) {
	            console.log(e);
	        }
		});
	}

	
		//$(document).on('click','#saveRoleResponse', function(){
	$("#saveRoleResponse").click( function(e){		
	var validation = true;
			var JsonArray = [];
			for(var i = 0; i<$('.rowClass').length; i++){
				var inputs = {};
				var role = $('.role').eq(i).val();
				var name = $('.name').eq(i).val();
				var title = $('.title').eq(i).val();
				var approver = $('.approverpurpose').eq(i).val();
				 
				if(!checkFieldValues(role, name, title, approver))
					validation = false;
				inputs['seq_no'] = i+1;
				inputs['role'] = role;
				inputs['name'] = name;
				inputs['title'] = title;
				inputs['approverpurpose'] = approver;
				JsonArray.push(inputs);
				
			}
			if(validation)
				archiveRolesResponseSaveAjaxcall(JsonArray);
			else
				notification("warning","Please fill the all fields.","Warning");
	        e.preventDefault();	
	});
		
		
	function checkFieldValues(role, name, title, approver){
		
		var validationFlag = false;
		if((role != '' && role != undefined && role != null) && (name != '' && name != undefined && name != null) && 
				(title != '' && title != undefined && title != null) && (approver != '' && approver != undefined && approver != null))
				validationFlag = true;
		
		return validationFlag;
	}
		
	function archiveRolesResponseSaveAjaxcall(JsonArray){
		
		var checkAjax =false;
		
			$.ajax({
		        url: "archiveRolesResponseSaveServlet",
		        type: 'POST',
		        data : {JsonArray:JSON.stringify(JsonArray)},
		        async: false,
		        dataType: "json",
		        success: function (data) {
		        	console.log("SAVE DATA:",data);
		        	JsonObject = data;
		        	if(data.SaveStatus)
		        		notification("success","Saved successfully.","Note:");
		        	else
		        		notification("error","Error occured while saving.","Error:");
		        },
		        error: function (e) {
		            console.log(e);
		        }
			});
		}
	