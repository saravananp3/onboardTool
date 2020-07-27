function validateTriage(){
	$(".submitDisable").attr("disabled", true);
	$(".hidepen").hide();
	$(".hidedel").hide();
	var selected_seq = [];
	var selected_index = "";
	console.log("class total length"+$(".Template_Values").length);
	$(".Template_Values").each(function(i) {
		   if (this.checked) {
		       //alert("Checkbox at index " + i + " is checked.");
		       selected_seq.push(""+(i+1)+"");
		       selected_index += (i+1)+",";
		   }
		});
	selected_index = selected_index.substring(0,selected_index.length-1)
	$.ajax({
        url: "IntakeDetailsTriageAddTemplateFields",
        type: 'POST',
        data : {Selected_Index:selected_index},
        dataType: "json",
        success: function (data) {
        	console.log("data add template ; ",data);
        	if (!$.isArray(data)) {
        		data = [data];
                
            }
        	var index = 0;
        	$.each(data, function(key, value)
            {
            	if(index!=0)
            	{
            		console.log("FULL NAME " + value.Type);
                    var manadatory="class='required_fie'";
                    var disable_property = "disabled='disabled'";
                    var Type=value.Type;
                    var ColumnName=value.ColumnName;
                    var LabelName=value.LabelName;
                    var Value=value.Value;
                    var delete_edit_icon="<div class='edit deletealert' style='display:none;'></div>";
                    //var options=AddTemplateData[i].options.split(',');
                    if(value.Mandatory=="No")
                    {
                        manadatory="";
                        disable_property = "";
                        delete_edit_icon = "<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span>";
                    }
                    if(Type=="Text box")
                    {
                        var inputtext="<div class='form-group Inputvalue' id ='"+ColumnName+"_Row'>\n" +
                            "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n" +
                            "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                            "</div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputValue').append(inputtext);
                         }
                        }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>" +
                            "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n" +
                            "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                            "</div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputValue').append(inputdate);
                        }
                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>" + 
							"<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n"+
                            "<select style = 'width:100%;' class ='form-control' id = '"+ColumnName+"' name='"+ColumnName+"'>";
                        var Options=value.options;
                        //var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for(var i=0;i<option.length;i++) {
                            var select = "";
                            if(Value.includes(option[i])){
                             select = "selected";
                            }
                            inputdrop += "<option label=" + option[i] + " class='control-label' for= 'triage' "+select+">" + option[i] + "</option>";
                        }
                        inputdrop +="</select></div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputValue').append(inputdrop);
                        }
                      }
                    else if(Type=="Check box")
                    {
                        var inputcheck= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>"+
                            "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        var value_arr=Value.split(",");
                        for (var i=0; i<option.length; i++) {
                            var check = "";
                            var option_element=option[i];
                            if(value_arr.includes(option_element)){
                                check = "checked";
                            }
                            inputcheck += "<label class = 'control-label' for = 'triage'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>" +
                                option[i]+"</label>";
                        }
                        inputcheck +="</div>";
                        $('#inputValue').append(inputcheck);

                    }
                    else if(Type=="Radio box")
                    {
                        var inputdrop= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>"+
                            "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;' '></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for (var i=0; i<option.length; i++){
                            var check = "";
                            if(Value.includes(option[i])){
                                check = "checked";
                            }
                            inputdrop+= "<label class = 'control-label' for = 'triage'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>"+
                                option[i]+"</label>";
                        }
                        inputdrop +="</div>";
                        $('#inputValue').append(inputdrop);

                    }
                    else if(Type=="file")
                    {
                        inputfile="<div class='form-group Inputvalue'>\n" +
                            "<label class='control-label' for='triage'><div class='required_fie'>"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'' ></span></div></label>\n" +
                            "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                            "</div>";
                        $('#inputValue').append(inputfile);

                    }
                    else if(Type=="Text area")
                    {
                        var inputtext="<div class='form-group Inputvalue'>\n" +
                            "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                             "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                            "</div>";
                        $('#inputValue').append(inputtext);
                    }
                    else if(Type=="HiddenText")
            		{
            		var template_check=""; 
                    var inputtext="<div class='form-group Inputvalue' id ='"+ColumnName+"_Row' style ='display:none';>\n" +
                        "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+"<div class ='edit deletealert'></div></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputValue').append(inputtext);
            		}
            	}
            	
            	else
            	{
            		var indexValue = value;
            	  var index_no = indexValue.split(",");
            	  for(var i=0;i<index_no.length;i++)
            		  {
            	        console.log("index",index_no);
            	        $("#"+index_no[i]+"_Row").remove();
            	        //$(".Inputvalue").eq(index_no[i]-1).remove();
            		  }
            	}
            	index++;
        	});
        	var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "autoclose: true\n"+
            "});<\/script>";
        //$('#scripttag').html("");
        $('#scripttag').append(script);
        for(var i = 0; i<$(".inputValue").length;i++)
    	{
    	  var exist = $(".Inputvalue").eq(i).find("input").length;
    	  if($(".inputValue").eq(i).find("input").length)
    	 {
    		var name = $(".Inputvalue").eq(i).find("input").attr("name");
    		 if(name.startsWith("TriageAddInfo"))
    		 {
    			 $(".inputValue").eq(i).find("input").attr("name","TriageAddInfo"+(i+1));
    		 }
         } 
    	else if($(".Inputvalue").eq(i).find("select").length)
         {
    		var name = $(".Inputvalue").eq(i).find("select").attr("name");
   		   if(name.startsWith("TriageAddInfo"))
   		   {
   			 $(".inputValue").eq(i).find("select").attr("name","TriageAddInfo"+(i+1));
   		   }
    	 }
    		
    	}
        
        	$("#triage_temp_close_id").click();
        	$(".submitDisable").attr("disabled", false);
        },
        error: function (e) {
            console.log(e);
        }
    });
} 