var FieldClasses = ['taskTypeDrop','majorDep','assignedToDrop','planStart','planEnd','actStart','actEnd','remark'];
var checkAboveChild = true;
function checkPreviousRows(currentIndex,validationType,value){
	if(value == "")
		return true;
	 var checkAboveFields = true;
  if(validationType)
   {
	for(var i =currentIndex-1; i>=0;i--)
	{
	  var level = parseInt($(".archiveLevel").eq(i).val());
	  if(level==1)
		  break;   
	  else 
		{
		  
		  checkAboveFields = checkFieldValues(i);
	      	
		  if(!checkAboveFields)
	      		break;
		}
	}
}
  else
	  {
	  var levelone_count=0;
	  for(var i =currentIndex; i>=0;i--)
		{
		  var level = parseInt($(".archiveLevel").eq(i).val());
		  if(level==1)
		  {
			  checkAboveFields =  checkFieldValues(i+11);
			  levelone_count++;
		  }
		  
		}  
	  if(levelone_count==1)
		  checkAboveFields = true;
	  }
	return checkAboveFields;
  }
	/*else
	{
		for(var i =0; i<currentIndex;i++)
		{
		  var level = parseInt($(".archiveLevel").eq(i).val());
		  if(level==1)
		  {
			  checkAboveFields =  checkNextChildToParent(i+1);
			  if(!checkAboveFields)
		      		break;
		  }
		  
		}
	}
	*/	
	
function checkFieldValues(index)
{
	var checkField = false;
	for(var i=0;i<FieldClasses.length;i++)
	{
		var value = "";
		if(FieldClasses[i]=="assignedToDrop")
	     value = $("select."+FieldClasses[i]).eq(index).val();
		else
		value = $("."+FieldClasses[i]).eq(index).val();	
	  if(value!=""&&value!=undefined&&value!=null)
	  {
		  checkField = true;
		  break;
	  }
	}
	return checkField;
}
/*function checkFieldValues(index)
{
	var checkField = true;
	for(var i=0;i<FieldClasses.length;i++)
	{
		var value ="";
		if(FieldClasses[i]=="assignedToDrop")
	     value = $("select."+FieldClasses[i]).eq(index).val();
		else
		value = $("."+FieldClasses[i]).eq(index).val();	
	  if(value==""||value==undefined||value==null)
	  {
		  checkField = false;
		  break;
	  }
	}
	return checkField;
}*/
/*function checkNextChildToParent(index)
{
var checkField  = false;
for(var i=0;i<FieldClassNames.length;i++)
{
	var value ="";
	if(FieldClassNames[i]=="assignedToDrop")
     value = $("."+FieldClassNames[i]).eq(index).val();
	else
	value = $("select."+FieldClassNames[i]).eq(index).val();	
  if(value!=""&&value!=null&&value!=undefined)
  {
	  checkField = true;
	  break;
  }
}
return checkField;
}*/