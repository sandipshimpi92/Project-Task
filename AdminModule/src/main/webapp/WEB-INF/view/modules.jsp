<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ERP Modules</title>
<!-- plugins:css -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/Admin/CRM/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="/Admin/CRM/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="/Admin/CRM/vendors/css/vendor.bundle.addons.css">
<link rel="stylesheet" href="/Admin/CRM/css1/style.css">
<link rel="stylesheet" href="/Admin/CRM/css1/toggle.css">
<link rel="shortcut icon" href="/Admin/CRM/images/edzeallogo.jpg" />
<script src="/Admin/CRM/js/bootstrap.bundle.min.js"></script>

<script src="CommonFiles/js/modules.js"></script>
<script src="/Admin/CRM/js/modules.js"></script>

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
					<li id="rotation"><a id="menu-toggle" data-toggle="offcanvas"><span
							Style="position: fixed; left: 12px; top: 19px; color: red;"
							class="mdi mdi-menu"></span></a></li>
							
							<li><a class="nav-link" Style="position: fixed; left: 50px; top: 0px;"><img class="img-xs"
			src="CommonFiles/images/GrobizLogo.png" style="width: 130px; height: 30px;" alt="Profile image">
		</a></li>
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
			
			<!-- partial -->
			<div class="">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card" onclick="openAdminModule()">
						<%-- <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card" onclick="openAdminModule(${userId})"> --%>
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-poll-box text-success icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">A</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Admin</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-calendar mr-1" aria-hidden="true"></i>
										Weekly Sales
									</p>
								</div>
							</div>
						</div>
						 <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card" onclick="openMasterModule()">
			 			  <div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-account-location text-info icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">B</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Master</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-reload mr-1" aria-hidden="true"></i>
										Product-wise sales
									</p>
								</div>
							</div>
						</div>
						 <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card" onclick="openCRMModule()">
					     <div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-poll-box text-success icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">E</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">CRM</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-calendar mr-1" aria-hidden="true"></i>
										Weekly Sales
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card" onclick="openEngineeringModule()">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-cube text-danger icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">C</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Engineering</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-alert-octagon mr-1" aria-hidden="true"></i>
										65% lower growth
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-receipt text-warning icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">D</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Site</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-bookmark-outline mr-1" aria-hidden="true"></i>
										Product-wise sales
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-account-location text-info icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">F</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Sales</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-reload mr-1" aria-hidden="true"></i>
										Product-wise sales
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-cube text-danger icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">G</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Store</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-alert-octagon mr-1" aria-hidden="true"></i>
										65% lower growth
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-receipt text-warning icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">H</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Manufacture</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-bookmark-outline mr-1" aria-hidden="true"></i>
										Product-wise sales
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-poll-box text-success icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">I</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Purchase</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-calendar mr-1" aria-hidden="true"></i>
										Weekly Sales
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-account-location text-info icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">J</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Contract</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-reload mr-1" aria-hidden="true"></i>
										Product-wise sales
									</p>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-lg-3 col-md-3 col-sm-6 grid-margin stretch-card">
							<div class="card card-statistics">
								<div class="card-body">
									<div class="clearfix">
										<div class="float-left">
											<i class="mdi mdi-account-location text-info icon-lg"></i>
										</div>
										<div class="float-right">
											<p class="mb-0 text-right">K</p>
											<div class="fluid-container">
												<h4 class="font-weight-medium text-right mb-0">Account</h4>
											</div>
										</div>
									</div>
									<p class="text-muted mt-3 mb-0">
										<i class="mdi mdi-reload mr-1" aria-hidden="true"></i>dfgfd
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<footer class="footer">
					<div class="container-fluid clearfix">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright
							© 2019 <a href="http://www.edzeal.com/" target="_blank">Edzeal
								Technologies</a>. All rights reserved.
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
	<script src="/Admin/CRM/vendors/js/vendor.bundle.base.js"></script>
	<script src="/Admin/CRM/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="/Admin/CRM/js/off-canvas.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="/Admin/CRM/js/dashboard.js"></script>
	<script type="text/javascript">
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