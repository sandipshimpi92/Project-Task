<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>ERP Project | Admin | CreateNewUser</title>
  
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url value="/AdminDashboard" var="admindashboardurl" />
<spring:url value="/FirmDetails" var="firmdetailsurl" />
<spring:url value="/CreateUser" var="createuserurl" />
<spring:url value="/UserPermission" var="userpermissionurl" />
<spring:url value="/UserBrowse" var="userbrowseurl" />
<spring:url value="/DatabaseBackup" var="databaseBackupurl" />
<spring:url value="/AddLicenseKey" var="addLicenseKeyUrl" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="CommonFiles/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="CommonFiles/vendors/css/vendor.bundle.base.css">
	<link rel="stylesheet" href="CommonFiles/vendors/css/vendor.bundle.addons.css">
	<link rel="stylesheet" href="CommonFiles/css1/style.css">
	<link rel="stylesheet" href="CommonFiles/css1/toggle.css">
	<link rel="shortcut icon" href="CommonFiles/images/grobizlogo.jpg" />
	<script src="CommonFiles/js/bootstrap.bundle.min.js"></script>
	<script src="CommonFiles/js/saveNewPassword.js"></script>
	<script src="/Admin/js/CreateNewUser.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  fa fa icons start-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!--  fa fa icons end-->
	<script type="text/javascript">
	function myFunction(id) {
		var x = document.getElementById(id);
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}
</script>
<style type="text/css">
.ddd {
	font-weight: bold;
	font-family: sans-serif;
	font-size: medium;
	font-size-adjust: inherit;
	background-color: #85c1e9;
	padding-left: 5px;
}

.col-md-6 .form-group .col-sm-3 {
	font-weight: normal;
}

.rotate {
	-moz-transition: all .25s linear;
	-webkit-transition: all .25s linear;
	transition: all .10s linear;
}

.rotate.down {
	-moz-transform: rotate(90deg);
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg);
}

.rotate1 {
	-moz-transition: all .25s linear;
	-webkit-transition: all .25s linear;
	transition: all .10s linear;
}

.rotate1.up {
	-moz-transform: rotate(-90deg);
	-webkit-transform: rotate(-90deg);
	transform: rotate(-90deg);
}
</style>
</head>

<body>
	<%!String firmsName = "";%>
	<%
		firmsName = (String) session.getAttribute("firmsName");
	%>
	<%!String username = "";%>
	<%
		username = (String) session.getAttribute("usernames");
	%>
	<%!String password = "";%>
	<%
		password = (String) session.getAttribute("password");
	%>
	<%!String firmsUsername = "";%>
	<%
		firmsUsername = (String) session.getAttribute("firmsUsername");
	%>
	<%!String empName = "";%>
	<%
		empName = (String) session.getAttribute("empName");
	%>
	<div class="container-scroller" id="page-content-wrapper">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="navbar-menu-wrapper d-flex align-items-center">
				<ul class="navbar-nav navbar-nav-left header-links d-md-flex">
					<li id="rotation"><a href="#" id="menu-toggle" data-toggle="offcanvas"><span
							Style="position: fixed; left: 12px; top: 19px; color: red;"
							class="mdi mdi-menu"></span></a></li>
							
							<li><a class="nav-link" Style="position: fixed; left: 50px; top: 0px;"><img class="img-xs"
			src="CommonFiles/images/GrobizLogo.png" style="width: 130px; height: 30px;" alt="Profile image">
		</a></li>
							
							
<!-- 					<li class="nav-item"><a href="#" class="nav-link" -->
<%-- 						Style="position: fixed; left: 35px; top: 3px; color: white; font-size: 22px;"><%=firmsName%> --%>
<!-- 					</a></li> -->
					<li class="nav-item dropdown d-xl-inline-block"
						Style="position: fixed; right: 60px; top: 3px; color: white;">
						<a class="nav-link dropdown-toggle" href="#p"
						data-toggle="dropdown" aria-expanded="false"> <img
							class="img-xs rounded-circle"
							src="CommonFiles/images/user-laptop-512.png"
							style="background-color: white;" alt="Profile image">
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown" id="p"
							style="width: 350%; background-color: #e6e6e6">
							<div class="well" style="background: #fff;">
								<div class="media text-center">
									<div class="media-center media-bottom">
										<img src="https://img1a.flixcart.com/www/linchpin/fk-cp-zion/img/profile-pic-male_2fd3e8.svg"
											class="media-object" style="width: 60px; margin: 0 auto;">
									</div>
									<div class="media-body">
										<h5 style="width: 100%"> Hello, <%=empName%></h5>
										<br>
										<h4 style="width: 100%" class="media-heading">Welcome to,
										</h4>
										<h5><%=firmsName%></h5>
									</div>
								</div>
							</div>
							<br> <input type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#myModal"
								value="Change Password" style="margin-left: 4%;"> <input
								type="button" class="btn btn-primary" style="margin-left: 18%;"
								value="SignOut" onclick='signout()'>
						</div>
					</li>
					<li class="nav-item dropdown"
						Style="position: fixed; right: 0px; top: 4px; color: white;"><a
						class="nav-link count-indicator dropdown-toggle"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="mdi mdi-bell"></i> <span class="count">4</span>
					</a></li>
				</ul>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper" id="wrapper">
			<!-- partial:partials/_sidebar.html -->
			<div id="sidebar-wrapper">
				<nav class=" gmd-5 sidebar sidebar-offcanvas" id="sidebar ">
					<ul class="nav" id="accordion">
						<li class="nav-item"><a class="nav-link" href="http://103.210.200.101:8080/Master/Modules?u=<%=username%>&word=<%=password%>&firm=<%=firmsUsername%>"><i
								style="font-size: 312%; margin-left: -8px"
								class="menu-icon mdi mdi-crown"> <span
									class="menu-title adjust">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ADMIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<h6 class="glyphicon glyphicon-chevron-right"></h6>
								</span>
							</i> </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${admindashboardurl}"> <i
								class="menu-icon mdi mdi-television">&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="menu-title"> Admin Dashboard</span>
							</i>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#ui-basic" 
							aria-controls="ui-basic"> <i
								class="menu-icon mdi mdi-account-key">&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="menu-title">Administration</span>
							</i> <i class="menu-arrow"></i>
						</a>
							<div class="collapse" id="ui-basic" data-parent="#accordion">
								<ul class="nav flex-column sub-menu">
									<li class="nav-item"><a class="nav-link"
										href="${firmdetailsurl}">Firm Details</a></li>
									<li class="nav-item"><a class="nav-link"
										href="${createuserurl}">Create User</a></li>
									<li class="nav-item"><a class="nav-link"
										href="${userbrowseurl}">User Browse</a></li>
									<li class="nav-item"><a class="nav-link"
										href="${userpermissionurl}">User Permissions</a></li>
									<li class="nav-item"><a class="nav-link"
										href="${addLicenseKeyUrl}">Add License Key</a></li>
								</ul>
							</div></li>
						<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#ui-basic1" 
							aria-controls="ui-basic"> <i
								class="menu-icon mdi mdi-settings ">&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="menu-title">Settings</span>
							</i><i class="menu-arrow"></i>
						</a>
							<div class="collapse" id="ui-basic1" data-parent="#accordion">
								<ul class="nav flex-column sub-menu">
									<li class="nav-item"><a class="nav-link"
										href="${databaseBackupurl}">Database Backup</a></li>

								</ul>
							</div></li>

					</ul>
				</nav>
			</div>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card gmd-5">
								<div class="card-body">
									<form class="form-sample" id="serializecreateNewuser">
										<h2>New User Registration</h2>
										<p class="card-description slatcolor">
											<span class="glyphicon glyphicon-triangle-bottom rotate1"
												onclick="myFunction('myDI')"></span> General Information
										</p>
										<div id="myDI">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">First Name
															:<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="firstName"
																name="firstName" required="required" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Last Name :<span
															style="color: red; font-size: 123%">*</span></label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="lastName"
																name="lastName" required="required" />
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">E-mail-ID :</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="emailId"
																name="emailId" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Email Password :</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="mailPasswrd"
																name="mailPasswrd" />
														</div>
													</div>
												</div>
												<!-- <div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Mobile No :<span
															style="color: red; font-size: 123%">*</span></label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="mobNumbr"
																name="mobNumbr" min="10" required="required" />
														</div>
													</div>
												</div> -->
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Date Of
															Birth :</label>
														<div class="col-sm-9">
															<input type="date" class="form-control" id="dateofBirth"
																name="dateofBirth" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Department
															:<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-9">
															<select style="border-color: #c0c0c0;"
																class="form-control" id="departments" name="departments"
																required>
																<option value="">-----select------</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Employee ID
															:<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="empId"
																name="empId" required="required" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Role /
															Profile :<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-9">
															<select style="border-color: #c0c0c0;"
																class="form-control" id="designation" name="designation"
																required>
																<option value="">-----select------</option>
															</select>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Mobile No :<span
															style="color: red; font-size: 123%">*</span></label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="mobNumbr"
																name="mobNumbr" min="10" required="required" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<p class="card-description slatcolor">
											<span onclick="myFunction('myDIV')"
												class="glyphicon glyphicon-triangle-right rotate"></span>
											Address Details
										</p>
										<div id="myDIV" style="display: none;">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label" for="state">State
															:<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-9">
															<input type="text" name="state" id="state"
																class="form-control" onfocus="autosuggestionstate()"
																required="required" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">City :<span
															style="color: red; font-size: 123%">*</span></label>
														<div class="col-sm-9">
															<input type="text" name="city" id="city"
																class="form-control" onfocus="autosuggestioncity()"
																required="required" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Area :<span
															style="color: red; font-size: 123%">*</span></label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="area"
																name="area" onfocus="autosuggestionarea()"
																required="required" />
														</div>
													</div>
												</div>

												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Postal Code
															:<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="postalCode"
																name="postalCode" maxlength="6" required="required" />
														</div>
													</div>
												</div>

											</div>
										</div>


										<p class="card-description slatcolor">
											<span onclick="myFunction('myDIV1')"
												class="glyphicon glyphicon-triangle-right rotate"></span>
											Create User Account
										</p>
										<div id="myDIV1" style="display: none;">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Username :<span
															style="color: red; font-size: 123%">*</span></label>
														<div class="col-sm-9">
															<input type="text" class="form-control" id="userName"
																name="userName" required="required" />
														</div>
													</div>
												</div>


												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Password :<span
															style="color: red; font-size: 123%">*</span></label>
														<div class="col-sm-9">
															<input type="password" class="form-control"
																id="passWordnew" name="passWordnew" required="required" />
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Confirm-Password
															:<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-9">
															<input type="password" class="form-control"
																id="confirmPasswordnew" name="confirmPasswordnew"
																required="required" />
														</div>
													</div>
												</div>
											</div>
										</div>


										<div align="center">
											<button type="submit" class="btn btn-primary gmd-4 ">
												<span class="fa fa-floppy-o"></span> Save
											</button>
											<button type="button" class="btn btn-primary gmd-4 "
												onclick="location.reload(true);">
												<span class="fa fa-refresh"></span> Refresh
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<!-- change password bootsrap code -->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-dialog-centered">

						<div class="modal-content"
							style="background-color: white; width: 80%; margin-left: 12%">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">Change Password :</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body" style="margin-left: 14%">

								<div class="form-group">
									<label>Old Password:</label> <input type="password"
										class="form-control" id="password" name="oldpassword"
										style="border-color: #c0c0c0; width: 80%" required />
								</div>
								<div class="form-group">
									<label>New Password :</label> <input type="password"
										class="form-control" id="newPassword" name="newPassword"
										style="border-color: #c0c0c0; width: 80%" required />
								</div>
								<div class="form-group">
									<label>Confirm New Password :</label> <input type="password"
										class="form-control" name="confirmPassword"
										id="confirmPassword" style="border-color: #c0c0c0; width: 80%"
										required />
								</div>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer" align="center">

								<button type="button" class="btn btn-primary"
									onclick="saveNewPassword()">
									<span class="fa fa-floppy-o"></span> &nbsp;Save
								</button>
								<button class="btn btn-primary" data-dismiss="modal">Cancel</button>
							</div>
						</div>
					</div>
				</div>
				<!-- change password bootsrap code -->
				<footer class="footer">
					<div class="container-fluid clearfix">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
							© 2019 <a href="http://www.edzeal.com/" target="_blank">Edzeal Technologies</a>. All rights reserved.
						</span>
					</div>
				</footer>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="CommonFiles/vendors/js/vendor.bundle.base.js"></script>
	<script src="CommonFiles/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="CommonFiles/js/off-canvas.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="CommonFiles/js/dashboard.js"></script>
	<script type="text/javascript">
		$(".rotate").click(function() {
			$(this).toggleClass("down");
		})
		$(".rotate1").click(function() {
			$(this).toggleClass("up");
		})
		$("#menu-toggle").click(function(e) {

			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
			$("#rotation").toggleClass("toggled");
			$("#leftswapp").toggleClass("toggled");
		});
	</script>
	
	<!-- language code -->
	<script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element_id');
}
</script>
	<script type="text/javascript">

	(function(){var gtConstEvalStartTime = new Date();/*

	 Copyright The Closure Library Authors.
	 SPDX-License-Identifier: Apache-2.0
	*/
	function d(b){var a=document.getElementsByTagName("head")[0];a||(a=document.body.parentNode.appendChild(document.createElement("head")));a.appendChild(b)}function _loadJs(b){var a=document.createElement("script");a.type="text/javascript";a.charset="UTF-8";a.src=b;d(a)}function _loadCss(b){var a=document.createElement("link");a.type="text/css";a.rel="stylesheet";a.charset="UTF-8";a.href=b;d(a)}function _isNS(b){b=b.split(".");for(var a=window,c=0;c<b.length;++c)if(!(a=a[b[c]]))return!1;return!0}
	function _setupNS(b){b=b.split(".");for(var a=window,c=0;c<b.length;++c)a.hasOwnProperty?a.hasOwnProperty(b[c])?a=a[b[c]]:a=a[b[c]]={}:a=a[b[c]]||(a[b[c]]={});return a}window.addEventListener&&"undefined"==typeof document.readyState&&window.addEventListener("DOMContentLoaded",function(){document.readyState="complete"},!1);
	if (_isNS('google.translate.Element')){return}(function(){var c=_setupNS('google.translate._const');c._cest = gtConstEvalStartTime;gtConstEvalStartTime = undefined;c._cl='en';c._cuc='googleTranslateElementInit';c._cac='';c._cam='';c._ctkk='444828.564621322';var h='translate.googleapis.com';var s=(true?'https':window.location.protocol=='https:'?'https':'http')+'://';var b=s+h;c._pah=h;c._pas=s;c._pbi=b+'/translate_static/img/te_bk.gif';c._pci=b+'/translate_static/img/te_ctrl3.gif';c._pli=b+'/translate_static/img/loading.gif';c._plla=h+'/translate_a/l';c._pmi=b+'/translate_static/img/mini_google.png';c._ps=b+'/translate_static/css/translateelement.css';c._puh='translate.google.com';_loadCss(c._ps);_loadJs(b+'/translate_static/js/element/main.js');})();})();

</script>
	<!-- End custom js for this page-->
</body>
</html>