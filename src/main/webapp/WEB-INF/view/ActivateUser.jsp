<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
<title>ERP | Activate New User</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="shortcut icon" href="CommonFiles/images/grobizlogo.jpg" />
<!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!--Custom styles-->

<link href="CommonFiles/css/login-register.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="js/login-register.js"></script> -->
<script src="/Admin/js/activateUser.js"></script>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Activate New User</h3>
				</div>
				<div class="card-body">
					<form id="ActivateUserdata">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i style="color: white;" class="fas fa-user"></i></span>
							</div>
							<input  type="text" class="form-control" id="username" name="username" placeholder="Username"/>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i style="color: white;" class="fas fa-key"></i></span>
							</div>
							<input  type="password" class="form-control" id="password" name="password" placeholder="User Password"/>
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i style="color: white;" class="fas fa-home"></i></span>
							</div>
							<input type="text" class="form-control" id="FirmsUserName" name="FirmsUserName" placeholder="Firms User Name"/>
						</div>
						<div class="input-group form-group">
							<!-- <div class="input-group-prepend">
								<span class="input-group-text"><i style="color: white;" class="fas fa-home"></i></span>
							</div> -->
							<input type="text" class="form-control" id="first" maxlength="5" name="first" onkeypress ="jump(this)" style="text-transform:uppercase; font-size: 14px;" placeholder="Enter"/>
							<input type="text" class="form-control" id="second" maxlength="5" name="second" onkeypress ="jump(this)" style="text-transform:uppercase; font-size: 14px;" placeholder="Your"/>
							<input type="text" class="form-control" id="third" maxlength="5" name="third" onkeypress ="jump(this)" style="text-transform:uppercase; font-size: 14px;" placeholder="Licens"/>
							<input type="text" class="form-control" id="fourth" maxlength="5" name="fourth" onkeypress ="jump(this)" style="text-transform:uppercase; font-size: 14px;" placeholder=" Key" />
							<input type="text" class="form-control" id="fifth" maxlength="4" name="fifth" onkeyup ="jum(this)" style="text-transform:uppercase; font-size: 14px;" placeholder="Here"/>
						</div>
						<div id="activateB" class="form-group" style="display: none;">
							<input style="color: white;" type="submit" value="Activate" class="btn float-right login_btn"/>
						</div>
					</form>
				</div>
				<!-- <div class="card-footer">
					<div class="d-flex justify-content-center links">
						Don't have an account?<a href="http://103.210.200.101:8080/LicenseKey">Sign Up</a>
					</div>
					<div class="d-flex justify-content-center">
						<input style="color: white;" type="button" value="Register Firm" class="btn float-right logi_btn" onclick="openLicenseKeyPage()">
					</div>
					<div class="d-flex justify-content-center">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input style="color: white;" type="button" value="Activate New User" class="btn float-right logi_btn" onclick="openActivateUser()">
					</div>
				</div> -->
			</div>
		</div>
	</div>
	
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
</body>
</html>