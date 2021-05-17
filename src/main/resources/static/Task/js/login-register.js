$(document).ready(function(e) {
	$("#Formsdata").on('submit',(function(e) {
	
			e.preventDefault();
			var formsData= $('#Formsdata').serialize();
						$.ajax({
						type : "POST",
						url : "Admin/login",
						dataType : "json",
						async : false,
						data :formsData,
						success : function(jArray) {

							var ans=jArray[0]["Auth"];
							var status=jArray[0]["UserStatus"];
							var departmentsName=jArray[0]["departsName"];
							var FirmsName=jArray[0]["FirmsName"];	
							var Anotherdevice=jArray[0]["Anotherdevice"];
							
							if(FirmsName=="wrong")
							{
								alert("Please Enter Correct Firms User Name ...!")
								$('#FirmsUserName').focus();
							}
							else if(FirmsName=="Exception")
							{
								alert("Server Connection Error.....")
							}
							else if(status=="Suspend")
							{
								alert("Sorry You Are Suspended... Please Contact To Admin...!")
							}
							else if(status=="Deactive")
							{
								alert("Sorry You Are Deactivated... Please Buy License Key...!")
							}
							else if(Anotherdevice=="alreadyLoggedIn")
							{
								alert("Sorry Your Are Already Logged-In From Another Device, Please Contact to ADMIN...!")
							}
							else if(ans=="false" && FirmsName=="Correct")
							{
								alert("Please Insert Correct Username Or Password...! or Check Status of User")
							}
							
							//else if(ans=="true")
							//{
								//var firmNm=jArray[0]["Firm"];
								//var u=jArray[0]["uname"];
								//var word=jArray[0]["password"];
								//window.location.href='http://localhost:8080/Admin/AdminDashboard';
							//}   //Previous code
						
						    //sandip Start code here	
							else if(ans=="true")
							{
							
								var firmNm=jArray[0]["Firm"];
								var u=jArray[0]["uname"];
								var word=jArray[0]["password"];
								var department=jArray[0]["department"];
								var userId=jArray[0]["userId"];
								
								
								if(department==1){
								    window.location.href='http://localhost:8080/Admin/AdminDashboard';//?s=37
								}
								
								else if(department==2){
									
									var firmNm=jArray[0]["Firm"];
									var u=jArray[0]["uname"];
									var word=jArray[0]["password"];
									var department=jArray[0]["department"];
									var userId=jArray[0]["userId"];
									
									
									//window.location.href='http://localhost:8080/Master/MasterDashboard';
									  window.location.href='http://localhost:8080/Master/MasterDashboard?s='+userId; 
								    //window.location.href='http://localhost:8080/Master/Modules?u='+u+'&word='+word+'&firm='+firmNm;
                                }
								
								else if(department==3){
									
									var firmNm=jArray[0]["Firm"];
									var u=jArray[0]["uname"];
									var word=jArray[0]["password"];
									var department=jArray[0]["department"];
									var userId=jArray[0]["userId"];
									
									
								  //window.location.href='http://localhost:8080/CRM/CRMDashboard';
								    window.location.href='http://localhost:8080/CRM/CRMDashboard?s='+userId;
								  //window.location.href='http://localhost:8080/CRM/CRMDashboard?s=37'; u='+u
						        }
								
							}
							//sandip end code here
							
						},

					});
				}));
		});

function openLicenseKeyPage()
{
	window.location.href = "/Admin/Admin/LicenseKey";
}

function openActivateUser()
{
	window.location.href = "/Admin/ActivateUser";
}

$(document).ready(function($)
	{
	$.ajax({
			type : "GET",
			url : 'Admin/fetchDepartmentMain',
			dataType : "json",
			async : false,
			
			success : function(jarray) {
				
				var boiler = '';
				for (var i = 0; i < jarray.length; i++) {
				
					boiler += '<option value="' + jarray[i]["Deptid"]
							+ '">' + jarray[i]["Deptname"] + '</option>';
				}

				$('#department').append(boiler);

			},
			
		});
	});

function signout()
{
	window.location.replace("/Admin/Signout");
	$.ajax({
		type:"POST",
		url:'/Admin/Signout',
		dataType : "json",
		async :false,
		success : function(jArray)
		{
			var result=jArray[0]["saved"];
			if(result=="success")
				{
					alert("Sign Out Successfully....")
					window.location.replace("/Admin/LoginPage");
				}
			else if(result=="exception")
				{
				alert("Unable to Logout Due to Exception....");
				}
		},
	});
}