package com.edzeal.Admin.Controller;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.edzeal.Controller.FirmController;
import com.edzeal.POJO.ADMIN.LicenseKeyModel;
import com.edzeal.POJO.ADMIN.ParentFirmsModel;
import com.edzeal.POJO.ADMIN.UserAccessPermissionsModel;
import com.edzeal.POJO.ADMIN.UserLoginDetailsModel;
import com.edzeal.POJO.ADMIN.UserRegistrationModel;
import com.edzeal.POJO.MASTER.Area;
import com.edzeal.POJO.MASTER.City;
import com.edzeal.POJO.MASTER.DepartmentsModel;
import com.edzeal.POJO.MASTER.Designation;
import com.edzeal.POJO.MASTER.State;
import com.edzeal.Repository.ADMIN.DepartmentsRepository;
import com.edzeal.Repository.ADMIN.LicenseKeyRepository;
import com.edzeal.Repository.ADMIN.ParentFirmsRepository;
import com.edzeal.Repository.ADMIN.UserAccessPermissionRepository;
import com.edzeal.Repository.ADMIN.UserLoginRepository;
import com.edzeal.Repository.ADMIN.UserRegistrationRepository;
import com.edzeal.Repository.MASTER.AreaRepository;
import com.edzeal.Repository.MASTER.CityRepository;
import com.edzeal.Repository.MASTER.DesignationRepository;
import com.edzeal.Repository.MASTER.StateRepository;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class CreateNewUserController {

	@Autowired
	UserRegistrationRepository userRepoObj;
	@Autowired
	UserLoginRepository userLoginRepositoryObj;
	@Autowired
	LicenseKeyRepository licenseKeyRepositoryObj;
	@Autowired
	StateRepository stateRepositoryObj;
	@Autowired
	CityRepository cityRepositoryObj;
	@Autowired
	DepartmentsRepository departmentsRepositoryObj;
	@Autowired
	AreaRepository areaRepositoryObj;
	@Autowired
	DesignationRepository designationsRepositoryObj;
	@Autowired
	UserAccessPermissionRepository userAccessPermissionRepositoryObj;
	
	@Autowired
	ParentFirmsRepository prntFirmRepoObj;
	
	java.util.Date utilDate = new java.util.Date();
	java.sql.Date todayDate = new java.sql.Date(utilDate.getTime());


	@RequestMapping("/CreateUser")
	public ModelAndView userbrowse(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String username = null;
		try {
			username = (String) session.getAttribute("usernames");
		} catch (Exception e) {
			System.out.println(e);
		}
		if (username != null) {
			return new ModelAndView("ADMIN/CreateNewUser");
		} else {
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(value = "/saveNewUserDetails", method = RequestMethod.POST)
	@ResponseBody
	public String saveNewUserDetails(@RequestParam("dateofBirth") Date dateofBirth, HttpServletRequest request) {
		String FirstName = request.getParameter("firstName");
		String LastName = request.getParameter("lastName");
		String EmailId = request.getParameter("emailId");
		String mailPasswrd = request.getParameter("mailPasswrd");
		String MobNumbr = request.getParameter("mobNumbr");
		String Departments = request.getParameter("departments");
		System.out.println("Departments>>"+Departments);
		String EmpId = request.getParameter("empId");
		String Designation = request.getParameter("designation");
		String State = request.getParameter("state");
		String City = request.getParameter("city");
		String Area = request.getParameter("area");
		String PostalCode = request.getParameter("postalCode");
		String NewUsername = request.getParameter("userName");
		String NewPassword = request.getParameter("passWordnew");
		String employeeName = FirstName.concat(" " + LastName);
		System.out.println("employeeName" + employeeName);
		Calendar exDateCal = Calendar.getInstance();
		exDateCal.add(Calendar.DAY_OF_MONTH,0);
		
		HttpSession session = request.getSession(false);
		String firmsUsername=(String) session.getAttribute("firmsUsername");
		//FirmRegistrationModel findByFirmsUserName = firmRegistrationRepositoryObj.findByFirmsUserName(firmsUsername);
		ParentFirmsModel prntFirmObj = prntFirmRepoObj.findByParentFirmsUserName(firmsUsername);
		UserRegistrationModel userObj = userRepoObj.findByUsernameAndParentFirmObj(NewUsername,prntFirmObj);
		JsonArray jArray = new JsonArray();
		JsonObject jObject = new JsonObject();
		if (userObj == null) {
			UserRegistrationModel userObj1 = userRepoObj.findByemployeeId(EmpId);
			if (userObj1 == null)
			{
				try {
					State stateobj1 = stateRepositoryObj.findByState(State);
					if (stateobj1 == null) {
						State saveStatesobj = new State();
						saveStatesobj.setState(State);
						stateRepositoryObj.saveAndFlush(saveStatesobj);
					}
					State stateobj2 = stateRepositoryObj.findByState(State);
					City cityObj1 = cityRepositoryObj.findByCityAndState(City, stateobj2);
					
					if (cityObj1 == null) {
						City SaveCityObj = new City();
						SaveCityObj.setCity(City);
						SaveCityObj.setState(stateobj2);
						cityRepositoryObj.saveAndFlush(SaveCityObj);
					}
					City cityObj2 = cityRepositoryObj.findByCityAndState(City, stateobj2);

					Area AreaDetails1 = areaRepositoryObj.findByAreaAndCityAndState(Area, cityObj2, stateobj2);
					
					if (AreaDetails1 == null) {
						Area areaObj = new Area();
						areaObj.setArea(Area);
						areaObj.setAreaCode(PostalCode);
						areaObj.setCity(cityObj2);
						areaObj.setState(stateobj2);
						areaRepositoryObj.saveAndFlush(areaObj);
					}
				} catch (Exception e) {

				}
				Designation DesignationDetails = designationsRepositoryObj.findByDesignation(Designation);
				DepartmentsModel departmentnameDetails  = departmentsRepositoryObj.findByDepartmentname(Departments);
				UserRegistrationModel userregistrationObj = new UserRegistrationModel();
				UserAccessPermissionsModel userAccessObj = new UserAccessPermissionsModel();
				userregistrationObj.setEmployeeName(employeeName);
				userregistrationObj.setEmailId(EmailId);
				userregistrationObj.setMailpassword(mailPasswrd);
				userregistrationObj.setMobileNo(MobNumbr);
				userregistrationObj.setDateOfBirth(dateofBirth);
				userregistrationObj.setDepartmentModelObj(departmentnameDetails);
				userregistrationObj.setEmployeeId(EmpId);
				userregistrationObj.setDesignationObj(DesignationDetails);
				userregistrationObj.setStatus("Deactive");
				userregistrationObj.setState(State);
				userregistrationObj.setCity(City);
				userregistrationObj.setArea(Area);
				userregistrationObj.setPinCode(Integer.parseInt(PostalCode));
				userregistrationObj.setUsername(NewUsername);
				userregistrationObj.setPassword(NewPassword);
				//userregistrationData.setFirmRegistrationModelObj(findByFirmsUserName);
				userregistrationObj.setParentFirmObj(prntFirmObj);
				userAccessObj.setDepartmentsIdObj(departmentnameDetails);
				userAccessObj.setPermissionGrantDate(new Date(exDateCal.getTime().getTime()));
				userRepoObj.save(userregistrationObj);
				userAccessObj.setRegistrationsIdObj(userregistrationObj);
				userAccessPermissionRepositoryObj.saveAndFlush(userAccessObj);
				jObject.addProperty("success", "success");
			} else {
				jObject.addProperty("success", "DuplicateEmpId");
			}

		} else {
			jObject.addProperty("success", "denied");
		}
		jArray.add(jObject);
		return new Gson().toJson(jArray);
	}

	@RequestMapping(value = "/Admin/userBrowseData", method = RequestMethod.POST)
	@ResponseBody
	public String userBrowseData(HttpServletRequest request) {
		JsonArray jArray = new JsonArray();
		JsonObject json = new JsonObject();
		String employeeName = request.getParameter("nameofuser");
		String department = request.getParameter("departmentName");
		System.out.println("department" + department);
		List<UserRegistrationModel> findByUsername = userRepoObj.findByEmployeeName(employeeName);
		System.out.println("findByUsername><" + findByUsername.size());
		for (UserRegistrationModel userRegistrationModel : findByUsername) {
			System.out.println("aa" + userRegistrationModel.getDepartmentModelObj());
			if (userRegistrationModel.getDepartmentModelObj().getDepartmentname().equals(department)) {
				json.addProperty("employeeName", userRegistrationModel.getEmployeeName());
			} else {
				json.addProperty("Error", "Department Is Not Present To Perticuler User");

			}

		}

		jArray.add(json);
		return new Gson().toJson(jArray);

	}





	@RequestMapping(value ="/AddLicenseKey")
	public ModelAndView addlicensekey(ModelMap map, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String username = null;
		try {
			username = (String) session.getAttribute("usernames");
		} catch (Exception e) {
			System.out.println(e);
		}
		if (username != null) {
			return new ModelAndView("ADMIN/AddLicenseKey");
		} else {
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(value = "/registerAndAddLicenseKey", method = RequestMethod.POST)
	@ResponseBody
	public String registerAndAddLicenseKey(HttpServletRequest request) {
		String licenKey = request.getParameter("licenseKey").toUpperCase();
		HttpSession session = request.getSession(false);
		String prntFirmUsername=(String) session.getAttribute("firmsUsername");
		ParentFirmsModel prntFirmObj = prntFirmRepoObj.findByParentFirmsUserName(prntFirmUsername);
		JsonArray jArray = new JsonArray();
		JsonObject jObject = new JsonObject();
		try {
			LicenseKeyModel licenseKeyObj = licenseKeyRepositoryObj.findByLicenseKey(licenKey);
			if (licenseKeyObj == null) {
				LicenseKeyController licKeyCObj = new LicenseKeyController();
				int firmId = 0;
				int noOfLicen = 0;
				boolean f = false;
				ResultSet rs = licKeyCObj.checkLicenOnServer(licenKey,"false");
				if (rs.next()) 
				{
					ResultSet rs1 = licKeyCObj.checkParentFirmOnServer(prntFirmUsername);
					if (rs1.next()) 
					{
						firmId = rs1.getInt("parent_firms_id");
						noOfLicen = rs1.getInt("no_of_license");
						f = licKeyCObj.registerKeyOnSeverForPrntFirm(todayDate, licenKey, firmId);
						if(f)
						{
							noOfLicen++;
							f = licKeyCObj.updateNoOfLicenOfPrntFirmonServer(noOfLicen,firmId);
							if(f)
							{
								LicenseKeyModel licenKeyObj = new LicenseKeyModel();
								licenKeyObj.setLicenseKey(licenKey);
								licenKeyObj.setParentFirmObj(prntFirmObj);
								licenKeyObj.setRegistrationdate(todayDate);
								licenseKeyRepositoryObj.saveAndFlush(licenKeyObj);
								jObject.addProperty("Success", "Success");
							}
							else
							{
								jObject.addProperty("Success", "fail");
							}
						}	
					}
				}
				/*LicenseKeyModel licenseKeyObj1 = new LicenseKeyModel();
				licenseKeyObj1.setLicenseKey(LicenseKey);
				licenseKeyObj1.setParentFirmObj(prntFirmObj);
				licenseKeyRepositoryObj.save(licenseKeyObj1);
				jObject.addProperty("Success", "Success");*/
			} else {
				jObject.addProperty("Success", "denied");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		jArray.add(jObject);
		return new Gson().toJson(jArray);
	}

	@RequestMapping(value = "/Admin/licesekeydatatabel", method = RequestMethod.POST)
	@ResponseBody
	public String licesekeydatatabel(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		FirmController firmControlrObj = new FirmController();
		ParentFirmsModel parentFirmObj = firmControlrObj.getCurrentParentFirmObject(session, prntFirmRepoObj);
		List<LicenseKeyModel> licenseKeyList = licenseKeyRepositoryObj.findByParentFirmObj(parentFirmObj);
		JsonArray jArray = new JsonArray();

		DateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy ");

		for (LicenseKeyModel licenseKeyModel : licenseKeyList) 
		{
			JsonObject jObject = new JsonObject();
			String	registrationdate="null";
			Date Registradate = licenseKeyModel.getRegistrationdate();
			
			if(Registradate!=null)
			{
				registrationdate = dateFormat.format(Registradate);
			}
			jObject.addProperty("LicenseKey", licenseKeyModel.getLicenseKey());
			jObject.addProperty("Registrationdate", registrationdate);
			jObject.addProperty("LicenseKeyId", licenseKeyModel.getLinceseKeyId());
			try {
				if (licenseKeyModel.getUserRegistrationModelObj() != null)
				{
					jObject.addProperty("EmployeeName", licenseKeyModel.getUserRegistrationModelObj().getEmployeeName());
					jObject.addProperty("Mobilenubmer", licenseKeyModel.getUserRegistrationModelObj().getMobileNo());
					jObject.addProperty("UserId", "ok");
				} else {
					jObject.addProperty("EmployeeName", "Null");
					jObject.addProperty("Mobilenubmer", "Null");
				}
			} catch (Exception e) {
				System.out.println(e);
			}
			jArray.add(jObject);
		}
		return new Gson().toJson(jArray);
	}

	@RequestMapping(value="/Admin/getarea")
	@ResponseBody
	public String autosuggestionarea(HttpServletRequest request) {

		String cityName = request.getParameter("city");
		String state = request.getParameter("state");
		System.out.println("state>>" + state);
		JsonArray jArray = new JsonArray();
		List<City> findByCity = cityRepositoryObj.findByCity(cityName);
		System.out.println("findByCity><>" + findByCity.size());
		State findByState = stateRepositoryObj.findByState(state);
		System.out.println("findByCity><>" + findByState);

		for (City city : findByCity) {
			List<Area> findByCityAndState = areaRepositoryObj.findByCityAndState(city, findByState);
			System.out.println("sizw" + findByCityAndState.size());
			for (Area areaObj : findByCityAndState) {
				JsonObject json = new JsonObject();
				json.addProperty("areas", areaObj.getArea());
				json.addProperty("areascode", areaObj.getAreaCode());
				jArray.add(json);
			}

		}
		return new Gson().toJson(jArray);

	}

	@RequestMapping("/Admin/getusername")
	@ResponseBody
	public String autosuggestionUsername(HttpServletRequest request) {
		int counter = Integer.parseInt(request.getParameter("counters"));
		String virtualdepartments = "departmentsName'" + counter + "'";
		int department = Integer.parseInt(request.getParameter(virtualdepartments));
		List<DepartmentsModel> findAllById = departmentsRepositoryObj.findAll();
		int i = 0;
		String deptName = "";
		for (DepartmentsModel departmentsModel : findAllById) {
			if (departmentsModel.getDepartmentid().equals(department)) {
				deptName = departmentsModel.getDepartmentname();
			}
			i++;
		}
		System.out.println("deptName>>" + deptName);
		JsonArray jArray = new JsonArray();
		try {
			List<UserRegistrationModel> findByStatus = userRepoObj.findByStatus("Deactive");
			for (UserRegistrationModel userRegistrationModel : findByStatus) {
				LicenseKeyModel licenseKeyDetails = licenseKeyRepositoryObj
						.findByuserRegistrationModelObj(userRegistrationModel);
				if (licenseKeyDetails == null) {
					if (deptName.equalsIgnoreCase(userRegistrationModel.getDepartmentModelObj().getDepartmentname())) {
						JsonObject json = new JsonObject();
						json.addProperty("username", userRegistrationModel.getUsername());
						jArray.add(json);
					}
				}
			}
		}

		catch (Exception e) {

		}
		return new Gson().toJson(jArray);
	}
	
	@RequestMapping(value = "/getUserIdFromUName", method = RequestMethod.POST)
	@ResponseBody
	public String getUserIdFromUName(HttpServletRequest request) throws SQLException {
		JsonArray jArray = new JsonArray();
		JsonObject json = new JsonObject();
		HttpSession session = request.getSession(false);
		String prntFirmsUsername=(String) session.getAttribute("firmsUsername");
		ParentFirmsModel prntFirmObj = prntFirmRepoObj.findByParentFirmsUserName(prntFirmsUsername);
		if (prntFirmObj !=null) 
		{
			String user = request.getParameter("uName");
			String uName = request.getParameter(user);
			UserRegistrationModel usrObj = userRepoObj.findByUsernameAndParentFirmObj(uName, prntFirmObj);
			if (usrObj !=null) 
			{
				json.addProperty("uId", usrObj.getUserId());
				json.addProperty("result", "done");
			}
			else
			{
				json.addProperty("result", "usrNull");
			}
		}
		jArray.add(json);
		return new Gson().toJson(jArray);
	}

	/*@RequestMapping("/Admin/assingLicenceKey")
	@ResponseBody
	public String assingLincenceKey(HttpServletRequest request) {
		JsonArray jArray = new JsonArray();
		JsonObject json = new JsonObject();
		String lincenceId = request.getParameter("licenceId");
		String count = request.getParameter("count");
		String param = "newusersname'" + count + "'";
		String param1 = "departmentsName'" + count + "'";
		System.out.println("as1" + param);
		System.out.println("as" + param1);
		String userName = request.getParameter(param);
		System.out.println("userName" + userName);
		int department = Integer.parseInt(request.getParameter(param1));
		Integer id = Integer.parseInt(lincenceId);
		List<DepartmentsModel> findAllById = departmentsRepositoryObj.findAll();
		int i = 0;
		String deptName = "";
		for (DepartmentsModel departmentsModel : findAllById) {
			if (departmentsModel.getDepartmentid().equals(department)) {
				deptName = departmentsModel.getDepartmentname();
			}
			i++;
		}
		System.out.println("deptName>>" + deptName);
		DepartmentsModel departmentnameObj = departmentsRepositoryObj.findByDepartmentname(deptName);
		LicenseKeyModel licenseKeyObj = licenseKeyRepositoryObj.findByLinceseKeyId(id);
		
		String licenseKey = "";
		if(licenseKeyObj !=null) 
		{
			licenseKey = licenseKeyObj.getLicenseKey();
		}
		HttpSession session = request.getSession(false);
		FirmController firmControlrObj = new FirmController();
		ParentFirmsModel prntFirmObj = firmControlrObj.getCurrentParentFirmObject(session, prntFirmRepoObj);
		UserRegistrationModel userObj = userRepoObj.findByUsernameAndParentFirmObj(userName,prntFirmObj);
		if (userObj == null) {
			json.addProperty("fail", "DeptAndUserFail");
		} else {
			java.util.Date utilDate = new java.util.Date();
			java.sql.Date PermissionGrantDate = new java.sql.Date(utilDate.getTime());
			UserAccessPermissionsModel userAccessPermission = userAccessPermissionRepositoryObj.findByuserRegistrationModelObjAndDepartmentsIdObj(userObj, departmentnameObj);
			LicenseKeyModel findByLicenseKey = licenseKeyRepositoryObj.findByLicenseKey(licenseKey);
			if(findByLicenseKey.getRegistrationdate()==null)
			{
				findByLicenseKey.setRegistrationdate(todayDate);
				DateFunctions dateFunObj = new DateFunctions();
				findByLicenseKey.setExpirydate(dateFunObj.getExpiryDate());
			}
			findByLicenseKey.setUserRegistrationModelObj(userObj);
			licenseKeyRepositoryObj.save(findByLicenseKey);
			userObj.setStatus("Active");
			userRepoObj.save(userObj);
			if(userAccessPermission==null)
			{
				UserAccessPermissionsModel userpermissionDetails = new UserAccessPermissionsModel();
				userpermissionDetails.setPermissionGrantDate(todayDate);
				userpermissionDetails.setDepartmentsIdObj(departmentnameObj);
				userpermissionDetails.setRegistrationsIdObj(userObj);
				userAccessPermissionRepositoryObj.save(userpermissionDetails);
			}
		}
		jArray.add(json);
		return new Gson().toJson(jArray);
	}*/

	@RequestMapping(value = "/transferLicenseKey", method = RequestMethod.POST)
	@ResponseBody
	public String transferLicenseKey(HttpServletRequest request) throws SQLException {
		JsonArray jArray = new JsonArray();
		JsonObject json = new JsonObject();
		HttpSession session = request.getSession(false);
		String prntFirmsUsername=(String) session.getAttribute("firmsUsername");
		ParentFirmsModel prntFirmObj = prntFirmRepoObj.findByParentFirmsUserName(prntFirmsUsername);
		if (prntFirmObj !=null) 
		{
			Integer oldusrId = Integer.parseInt(request.getParameter("oldUser"));
			String newUser = request.getParameter("newUser");
			String newUserN = request.getParameter(newUser);
			UserRegistrationModel newUsrObj = userRepoObj.findByUsernameAndParentFirmObj(newUserN, prntFirmObj);
			UserRegistrationModel oldusrObj = userRepoObj.findByUserId(oldusrId);
			LicenseKeyModel licKeyObj = licenseKeyRepositoryObj.findByuserRegistrationModelObj(oldusrObj);
			String licKey = licKeyObj.getLicenseKey();
			LicenseKeyController licenseKeyCtrlObj = new LicenseKeyController();
			int firmId =0;
			int usrId = 0;
			ResultSet rs =licenseKeyCtrlObj.checkParentFirmOnServer(prntFirmsUsername);
			boolean f1 = false;
			if (rs.next()) 
			{
				firmId = rs.getInt("parent_firms_id");
				ResultSet rs1 =licenseKeyCtrlObj.checkUserOnServer(oldusrObj.getUsername(), oldusrObj.getPassword(), "Active", firmId);
				if (rs1.next()) 
				{
					usrId = rs1.getInt("user_id");
					ResultSet rs2 =licenseKeyCtrlObj.checkLicenKeyByUserAndPrntFirm(usrId,firmId);
					if (rs2.next()) 
					{
						String keyOnSrvr=rs2.getString("license_key");
						if(keyOnSrvr.equalsIgnoreCase(licKey))
						{
							int newUsrId = 0;
							ResultSet rs3 =licenseKeyCtrlObj.checkUserOnServer(newUsrObj.getUsername(), newUsrObj.getPassword(), "Deactive", firmId);
							if (rs3.next()) 
							{
								newUsrId = rs3.getInt("user_id");
							}
							else
							{
								boolean f = licenseKeyCtrlObj.saveUserOnServer(newUsrObj.getEmployeeName(),newUsrObj.getUsername(), newUsrObj.getPassword(),"Deactive", firmId);
								if (f) {
									ResultSet rs4 = licenseKeyCtrlObj.checkUserOnServer(newUsrObj.getUsername(), newUsrObj.getPassword(),"Deactive", firmId);
									if (rs4.next()) {
										newUsrId = rs4.getInt("user_id");
									}
								}
							}
							f1 = licenseKeyCtrlObj.assignKeyOnSeverForUser(keyOnSrvr, firmId, newUsrId);
							f1 = licenseKeyCtrlObj.updateUserStatusOnServer("Active", firmId, newUsrId);
							f1 = licenseKeyCtrlObj.updateUserStatusOnServer("Deactive", firmId, usrId);
							if(f1) 
							{
								//LicenseKeyModel licKeyObj = licenseKeyRepositoryObj.findByLicenseKey(licKey);
								licKeyObj.setUserRegistrationModelObj(newUsrObj);
								licenseKeyRepositoryObj.saveAndFlush(licKeyObj);
								newUsrObj.setStatus("Active");
								oldusrObj.setStatus("Deactive");
								UserLoginDetailsModel userLoginObj = userLoginRepositoryObj.findByUserRegistrationModelObj(oldusrObj);
								userRepoObj.saveAndFlush(newUsrObj);
								userRepoObj.saveAndFlush(oldusrObj);
								if(userLoginObj!=null)
								{
									DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy hh:mm:ss a");
									LocalDateTime now = LocalDateTime.now();
									String dateTime = dtf.format(now);
									userLoginObj.setLoginStatus("LogOut");
									userLoginObj.setLoginOutDetails(dateTime);
									userLoginRepositoryObj.saveAndFlush(userLoginObj);
								}
								json.addProperty("result", "s");
							}
							else
							{
								json.addProperty("result", "n");
							}
						}
						else
						{
							json.addProperty("result", "mismatch");
						}
					}
					else
					{
						json.addProperty("result", "LicenNot");
					}
				}
				else
				{
					json.addProperty("result", "userNot");
				}
			}
		}
		jArray.add(json);
		return new Gson().toJson(jArray);
	}



	@RequestMapping(value = "/Admin/fetchAlldesignations", method = RequestMethod.GET)
	@ResponseBody
	public String fetchAlldesignations(HttpServletRequest request) {
		JsonArray JArray = new JsonArray();

		List<Designation> AllDesignations = designationsRepositoryObj.findAll();
		for (Designation designation : AllDesignations) {
			JsonObject JObject = new JsonObject();
			JObject.addProperty("designations", designation.getDesignation());
			JArray.add(JObject);
		}
		return new Gson().toJson(JArray);
	}

	@RequestMapping("/Admin/logoutStatusData")
	@ResponseBody
	public String logoutStatusData(HttpServletRequest request)
	{
		JsonArray jArray=new JsonArray();
		JsonObject json=new JsonObject();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy hh:mm:ss a");
		LocalDateTime now = LocalDateTime.now();
		String logoutDateAndTime = dtf.format(now);
		int userId=Integer.parseInt(request.getParameter("userId"));
		if(userId!=0)
		{
		UserRegistrationModel findByUsername = userRepoObj.findByUserId(userId);
		UserLoginDetailsModel UserRegistrationModelObj = userLoginRepositoryObj.findByUserRegistrationModelObj(findByUsername);
		UserRegistrationModelObj.setLoginStatus("LogOut");
		UserRegistrationModelObj.setLoginOutDetails(logoutDateAndTime);
		userLoginRepositoryObj.save(UserRegistrationModelObj);
		json.addProperty("success", "success");
		}else {
			json.addProperty("success", "field");
		}
		jArray.add(json);
		return new Gson().toJson(jArray);
	}
}