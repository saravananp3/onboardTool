$(document).ready(function()
{
	governanceDataretrieveAjaxCall();
});

function governanceDataretrieveAjaxCall()
{
    $.ajax({
        url: "governanceDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve json array----->",data);
            AddTemplateData = data;
            
            if (!$.isArray(data)) {
                data = [data];
                AddTemplateData=[data];
            }
            
            var waveId = "";
            
            $.each(data, function(key, value){
                /*console.log("FULL NAME " + value.Type);*/
                var manadatory="class='required_fie'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                waveId = value.WaveId;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
                var delete_icon="<div class='deletepopup' style='display:none;'></div>";
                var Value=value.Value;
                
                if(value.Mandatory=="No")
                {
                    manadatory="";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                }
                
                if(Type=="Text box")
                {
                    var inputtext="<div class='form-group InputField' id ='"+ColumnName+"_Row'>\n" +
                        "<label class='control-label' for='governance'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputFields').append(inputtext);
                }
                else if(Type=="Datepicker")
                {
                	var inputdate="<div class='form-group InputField' id='"+ColumnName+"_Row'>" +
                        "<label class='control-label' for= 'governance'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#inputFields').append(inputdate);
                    }
                else if(Type=="Dropdown")
                {
                	var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'><label class='control-label' for= 'governance'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                        "<select style = 'width:100%;' class ='form-control' id='"+ColumnName+"'name='"+ColumnName+"'>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=sub_option.split(",");
                    for(var i=0;i<option.length;i++) {
                        var select = "";
                        if(Value.includes(option[i])){
                         select = "selected";
                        }
                        inputdrop += "<option label='"+ option[i] + "' class='control-label' for= 'governance' "+select+">" + option[i] + "</option>";
                    }
                    inputdrop +="</select></div>";
                    $('#inputFields').append(inputdrop);
                }
                else if(Type=="Check box")
                {
                    var inputcheck= "<div class='form-group'>"+
                        "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
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
                        inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                            option[i]+"</label>";
                    }
                    inputcheck +="</div>";
                    $('#inputFields').append(inputcheck);

                }
                else if(Type=="Radio box")
                {
                    var inputdrop= "<div class='form-group'>"+
                        "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span></div></label>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    for (var i=0; i<option.length; i++){
                        var check = "";
                        if(Value.includes(option[i])){
                            check = "checked";
                        }
                        inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                            option[i]+"</label>";
                    }
                    inputdrop +="</div>";
                    $('#inputFields').append(inputdrop);

                }
                else if(Type=="file")
                {
                    inputfile="<div class='form-group'>\n" +
                        "<label class='control-label' for='formInput198'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                        "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                        "</div>";
                    $('#inputFields').append(inputfile);

                }
                else if(Type=="Text area")
                {
                    var inputtext="<div class='form-group'>\n" +
                        "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                         "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#inputFields').append(inputtext);
                }
                else if(Type=="MultiselectDropdown")
                {
                	var Options=value.options;
                	var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'><label class='control-label' for= 'governance'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                    "<select multiple data-live-search='true' style = 'width:100%;' class ='form-control multiselect' id='"+ColumnName+"'name='"+ColumnName+"' multiple data-actions-box='true'>";
                
                var sub_option = Options.substring(0, Options.length - 1);
                var option=Options.split(",");
                for(var i=0;i<option.length;i++) {
                    var select = "";
                    if(Value.includes(option[i])){
                     select = "selected";
                    }
                    inputdrop += "<option label='"+ option[i] + "' class='control-label' for= 'governance' "+select+">" + option[i] + "</option>";
                }
                inputdrop +="</select></div>";
                $('#inputFields').append(inputdrop);
                if(Options==""){
                $("#infopopup_btn").click();
                return false;
                }
            }
            });
            
            $("#wave_Id").val(waveId);
            $(".multiselect").selectpicker();
            
            var script="<script>$('.datepicker1').datepicker({\n" +
                "format: \"mm/dd/yyyy\",\n"+
                "autoclose: true\n"+
                "});<\/script>";
            $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
}