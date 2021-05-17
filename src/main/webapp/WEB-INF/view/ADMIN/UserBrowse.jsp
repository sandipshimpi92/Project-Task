<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>ERP Project | Admin | Users</title>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<spring:url value="/AdminDashboard" var="admindashboardurl" />
<spring:url context="/Master" value="/Modules" var="modules" />


<spring:url value="/FirmDetails" var="firmdetailsurl" />
<spring:url value="/CreateUser" var="createuserurl" />
<spring:url value="/UserPermission" var="userpermissionurl" />
<spring:url value="/UserBrowse" var="userbrowseurl" />
<spring:url value="/DatabaseBackup" var="databaseBackupurl" />
<spring:url value="/AddLicenseKey" var="addLicenseKeyUrl" />

<!-- change password bootsrap file start -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- change password bootsrap file end -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="CommonFiles/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="CommonFiles/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" href="CommonFiles/vendors/css/vendor.bundle.addons.css">
<link rel="stylesheet" href="CommonFiles/css1/style.css">
<link rel="stylesheet" href="CommonFiles/css1/toggle.css">
<link rel="stylesheet" href="CommonFiles/css/opportunities.css">
<link rel="shortcut icon" href="CommonFiles/images/grobizlogo.jpg" />
<script src="CommonFiles/js/bootstrap.bundle.min.js"></script>
<script src="CommonFiles/js/saveNewPassword.js"></script>
<script src="/Admin/js/Userbrowse.js"></script>
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
	padding-left: 5px;
}

.col-md-6 .form-group .col-sm-3 {
	font-weight: normal;
}

.col-md-6 .form-group .col-sm-4 {
	font-weight: normal;
}

.rotate {
	-moz-transition: all .25s linear;
	-webkit-transition: all .25s linear;
	transition: all .10s linear;
}

.rotate.down {
	-moz-transform: rotate(-90deg);
	-webkit-transform: rotate(-90deg);
	transform: rotate(-90deg);
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

<!-- autosuggestion text urls start -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--  autosuggestion text urls end -->
<!--advanced data table js start here  -->
<script	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<!--advanced data table js end here  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <!-- sandip code start here  -->
	<%!Integer userId = 0;%>
	<%
		userId = (Integer) session.getAttribute("userId");
	%>
	<!-- sandip code end here  -->

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
	
	    <c:set var="nm" value="${getSubDepartmentslistIdObj0}" />
						<c:set var="nm1" value="${getSubDepartmentslistIdObj1}" />
						<c:set var="nm2" value="${getSubDepartmentslistIdObj2}" />
						<c:set var="nm3" value="${getSubDepartmentslistIdObj3}" />
						<c:set var="nm4" value="${getSubDepartmentslistIdObj4}" />
						<c:set var="nm5" value="${getSubDepartmentslistIdObj5}" />
						<c:set var="nm6" value="${getSubDepartmentslistIdObj6}" />
						<c:set var="nm7" value="${getSubDepartmentslistIdObj7}" />
						<c:set var="nm8" value="${getSubDepartmentslistIdObj8}" />
						<c:set var="nm9" value="${getSubDepartmentslistIdObj9}" />
						<c:set var="nm10" value="${getSubDepartmentslistIdObj10}" />
						<c:set var="nm11" value="${getSubDepartmentslistIdObj11}" />
						<c:set var="nm12" value="${getSubDepartmentslistIdObj12}" />
						<c:set var="nm13" value="${getSubDepartmentslistIdObj13}" />
						<c:set var="nm14" value="${getSubDepartmentslistIdObj14}" />
						<c:set var="nm15" value="${getSubDepartmentslistIdObj15}" />
						<c:set var="nm16" value="${getSubDepartmentslistIdObj16}" />
						<c:set var="nm17" value="${getSubDepartmentslistIdObj17}" />
						<c:set var="nm18" value="${getSubDepartmentslistIdObj18}" />
						<c:set var="nm19" value="${getSubDepartmentslistIdObj19}" />
						<c:set var="nm20" value="${getSubDepartmentslistIdObj20}" />
						<c:set var="nm21" value="${getSubDepartmentslistIdObj21}" />
						<c:set var="nm22" value="${getSubDepartmentslistIdObj22}" />
						<c:set var="nm23" value="${getSubDepartmentslistIdObj23}" />
						<c:set var="nm24" value="${getSubDepartmentslistIdObj24}" />
						<c:set var="nm25" value="${getSubDepartmentslistIdObj25}" />
						<c:set var="nm26" value="${getSubDepartmentslistIdObj26}" />
						<c:set var="nm27" value="${getSubDepartmentslistIdObj27}" />
						<c:set var="nm28" value="${getSubDepartmentslistIdObj28}" />
						<c:set var="nm29" value="${getSubDepartmentslistIdObj29}" />
						<c:set var="nm30" value="${getSubDepartmentslistIdObj30}" />
						<c:set var="nm31" value="${getSubDepartmentslistIdObj31}" />
						<c:set var="nm32" value="${getSubDepartmentslistIdObj32}" />
						<c:set var="nm33" value="${getSubDepartmentslistIdObj33}" />
						<c:set var="nm34" value="${getSubDepartmentslistIdObj34}" />
						<c:set var="nm35" value="${getSubDepartmentslistIdObj35}" />
						<c:set var="nm36" value="${getSubDepartmentslistIdObj36}" />
						<c:set var="nm37" value="${getSubDepartmentslistIdObj37}" />
						<c:set var="nm38" value="${getSubDepartmentslistIdObj38}" />
						<c:set var="nm39" value="${getSubDepartmentslistIdObj39}" />
						<c:set var="nm40" value="${getSubDepartmentslistIdObj41}" />
						<c:set var="nm41" value="${getSubDepartmentslistIdObj41}" />
						<c:set var="nm42" value="${getSubDepartmentslistIdObj42}" />
						<c:set var="nm43" value="${getSubDepartmentslistIdObj43}" />
						<c:set var="nm44" value="${getSubDepartmentslistIdObj44}" />
						<c:set var="nm45" value="${getSubDepartmentslistIdObj45}" />
						<c:set var="nm46" value="${getSubDepartmentslistIdObj46}" />
						<c:set var="nm47" value="${getSubDepartmentslistIdObj47}" />
						<c:set var="nm48" value="${getSubDepartmentslistIdObj48}" />
						<c:set var="nm49" value="${getSubDepartmentslistIdObj49}" />
						<c:set var="nm50" value="${getSubDepartmentslistIdObj50}" />
						<c:set var="nm51" value="${getSubDepartmentslistIdObj51}" />
						<c:set var="nm52" value="${getSubDepartmentslistIdObj52}" />
						<c:set var="nm53" value="${getSubDepartmentslistIdObj53}" />
						<c:set var="nm54" value="${getSubDepartmentslistIdObj54}" />
						<c:set var="nm55" value="${getSubDepartmentslistIdObj55}" />
						<c:set var="nm56" value="${getSubDepartmentslistIdObj56}" />
						<c:set var="nm57" value="${getSubDepartmentslistIdObj57}" />
						<c:set var="nm58" value="${getSubDepartmentslistIdObj58}" />
						<c:set var="nm59" value="${getSubDepartmentslistIdObj59}" />
						<c:set var="nm60" value="${getSubDepartmentslistIdObj60}" />
						<c:set var="nm61" value="${getSubDepartmentslistIdObj61}" />
						<c:set var="nm62" value="${getSubDepartmentslistIdObj62}" />
						<c:set var="nm63" value="${getSubDepartmentslistIdObj63}" />
						<c:set var="nm64" value="${getSubDepartmentslistIdObj64}" />
						<c:set var="nm65" value="${getSubDepartmentslistIdObj65}" />
						<c:set var="nm66" value="${getSubDepartmentslistIdObj66}" />
						<c:set var="nm67" value="${getSubDepartmentslistIdObj67}" />
						<c:set var="nm68" value="${getSubDepartmentslistIdObj68}" />
						<c:set var="nm69" value="${getSubDepartmentslistIdObj69}" />
						<c:set var="nm70" value="${getSubDepartmentslistIdObj70}" />
						<c:set var="nm71" value="${getSubDepartmentslistIdObj71}" />
						<c:set var="nm72" value="${getSubDepartmentslistIdObj72}" />
						<c:set var="nm73" value="${getSubDepartmentslistIdObj73}" />
						<c:set var="nm74" value="${getSubDepartmentslistIdObj74}" />
						<c:set var="nm75" value="${getSubDepartmentslistIdObj75}" />
						<c:set var="nm76" value="${getSubDepartmentslistIdObj76}" />
						<c:set var="nm77" value="${getSubDepartmentslistIdObj77}" />
						<c:set var="nm78" value="${getSubDepartmentslistIdObj78}" />
						<c:set var="nm79" value="${getSubDepartmentslistIdObj79}" />
						<c:set var="nm80" value="${getSubDepartmentslistIdObj80}" />
						<c:set var="nm81" value="${getSubDepartmentslistIdObj81}" />
						<c:set var="nm82" value="${getSubDepartmentslistIdObj82}" />
						<c:set var="nm83" value="${getSubDepartmentslistIdObj83}" />
						<c:set var="nm84" value="${getSubDepartmentslistIdObj84}" />
						<c:set var="nm85" value="${getSubDepartmentslistIdObj85}" />
						<c:set var="nm86" value="${getSubDepartmentslistIdObj86}" />
						<c:set var="nm87" value="${getSubDepartmentslistIdObj87}" />
						<c:set var="nm88" value="${getSubDepartmentslistIdObj88}" />
						<c:set var="nm89" value="${getSubDepartmentslistIdObj89}" />
						<c:set var="nm90" value="${getSubDepartmentslistIdObj90}" />
						<c:set var="nm91" value="${getSubDepartmentslistIdObj91}" />
						<c:set var="nm92" value="${getSubDepartmentslistIdObj92}" />
						<c:set var="nm93" value="${getSubDepartmentslistIdObj93}" />
						<c:set var="nm94" value="${getSubDepartmentslistIdObj94}" />
						<c:set var="nm95" value="${getSubDepartmentslistIdObj95}" />
						<c:set var="nm96" value="${getSubDepartmentslistIdObj96}" />
						<c:set var="nm97" value="${getSubDepartmentslistIdObj97}" />
						<c:set var="nm98" value="${getSubDepartmentslistIdObj98}" />
						<c:set var="nm99" value="${getSubDepartmentslistIdObj99}" />
						<c:set var="nm100" value="${getSubDepartmentslistIdObj100}" />
						<c:set var="nm101" value="${getSubDepartmentslistIdObj101}" />
						<c:set var="nm102" value="${getSubDepartmentslistIdObj102}" />
						<c:set var="nm103" value="${getSubDepartmentslistIdObj103}" />
						<c:set var="nm104" value="${getSubDepartmentslistIdObj104}" />
						<c:set var="nm105" value="${getSubDepartmentslistIdObj105}" />
						<c:set var="nm106" value="${getSubDepartmentslistIdObj106}" />
						<c:set var="nm107" value="${getSubDepartmentslistIdObj107}" />
						<c:set var="nm108" value="${getSubDepartmentslistIdObj108}" />
						<c:set var="nm109" value="${getSubDepartmentslistIdObj109}" />
						<c:set var="nm110" value="${getSubDepartmentslistIdObj110}" />
						<c:set var="nm111" value="${getSubDepartmentslistIdObj111}" />
						<c:set var="nm112" value="${getSubDepartmentslistIdObj112}" />
						<c:set var="nm113" value="${getSubDepartmentslistIdObj113}" />
						<c:set var="nm114" value="${getSubDepartmentslistIdObj114}" />
						<c:set var="nm115" value="${getSubDepartmentslistIdObj115}" />
						<c:set var="nm116" value="${getSubDepartmentslistIdObj116}" />
						<c:set var="nm117" value="${getSubDepartmentslistIdObj117}" />
						<c:set var="nm118" value="${getSubDepartmentslistIdObj118}" />
						<c:set var="nm119" value="${getSubDepartmentslistIdObj119}" />
						<c:set var="nm120" value="${getSubDepartmentslistIdObj120}" />
						<c:set var="nm121" value="${getSubDepartmentslistIdObj121}" />
						<c:set var="nm122" value="${getSubDepartmentslistIdObj122}" />
						<c:set var="nm123" value="${getSubDepartmentslistIdObj123}" />
						<c:set var="nm124" value="${getSubDepartmentslistIdObj124}" />
						<c:set var="nm125" value="${getSubDepartmentslistIdObj125}" />
						<c:set var="nm126" value="${getSubDepartmentslistIdObj126}" />
						<c:set var="nm127" value="${getSubDepartmentslistIdObj127}" />
						<c:set var="nm128" value="${getSubDepartmentslistIdObj128}" />
						<c:set var="nm129" value="${getSubDepartmentslistIdObj129}" />
						<c:set var="nm130" value="${getSubDepartmentslistIdObj130}" />
						<c:set var="nm131" value="${getSubDepartmentslistIdObj131}" />
						<c:set var="nm132" value="${getSubDepartmentslistIdObj132}" />
						<c:set var="nm133" value="${getSubDepartmentslistIdObj133}" />
						<c:set var="nm134" value="${getSubDepartmentslistIdObj134}" />
						<c:set var="nm135" value="${getSubDepartmentslistIdObj135}" />
						<c:set var="nm136" value="${getSubDepartmentslistIdObj136}" />
						<c:set var="nm137" value="${getSubDepartmentslistIdObj137}" />
						<c:set var="nm138" value="${getSubDepartmentslistIdObj138}" />
						<c:set var="nm139" value="${getSubDepartmentslistIdObj139}" />
						<c:set var="nm140" value="${getSubDepartmentslistIdObj141}" />
						<c:set var="nm141" value="${getSubDepartmentslistIdObj141}" />
						<c:set var="nm142" value="${getSubDepartmentslistIdObj142}" />
						<c:set var="nm143" value="${getSubDepartmentslistIdObj143}" />
						<c:set var="nm144" value="${getSubDepartmentslistIdObj144}" />
						<c:set var="nm145" value="${getSubDepartmentslistIdObj145}" />
						<c:set var="nm146" value="${getSubDepartmentslistIdObj146}" />
						<c:set var="nm147" value="${getSubDepartmentslistIdObj147}" />
						<c:set var="nm148" value="${getSubDepartmentslistIdObj148}" />
						<c:set var="nm149" value="${getSubDepartmentslistIdObj149}" />
						<c:set var="nm150" value="${getSubDepartmentslistIdObj150}" />
					    <c:set var="nm151" value="${getSubDepartmentslistIdObj151}" />
						<c:set var="nm152" value="${getSubDepartmentslistIdObj152}" />
	<div class="container-scroller" id="page-content-wrapper">
		<!-- partial:partials/_navbar.html -->
		<nav
			class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div class="navbar-menu-wrapper d-flex align-items-center">
				<ul class="navbar-nav navbar-nav-left header-links d-md-flex">
					<li id="rotation"><a href="#" id="menu-toggle"
						data-toggle="offcanvas"><span
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
						<a class="nav-link dropdown-toggle" id="UserDropdown" href="#"
						data-toggle="dropdown" aria-expanded="false"> <img
							class="img-xs rounded-circle"
							src="CommonFiles/images/user-laptop-512.png"
							style="background-color: white;" alt="Profile image">
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="UserDropdown"
							style="width: 350%; background-color: #e6e6e6">
							<div class="well" style="background: #fff;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<div class="media text-center">
									<div class="media-center media-bottom">
										<img src="https://img1a.flixcart.com/www/linchpin/fk-cp-zion/img/profile-pic-male_2fd3e8.svg"
											class="media-object" style="width: 60px; margin: 0 auto;">
									</div>
									<div class="media-body">
										<h5 style="width: 100%">
											Hello,
											<%=empName%></h5>
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
				 <c:if test="${(nm == '1')||(nm1 == '1')||(nm2 == '1')||(nm3 == '1')||(nm4 == '1')||(nm5 == '1')||(nm6 == '1')||(nm7 == '1')||(nm8 == '1')||(nm9 == '1')||(nm10 == '1')||(nm11 == '1')||(nm12 == '1')||(nm13 == '1')||(nm14 == '1')||(nm15 == '1')||(nm16 == '1')||(nm17 == '1')||(nm18 == '1')||(nm19 == '1')||(nm20 == '1')||(nm21 == '1')||(nm22 == '1')||(nm23 == '1')||(nm24 == '1')||(nm25 == '1')||(nm26 == '1')||(nm27 == '1')||(nm28 == '1')||(nm29 == '1')||(nm30 == '1')||(nm31 == '1')||(nm32 == '1')||(nm33 == '1')||(nm34 == '1')||(nm35 == '1')||(nm36 == '1')||(nm37 == '1')||(nm38 == '1')||(nm39 == '1')||(nm40 == '1')||(nm41 == '1')||(nm42 == '1')||(nm43 == '1')||(nm44 == '1')||(nm45 == '1')||(nm46 == '1')||(nm47 == '1')||(nm48 == '1')||(nm49 == '1')||(nm50 == '1')||(nm51 == '1')||(nm52 == '1')||(nm53 == '1')||(nm54 == '1')||(nm55 == '1')||(nm56 == '1')||(nm57 == '1')||(nm58 == '1')||(nm59 == '1')||(nm60 == '1')||(nm61 == '1')||(nm62 == '1')||(nm63 == '1')||(nm64 == '1')||(nm65 == '1')||(nm66 == '1')||(nm67 == '1')||(nm68 == '1')||(nm69 == '1')||(nm70 == '1')||(nm71 == '1')||(nm72 == '1')||(nm73 == '1')||(nm74 == '1')||(nm75 == '1')||(nm76 == '1')||(nm77 == '1')||(nm78 == '1')||(nm79 == '1')||(nm80 == '1')||(nm81 == '1')||(nm82 == '1')||(nm83 == '1')||(nm84 == '1')||(nm85 == '1')||(nm86 == '1')||(nm87 == '1')||(nm88 == '1')||(nm89 == '1')||(nm90 == '1')||(nm91 == '1')||(nm92 == '1')||(nm93 == '1')||(nm94 == '1')||(nm95 == '1')||(nm96 == '1')||(nm97 == '1')||(nm98 == '1')||(nm99 == '1')||(nm100 == '1')||(nm101 == '1')||(nm102 == '1')||(nm103 == '1')||(nm104 == '1')||(nm105 == '1')||(nm106 == '1')||(nm107 == '1')||(nm108 == '1')||(nm109 == '1')||(nm110 == '1')||(nm111 == '1')||(nm112 == '1')||(nm113 == '1')||(nm114 == '1')||(nm115 == '1')||(nm116 == '1')||(nm117 == '1')||(nm118 == '1')||(nm119 == '1')||(nm120 == '1')||(nm121 == '1')||(nm122 == '1')||(nm123 == '1')||(nm124 == '1')||(nm125 == '1')||(nm126 == '1')||(nm127 == '1')||(nm128 == '1')||(nm129 == '1')||(nm130 == '1')||(nm131 == '1')||(nm132 == '1')||(nm133 == '1')||(nm134 == '1')||(nm135 == '1')||(nm136 == '1')||(nm137 == '1')||(nm138 == '1')||(nm139 == '1')||(nm140 == '1')||(nm141 == '1')||(nm142 == '1')||(nm143 == '1')||(nm144 == '1')||(nm145 == '1')||(nm146 == '1')||(nm147 == '1')||(nm148 == '1')||(nm149 == '1')||(nm150 == '1')||(nm151 == '1')||(nm152 == '1')}">	
					<ul class="nav" id="accordion">
					    <li class="nav-item">
						<%-- <a class="nav-link" href="${modules}"> --%>
						<a class="nav-link" href="http://localhost:8080/Master/Modules?u=<%=username%>&word=<%=password%>&firm=<%=firmsUsername%>">
						<i style="font-size: 312%; margin-left: -8px" class="menu-icon mdi mdi-crown"> 
						<span class="menu-title adjust">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ADMIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     <h6 class="glyphicon glyphicon-chevron-right"></h6>
					    </span>
					   </i> 
					   </a>
					   </li>
					   <c:if test="${(nm == '1')||(nm1 == '1')||(nm2 == '1')||(nm3 == '1')||(nm4 == '1')||(nm5 == '1')||(nm6 == '1')||(nm7 == '1')||(nm8 == '1')||(nm9 == '1')||(nm10 == '1')||(nm11 == '1')||(nm12 == '1')||(nm13 == '1')||(nm14 == '1')||(nm15 == '1')||(nm16 == '1')||(nm17 == '1')||(nm18 == '1')||(nm19 == '1')||(nm20 == '1')||(nm21 == '1')||(nm22 == '1')||(nm23 == '1')||(nm24 == '1')||(nm25 == '1')||(nm26 == '1')||(nm27 == '1')||(nm28 == '1')||(nm29 == '1')||(nm30 == '1')||(nm31 == '1')||(nm32 == '1')||(nm33 == '1')||(nm34 == '1')||(nm35 == '1')||(nm36 == '1')||(nm37 == '1')||(nm38 == '1')||(nm39 == '1')||(nm40 == '1')||(nm41 == '1')||(nm42 == '1')||(nm43 == '1')||(nm44 == '1')||(nm45 == '1')||(nm46 == '1')||(nm47 == '1')||(nm48 == '1')||(nm49 == '1')||(nm50 == '1')||(nm51 == '1')||(nm52 == '1')||(nm53 == '1')||(nm54 == '1')||(nm55 == '1')||(nm56 == '1')||(nm57 == '1')||(nm58 == '1')||(nm59 == '1')||(nm60 == '1')||(nm61 == '1')||(nm62 == '1')||(nm63 == '1')||(nm64 == '1')||(nm65 == '1')||(nm66 == '1')||(nm67 == '1')||(nm68 == '1')||(nm69 == '1')||(nm70 == '1')||(nm71 == '1')||(nm72 == '1')||(nm73 == '1')||(nm74 == '1')||(nm75 == '1')||(nm76 == '1')||(nm77 == '1')||(nm78 == '1')||(nm79 == '1')||(nm80 == '1')||(nm81 == '1')||(nm82 == '1')||(nm83 == '1')||(nm84 == '1')||(nm85 == '1')||(nm86 == '1')||(nm87 == '1')||(nm88 == '1')||(nm89 == '1')||(nm90 == '1')||(nm91 == '1')||(nm92 == '1')||(nm93 == '1')||(nm94 == '1')||(nm95 == '1')||(nm96 == '1')||(nm97 == '1')||(nm98 == '1')||(nm99 == '1')||(nm100 == '1')||(nm101 == '1')||(nm102 == '1')||(nm103 == '1')||(nm104 == '1')||(nm105 == '1')||(nm106 == '1')||(nm107 == '1')||(nm108 == '1')||(nm109 == '1')||(nm110 == '1')||(nm111 == '1')||(nm112 == '1')||(nm113 == '1')||(nm114 == '1')||(nm115 == '1')||(nm116 == '1')||(nm117 == '1')||(nm118 == '1')||(nm119 == '1')||(nm120 == '1')||(nm121 == '1')||(nm122 == '1')||(nm123 == '1')||(nm124 == '1')||(nm125 == '1')||(nm126 == '1')||(nm127 == '1')||(nm128 == '1')||(nm129 == '1')||(nm130 == '1')||(nm131 == '1')||(nm132 == '1')||(nm133 == '1')||(nm134 == '1')||(nm135 == '1')||(nm136 == '1')||(nm137 == '1')||(nm138 == '1')||(nm139 == '1')||(nm140 == '1')||(nm141 == '1')||(nm142 == '1')||(nm143 == '1')||(nm144 == '1')||(nm145 == '1')||(nm146 == '1')||(nm147 == '1')||(nm148 == '1')||(nm149 == '1')||(nm150 == '1')||(nm151 == '1')||(nm152 == '1')}">	
						<li class="nav-item"><a class="nav-link"
							href="${admindashboardurl}"> <i
								class="menu-icon mdi mdi-television">&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="menu-title"> Admin Dashboard</span>
							</i>
						</a></li>
						</c:if>	
				        <c:if test="${(nm == '1')||(nm1 == '1')||(nm2 == '1')||(nm3 == '1')||(nm4 == '1')||(nm5 == '1')||(nm6 == '1')||(nm7 == '1')||(nm8 == '1')||(nm9 == '1')||(nm10 == '1')||(nm11 == '1')||(nm12 == '1')||(nm13 == '1')||(nm14 == '1')||(nm15 == '1')||(nm16 == '1')||(nm17 == '1')||(nm18 == '1')||(nm19 == '1')||(nm20 == '1')||(nm21 == '1')||(nm22 == '1')||(nm23 == '1')||(nm24 == '1')||(nm25 == '1')||(nm26 == '1')||(nm27 == '1')||(nm28 == '1')||(nm29 == '1')||(nm30 == '1')||(nm31 == '1')||(nm32 == '1')||(nm33 == '1')||(nm34 == '1')||(nm35 == '1')||(nm36 == '1')||(nm37 == '1')||(nm38 == '1')||(nm39 == '1')||(nm40 == '1')||(nm41 == '1')||(nm42 == '1')||(nm43 == '1')||(nm44 == '1')||(nm45 == '1')||(nm46 == '1')||(nm47 == '1')||(nm48 == '1')||(nm49 == '1')||(nm50 == '1')||(nm51 == '1')||(nm52 == '1')||(nm53 == '1')||(nm54 == '1')||(nm55 == '1')||(nm56 == '1')||(nm57 == '1')||(nm58 == '1')||(nm59 == '1')||(nm60 == '1')||(nm61 == '1')||(nm62 == '1')||(nm63 == '1')||(nm64 == '1')||(nm65 == '1')||(nm66 == '1')||(nm67 == '1')||(nm68 == '1')||(nm69 == '1')||(nm70 == '1')||(nm71 == '1')||(nm72 == '1')||(nm73 == '1')||(nm74 == '1')||(nm75 == '1')||(nm76 == '1')||(nm77 == '1')||(nm78 == '1')||(nm79 == '1')||(nm80 == '1')||(nm81 == '1')||(nm82 == '1')||(nm83 == '1')||(nm84 == '1')||(nm85 == '1')||(nm86 == '1')||(nm87 == '1')||(nm88 == '1')||(nm89 == '1')||(nm90 == '1')||(nm91 == '1')||(nm92 == '1')||(nm93 == '1')||(nm94 == '1')||(nm95 == '1')||(nm96 == '1')||(nm97 == '1')||(nm98 == '1')||(nm99 == '1')||(nm100 == '1')||(nm101 == '1')||(nm102 == '1')||(nm103 == '1')||(nm104 == '1')||(nm105 == '1')||(nm106 == '1')||(nm107 == '1')||(nm108 == '1')||(nm109 == '1')||(nm110 == '1')||(nm111 == '1')||(nm112 == '1')||(nm113 == '1')||(nm114 == '1')||(nm115 == '1')||(nm116 == '1')||(nm117 == '1')||(nm118 == '1')||(nm119 == '1')||(nm120 == '1')||(nm121 == '1')||(nm122 == '1')||(nm123 == '1')||(nm124 == '1')||(nm125 == '1')||(nm126 == '1')||(nm127 == '1')||(nm128 == '1')||(nm129 == '1')||(nm130 == '1')||(nm131 == '1')||(nm132 == '1')||(nm133 == '1')||(nm134 == '1')||(nm135 == '1')||(nm136 == '1')||(nm137 == '1')||(nm138 == '1')||(nm139 == '1')||(nm140 == '1')||(nm141 == '1')||(nm142 == '1')||(nm143 == '1')||(nm144 == '1')||(nm145 == '1')||(nm146 == '1')||(nm147 == '1')||(nm148 == '1')||(nm149 == '1')||(nm150 == '1')||(nm151 == '1')||(nm152 == '1')}">	
					    <li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#ui-basic" aria-controls="ui-basic"> <i
								class="menu-icon mdi mdi-account-key">&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="menu-title">Administration</span>
							</i> <i class="menu-arrow"></i>
						</a>
							<div class="collapse" id="ui-basic" data-parent="#accordion">
								<ul class="nav flex-column sub-menu">
									<c:if test="${(nm == '12')||(nm1 == '12')||(nm2 == '12')||(nm3 == '12')||(nm4 == '12')||(nm5 == '12')||(nm6 == '12')||(nm7 == '12')||(nm8 == '12')||(nm9 == '12')||(nm10 == '12')||(nm11 == '12')||(nm12 == '12')||(nm13 == '12')||(nm14 == '12')||(nm15 == '12')||(nm16 == '12')||(nm17 == '12')||(nm18 == '12')||(nm19 == '12')||(nm20 == '12')||(nm21 == '12')||(nm22 == '12')||(nm23 == '12')||(nm24 == '12')||(nm25 == '12')||(nm26 == '12')||(nm27 == '12')||(nm28 == '12')||(nm29 == '12')||(nm30 == '12')||(nm31 == '12')||(nm32 == '12')||(nm33 == '12')||(nm34 == '12')||(nm35 == '12')||(nm36 == '12')||(nm37 == '12')||(nm38 == '12')||(nm39 == '12')||(nm40 == '12')||(nm41 == '12')||(nm42 == '12')||(nm43 == '12')||(nm44 == '12')||(nm45 == '12')||(nm46 == '12')||(nm47 == '12')||(nm48 == '12')||(nm49 == '12')||(nm50 == '12')||(nm51 == '12')||(nm52 == '12')||(nm53 == '12')||(nm54 == '12')||(nm55 == '12')||(nm56 == '12')||(nm57 == '12')||(nm58 == '12')||(nm59 == '12')||(nm60 == '12')||(nm61 == '12')||(nm62 == '12')||(nm63 == '12')||(nm64 == '12')||(nm65 == '12')||(nm66 == '12')||(nm67 == '12')||(nm68 == '12')||(nm69 == '12')||(nm70 == '12')||(nm71 == '12')||(nm72 == '12')||(nm73 == '12')||(nm74 == '12')||(nm75 == '12')||(nm76 == '12')||(nm77 == '12')||(nm78 == '12')||(nm79 == '12')||(nm80 == '12')||(nm81 == '12')||(nm82 == '12')||(nm83 == '12')||(nm84 == '12')||(nm85 == '12')||(nm86 == '12')||(nm87 == '12')||(nm88 == '12')||(nm89 == '12')||(nm90 == '12')||(nm91 == '12')||(nm92 == '12')||(nm93 == '12')||(nm94 == '12')||(nm95 == '12')||(nm96 == '12')||(nm97 == '12')||(nm98 == '12')||(nm99 == '12')||(nm100 == '12')||(nm101 == '12')||(nm102 == '12')||(nm103 == '12')||(nm104 == '12')||(nm105 == '12')||(nm106 == '12')||(nm107 == '12')||(nm108 == '12')||(nm109 == '12')||(nm110 == '12')||(nm111 == '12')||(nm112 == '12')||(nm113 == '12')||(nm114 == '12')||(nm115 == '12')||(nm116 == '12')||(nm117 == '12')||(nm118 == '12')||(nm119 == '12')||(nm120 == '12')||(nm121 == '12')||(nm122 == '12')||(nm123 == '12')||(nm124 == '12')||(nm125 == '12')||(nm126 == '12')||(nm127 == '12')||(nm128 == '12')||(nm129 == '12')||(nm130 == '12')||(nm131 == '12')||(nm132 == '12')||(nm133 == '12')||(nm134 == '12')||(nm135 == '12')||(nm136 == '12')||(nm137 == '12')||(nm138 == '12')||(nm139 == '12')||(nm140 == '12')||(nm141 == '12')||(nm142 == '12')||(nm143 == '12')||(nm144 == '12')||(nm145 == '12')||(nm146 == '12')||(nm147 == '12')||(nm148 == '12')||(nm149 == '12')||(nm150 == '12')||(nm151 == '12')||(nm152 == '12')}">
									<li class="nav-item"><a class="nav-link"
										href="${firmdetailsurl}">Firm Details</a></li>
									</c:if>	
	                                <c:if test="${(nm == '13')||(nm1 == '13')||(nm2 == '13')||(nm3 == '13')||(nm4 == '13')||(nm5 == '13')||(nm6 == '13')||(nm7 == '13')||(nm8 == '13')||(nm9 == '13')||(nm10 == '13')||(nm11 == '13')||(nm12 == '13')||(nm13 == '13')||(nm14 == '13')||(nm15 == '13')||(nm16 == '13')||(nm17 == '13')||(nm18 == '13')||(nm19 == '13')||(nm20 == '13')||(nm21 == '13')||(nm22 == '13')||(nm23 == '13')||(nm24 == '13')||(nm25 == '13')||(nm26 == '13')||(nm27 == '13')||(nm28 == '13')||(nm29 == '13')||(nm30 == '13')||(nm31 == '13')||(nm32 == '13')||(nm33 == '13')||(nm34 == '13')||(nm35 == '13')||(nm36 == '13')||(nm37 == '13')||(nm38 == '13')||(nm39 == '13')||(nm40 == '13')||(nm41 == '13')||(nm42 == '13')||(nm43 == '13')||(nm44 == '13')||(nm45 == '13')||(nm46 == '13')||(nm47 == '13')||(nm48 == '13')||(nm49 == '13')||(nm50 == '13')||(nm51 == '13')||(nm52 == '13')||(nm53 == '13')||(nm54 == '13')||(nm55 == '13')||(nm56 == '13')||(nm57 == '13')||(nm58 == '13')||(nm59 == '13')||(nm60 == '13')||(nm61 == '13')||(nm62 == '13')||(nm63 == '13')||(nm64 == '13')||(nm65 == '13')||(nm66 == '13')||(nm67 == '13')||(nm68 == '13')||(nm69 == '13')||(nm70 == '13')||(nm71 == '13')||(nm72 == '13')||(nm73 == '13')||(nm74 == '13')||(nm75 == '13')||(nm76 == '13')||(nm77 == '13')||(nm78 == '13')||(nm79 == '13')||(nm80 == '13')||(nm81 == '13')||(nm82 == '13')||(nm83 == '13')||(nm84 == '13')||(nm85 == '13')||(nm86 == '13')||(nm87 == '13')||(nm88 == '13')||(nm89 == '13')||(nm90 == '13')||(nm91 == '13')||(nm92 == '13')||(nm93 == '13')||(nm94 == '13')||(nm95 == '13')||(nm96 == '13')||(nm97 == '13')||(nm98 == '13')||(nm99 == '13')||(nm100 == '13')||(nm101 == '13')||(nm102 == '13')||(nm103 == '13')||(nm104 == '13')||(nm105 == '13')||(nm106 == '13')||(nm107 == '13')||(nm108 == '13')||(nm109 == '13')||(nm110 == '13')||(nm111 == '13')||(nm112 == '13')||(nm113 == '13')||(nm114 == '13')||(nm115 == '13')||(nm116 == '13')||(nm117 == '13')||(nm118 == '13')||(nm119 == '13')||(nm120 == '13')||(nm121 == '13')||(nm122 == '13')||(nm123 == '13')||(nm124 == '13')||(nm125 == '13')||(nm126 == '13')||(nm127 == '13')||(nm128 == '13')||(nm129 == '13')||(nm130 == '13')||(nm131 == '13')||(nm132 == '13')||(nm133 == '13')||(nm134 == '13')||(nm135 == '13')||(nm136 == '13')||(nm137 == '13')||(nm138 == '13')||(nm139 == '13')||(nm140 == '13')||(nm141 == '13')||(nm142 == '13')||(nm143 == '13')||(nm144 == '13')||(nm145 == '13')||(nm146 == '13')||(nm147 == '13')||(nm148 == '13')||(nm149 == '13')||(nm150 == '13')||(nm151 == '13')||(nm152 == '13')}">	
									<li class="nav-item"><a class="nav-link"
										href="${createuserurl}">Create User</a></li>
									</c:if>	
									<c:if test="${(nm == '14')||(nm1 == '14')||(nm2 == '14')||(nm3 == '14')||(nm4 == '14')||(nm5 == '14')||(nm6 == '14')||(nm7 == '14')||(nm8 == '14')||(nm9 == '14')||(nm10 == '14')||(nm11 == '14')||(nm12 == '14')||(nm13 == '14')||(nm14 == '14')||(nm15 == '14')||(nm16 == '14')||(nm17 == '14')||(nm18 == '14')||(nm19 == '14')||(nm20 == '14')||(nm21 == '14')||(nm22 == '14')||(nm23 == '14')||(nm24 == '14')||(nm25 == '14')||(nm26 == '14')||(nm27 == '14')||(nm28 == '14')||(nm29 == '14')||(nm30 == '14')||(nm31 == '14')||(nm32 == '14')||(nm33 == '14')||(nm34 == '14')||(nm35 == '14')||(nm36 == '14')||(nm37 == '14')||(nm38 == '14')||(nm39 == '14')||(nm40 == '14')||(nm41 == '14')||(nm42 == '14')||(nm43 == '14')||(nm44 == '14')||(nm45 == '14')||(nm46 == '14')||(nm47 == '14')||(nm48 == '14')||(nm49 == '14')||(nm50 == '14')||(nm51 == '14')||(nm52 == '14')||(nm53 == '14')||(nm54 == '14')||(nm55 == '14')||(nm56 == '14')||(nm57 == '14')||(nm58 == '14')||(nm59 == '14')||(nm60 == '14')||(nm61 == '14')||(nm62 == '14')||(nm63 == '14')||(nm64 == '14')||(nm65 == '14')||(nm66 == '14')||(nm67 == '14')||(nm68 == '14')||(nm69 == '14')||(nm70 == '14')||(nm71 == '14')||(nm72 == '14')||(nm73 == '14')||(nm74 == '14')||(nm75 == '14')||(nm76 == '14')||(nm77 == '14')||(nm78 == '14')||(nm79 == '14')||(nm80 == '14')||(nm81 == '14')||(nm82 == '14')||(nm83 == '14')||(nm84 == '14')||(nm85 == '14')||(nm86 == '14')||(nm87 == '14')||(nm88 == '14')||(nm89 == '14')||(nm90 == '14')||(nm91 == '14')||(nm92 == '14')||(nm93 == '14')||(nm94 == '14')||(nm95 == '14')||(nm96 == '14')||(nm97 == '14')||(nm98 == '14')||(nm99 == '14')||(nm100 == '14')||(nm101 == '14')||(nm102 == '14')||(nm103 == '14')||(nm104 == '14')||(nm105 == '14')||(nm106 == '14')||(nm107 == '14')||(nm108 == '14')||(nm109 == '14')||(nm110 == '14')||(nm111 == '14')||(nm112 == '14')||(nm113 == '14')||(nm114 == '14')||(nm115 == '14')||(nm116 == '14')||(nm117 == '14')||(nm118 == '14')||(nm119 == '14')||(nm120 == '14')||(nm121 == '14')||(nm122 == '14')||(nm123 == '14')||(nm124 == '14')||(nm125 == '14')||(nm126 == '14')||(nm127 == '14')||(nm128 == '14')||(nm129 == '14')||(nm130 == '14')||(nm131 == '14')||(nm132 == '14')||(nm133 == '14')||(nm134 == '14')||(nm135 == '14')||(nm136 == '14')||(nm137 == '14')||(nm138 == '14')||(nm139 == '14')||(nm140 == '14')||(nm141 == '14')||(nm142 == '14')||(nm143 == '14')||(nm144 == '14')||(nm145 == '14')||(nm146 == '14')||(nm147 == '14')||(nm148 == '14')||(nm149 == '14')||(nm150 == '14')||(nm151 == '14')||(nm152 == '14')}">
									<li class="nav-item"><a class="nav-link"
										href="${userbrowseurl}">User Browse</a></li>
									</c:if>	
									<c:if test="${(nm == '15')||(nm1 == '15')||(nm2 == '15')||(nm3 == '15')||(nm4 == '15')||(nm5 == '15')||(nm6 == '15')||(nm7 == '15')||(nm8 == '15')||(nm9 == '15')||(nm10 == '15')||(nm11 == '15')||(nm12 == '15')||(nm13 == '15')||(nm14 == '15')||(nm15 == '15')||(nm16 == '15')||(nm17 == '15')||(nm18 == '15')||(nm19 == '15')||(nm20 == '15')||(nm21 == '15')||(nm22 == '15')||(nm23 == '15')||(nm24 == '15')||(nm25 == '15')||(nm26 == '15')||(nm27 == '15')||(nm28 == '15')||(nm29 == '15')||(nm30 == '15')||(nm31 == '15')||(nm32 == '15')||(nm33 == '15')||(nm34 == '15')||(nm35 == '15')||(nm36 == '15')||(nm37 == '15')||(nm38 == '15')||(nm39 == '15')||(nm40 == '15')||(nm41 == '15')||(nm42 == '15')||(nm43 == '15')||(nm44 == '15')||(nm45 == '15')||(nm46 == '15')||(nm47 == '15')||(nm48 == '15')||(nm49 == '15')||(nm50 == '15')||(nm51 == '15')||(nm52 == '15')||(nm53 == '15')||(nm54 == '15')||(nm55 == '15')||(nm56 == '15')||(nm57 == '15')||(nm58 == '15')||(nm59 == '15')||(nm60 == '15')||(nm61 == '15')||(nm62 == '15')||(nm63 == '15')||(nm64 == '15')||(nm65 == '15')||(nm66 == '15')||(nm67 == '15')||(nm68 == '15')||(nm69 == '15')||(nm70 == '15')||(nm71 == '15')||(nm72 == '15')||(nm73 == '15')||(nm74 == '15')||(nm75 == '15')||(nm76 == '15')||(nm77 == '15')||(nm78 == '15')||(nm79 == '15')||(nm80 == '15')||(nm81 == '15')||(nm82 == '15')||(nm83 == '15')||(nm84 == '15')||(nm85 == '15')||(nm86 == '15')||(nm87 == '15')||(nm88 == '15')||(nm89 == '15')||(nm90 == '15')||(nm91 == '15')||(nm92 == '15')||(nm93 == '15')||(nm94 == '15')||(nm95 == '15')||(nm96 == '15')||(nm97 == '15')||(nm98 == '15')||(nm99 == '15')||(nm100 == '15')||(nm101 == '15')||(nm102 == '15')||(nm103 == '15')||(nm104 == '15')||(nm105 == '15')||(nm106 == '15')||(nm107 == '15')||(nm108 == '15')||(nm109 == '15')||(nm110 == '15')||(nm111 == '15')||(nm112 == '15')||(nm113 == '15')||(nm114 == '15')||(nm115 == '15')||(nm116 == '15')||(nm117 == '15')||(nm118 == '15')||(nm119 == '15')||(nm120 == '15')||(nm121 == '15')||(nm122 == '15')||(nm123 == '15')||(nm124 == '15')||(nm125 == '15')||(nm126 == '15')||(nm127 == '15')||(nm128 == '15')||(nm129 == '15')||(nm130 == '15')||(nm131 == '15')||(nm132 == '15')||(nm133 == '15')||(nm134 == '15')||(nm135 == '15')||(nm136 == '15')||(nm137 == '15')||(nm138 == '15')||(nm139 == '15')||(nm140 == '15')||(nm141 == '15')||(nm142 == '15')||(nm143 == '15')||(nm144 == '15')||(nm145 == '15')||(nm146 == '15')||(nm147 == '15')||(nm148 == '15')||(nm149 == '15')||(nm150 == '15')||(nm151 == '15')||(nm152 == '15')}">
									<li class="nav-item"><a class="nav-link"
										href="${userpermissionurl}">User Permissions</a></li>
									</c:if>	
									<c:if test="${(nm == '16')||(nm1 == '16')||(nm2 == '16')||(nm3 == '16')||(nm4 == '16')||(nm5 == '16')||(nm6 == '16')||(nm7 == '16')||(nm8 == '16')||(nm9 == '16')||(nm10 == '16')||(nm11 == '16')||(nm12 == '16')||(nm13 == '16')||(nm14 == '16')||(nm15 == '16')||(nm16 == '16')||(nm17 == '16')||(nm18 == '16')||(nm19 == '16')||(nm20 == '16')||(nm21 == '16')||(nm22 == '16')||(nm23 == '16')||(nm24 == '16')||(nm25 == '16')||(nm26 == '16')||(nm27 == '16')||(nm28 == '16')||(nm29 == '16')||(nm30 == '16')||(nm31 == '16')||(nm32 == '16')||(nm33 == '16')||(nm34 == '16')||(nm35 == '16')||(nm36 == '16')||(nm37 == '16')||(nm38 == '16')||(nm39 == '16')||(nm40 == '16')||(nm41 == '16')||(nm42 == '16')||(nm43 == '16')||(nm44 == '16')||(nm45 == '16')||(nm46 == '16')||(nm47 == '16')||(nm48 == '16')||(nm49 == '16')||(nm50 == '16')||(nm51 == '16')||(nm52 == '16')||(nm53 == '16')||(nm54 == '16')||(nm55 == '16')||(nm56 == '16')||(nm57 == '16')||(nm58 == '16')||(nm59 == '16')||(nm60 == '16')||(nm61 == '16')||(nm62 == '16')||(nm63 == '16')||(nm64 == '16')||(nm65 == '16')||(nm66 == '16')||(nm67 == '16')||(nm68 == '16')||(nm69 == '16')||(nm70 == '16')||(nm71 == '16')||(nm72 == '16')||(nm73 == '16')||(nm74 == '16')||(nm75 == '16')||(nm76 == '16')||(nm77 == '16')||(nm78 == '16')||(nm79 == '16')||(nm80 == '16')||(nm81 == '16')||(nm82 == '16')||(nm83 == '16')||(nm84 == '16')||(nm85 == '16')||(nm86 == '16')||(nm87 == '16')||(nm88 == '16')||(nm89 == '16')||(nm90 == '16')||(nm91 == '16')||(nm92 == '16')||(nm93 == '16')||(nm94 == '16')||(nm95 == '16')||(nm96 == '16')||(nm97 == '16')||(nm98 == '16')||(nm99 == '16')||(nm100 == '16')||(nm101 == '16')||(nm102 == '16')||(nm103 == '16')||(nm104 == '16')||(nm105 == '16')||(nm106 == '16')||(nm107 == '16')||(nm108 == '16')||(nm109 == '16')||(nm110 == '16')||(nm111 == '16')||(nm112 == '16')||(nm113 == '16')||(nm114 == '16')||(nm115 == '16')||(nm116 == '16')||(nm117 == '16')||(nm118 == '16')||(nm119 == '16')||(nm120 == '16')||(nm121 == '16')||(nm122 == '16')||(nm123 == '16')||(nm124 == '16')||(nm125 == '16')||(nm126 == '16')||(nm127 == '16')||(nm128 == '16')||(nm129 == '16')||(nm130 == '16')||(nm131 == '16')||(nm132 == '16')||(nm133 == '16')||(nm134 == '16')||(nm135 == '16')||(nm136 == '16')||(nm137 == '16')||(nm138 == '16')||(nm139 == '16')||(nm140 == '16')||(nm141 == '16')||(nm142 == '16')||(nm143 == '16')||(nm144 == '16')||(nm145 == '16')||(nm146 == '16')||(nm147 == '16')||(nm148 == '16')||(nm149 == '16')||(nm150 == '16')||(nm151 == '16')||(nm152 == '16')}">	
									<li class="nav-item"><a class="nav-link"
										href="${addLicenseKeyUrl}">Add License Key</a></li>
									</c:if>	
								</ul>
							</div></li>
						 </c:if>
						<c:if test="${(nm == '1')||(nm1 == '1')||(nm2 == '1')||(nm3 == '1')||(nm4 == '1')||(nm5 == '1')||(nm6 == '1')||(nm7 == '1')||(nm8 == '1')||(nm9 == '1')||(nm10 == '1')||(nm11 == '1')||(nm12 == '1')||(nm13 == '1')||(nm14 == '1')||(nm15 == '1')||(nm16 == '1')||(nm17 == '1')||(nm18 == '1')||(nm19 == '1')||(nm20 == '1')||(nm21 == '1')||(nm22 == '1')||(nm23 == '1')||(nm24 == '1')||(nm25 == '1')||(nm26 == '1')||(nm27 == '1')||(nm28 == '1')||(nm29 == '1')||(nm30 == '1')||(nm31 == '1')||(nm32 == '1')||(nm33 == '1')||(nm34 == '1')||(nm35 == '1')||(nm36 == '1')||(nm37 == '1')||(nm38 == '1')||(nm39 == '1')||(nm40 == '1')||(nm41 == '1')||(nm42 == '1')||(nm43 == '1')||(nm44 == '1')||(nm45 == '1')||(nm46 == '1')||(nm47 == '1')||(nm48 == '1')||(nm49 == '1')||(nm50 == '1')||(nm51 == '1')||(nm52 == '1')||(nm53 == '1')||(nm54 == '1')||(nm55 == '1')||(nm56 == '1')||(nm57 == '1')||(nm58 == '1')||(nm59 == '1')||(nm60 == '1')||(nm61 == '1')||(nm62 == '1')||(nm63 == '1')||(nm64 == '1')||(nm65 == '1')||(nm66 == '1')||(nm67 == '1')||(nm68 == '1')||(nm69 == '1')||(nm70 == '1')||(nm71 == '1')||(nm72 == '1')||(nm73 == '1')||(nm74 == '1')||(nm75 == '1')||(nm76 == '1')||(nm77 == '1')||(nm78 == '1')||(nm79 == '1')||(nm80 == '1')||(nm81 == '1')||(nm82 == '1')||(nm83 == '1')||(nm84 == '1')||(nm85 == '1')||(nm86 == '1')||(nm87 == '1')||(nm88 == '1')||(nm89 == '1')||(nm90 == '1')||(nm91 == '1')||(nm92 == '1')||(nm93 == '1')||(nm94 == '1')||(nm95 == '1')||(nm96 == '1')||(nm97 == '1')||(nm98 == '1')||(nm99 == '1')||(nm100 == '1')||(nm101 == '1')||(nm102 == '1')||(nm103 == '1')||(nm104 == '1')||(nm105 == '1')||(nm106 == '1')||(nm107 == '1')||(nm108 == '1')||(nm109 == '1')||(nm110 == '1')||(nm111 == '1')||(nm112 == '1')||(nm113 == '1')||(nm114 == '1')||(nm115 == '1')||(nm116 == '1')||(nm117 == '1')||(nm118 == '1')||(nm119 == '1')||(nm120 == '1')||(nm121 == '1')||(nm122 == '1')||(nm123 == '1')||(nm124 == '1')||(nm125 == '1')||(nm126 == '1')||(nm127 == '1')||(nm128 == '1')||(nm129 == '1')||(nm130 == '1')||(nm131 == '1')||(nm132 == '1')||(nm133 == '1')||(nm134 == '1')||(nm135 == '1')||(nm136 == '1')||(nm137 == '1')||(nm138 == '1')||(nm139 == '1')||(nm140 == '1')||(nm141 == '1')||(nm142 == '1')||(nm143 == '1')||(nm144 == '1')||(nm145 == '1')||(nm146 == '1')||(nm147 == '1')||(nm148 == '1')||(nm149 == '1')||(nm150 == '1')||(nm151 == '1')||(nm152 == '1')}">	
					  	<li class="nav-item"><a class="nav-link"
							data-toggle="collapse" href="#ui-basic1" aria-controls="ui-basic1"> <i
								class="menu-icon mdi mdi-settings ">&nbsp;&nbsp;&nbsp;&nbsp;
									<span class="menu-title">Settings</span>
							</i><i class="menu-arrow"></i>
						</a>
							<div class="collapse" id="ui-basic1" data-parent="#accordion">
								<ul class="nav flex-column sub-menu">
	                               <c:if test="${(nm == '17')||(nm1 == '17')||(nm2 == '17')||(nm3 == '17')||(nm4 == '17')||(nm5 == '17')||(nm6 == '17')||(nm7 == '17')||(nm8 == '17')||(nm9 == '17')||(nm10 == '17')||(nm11 == '17')||(nm12 == '17')||(nm13 == '17')||(nm14 == '17')||(nm15 == '17')||(nm16 == '17')||(nm17 == '17')||(nm18 == '17')||(nm19 == '17')||(nm20 == '17')||(nm21 == '17')||(nm22 == '17')||(nm23 == '17')||(nm24 == '17')||(nm25 == '17')||(nm26 == '17')||(nm27 == '17')||(nm28 == '17')||(nm29 == '17')||(nm30 == '17')||(nm31 == '17')||(nm32 == '17')||(nm33 == '17')||(nm34 == '17')||(nm35 == '17')||(nm36 == '17')||(nm37 == '17')||(nm38 == '17')||(nm39 == '17')||(nm40 == '17')||(nm41 == '17')||(nm42 == '17')||(nm43 == '17')||(nm44 == '17')||(nm45 == '17')||(nm46 == '17')||(nm47 == '17')||(nm48 == '17')||(nm49 == '17')||(nm50 == '17')||(nm51 == '17')||(nm52 == '17')||(nm53 == '17')||(nm54 == '17')||(nm55 == '17')||(nm56 == '17')||(nm57 == '17')||(nm58 == '17')||(nm59 == '17')||(nm60 == '17')||(nm61 == '17')||(nm62 == '17')||(nm63 == '17')||(nm64 == '17')||(nm65 == '17')||(nm66 == '17')||(nm67 == '17')||(nm68 == '17')||(nm69 == '17')||(nm70 == '17')||(nm71 == '17')||(nm72 == '17')||(nm73 == '17')||(nm74 == '17')||(nm75 == '17')||(nm76 == '17')||(nm77 == '17')||(nm78 == '17')||(nm79 == '17')||(nm80 == '17')||(nm81 == '17')||(nm82 == '17')||(nm83 == '17')||(nm84 == '17')||(nm85 == '17')||(nm86 == '17')||(nm87 == '17')||(nm88 == '17')||(nm89 == '17')||(nm90 == '17')||(nm91 == '17')||(nm92 == '17')||(nm93 == '17')||(nm94 == '17')||(nm95 == '17')||(nm96 == '17')||(nm97 == '17')||(nm98 == '17')||(nm99 == '17')||(nm100 == '17')||(nm101 == '17')||(nm102 == '17')||(nm103 == '17')||(nm104 == '17')||(nm105 == '17')||(nm106 == '17')||(nm107 == '17')||(nm108 == '17')||(nm109 == '17')||(nm110 == '17')||(nm111 == '17')||(nm112 == '17')||(nm113 == '17')||(nm114 == '17')||(nm115 == '17')||(nm116 == '17')||(nm117 == '17')||(nm118 == '17')||(nm119 == '17')||(nm120 == '17')||(nm121 == '17')||(nm122 == '17')||(nm123 == '17')||(nm124 == '17')||(nm125 == '17')||(nm126 == '17')||(nm127 == '17')||(nm128 == '17')||(nm129 == '17')||(nm130 == '17')||(nm131 == '17')||(nm132 == '17')||(nm133 == '17')||(nm134 == '17')||(nm135 == '17')||(nm136 == '17')||(nm137 == '17')||(nm138 == '17')||(nm139 == '17')||(nm140 == '17')||(nm141 == '17')||(nm142 == '17')||(nm143 == '17')||(nm144 == '17')||(nm145 == '17')||(nm146 == '17')||(nm147 == '17')||(nm148 == '17')||(nm149 == '17')||(nm150 == '17')||(nm151 == '17')||(nm152 == '17')}">	
									<li class="nav-item"><a class="nav-link"
										href="${databaseBackupurl}">Database Backup</a></li>
									</c:if>		
								</ul>
							</div></li>
                       </c:if>
					</ul>
				</c:if>	
				</nav>
			</div>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card gmd-5">
								<div class="card-body">
									<form class="form-sample" id="userbrowse">
										<p class="card-description dddd slatcolor">
											<span class="glyphicon glyphicon-triangle-bottom rotate"
												onclick="myFunction('myDIV1')"></span>&nbsp;Filter
										</p>
										<div id="myDIV1">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-4 col-form-label">Select
															Department :<span style="color: red; font-size: 123%">*</span>
														</label>
														<div class="col-sm-6">
															<select style="border-color: #c0c0c0;"
																class="form-control department" id="department"
																name="department">
																<option>---select---</option>
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group row">
														<label class="col-sm-3 col-form-label">Employee Name:</label>
														<div class="col-sm-9">
															<input type="text" class="form-control "
																name="nameofuser" id="nameofuser"
																onkeyup="searchByUsername()" />
														</div>
													</div>
												</div>
											</div>
											<!-- <div class="row">
												<div class="col-md-4 mb-3">
													<div class="form-group">
														<button type="button" class="btn btn-primary gmd-4"
															onclick="location.reload(true);">
															<span class="fa fa-refresh"></span> Refresh
														</button>
														<button type="button" class="btn btn-primary gmd-4"
															onclick="searchDataTable()">
															<span class="fa fa-search"></span> Search
														</button>
													</div>
												</div>
											</div> -->
										</div>
										
	                                    <c:if test="${(nm == '23')||(nm1 == '23')||(nm2 == '23')||(nm3 == '23')||(nm4 == '23')||(nm5 == '23')||(nm6 == '23')||(nm7 == '23')||(nm8 == '23')||(nm9 == '23')||(nm10 == '23')||(nm11 == '23')||(nm12 == '23')||(nm13 == '23')||(nm14 == '23')||(nm15 == '23')||(nm16 == '23')||(nm17 == '23')||(nm18 == '23')||(nm19 == '23')||(nm20 == '23')||(nm21 == '23')||(nm22 == '23')||(nm23 == '23')||(nm24 == '23')||(nm25 == '23')||(nm26 == '23')||(nm27 == '23')||(nm28 == '23')||(nm29 == '23')||(nm30 == '23')||(nm31 == '23')||(nm32 == '23')||(nm33 == '23')||(nm34 == '23')||(nm35 == '23')||(nm36 == '23')||(nm37 == '23')||(nm38 == '23')||(nm39 == '23')||(nm40 == '23')||(nm41 == '23')||(nm42 == '23')||(nm43 == '23')||(nm44 == '23')||(nm45 == '23')||(nm46 == '23')||(nm47 == '23')||(nm48 == '23')||(nm49 == '23')||(nm50 == '23')||(nm51 == '23')||(nm52 == '23')||(nm53 == '23')||(nm54 == '23')||(nm55 == '23')||(nm56 == '23')||(nm57 == '23')||(nm58 == '23')||(nm59 == '23')||(nm60 == '23')||(nm61 == '23')||(nm62 == '23')||(nm63 == '23')||(nm64 == '23')||(nm65 == '23')||(nm66 == '23')||(nm67 == '23')||(nm68 == '23')||(nm69 == '23')||(nm70 == '23')||(nm71 == '23')||(nm72 == '23')||(nm73 == '23')||(nm74 == '23')||(nm75 == '23')||(nm76 == '23')||(nm77 == '23')||(nm78 == '23')||(nm79 == '23')||(nm80 == '23')||(nm81 == '23')||(nm82 == '23')||(nm83 == '23')||(nm84 == '23')||(nm85 == '23')||(nm86 == '23')||(nm87 == '23')||(nm88 == '23')||(nm89 == '23')||(nm90 == '23')||(nm91 == '23')||(nm92 == '23')||(nm93 == '23')||(nm94 == '23')||(nm95 == '23')||(nm96 == '23')||(nm97 == '23')||(nm98 == '23')||(nm99 == '23')||(nm100 == '23')||(nm101 == '23')||(nm102 == '23')||(nm103 == '23')||(nm104 == '23')||(nm105 == '23')||(nm106 == '23')||(nm107 == '23')||(nm108 == '23')||(nm109 == '23')||(nm110 == '23')||(nm111 == '23')||(nm112 == '23')||(nm113 == '23')||(nm114 == '23')||(nm115 == '23')||(nm116 == '23')||(nm117 == '23')||(nm118 == '23')||(nm119 == '23')||(nm120 == '23')||(nm121 == '23')||(nm122 == '23')||(nm123 == '23')||(nm124 == '23')||(nm125 == '23')||(nm126 == '23')||(nm127 == '23')||(nm128 == '23')||(nm129 == '23')||(nm130 == '23')||(nm131 == '23')||(nm132 == '23')||(nm133 == '23')||(nm134 == '23')||(nm135 == '23')||(nm136 == '23')||(nm137 == '23')||(nm138 == '23')||(nm139 == '23')||(nm140 == '23')||(nm141 == '23')||(nm142 == '23')||(nm143 == '23')||(nm144 == '23')||(nm145 == '23')||(nm146 == '23')||(nm147 == '23')||(nm148 == '23')||(nm149 == '23')||(nm150 == '23')||(nm151 == '23')||(nm152 == '23')}">
										<div class="row table-responsive ">
											<table id="example"	class="table table-striped table-bordered" style="width: 100%">
												<thead>
													<tr>
														<th>Sr.No</th>
														<th>Employee Name</th>
														<th>IP Address</th>
														<th>Username</th>
														<th>Last Login</th>
														<th>Status</th>
														       
														       <%--  
														       <c:if test="${(nm == '25')||(nm1 == '25')||(nm2 == '25')||(nm3 == '25')||(nm4 == '25')||(nm5 == '25')||(nm6 == '25')||(nm7 == '25')||(nm8 == '25')||(nm9 == '25')||(nm10 == '25')||(nm11 == '25')||(nm12 == '25')||(nm13 == '25')||(nm14 == '25')||(nm15 == '25')||(nm16 == '25')||(nm17 == '25')||(nm18 == '25')||(nm19 == '25')||(nm20 == '25')||(nm21 == '25')||(nm22 == '25')||(nm23 == '25')||(nm24 == '25')||(nm25 == '25')||(nm26 == '25')||(nm27 == '25')||(nm28 == '25')||(nm29 == '25')||(nm30 == '25')||(nm31 == '25')||(nm32 == '25')||(nm33 == '25')||(nm34 == '25')||(nm35 == '25')||(nm36 == '25')||(nm37 == '25')||(nm38 == '25')||(nm39 == '25')||(nm40 == '25')||(nm41 == '25')||(nm42 == '25')||(nm43 == '25')||(nm44 == '25')||(nm45 == '25')||(nm46 == '25')||(nm47 == '25')||(nm48 == '25')||(nm49 == '25')||(nm50 == '25')||(nm51 == '25')||(nm52 == '25')||(nm53 == '25')||(nm54 == '25')||(nm55 == '25')||(nm56 == '25')||(nm57 == '25')||(nm58 == '25')||(nm59 == '25')||(nm60 == '25')||(nm61 == '25')||(nm62 == '25')||(nm63 == '25')||(nm64 == '25')||(nm65 == '25')||(nm66 == '25')||(nm67 == '25')||(nm68 == '25')||(nm69 == '25')||(nm70 == '25')||(nm71 == '25')||(nm72 == '25')||(nm73 == '25')||(nm74 == '25')||(nm75 == '25')||(nm76 == '25')||(nm77 == '25')||(nm78 == '25')||(nm79 == '25')||(nm80 == '25')||(nm81 == '25')||(nm82 == '25')||(nm83 == '25')||(nm84 == '25')||(nm85 == '25')||(nm86 == '25')||(nm87 == '25')||(nm88 == '25')||(nm89 == '25')||(nm90 == '25')||(nm91 == '25')||(nm92 == '25')||(nm93 == '25')||(nm94 == '25')||(nm95 == '25')||(nm96 == '25')||(nm97 == '25')||(nm98 == '25')||(nm99 == '25')||(nm100 == '25')||(nm101 == '25')||(nm102 == '25')||(nm103 == '25')||(nm104 == '25')||(nm105 == '25')||(nm106 == '25')||(nm107 == '25')||(nm108 == '25')||(nm109 == '25')||(nm110 == '25')||(nm111 == '25')||(nm112 == '25')||(nm113 == '25')||(nm114 == '25')||(nm115 == '25')||(nm116 == '25')||(nm117 == '25')||(nm118 == '25')||(nm119 == '25')||(nm120 == '25')||(nm121 == '25')||(nm122 == '25')||(nm123 == '25')||(nm124 == '25')||(nm125 == '25')||(nm126 == '25')||(nm127 == '25')||(nm128 == '25')||(nm129 == '25')||(nm130 == '25')||(nm131 == '25')||(nm132 == '25')||(nm133 == '25')||(nm134 == '25')||(nm135 == '25')||(nm136 == '25')||(nm137 == '25')||(nm138 == '25')||(nm139 == '25')||(nm140 == '25')||(nm141 == '25')||(nm142 == '25')||(nm143 == '25')||(nm144 == '25')||(nm145 == '25')||(nm146 == '25')||(nm147 == '25')||(nm148 == '25')||(nm149 == '25')||(nm150 == '25')||(nm151 == '25')||(nm152 == '25')}">
										                        --%>
                                                        
														<th>Action</th>
														 <%-- </c:if> --%>
														 	<%-- <c:choose>
                                            
                                            <c:when test="${(nm == '25')||(nm1 == '25')||(nm2 == '25')||(nm3 == '25')||(nm4 == '25')||(nm5 == '25')||(nm6 == '25')||(nm7 == '25')||(nm8 == '25')||(nm9 == '25')||(nm10 == '25')||(nm11 == '25')||(nm12 == '25')||(nm13 == '25')||(nm14 == '25')||(nm15 == '25')||(nm16 == '25')||(nm17 == '25')||(nm18 == '25')||(nm19 == '25')||(nm20 == '25')||(nm21 == '25')||(nm22 == '25')||(nm23 == '25')||(nm24 == '25')||(nm25 == '25')||(nm26 == '25')||(nm27 == '25')||(nm28 == '25')||(nm29 == '25')||(nm30 == '25')||(nm31 == '25')||(nm32 == '25')||(nm33 == '25')||(nm34 == '25')||(nm35 == '25')||(nm36 == '25')||(nm37 == '25')||(nm38 == '25')||(nm39 == '25')||(nm40 == '25')||(nm41 == '25')||(nm42 == '25')||(nm43 == '25')||(nm44 == '25')||(nm45 == '25')||(nm46 == '25')||(nm47 == '25')||(nm48 == '25')||(nm49 == '25')||(nm50 == '25')||(nm51 == '25')||(nm52 == '25')||(nm53 == '25')||(nm54 == '25')||(nm55 == '25')||(nm56 == '25')||(nm57 == '25')||(nm58 == '25')||(nm59 == '25')||(nm60 == '25')||(nm61 == '25')||(nm62 == '25')||(nm63 == '25')||(nm64 == '25')||(nm65 == '25')||(nm66 == '25')||(nm67 == '25')||(nm68 == '25')||(nm69 == '25')||(nm70 == '25')||(nm71 == '25')||(nm72 == '25')||(nm73 == '25')||(nm74 == '25')||(nm75 == '25')||(nm76 == '25')||(nm77 == '25')||(nm78 == '25')||(nm79 == '25')||(nm80 == '25')||(nm81 == '25')||(nm82 == '25')||(nm83 == '25')||(nm84 == '25')||(nm85 == '25')||(nm86 == '25')||(nm87 == '25')||(nm88 == '25')||(nm89 == '25')||(nm90 == '25')||(nm91 == '25')||(nm92 == '25')||(nm93 == '25')||(nm94 == '25')||(nm95 == '25')||(nm96 == '25')||(nm97 == '25')||(nm98 == '25')||(nm99 == '25')||(nm100 == '25')||(nm101 == '25')||(nm102 == '25')||(nm103 == '25')||(nm104 == '25')||(nm105 == '25')||(nm106 == '25')||(nm107 == '25')||(nm108 == '25')||(nm109 == '25')||(nm110 == '25')||(nm111 == '25')||(nm112 == '25')||(nm113 == '25')||(nm114 == '25')||(nm115 == '25')||(nm116 == '25')||(nm117 == '25')||(nm118 == '25')||(nm119 == '25')||(nm120 == '25')||(nm121 == '25')||(nm122 == '25')||(nm123 == '25')||(nm124 == '25')||(nm125 == '25')||(nm126 == '25')||(nm127 == '25')||(nm128 == '25')||(nm129 == '25')||(nm130 == '25')||(nm131 == '25')||(nm132 == '25')||(nm133 == '25')||(nm134 == '25')||(nm135 == '25')||(nm136 == '25')||(nm137 == '25')||(nm138 == '25')||(nm139 == '25')||(nm140 == '25')||(nm141 == '25')||(nm142 == '25')||(nm143 == '25')||(nm144 == '25')||(nm145 == '25')||(nm146 == '25')||(nm147 == '25')||(nm148 == '25')||(nm149 == '25')||(nm150 == '25')||(nm151 == '25')||(nm152 == '25')}">
                                            <th>Action</th>
	                                        </c:when>
	                                        <c:otherwise>
                                            <th>Action</th>
                                            </c:otherwise>
                                            </c:choose> --%>
													</tr>
												</thead>
												<tbody id="userBrowseData">	</tbody>
											</table>
										</div>
										</c:if> 
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



				<!-- edit user details start -->



				<div class="modal fade" id="editUSerDetails" role="dialog">
					<div class="modal-dialog modal-lg modal-dialog-centered"
						style="width: 55%; align-content: center;">
						<div class="modal-content" style="background-color: white">
							<div class="modal-header">
								<form class="form-sample" id="serializeEdituserdetails">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title  fa fa-user">
										<a style="font-weight: bold; font-family: sans-serif;">Edit
											User Details :</a>
									</h4>

									<div align="right" style="margin-right: 4.5%">
										<button type="button"
											class="btn btn-primary gmd-4 fa fa-sign-in btn-round"
											aria-hidden="true">&nbsp;Login As</button>
										<button type="button"
											class="btn btn-primary gmd-4 fa fa-power-off "
											aria-hidden="true" onclick="logoutStatus()">&nbsp;Logout</button>
									</div>
									<br>




									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">First Name :<span
													style="color: red; font-size: 123%">*</span></label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="efirstName"
														name="efirstName" required="required" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Last Name :<span
													style="color: red; font-size: 123%">*</span></label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="elastName"
														name="elastName" required="required" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">E-mail-ID :</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="eemailId"
														name="eemailId" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Mobile No :<span
													style="color: red; font-size: 123%">*</span></label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="emobNumbr"
														name="emobNumbr" min="10" required="required" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Date Of Birth
													:</label>
												<div class="col-sm-8">
													<input type="date" class="form-control" id="edateofBirth"
														name="edateofBirth" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Department :<span
													style="color: red; font-size: 123%">*</span></label>
												<div class="col-sm-8">
													<select style="border-color: #c0c0c0;"
														class="form-control department" id="edepartment"
														name="edepartment" required>
														<option value="">-----select------</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Employee ID :<span
													style="color: red; font-size: 123%">*</span>
												</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="eempId"
														name="eempId" required="required" />
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Role /
													Profile :<span style="color: red; font-size: 123%">*</span>
												</label>
												<div class="col-sm-8">
													<select style="border-color: #c0c0c0;"
														class="form-control designation" id="edesignation"
														name="edesignation" required>
														<option value="">-----select------</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group row">
												<label class="col-sm-3 col-form-label">Status :</label>
												<div class="col-sm-8">
													<select style="border-color: #c0c0c0;" class="form-control"
														id="estatus" name="estatus">
														<option>--Select--</option>
														<option>Active</option>
														<option>Suspend</option>
													</select>
												</div>
											</div>
										</div>

									</div>


									<div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label" for="state">State
														:<span style="color: red; font-size: 123%">*</span>
													</label>
													<div class="col-sm-8">
														<input type="text" name="estate" id="estate"
															class="form-control" onfocus="autosuggestionstate()"
															required="required" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">City :<span
														style="color: red; font-size: 123%">*</span></label>
													<div class="col-sm-8">
														<input type="text" name="ecity" id="ecity"
															class="form-control" onfocus="autosuggestioncity()"
															required="required" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Area :<span
														style="color: red; font-size: 123%">*</span></label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="earea"
															name="earea" onfocus="autosuggestionarea()"
															required="required" />
													</div>
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Postal Code
														:<span style="color: red; font-size: 123%">*</span>
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="epostalCode"
															name="epostalCode" maxlength="6" required="required" />
													</div>
												</div>
											</div>

										</div>
									</div>

									<div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Username :<span
														style="color: red; font-size: 123%">*</span></label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="euserName"
															name="euserName" required="required" />
													</div>
												</div>
											</div>


											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Password :<span
														style="color: red; font-size: 123%">*</span></label>
													<div class="col-sm-8">
														<input type="password" class="form-control"
															id="epassWordnew" name="epassWordnew" required="required" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Confirm-Password
														:<span style="color: red; font-size: 123%">*</span>
													</label>
													<div class="col-sm-8">
														<input type="text" class="form-control"
															id="econfirmPasswordnew" name="econfirmPasswordnew"
															required="required" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<div class="col-sm-8">
														<input type="hidden" class="form-control" id="userId"
															name="userId" />
													</div>
												</div>
											</div>
										</div>
									</div>


									<div align="center">
                                        <c:choose>
                                          <c:when test="${(nm == '26')||(nm1 == '26')||(nm2 == '26')||(nm3 == '26')||(nm4 == '26')||(nm5 == '26')||(nm6 == '26')||(nm7 == '26')||(nm8 == '26')||(nm9 == '26')||(nm10 == '26')||(nm11 == '26')||(nm12 == '26')||(nm13 == '26')||(nm14 == '26')||(nm15 == '26')||(nm16 == '26')||(nm17 == '26')||(nm18 == '26')||(nm19 == '26')||(nm20 == '26')||(nm21 == '26')||(nm22 == '26')||(nm23 == '26')||(nm24 == '26')||(nm25 == '26')||(nm26 == '26')||(nm27 == '26')||(nm28 == '26')||(nm29 == '26')||(nm30 == '26')||(nm31 == '26')||(nm32 == '26')||(nm33 == '26')||(nm34 == '26')||(nm35 == '26')||(nm36 == '26')||(nm37 == '26')||(nm38 == '26')||(nm39 == '26')||(nm40 == '26')||(nm41 == '26')||(nm42 == '26')||(nm43 == '26')||(nm44 == '26')||(nm45 == '26')||(nm46 == '26')||(nm47 == '26')||(nm48 == '26')||(nm49 == '26')||(nm50 == '26')||(nm51 == '26')||(nm52 == '26')||(nm53 == '26')||(nm54 == '26')||(nm55 == '26')||(nm56 == '26')||(nm57 == '26')||(nm58 == '26')||(nm59 == '26')||(nm60 == '26')||(nm61 == '26')||(nm62 == '26')||(nm63 == '26')||(nm64 == '26')||(nm65 == '26')||(nm66 == '26')||(nm67 == '26')||(nm68 == '26')||(nm69 == '26')||(nm70 == '26')||(nm71 == '26')||(nm72 == '26')||(nm73 == '26')||(nm74 == '26')||(nm75 == '26')||(nm76 == '26')||(nm77 == '26')||(nm78 == '26')||(nm79 == '26')||(nm80 == '26')||(nm81 == '26')||(nm82 == '26')||(nm83 == '26')||(nm84 == '26')||(nm85 == '26')||(nm86 == '26')||(nm87 == '26')||(nm88 == '26')||(nm89 == '26')||(nm90 == '26')||(nm91 == '26')||(nm92 == '26')||(nm93 == '26')||(nm94 == '26')||(nm95 == '26')||(nm96 == '26')||(nm97 == '26')||(nm98 == '26')||(nm99 == '26')||(nm100 == '26')||(nm101 == '26')||(nm102 == '26')||(nm103 == '26')||(nm104 == '26')||(nm105 == '26')||(nm106 == '26')||(nm107 == '26')||(nm108 == '26')||(nm109 == '26')||(nm110 == '26')||(nm111 == '26')||(nm112 == '26')||(nm113 == '26')||(nm114 == '26')||(nm115 == '26')||(nm116 == '26')||(nm117 == '26')||(nm118 == '26')||(nm119 == '26')||(nm120 == '26')||(nm121 == '26')||(nm122 == '26')||(nm123 == '26')||(nm124 == '26')||(nm125 == '26')||(nm126 == '26')||(nm127 == '26')||(nm128 == '26')||(nm129 == '26')||(nm130 == '26')||(nm131 == '26')||(nm132 == '26')||(nm133 == '26')||(nm134 == '26')||(nm135 == '26')||(nm136 == '26')||(nm137 == '26')||(nm138 == '26')||(nm139 == '26')||(nm140 == '26')||(nm141 == '26')||(nm142 == '26')||(nm143 == '26')||(nm144 == '26')||(nm145 == '26')||(nm146 == '26')||(nm147 == '26')||(nm148 == '26')||(nm149 == '26')||(nm150 == '26')||(nm151 == '26')||(nm152 == '26')}">
                                           <button type="button"
											class="btn btn-primary gmd-4 fa fa-download"
											aria-hidden="true" onclick="updateUserBrowseData()">
											Update</button>
	                                        </c:when>
                                            <c:otherwise>
                                            <button type="button" <c:out value="disabled='disabled'"/> 
											class="btn btn-primary gmd-4 fa fa-download"
											aria-hidden="true">
											Update</button>
                                            </c:otherwise>
                                            </c:choose>
                                         <button type="reset"
											class="btn btn-primary gmd-4 fa fa-times-circle"
											class="close" data-dismiss="modal" aria-hidden="true">
											Cancel</button>
									</div>
								</form>

							</div>


						</div>
					</div>
				</div>

				<!-- edit user details start -->




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
	<!-- <script src="CommonFiles/vendors/js/vendor.bundle.base.js"></script> -->
	<script src="CommonFiles/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="CommonFiles/js/off-canvas.js"></script>
	<!-- <script src="CommonFiles/js/misc.js"></script> -->
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