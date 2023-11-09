$(document).ready(function(){
	archiveRetentionDataRetrieve();
	$(document).on('change','.dateUsedType',function(){
       	var nameAttr = $(this).attr('name');	
       	var classAttr = $(this).attr('class');
       	var classArr = classAttr.split(" ");
       	var className = classArr[1];
       	var Index= $(this).index('.'+className);
       	var value= $("input:radio[name='"+nameAttr+"']:checked").val();
	    $(".dateUsedColumn").eq(Index).hide();
	    $(".dateUsedDate").eq(Index).hide();
       	if(value=="column")
       	$(".dateUsedColumn").eq(Index).show();
	    else if(value=="date")
		$(".dateUsedDate").eq(Index).show();
  });
});

$(document).on('change','.retentionCheck', function(){
	
	var seqNum = $(this).index(".retentionCheck");
	var nameReadOnly = $(".conditions").eq(seqNum).attr("readonly");
	if(nameReadOnly)
	{
		$(".conditions").eq(seqNum).removeAttr("readonly");
		$(".ColumnValue").eq(seqNum).removeAttr("disabled");
		$(".ColumnDate").eq(seqNum).removeAttr("disabled");
		$(".dateUsedColumn").eq(seqNum).removeAttr("readonly");
		$(".dateUsedDate").eq(seqNum).removeAttr("disabled");
		$(".descp").eq(seqNum).removeAttr("readonly");
		notification("info","Seleted row is editable.","Info:");
	}
	else
	{
		$(".conditions").eq(seqNum).prop("readonly", true);
		$(".ColumnValue").eq(seqNum).prop("disabled", true);
		$(".ColumnDate").eq(seqNum).prop("disabled", true);
		$(".dateUsedColumn").eq(seqNum).prop("readonly", true);
		$(".dateUsedDate").eq(seqNum).prop("disabled", true);
		$(".descp").eq(seqNum).prop("readonly", true);
		notification("info","Seleted row is non-editable.","Info:");
	}	

});

$(document).on('mouseenter','input:readonly',function()
		{
			notification("info","Select the check box to make the current row as editable.","Info:");
		});	
		$(document).on('mouseenter','input:disabled',function()
				{
					notification("info","Select the check box to make the current row as editable.","Info:");
				});	
		$(document).on('mouseenter','textarea:readonly',function()
				{
					notification("info","Select the check box to make the current row as editable.","Info:");
				});	


function archiveRetentionDataRetrieve(){
	
	$.ajax({
        url: "archiveRetentionDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $("#contentInfoList").html("");
        	 var contentInfo = data[0].ContentInfo;
        	 var contentInfoListArray = contentInfo.split("::");
        	 for( var i = 0;i<contentInfoListArray.length;i++ )
        		 $("#contentInfoList").append("<li>"+contentInfoListArray[i]+"</li>");
        	 $("#RetentionTable").html("");
        	 var rowCount=0;
             $.each(data[1], function(key, value){
            	 rowCount++;
            	 var checkBox =(value.retentionCheck=="true")?'checked':'';
            	 var dateUsedCol =((value.dateUsedType == 'column') ? value.dateUsed:'');
            	 var readonly =(value.retentionCheck=="true")?'':'readonly';
            	 var disabled =(value.retentionCheck=="true")?'':'disabled';
            	 var dateUsedDat =((value.dateUsedType == 'date') ? value.dateUsed:'');
            	 var columnOption =((value.dateUsedType == 'column' || value.dateUsedType == '') ? 'checked':'');
            	 var dateOption = ((value.dateUsedType == 'date') ? 'checked':'');
            	 var columnStyle  = ((value.dateUsedType == 'column' || value.dateUsedType == '') ? '':'display:none;');
            	 var dateStyle = ((value.dateUsedType == 'date') ? '':'display:none;');
            	 var Row="<tr class = 'rowClass' style ='height: 140px;'>"+
            	 "<td style='text-align:center;vertical-align: middle;'><input type ='checkbox' class='retentionCheck' value='"+value.retentionCheck+"' "+checkBox+"></td>" +
            	 "<td style='text-align:center;vertical-align: middle;' class='retentionLevel'>"+value.retentionLevel+"</td>" +
            	 "<td style='text-align:center;vertical-align: middle;'><textarea rows='2' cols='40' style='height:100px;' class='conditions' "+readonly+">"+value.condition+"</textarea></td>" +
            	 "<td style='text-align:center;vertical-align: middle;'>" +
            	 "<input type ='radio' name='dateUsedType"+(rowCount)+"' class='dateUsedType ColumnValue' value='column' "+columnOption+" "+disabled+" /> Field &nbsp;"+
            	 "<input type ='radio' name='dateUsedType"+(rowCount)+"' class='dateUsedType ColumnDate' value='date' "+dateOption+" "+disabled+" /> Date"+
            	 "<br/>"+
            	 "<br/>"+
            	 "<input type = 'text' class = 'dateUsedColumn hideField' style='"+columnStyle+"' value='"+dateUsedCol+"' "+readonly+">"+
            	 "<input type = 'text' class = 'dateUsedDate datepicker1 hideField' style ='"+dateStyle+"' value='"+dateUsedDat+"' readonly "+disabled+">"+
            	 "</td>"+
            	 "<td style='text-align:center;vertical-align: middle;'><textarea rows='2' class='descp' "+readonly+">"+value.descp+"</textarea></td>" +
            	 "</td>" +
            	 "</tr>";
            	 $("#RetentionTable").append(Row);
             });
             var script="<script>$('.datepicker1').datepicker({\n" +
             "format: \"mm/dd/yyyy\",\n"+
             "clearBtn:true,"+
             "autoclose: true,\n"+
             "orientation: 'bottom',"+
             "});";
         
         $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}