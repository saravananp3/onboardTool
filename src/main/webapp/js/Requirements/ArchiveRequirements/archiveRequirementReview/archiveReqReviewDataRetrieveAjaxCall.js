$(document).ready(function()
{
	reviewDataRetrieveAjaxCall();
});

function reviewDataRetrieveAjaxCall()
{
	$.ajax({
        url: "archiveReqReviewDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Review data --->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 // purpose and scope
        	 if(data[0][0].checkData)
        	  {
        		 var purpose = "<h3 class='panel-title'>Purpose</h3><br>";
        		     purpose += "<pre style='font-family:verdana;font-size:100%;width:800px;' class = 'OppInfoPreview'><b>Purpose</b> : "+data[0][0].Purpose+" </pre>";
        		 $("#purposeInfoPreview").html(purpose);
        		 var scope = "<h3 class='panel-title'>Scope</h3><br>";
    		     scope += "<pre style='font-family:verdana;font-size:100%;width:800px;' class = 'OppInfoPreview'><b>Scope</b> : "+data[0][0].Scope+" </pre>";
    		 $("#scopeInfoPreview").html(scope);
    		 var assumptionValArray = (data[0][0].Assumption).split("::");
    		 var assumptionVal ="";
    		 for(var i=0;i<assumptionValArray.length;i++)
    			 assumptionVal += "<li>"+assumptionValArray[i].trim()+"</li>";
    		 var Assumption = "<pre style='font-family:verdana;font-size:100%;width:800px;' class = 'OppInfoPreview'><b>Assumptions</b> : "+assumptionVal+" </pre>";
		 $("#AssumptionInfoPreview").html(Assumption); }
        	 // Roles and Responsibility
        	 var checkRoles =true;
        	 $.each(data[0][1],function(key,value)
        	 {
        		 var row ="<tr >"+
        		           "<td>"+value.role+" </td>"+
        		           "<td>"+value.name+"</td>"+
        		           "<td>"+value.title+"</td>"+
        		           "<td>"+value.approverpurpose+"</td>"+
        		           "</tr>";
        		  if(!checkFieldValues(value.role, value.name, value.title, value.approverpurpose))
                        checkRoles =false;
        			  $("#roleResponseInfoPreview").append(row);
        	  });
        	 if(!checkRoles)
        	 {
        		$("#ReviewNextBtn").attr("disabled",true);
        		$("#nextBtn").attr('title',"Please Fill all the fields in roles and responsibility");
        		$("#nextBtn").attr('data-toggle',"tooltip");
        		$("#nextBtn").tooltip();
        	  }
        	 else
         		$("#ReviewNextBtn").attr("disabled",false);

        	 //legacy app info
        	 $.each(data[1][0],function(key,value)
                	 {
                		 var input = "<tr><td>"+value.LabelName+"</b> </td><td>"+value.Value+"</td></tr>";
                		 $("#AppInfoPreview").append(input);
                	  });
        	 
        	 // archive environment
        	 $.each(data[1][1][0],function(key,value)
                	 {
                		 var input = "<tr><td>"+value.DevName+"</td><td>"+value.TestName+"</td><td>"+value.StageName+"</td><td>"+value.ProdName+"</td></tr>";
                		 $("#ArchiveEnvInfoPreview").append(input);
                	  });
        	 $.each(data[1][1][1],function(key,value)
                	 {
                		 var input = "<tr><td>"+value.DevServerIp+"</td><td>"+value.TestServerIp+"</td><td>"+value.StageServerIp+"</td><td>"+value.ProdServerIp+"</td></tr>";
                		 $("#ArchiveEnvServerInfoPreview").append(input);
                	  });
        	 var files= data[1][2].listOfScreenShots;
        	 var fileList = files.split(",");
        	 for(var i=0;i<fileList.length;i++)
             {
                		 var input = "<li>"+fileList[i]+"</li>";
                		 $("#legacyAppInfoReview").append(input);
                	  }
        	 var contentInfo = (data[2][0].ContentInfo).split("::");
        	 for(var i=0;i<contentInfo.length;i++)
        	 $("#RetentionDetailsInfoPreview").append("<li>"+contentInfo[i]+"</li>");
        	 if(data[2][1][0].checkExistance){
        	 $.each(data[2][1],function(key,value)
                	 {
        		         var check = value.retentionCheck=="true"?"checked":"";
                		 var input = "<tr><td align ='center'><input type='checkbox' disabled "+check+"/></td><td>"+value.retentionLevel+"</td><td>"+value.condition+"</td><td><b>Field Type:</b> "+value.dateUsedType+"<br><b>value:</b> "+value.dateUsed+"</td><td>"+value.descp+"</td></tr>";
                		 $("#RetentionInfoPreview").append(input);
                	  });
        	 }
        	 
        	 $.each(data[3],function(key,value)
                	 {
        		         var check = value.retentionCheck=="true"?"checked":"";
                		 var input = "<tr><td align ='center'>"+value.req_in_scope+"</td><td>"+value.description+"</td></tr>";
                		 $("#BusinessReqTableInfoPreview").append(input);
                	  });
        	 var businessContentInfo = "<ul><li>Each requirement must be marked as In-Scope or Out-of-Scope for this project, with additional information specific to each requirement if necessary. </li><li>Requirement ID's are linked to test script ID's to ensure traceability from requirement to test execution. Requirement ID's may be formatted according to client needs.</li></ul>";
        	 if(data[4].checkData){
        		 businessContentInfo = "<ul>";
        		 var businessContentInfoArray = (data[4].businessreq).split("::");
        		 for(var i =0 ; i<businessContentInfoArray.length;i++)
        			 businessContentInfo+="<li>"+businessContentInfoArray[i]+"</li>";
        		 businessContentInfo+="</ul>";
        	 }
        	 $("#BusinessReqHeaderInfo").html(businessContentInfo);
              var functionalReqIdArray = ['FunctionReqDataReqInfoPreview','FunctionReqRetentionLegalReqInfoPreview','FunctionReqSecurityReqInfoPreview','FunctionReqUsabilityReqInfoPreview','FunctionReqAuditReqInfoPreview'];
              for(var j=0;j<functionalReqIdArray.length;j++)
            	  {
              var dataCheck = data[5][j][0].checkExistance; 
              $.each(data[5][j],function(key,value){    
            	         if(dataCheck){
                 		 var input = "<tr><td width='80px;'>"+value.reqId+"</td><td>"+value.reqInScope+"</td><td>"+value.reqType+"</td><td>"+value.req+"</td><td>"+value.additionInfo+"</td></tr>";
         		         $("#"+functionalReqIdArray[j]).append(input);
            	         }
                 	});
            	}
              var checkScreenReqData= data[6][0][0].checkData;
              if(checkScreenReqData)
            	{
            	  $.each(data[6][0],function(key,value){    
         	         
              		 var input = "<tr><td width='80px;'>"+value.reqId+"</td><td>"+value.screenDisplay+"</td><td>"+value.purpose+"</td><td>"+value.equivalentLegacy+"</td></tr>";
      		         $("#ScreenReqInfoPreview").append(input);
         	         
              	});
            	}
              var checkSearchFormReqData = data[6][1][0].checkData;
              if(checkSearchFormReqData)
               {
            	  $.each(data[6][1],function(key,value){    
          	         
               		 var input = "<tr><td width='80px;'>"+value.reqId+"</td><td>"+value.searchForm+"</td><td>"+value.searchField+"</td><td>"+value.fieldFormat+"</td><td>"+value.dataType+"</td><td>"+value.dataRetrieval+"</td><td>"+value.requiredField+"</td><td>"+value.searchField+"</td></tr>";
       		         $("#SearchFormInfoPreview").append(input);
          	         
               	});
            	  }
              //AbbrevationDescriptionInfoPreview
              var abbreviation = "<tr>"+
								  "<td>AD</td>"+
		    					   "<td>Active Directory Group</td>"+
								   "</tr>"+
								   "<tr>"+
								   "<td>BI</td>"+
			     				   "<td>Business Intelligence</td>"+
								   "</tr>"+
								   "<tr>"+
								   "<td>IA</td>"+
								   "<td>InfoArchive: InfoArchive is a repository that compresses and maintains data from business applications and data sources."+ 
								    "Data contained within the archive is no longer transactional and immutable (unable to be changed)."+ 
								    "Access to the archive is normally confined to a small group of users defined by security rules and roles."+ 
									"Data retention policies may be applied to data contained within the archive</td>"+
								    "</tr>"+
									"<tr>"+
									"<td>Read-Only</td>"+
									"<td>Date at which the legacy application data has been set to static use."+ 
									"There are no changes to be made to the data, no integration jobs running to alter the status of the data,"+ 
									"nor will any future changes be made to the data</td>"+
									"</tr>"+
									"<tr>"+
									"<td>REQ</td>"+
									"<td>Requirement</td>"+
									"</tr>"+
									"<tr>"+
									"<td>UAT</td>"+
									"<td>User Acceptance Testing</td>"+
									"</tr>"+
									"<tr>"+
									"<td>XML</td>"+
									"<td>Extensible Markup Format is used to define documents with a standard format that can be read by any XML-compatible application."+ 
									"It is a \"metalanguage\" that can be used to create markup languages for specific applications</td>"+
									"</tr>"+
									"</tbody>";
                 $("#AbbrevationDescriptionInfoPreview").html(abbreviation);
              //document revision
              var checkDocumentRevisionData = data[7][0].checkExistance;
              if(checkDocumentRevisionData)
            	{
            	  $.each(data[7],function(key,value){    
           	         
                		 var input = "<tr><td width='80px;'>"+value.date+"</td><td>"+value.version+"</td><td>"+value.documentChanges+"</td><td>"+value.changeAuthor+"</td></tr>";
        		         $("#documentRevisionsInfoPreview").append(input);
           	         
                	});
            	  }
              
              //addendum
              var checkDocumentRevisionData = data[8][0].checkExistance;
              if(checkDocumentRevisionData)
            	{
            	  $.each(data[8],function(key,value){    
           	         
                		 var input = "<pre style='font-family:verdana;font-size:100%;width:800px;' class = 'OppInfoPreview'><b>"+value.labelName+"</b> : "+value.addendumInfo+" </pre>";
        		         $("#addendumInfoPreview").append(input);
           	         
                	});
            	  }
            if(data[9].checkOverAllStatus)
            	{
            	  $("#ReviewNextBtn").hide();
            	  $("#button_id").hide();
            	  $("#ReviewPrevBtn").attr('onclick','location.href="ArchiveDecommPage.jsp";');
            	}
            var indexCount =0;
            $.each(data[10],function(key,value){
            	if(indexCount!=0)
            	{
      		  var input = "<tr><td width='80px;'>"+value.name+"</td><td>"+value.role+"</td><td>"+data[0][1][indexCount].title+"</td><td>"+value.approvalStatus+"</td></tr>";
		         $("#approvalInfoPreview").append(input);
            	}
            	indexCount++;
      	 });
            
        	     },
        error: function (e) {
            console.log(e);
        }
    });	
}
function checkFieldValues(role, name, title, approver){
	
	var validationFlag = false;
	if((role != '' && role != undefined && role != null) && (name != '' && name != undefined && name != null) && 
			(title != '' && title != undefined && title != null) && (approver != '' && approver != undefined && approver != null))
			validationFlag = true;
	
	return validationFlag;
}