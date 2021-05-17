$(document)
		.ready(
				function(e) {
					$("#serializecreateNewuser")
							.on(
									'submit',
									(function(e) {
										e.preventDefault();
										var mobnumbr = $('#mobNumbr').val();
										if (eval(mobnumbr.length < 10)) {
											alert("Mobile Number Should be Minimum 10 Digit");
											$('#mobNumbr').focus();
											return false;
										}

										var pincode = $('#postalCode').val();

										if (eval(pincode.length < 6)) {
											alert("Pincode Should be 6 Digit");
											$('#postalCode').focus();
											return false;
										}

										var passWordnew = $("#passWordnew")
												.val();
										var confirmPasswordnew = $(
												"#confirmPasswordnew").val();
										if (passWordnew != confirmPasswordnew) {
											alert("Password and Confirmpass does not matched....");
											$("#confirmPasswordnew").focus();
											return false;
										}
										var createNewusersData = $('#serializecreateNewuser').serialize();
								
										$.ajax({
													type : "POST",
													url : "saveNewUserDetails",
													dataType : "json",
													async : false,
													data :createNewusersData,
														success : function(jArray) {
														var result = jArray[0]["success"];
														if (result == "success") {
															alert("User Created Successfully....");
															document.location.reload()
														} else if (result == "denied") {
															alert("Username is already exist.... Please insert the correct username.... ");
															$('#userName').focus();
															return false;
														} else if (result == "DuplicateEmpId") {
															alert("Employee Id Is Already Present");
															$('#empId').focus();
															return false;
														}
													},

												});
									}));
				});

$(document).ready(
		function($) {

			$.ajax({
				type : "GET",
				url : 'Admin/fetchDepartmentMain',
				dataType : "json",
				async : false,

				success : function(jarray) {

					var boiler = '';
					for (var i = 0; i < jarray.length; i++) {

						boiler += '<option value="' + jarray[i]["Deptname"]
								+ '">' + jarray[i]["Deptname"] + '</option>';
					}

					$('#departments').append(boiler);

				},

			});
		});

function autosuggestionstate() {
	$.ajax({
		type : "POST",
		url : 'Admin/getstate',
		dataType : "json",
		async : false,

		success : function(jArray) {
			var availableTags = [];
			for (var i = 0; i < jArray.length; i++) {
				availableTags.push(jArray[i]["searchState"]);
			}

			$("#state").autocomplete({
				source : availableTags
			});

		},

	});
}

function autosuggestioncity() {
	var state = $('#state').val();
	if (state == "") {
		alert("Please Select The State First....");
		$('#state').focus();
		return false;
	}
	$.ajax({
		type : "POST",
		url : 'Admin/getcity',
		dataType : "json",
		async : false,
		data : {
			state : state
		},
		success : function(jArray) {
			var availableTags = [];
			for (var i = 0; i < jArray.length; i++) {
				availableTags.push(jArray[i]["searchCity"]);
			}

			$("#city").autocomplete({
				source : availableTags
			});
		},
	});
}

function autosuggestionarea() {
	var state = $('#state').val();
	var city = $('#city').val();
	if (city == "") {
		alert("Please Select The City First....");
		$('#city').focus();
		return false;
	}
	$.ajax({
		type : "POST",
		url : 'Admin/getarea',
		dataType : "json",
		async : false,
		data : {
			state : state,
			city : city
		},
		success : function(jArray) {
			var availableTags = [];
			for (var i = 0; i < jArray.length; i++) {
				availableTags.push(jArray[i]["areas"]);
			}

			$("#area").autocomplete({
				source : availableTags
			});
			/*$("#customerNames").autocomplete({
				source : jArray,
				focus : function(event, ui) {
					$("#area").val(ui.item.areas);
					return false;
				},
				select : function(event, ui) {
					$("#postalCode").val(ui.item.areascode);

					// $( "#custType" ).val(ui.item.contactno);

					// getSavedSaleMomByCust();

				}

			}).data("ui-autocomplete")._renderItem = function(ul, item) {

				return $("<li>").append(
						"<a>" + item.areas + "&nbsp;&nbsp;&nbsp;&nbsp&nbsp"
								+ item.areascode + "</a>").appendTo(ul);
			};*/

		},

	});
}

$(document).ready(
		function($) {

			$.ajax({
				type : "GET",
				url : 'Admin/fetchAlldesignations',
				dataType : "json",
				async : false,

				success : function(jarray) {

					var boiler = '';
					for (var i = 0; i < jarray.length; i++) {

						boiler += '<option value="' + jarray[i]["designations"]
								+ '">' + jarray[i]["designations"]
								+ '</option>';
					}

					$('#designation').append(boiler);

				},

			});
		});