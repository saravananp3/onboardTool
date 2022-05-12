$('#license_update_submit').click(function() {
	var license_info = $("#license_info").val();
	var flag;

	$.ajax({
		url: "update_license_servlet",
		type: 'POST',
		data: { license_info: license_info, flag: flag },
		dataType: "json",
		success: function(data) {
			console.log("License Info", data);
			license_info = data.license_info;
			flag = data.flag;
			console.log(flag);
			if (flag == "Success") {
				notification("success", "License is Updated Successfully", "Success");
				setTimeout(function() {
					location.href = "License_info.jsp";
				}, 500);
			} else if (flag == "Invalid") {
				notification("error", "License is Invalid", "Error");
				setTimeout(function() {
					location.href = "License_info.jsp";
				}, 500);
			} else if (flag == "Expired") {
				notification("error", "License is Expired", "Error");
				setTimeout(function() {
					location.href = "License_info.jsp";
				}, 500);
			}


		}

	});

});
