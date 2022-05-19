var checkScope = false;
var checkRoles = false;

$(document).ready(function() {

	$.ajax({
		url: "OpportunityListServlet",
		type: 'POST',
		dataType: "json",
		success: function(data) {
			console.log(data);
			
			var phaseOptions = "<option selected class='options Select' value='Select'>Select</option>"
			$.each(data[3][1], function(key, value) {
				phaseOptions += "<option class='phaseOptions options' value='" + value.phaseName + "'>" + value.phaseName + "</option>";
			});
			var waveOptions = "<option selected class='options Select' value='Select'>Select</option>"
			$.each(data[3][1], function(key, value) {
				var phase = ((value.phaseName).replaceAll(" ", "")).replaceAll("-", "");
				waveOptions += "<option class='options waveOptions " + phase + "' value='" + value.waveName + "'>" + value.waveName + "</option>";

			});
			var resourceOptions = "<option selected class='options Select' value='Select'>Select</option>"
			$.each(data[1][0], function(key, value) {
				resourceOptions += "<option class='options resourceOptions' value='" + value.resourcesList + "'>" + value.resourcesList + "</option>";

			});
			
			$.each(data[2], function(key, value) {
				
				var opportunityName = value.OpportunityName;
				var opportunityId = value.OpportunityId;

				var t_row = "<tr class='rowClass'>"
					+ "<td><input type = 'text' class ='oppName' value = '"+opportunityName+"' style='width:100%; border:none;' data-bs-toggle='tooltip' data-bs-placement='top' title='"+opportunityName+"'></td>"
					+ "<td>" + "<select class='form-select phase' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					phaseOptions +
					"</select>" + "</td>"
					+ "<td>" + "<select class='form-select wave' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					waveOptions +
					"</select>" + "</td>"
					+ "<td>" + "<select class='form-select wave' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
					resourceOptions +
					"</select>" + "</td>"
					+ "</tr>";
				$('#applicationList').append(t_row);
				
				/*$('.resource').selectpicker();*/

				    $.fn.pageMe = function(opts) {
					var $this = this,
						defaults = {
							perPage: 7,
							showPrevNext: false,
							hidePageNumbers: false
						},
						settings = $.extend(defaults, opts);

					var listElement = $this;
					var perPage = settings.perPage;
					var children = listElement.children();
					var pager = $('.pager');

					if (typeof settings.childSelector != "undefined") {
						children = listElement.find(settings.childSelector);
					}

					if (typeof settings.pagerSelector != "undefined") {
						pager = $(settings.pagerSelector);
					}

					var numItems = children.size();
					var numPages = Math.ceil(numItems / perPage);

					pager.data("curr", 0);

					if (settings.showPrevNext) {
						$('<li><a href="#" class="prev_link"><<</a></li>').appendTo(pager);
					}

					var curr = 0;
					while (numPages > curr && (settings.hidePageNumbers == false)) {
						$('<li><a href="#" class="page_link">' + (curr + 1) + '</a></li>').appendTo(pager);
						curr++;
					}

					if (settings.showPrevNext) {
						$('<li><a href="#" class="next_link">>></a></li>').appendTo(pager);
					}

					pager.find('.page_link:first').addClass('active');
					pager.find('.prev_link').hide();
					if (numPages <= 1) {
						pager.find('.next_link').hide();
					}
					pager.children().eq(1).addClass("active");

					children.hide();
					children.slice(0, perPage).show();

					pager.find('li .page_link').click(function() {
						var clickedPage = $(this).html().valueOf() - 1;
						goTo(clickedPage, perPage);
						return false;
					});
					pager.find('li .prev_link').click(function() {
						previous();
						return false;
					});
					pager.find('li .next_link').click(function() {
						next();
						return false;
					});

					function previous() {
						var goToPage = parseInt(pager.data("curr")) - 1;
						goTo(goToPage);
					}

					function next() {
						goToPage = parseInt(pager.data("curr")) + 1;
						goTo(goToPage);
					}

					function goTo(page) {
						var startAt = page * perPage,
							endOn = startAt + perPage;

						children.css('display', 'none').slice(startAt, endOn).show();

						if (page >= 1) {
							pager.find('.prev_link').show();
						}
						else {
							pager.find('.prev_link').hide();
						}

						if (page < (numPages - 1)) {
							pager.find('.next_link').show();
						}
						else {
							pager.find('.next_link').hide();
						}

						pager.data("curr", page);
						pager.children().removeClass("active");
						pager.children().eq(page + 1).addClass("active");

					}
				};
			});
			
			 $(document).ready(function() {
                $('#example3').DataTable();
            });
			

		}

	})
});

$(document).on('click', '#saveApplicationList', function(e) {
    var validation = false;
    var JsonArray = [];
    var checkDuplicateRole = true;
    for (var i = 0; i < $('.rowClass').length; i++) {
        var inputs = {};
        var opportunityName = $('.oppName').eq(i).val();
        var phase = $('.phase').eq(i).val();
        var wave = $('.wave').eq(i).val();
        var resource = $('.resource').eq(i).val();
        checkDuplicateRole = true;
        validation = true;
        inputs['seq_no'] = i + 1;
        inputs['opportunityName'] = opportunityName;
        inputs['phase'] = phase;
        inputs['wave'] = wave;
        inputs['resource'] = resource;
        JsonArray.push(inputs);
    }
    if (validation && checkDuplicateRole) {
        console.log("JsonArray Retrieve--->", JsonArray);
		applicationListSaveAjaxcall(JsonArray);
 
    }
    else {
        if (!validation)
            notification("warning", "Please fill atleast one row fields.", "Warning");
        if (!checkDuplicateRole)
            notification("warning", "Please provide unique roles.", "Warning");
        checkRoles = false;
    }
    e.preventDefault();
});

function applicationListSaveAjaxcall(JsonArray) {
    var checkAjax = false;
    $.ajax({
        url: "applicationList",
        type: 'POST',
        data: { JsonArray: JSON.stringify(JsonArray) },
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("SAVE DATA:", data);
            JsonObject = data;
            if (data) {
                notification("success", "Saved successfully.", "Note:");
                checkRoles = true;
            }
            else {
                notification("error", "Error occured while saving.", "Error:");
                checkRoles = false;
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}

$(document).on('change','.phase',function(){
$(".waveOptions").hide();
var phaseName = $(this).val();
if(phaseName!="Select")
    {
    $("."+(phaseName.replaceAll(" ","")).replaceAll("-","")).show();
    $(".wave").val("Select");
    }
    else
    {
    $(".waveOptions").show();
    }
});

$(document).on('change','.filter',function(){
   /* var category = $("#category").val();*/
    var phase = $(".phase").val();
    var wave = $(".wave").val();
    filterAjaxCall(category,phase,wave);
});
function filterAjaxCall(category,phase,wave)
{
    $.ajax({
        url: "OpportunityFilterListServlet",
        type: 'POST',
        dataType: "json",
        data:{wave:wave,category:category,phase:phase,bySearch:false},
        success: function (data) {
            console.log("Data:", data);
             if (!$.isArray(data)) {
                 data = [data];
             } 
        },
        error: function (e) {
            console.log(e);
        }
});
}
