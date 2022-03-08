$('#submit').click(function() {
	    	var projname = "";
	    	var phaseName = $('#phaseName').val();
	        var labelname = $('#label').val();
	        var columnname = $('#idname').val();
	        var type = $('#types').val();
	        var mandatory = $('#mandatory').val();
	        var num = 1;
	        var options = "";
	        if (type == "Check box") {
	            num = $('#number').val();
	            var length = $('.checkclass').length;
	            for (var i = 1; i <= length; i++) {
	                var checklabel = $('#label' + i).val();
	                options += checklabel + ",";
	            }
	        } else if (type == "Radio box") {
	            num = $('#radio_number').val();
	            var length = $('.radioclass').length;
	            for (var i = 1; i <= length; i++) {
	                var radiolabel = $('#Rlabel' + i).val();
	                options += radiolabel + ",";
	            }

	        } else if (type == "Dropdown") {
	            num = $('#drop_number').val();
	            var length = $('.dropclass').length;
	            for (var i = 1; i <= length; i++) {
	                var drplabel = $('#drp_label' + i).val();
	                options += drplabel + ",";
	            }

	        }
	      if(labelname != '' && columnname !='' && type !='' && mandatory !='')
	      {
	    	  var checkNotify = true;
	    	  var phaseId = $("#Id").val();
	        $.ajax({
	            url: "phaseAddServlet",
	            type: 'POST',
	            data: {phaseId:phaseId,phaseName:phaseName,LabelName:labelname,ColumnName:columnname,Type:type,Mandatory:mandatory,Options:options,operation:"NewPhase"},
	            dataType: "json",
	            success: function (data) {
	                var required = "";
	                console.log("data add---->",data);
	                var num=data.Seq_Num;
	                var required_field = "";
                    var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";	
	                if(data.AddStatus)
	               {
                    if (data.Mandatory == "Yes"){
	                    required_field = "class = 'required_fie'";
	                    delete_icon="<div class='deletepopup' style='display:none;'></div>";
	                }
	                
	                 if(data.Type=="Text box")
	                {
	                    var inputtext="<div class='form-group InputField'>"+
	                        "<label class='control-label' for='governance'>"+data.LabelName+"<span "+required_field+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
	                        "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    
	                    $('#inputFields').append(inputtext);
	                }
	                else if(data.Type=="Datepicker")
	                {
	                    var inputdate="<div class='form-group InputField'>"+
	                        "<label class='control-label' for= 'opportuity'>"+data.LabelName+"<span "+required_field+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
	                        "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    $('#inputFields').append(inputdate);
	                    var script="<script>$('.datepicker1').datepicker({\n" +
	                        "format: \"mm/dd/yyyy\",\n" +
	                        "autoclose: true\n" +
	                        "});<\/script>";
	                    $('#scripttag').append(script);
	                }
	                else if(data.Type=="Radio box")
	                {
	                    var input="";
	                    input+= "<div class='form-group InputField'>"+
	                        "<label class='control-label' for= 'governance'>"+data.LabelName+"<span "+required_field+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></br>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++){

	                        input+= "<label class = 'control-label' for = 'governance'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+data.ColumnName+num+"'/>&nbsp;&nbsp;"+
	                            option[i]+"</label></br>";

	                    }
	                    input +="</div>";
	                    $('#inputFields').append(input);
	                }
	                else if(data.Type=="Check box")
	                {
	                    var input="";
	                    input+= "<div class='form-group InputField'>"+
	                        "<label class='control-label' for= 'governance'>"+data.LabelName+"<span "+required_field+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></br>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++) {

	                        input += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='" + data.ColumnName+num+"'/>&nbsp;&nbsp;" +
	                            option[i] + "</label></br>";
	                    }
	                    input +="</div>";
	                    $('#inputFields').append(input);
	                }
	                else if(data.Type=="Dropdown")
	                {
	                    var select="";
	                    select+= "<div class='form-group InputField'><label class='control-label' for= 'governance'>"+data.LabelName+"<span "+required_field+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
	                        "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for(var i=0;i<option.length;i++) {
	                        select += "<option label=" + option[i] + " class='control-label' for= 'governance' >" + option[i] + "</option>";
	                    }
	                    select +="</select></div>";
	                    $('#inputFields').append(select);
	                }
	               }
	                else
	                	{
	                	if (data.checkLabel)
		                {
		                	checkNotify = false;
		                	notification("warning","Label name is already exist.","Warning");
		                    return false;
		                }
	                	else
	                		notification("error","Field not added.","Error");
	                	}
	                $('#label').val("");
	                $('#idname').val("");
	                $('#types').val("Text box");
	                $('#number').val("");
	                $('.hidefield').hide();
	                $('#radio_number').val("");
	                $('#drop_number').val("");
	                $('#mandatory').val("Yes");
	              $("#add_close_id").click();
	            	  
	            },
	        
	       
	            error: function (e) {
	                console.log(e);
	            }
	        });
	      }
	      
	      else{
	    	  notification("warning","Please fill the value in fields.","Warning");
	        	//alert("Please fill the value in fields");
	        	return false;
	        	
	        }
	        });
