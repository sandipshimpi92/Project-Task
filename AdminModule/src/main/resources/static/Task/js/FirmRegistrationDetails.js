$(document).ready(function() {
	$('#example').DataTable(

	{
		"aLengthMenu" : [ [ 5, 10, 25, -1 ], [ 5, 10, 25, "All" ] ],
		"iDisplayLength" : 5
	});
});

$(document).ready(function (e) {

    $("#formFirmId").on('submit',(function(e) {
	var formFirmData = $('#formFirmId').serialize();
	$.ajax({
		type : "POST",
		url : 'Admin/savefirmdetail',
		dataType : "json",
		async : false,
		data : formFirmData,
		success : function(jArray) {
			var firmnoj=jArray[0]["Firms"];
			if(firmnoj=="success")
				{
				alert("Firms Details Saved Succesfully")
	
				window.location.replace("FirmDetails");
				
				}else if (firmnoj=="Ffail") 
				{
					alert('Firm Name Already Exists');
					
				}else if (firmnoj=="Gfail") {
					alert('Gst Number Already Exists');
				}

		},

	});
	 e.preventDefault();
    }));
});

$(document).ready(function($) {
		document.getElementById("update").disabled = true;
		document.getElementById("save").disabled = false;
		var boiler = '';

		$.ajax({
				type : "POST",
				url : 'Admin/firmTableDetail',
				dataType : "json",
				async : false,
				success : function(jArray)
				{
					boiler += '<table id="example" class="table table-striped table-bordered" style="width: 100%"><thead><tr>';
					boiler += '<th>Sr.No</th>';
					boiler += '<th>Firms Name</th>';
					boiler += '<th>Owners Name</th>';
					boiler += '<th>GST No</th>';
					boiler += '<th>City</th>';
					boiler += '<th>State</th>';
					boiler += '<th>Action</th></thead><tbody>';
									if (jArray.length > 0) {
										for (var i = 0; i < jArray.length; i++) {

											boiler += '<tr><td>' + eval(i + 1)
													+ '</td><td>'
													+ jArray[i]["firmName"]
													+ '</td><td>'
													+ jArray[i]["ownersName"]
													+ '</td><td>'
													+ jArray[i]["gstNo"]
													+ '</td><td>'
													+ jArray[i]["city"]
													+ '</td><td>'
													+ jArray[i]["state"]
													+ '</td><td >'
													+ '<a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons" onclick="EditFirmRegistration(\''+jArray[i]["firmRegiId"]+'\')">&#xE254;</i></a>'
													+'</td></tr>';		
										}
										boiler +='</tbody></table>';
									}
									$('#firmDetails').html(boiler).show();
									$('#example').DataTable();
								},
							});
				});

 function EditFirmRegistration(data) 
 {
		var name = data.split(",");
		document.getElementById("update").disabled = false;
		document.getElementById("save").disabled = true;
		$.ajax({

			url : "Admin/EditFirmData?firmRegiId="+name[0],
			dataType:'json',
			type : "POST",
			success:function(jArray)
			{
				$('#firmsName').val(jArray[0]['firmName']);
				$('#ownersName').val(jArray[0]['ownersName']);
				$('#area').val(jArray[0]['area']);
				$('#landmark').val(jArray[0]['landmark']);
				$('#emailId').val(jArray[0]['emailId']);
				$('#mobileNumber').val(jArray[0]['mobileNumber']);
				$('#landlineNumber').val(jArray[0]['landlineNumber']);
				$('#pinCode').val(jArray[0]['pinCode']);
				$('#state').val(jArray[0]['state']);
				$('#city').val(jArray[0]['city']);
				$('#gstNumber').val(jArray[0]['gstNumber']);
				$('#panNumber').val(jArray[0]['panNumber']);
				$('#termsAndConditions').val(jArray[0]['termsAndConditions']);
				$('#gstNumber').val(jArray[0]['gstNumber']);
				$('#firmRegiId').val(jArray[0]['firmRegiId']);
				//$('#firmsUserName').val(jArray[0]['firmsUserName']);	
			}
		});
}
 
/*function DeleteFirmRegistration(data) 
{
	var r = confirm("Are You Sure Want To  Delete the Firm ?");
	if (r == true) 
	{
		var name = data.split(",");
		$.ajax({
			url : "Admin/DeleteFirmData?firmRegiId="+name[0],
			dataType:'json',
			type : "POST",
			success:function(jArray)
			{
			alert('Delete Record Succesfully');
			window.location.replace("FirmDetails");			
			}
		});
	}
}*/

function updateFirmRegistrationData() 
{
	var formFirmData = $('#formFirmId').serialize();

	$.ajax({
			type : "POST",
			url : 'Admin/updatefirmdetail',
			dataType : "json",
			async : false,
			data : formFirmData,
			success : function(jArray)
			{
				alert('Record Updated Succesfully');
				window.location.replace("FirmDetails");
			},
		});
}
 
   function autosuggestionstate() {
		$.ajax({
			type : "POST",
			url : 'Admin/getstate',
			dataType : "json",
			async : false,
		
			success : function(jArray)
			{
				var availableTags = [];
				for(var i=0; i<jArray.length; i++)
					{
					 availableTags.push(jArray[i]["searchState"]);   
					}

				$( "#state" ).autocomplete({
				      source:availableTags
				    });
			

			},
	
		});
	  } 
   
   function autosuggestioncity() {
	   var state=$('#state').val();
		if(state=="")
		{
			alert("Please Select The State First....");
			$('#state').focus();
			return false;
		}
		$.ajax({
			type : "POST",
			url : 'Admin/getcity',
			dataType : "json",
			async : false,
			data :{state:state},
			success : function(jArray)
			{
				var availableTags = [];
				for(var i=0; i<jArray.length; i++)
					{
					 availableTags.push(jArray[i]["searchCity"]);   
					}

				$("#city" ).autocomplete({
				      source:availableTags
				    });
			

			},
	
		});
	  }
   
   function autosuggestionarea() {
	   var city=$('#city').val();
	   var state=$('#state').val();
		if(city=="")
		{
			alert("Please Select The State First....");
			$('#city').focus();
			return false;
		}
		$.ajax({
			type : "POST",
			url : 'Admin/getarea',
			dataType : "json",
			async : false,
			data :{city:city,state:state},
			success : function(jArray)
			{
				var availableTags = [];
				for(var i=0; i<jArray.length; i++)
					{
					 availableTags.push(jArray[i]["areas"]);   
					}

				$("#area" ).autocomplete({
				      source:availableTags
				    });
			

			},
	
		});
	  }