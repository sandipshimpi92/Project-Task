package com.edzeal.Admin.Controller;

import java.net.SocketException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.edzeal.POJO.ADMIN.FirmRegistrationModel;
import com.edzeal.POJO.ADMIN.LicenseKeyModel;
import com.edzeal.POJO.ADMIN.ParentFirmsModel;
import com.edzeal.POJO.ADMIN.UserAccessPermissionsModel;
import com.edzeal.POJO.ADMIN.UserRegistrationModel;
import com.edzeal.POJO.MASTER.Area;
import com.edzeal.POJO.MASTER.City;
import com.edzeal.POJO.MASTER.DepartmentsModel;
import com.edzeal.POJO.MASTER.Designation;
import com.edzeal.POJO.MASTER.State;
import com.edzeal.Repository.ADMIN.DepartmentsRepository;
import com.edzeal.Repository.ADMIN.FirmRegistrationRepository;
import com.edzeal.Repository.ADMIN.LicenseKeyRepository;
import com.edzeal.Repository.ADMIN.ParentFirmsRepository;
import com.edzeal.Repository.ADMIN.UserAccessPermissionRepository;
import com.edzeal.Repository.ADMIN.UserRegistrationRepository;
import com.edzeal.Repository.MASTER.AreaRepository;
import com.edzeal.Repository.MASTER.CityRepository;
import com.edzeal.Repository.MASTER.DesignationRepository;
import com.edzeal.Repository.MASTER.StateRepository;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class FirmRegistrationDetailsController {
	@Autowired
	UserRegistrationRepository userRegistrationRepository;
	@Autowired
	FirmRegistrationRepository firmRegistrationRepository;
	@Autowired
	LicenseKeyRepository licenseKeyRepositoryObj;
	@Autowired
	StateRepository stateRepositoryObj;
	@Autowired
	DepartmentsRepository departmentsRepositoryObj;
	@Autowired
	DesignationRepository designationRepository;
	@Autowired
	UserAccessPermissionRepository userAccessPermissionRepositoryObj;
	@Autowired
	CityRepository cityRepositoryObj;
	@Autowired
	AreaRepository areaRepositoryObj;
	@Autowired
	ParentFirmsRepository parentFirmRepoObj;


	java.util.Date utilDate = new java.util.Date();
	java.sql.Date todayDate = new java.sql.Date(utilDate.getTime());
	@RequestMapping("/FirmDetails")
	public ModelAndView firmregistrationdetails(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		String username = null;
		try {
			username = (String) session.getAttribute("usernames");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (username != null) {
			return new ModelAndView("ADMIN/FirmRegistrationDetails");
		} else {
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(value = "/Admin/FirstTimeRegistrationdetails", method = RequestMethod.POST)
	@ResponseBody
	public String registorDetails(@RequestParam("dateOfBirth")Date dateOfBirth, HttpServletRequest request) throws SocketException, ParseException 
	{
		JsonArray jArray = new JsonArray();
		JsonObject json = new JsonObject();
		String licenseKey = request.getParameter("licenseKey").toUpperCase();
		LicenseKeyController licenseKeyCtrlObj = new LicenseKeyController();
		ResultSet rs =licenseKeyCtrlObj.checkLicenOnServer(licenseKey,"false");
		if(rs!=null)
		{
			try {
				if (rs.next()) 
				{
					String prntFirmsUsername = request.getParameter("firmsUsername");
					ResultSet rs1 =licenseKeyCtrlObj.checkParentFirmOnServer(prntFirmsUsername);
					ParentFirmsModel prntFirmObj = parentFirmRepoObj.findByParentFirmsUserName(prntFirmsUsername);
					if (rs1.next() || prntFirmObj !=null) 
					{
						json.addProperty("parentFirmP", "true");
					}
					else
					{
						String firstName = request.getParameter("firstName");
						String lastName = request.getParameter("lastName");
						String employeesName = firstName.concat(" " + lastName);
						String mailPasswrd = request.getParameter("mailPasswrd");
						String mobileNo = request.getParameter("mobileNo");
						String emplayeeId = request.getParameter("emplayeeId");
						String street = request.getParameter("street");
						String city1 = request.getParameter("Ucity");
						String state1 = request.getParameter("Ustate");
						String PinCode = request.getParameter("UPinCode");
						String username = request.getParameter("username");
						String password = request.getParameter("password");
						String firmsName = request.getParameter("firmsName");
						String ownersName = request.getParameter("ownersName");
						String area = request.getParameter("area");
						String landmark = request.getParameter("landmark");
						String city = request.getParameter("city");
						String state = request.getParameter("state");
						String pinCode = request.getParameter("pinCode");
						int pCode =Integer.parseInt(pinCode);
						String emailId = request.getParameter("emailId");
						String gstNumber = request.getParameter("gstNumber");
						String mobileNumber = request.getParameter("mobileNumber");
						String landlineNumber = request.getParameter("landlineNumber");
						String panNumber = request.getParameter("panNumber");
						String termsAndConditions = request.getParameter("termsAndConditions");
						List<Designation> desiList = designationRepository.findAll();
						if(desiList.isEmpty())
						{
							Designation designation = new Designation(); 
							designation.setDesignation("Admin");
							designation.setDesignationLevel(0);
							designationRepository.save(designation);
						}
						List<DepartmentsModel> deptList = departmentsRepositoryObj.findAll();
						if(deptList.isEmpty())
						{
							String[] departments= {"Admin","Master","CRM","Engineering","Site","Purchase","Sales","Contract","Store","Account","Manufacturing"};
							for(int i=0;i<=departments.length-1;i++)
							{
								DepartmentsModel deptModel = new DepartmentsModel();
								String deptsName=departments[i];
								deptModel.setDepartment_name(deptsName);
								departmentsRepositoryObj.save(deptModel);
							}
						}
						
						try
						{
						State stateobj1 = stateRepositoryObj.findByState(state);
						if (stateobj1 == null) {
							State saveStatesobj = new State();
							saveStatesobj.setState(state);
							stateRepositoryObj.saveAndFlush(saveStatesobj);
						}
						State stateobj2 = stateRepositoryObj.findByState(state);
						City cityobj = cityRepositoryObj.findByCityAndState(city, stateobj2);
						if (cityobj == null) {
							City SaveCityObj = new City();
							SaveCityObj.setCity(city);
							SaveCityObj.setState(stateobj2);
							cityRepositoryObj.saveAndFlush(SaveCityObj);
						}
						State stateobj3 = stateRepositoryObj.findByState(state);
						City cityobj1 = cityRepositoryObj.findByCityAndState(city, stateobj2);
						Area areaObj=areaRepositoryObj.findByAreaAndCityAndState(area, cityobj1, stateobj3);
						if(areaObj==null)
						{
							Area saveAreaObj=new Area();
							saveAreaObj.setArea(area);
							saveAreaObj.setAreaCode(pinCode);
							saveAreaObj.setCity(cityobj1);
							saveAreaObj.setState(stateobj3);
							areaRepositoryObj.saveAndFlush(saveAreaObj);
							
						}}catch (Exception e) {
							e.printStackTrace();
						}
						boolean f = licenseKeyCtrlObj.saveParentFirmOnServer(todayDate, firmsName, prntFirmsUsername, ownersName, 1);
						if(f) 
						{
							prntFirmObj = saveParentFirm(firmsName,ownersName,area,landmark,city,state,pCode,emailId,mobileNumber,landlineNumber,gstNumber,panNumber,termsAndConditions,prntFirmsUsername);
							int firmId =0;
							ResultSet rs2 =licenseKeyCtrlObj.checkParentFirmOnServer(prntFirmsUsername);
							if (rs2.next() && prntFirmObj !=null) 
							{
								firmId = rs2.getInt("parent_firms_id");
								boolean f1 =licenseKeyCtrlObj.saveUserOnServer(employeesName,username,password,"Active",firmId);
								if(f1) 
								{
									int userId =0;
									UserRegistrationModel userObj = saveInitialUserOfFirm(employeesName, emailId, mailPasswrd, mobileNo, dateOfBirth, emplayeeId, street, city, state, pCode, username, password, prntFirmObj);
									saveUserPermissionsForAdmin(userObj);
									ResultSet rs3 =licenseKeyCtrlObj.checkUserOnServer(username,password,"Active",firmId);
									if (rs3.next()) 
									{
										userId = rs3.getInt("user_id");
										licenseKeyCtrlObj.registerKeyOnSeverForFirm(todayDate,licenseKey,firmId,userId);
										saveLicenseKeyLocal(licenseKey, prntFirmObj, userObj);
									}
								}
							}
						}
						json.addProperty("parentFirmP", "false");
						
					}
					json.addProperty("keyPresent", "true");
				}
				else
				{
					json.addProperty("keyPresent", "false");
				}
			} catch (SQLException e) {
				json.addProperty("keyPresent", "Exception");
				e.printStackTrace();
			}
		}
		else
		{
			json.addProperty("keyPresent", "Exception");
		}
		jArray.add(json);
		return new Gson().toJson(jArray);
		/*String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String employeesName = firstName.concat(" " + lastName);
		String emailId1 = request.getParameter("emailId");
		String mailPasswrd = request.getParameter("mailPasswrd");
		String mobileNo = request.getParameter("mobileNo");
		String emplayeeId = request.getParameter("emplayeeId");
		String street = request.getParameter("street");
		String city1 = request.getParameter("Ucity");
		String state1 = request.getParameter("Ustate");
		String PinCode = request.getParameter("UPinCode");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firmsName = request.getParameter("firmsName");
		String ownersName = request.getParameter("ownersName");
		String area = request.getParameter("area");
		String landmark = request.getParameter("landmark");
		String city = request.getParameter("city");
		System.out.println("city,." + dateOfBirth);
		String state = request.getParameter("state");
		String pinCode = request.getParameter("pinCode");
		String emailId = request.getParameter("emailId");
		String gstNumber = request.getParameter("gstNumber");
		String mobileNumber = request.getParameter("mobileNumber");
		String landlineNumber = request.getParameter("landlineNumber");
		String panNumber = request.getParameter("panNumber");
		String firmsUsername = request.getParameter("firmsUsername");
		String termsAndConditions = request.getParameter("termsAndConditions");
		List<Designation> desiList = designationRepository.findAll();
		if(desiList.isEmpty())
		{
			Designation designation = new Designation(); 
			designation.setDesignation("Admin");
			designation.setDesignationLevel(0);
			designationRepository.save(designation);
		}
		List<DepartmentsModel> deptList = departmentsRepositoryObj.findAll();
		if(deptList.isEmpty())
		{
			String[] departments= {"Admin","Master","CRM","Engineering","Site","Purchase","Sales","Contract","Store","Account","Manufacturing"};
			for(int i=0;i<=departments.length-1;i++)
			{
				DepartmentsModel deptModel = new DepartmentsModel();
				String deptsName=departments[i];
				deptModel.setDepartment_name(deptsName);
				departmentsRepositoryObj.save(deptModel);
			}
		}
		
		try
		{
		State stateobj1 = stateRepositoryObj.findByState(state);
		if (stateobj1 == null) {
			State saveStatesobj = new State();
			saveStatesobj.setState(state);
			stateRepositoryObj.saveAndFlush(saveStatesobj);
		}
		State stateobj2 = stateRepositoryObj.findByState(state);
		City cityobj = cityRepositoryObj.findByCityAndState(city, stateobj2);
		System.out.println("stateobj2 " + stateobj2 + "cityobj " + cityobj);
		if (cityobj == null) {
			City SaveCityObj = new City();
			SaveCityObj.setCity(city);
			SaveCityObj.setState(stateobj2);
			cityRepositoryObj.saveAndFlush(SaveCityObj);
		}
		State stateobj3 = stateRepositoryObj.findByState(state);
		City cityobj1 = cityRepositoryObj.findByCityAndState(city, stateobj2);
		Area areaObj=areaRepositoryObj.findByAreaAndCityAndState(area, cityobj1, stateobj3);
		System.out.println("stateobj2 " + stateobj2 + "cityobj " + areaObj);
		if(areaObj==null)
		{
			Area saveAreaObj=new Area();
			saveAreaObj.setArea(area);
			saveAreaObj.setAreaCode(pinCode);
			saveAreaObj.setCity(cityobj1);
			saveAreaObj.setState(stateobj3);
			areaRepositoryObj.saveAndFlush(saveAreaObj);
			
		}}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		Designation DesignationDetails = designationRepository.findByDesignation("ADMIN");
		DepartmentsModel departmentDetails = departmentsRepositoryObj.findByDepartmentname("ADMIN");
		System.out.println("departmentDetails"+departmentDetails);
		UserRegistrationModel userRegistrationModel = new UserRegistrationModel();
		FirmRegistrationModel firmRegistrationModelObj = new FirmRegistrationModel();
		userRegistrationModel.setEmployeeName(employeesName);
		userRegistrationModel.setEmailId(emailId1);
		userRegistrationModel.setMailpassword(mailPasswrd);
		userRegistrationModel.setMobileNo(mobileNo);
		userRegistrationModel.setDateOfBirth(dateOfBirth);
		userRegistrationModel.setEmployeeId(emplayeeId);
		userRegistrationModel.setArea(street);
		userRegistrationModel.setCity(city1);
		userRegistrationModel.setState(state1);
		userRegistrationModel.setPinCode(Integer.parseInt(PinCode));
		userRegistrationModel.setUsername(username);
		userRegistrationModel.setPassword(password);
		userRegistrationModel.setDepartmentModelObj(departmentDetails);
		userRegistrationModel.setStatus("Active");
		userRegistrationModel.setDesignationObj(DesignationDetails);
		firmRegistrationModelObj.setFirmsName(firmsName);
		firmRegistrationModelObj.setOwnersName(ownersName);
		firmRegistrationModelObj.setArea(area);
		firmRegistrationModelObj.setLandmark(landmark);
		firmRegistrationModelObj.setCity(city);
		firmRegistrationModelObj.setState(state);
		firmRegistrationModelObj.setPincode(Integer.parseInt(pinCode));
		firmRegistrationModelObj.setEmailId(emailId);
		firmRegistrationModelObj.setGstNumber(gstNumber);
		firmRegistrationModelObj.setMobileNumber(mobileNumber);
		firmRegistrationModelObj.setPanNumber(panNumber);
		firmRegistrationModelObj.setDateOfRegistration(todayDate);
		firmRegistrationModelObj.setLandlineNumber(landlineNumber);
		firmRegistrationModelObj.setFirmsUserName(firmsUsername);
		firmRegistrationModelObj.setTermsAndConditions(termsAndConditions);
		
		FirmRegistrationModel save = firmRegistrationRepository.save(firmRegistrationModelObj);
		userRegistrationModel.setFirmRegistrationModelObj(save);
		userRegistrationRepository.save(userRegistrationModel);
		LicenseKeyModel licenseKeyModelObj1 = new LicenseKeyModel();
		List<UserRegistrationModel> userRegistrationModel1 = userRegistrationRepository.findAll();
		for (UserRegistrationModel userRegistrationModel2 : userRegistrationModel1) {
			licenseKeyModelObj1.setUserRegistrationModelObj(userRegistrationModel2);
		}
		licenseKeyModelObj1.setRegistrationdate(todayDate);
		Calendar exDateCal = Calendar.getInstance();
		exDateCal.add(Calendar.DAY_OF_MONTH, 365);
		licenseKeyModelObj1.setExpirydate(new Date(exDateCal.getTime().getTime()));
		licenseKeyModelObj1.setLicenseKey(licenseKey);
		licenseKeyModelObj1.setFirmRegistrationModelObj(firmRegistrationModelObj);
		licenseKeyRepositoryObj.save(licenseKeyModelObj1);
		
		if(departmentDetails.getDepartmentname().equalsIgnoreCase("Admin")) 
		{
			saveUserPermissionsForAdmin(userRegistrationModel);
		}
		else
		{
			UserAccessPermissionsModel userAccessPermissionsModel = new UserAccessPermissionsModel();
			userAccessPermissionsModel.setRegistrationsIdObj(userRegistrationModel);
			userAccessPermissionsModel.setPermissionGrantDate(todayDate);
			userAccessPermissionsModel.setDepartmentsIdObj(departmentDetails);
			userAccessPermissionRepositoryObj.save(userAccessPermissionsModel);
		}*/
		
	}

	public ParentFirmsModel saveParentFirm(String firmsName, String ownersName,String area, String landmark, String city, String state, int pCode, String emailId, String mobileNumber, String landlineNumber, String gstNumber, String panNumber, String termsAndConditions, String prntFirmsUsername) {
		ParentFirmsModel prntfirmObj = new ParentFirmsModel();
		FirmRegistrationModel firmObj = new FirmRegistrationModel();
		prntfirmObj.setParentfirmName(firmsName);
		prntfirmObj.setOwnersName(ownersName);
		prntfirmObj.setDateOfRegistration(todayDate);
		prntfirmObj.setArea(area);
		prntfirmObj.setLandmark(landmark);
		prntfirmObj.setCity(city);
		prntfirmObj.setState(state);
		prntfirmObj.setPincode(pCode);
		prntfirmObj.setEmailId(emailId);
		prntfirmObj.setMobileNumber(mobileNumber);
		prntfirmObj.setLandlineNumber(landlineNumber);
		prntfirmObj.setGstNumber(gstNumber);
		prntfirmObj.setPanNumber(panNumber);
		prntfirmObj.setTermsAndConditions(termsAndConditions);
		prntfirmObj.setParentFirmsUserName(prntFirmsUsername);
		parentFirmRepoObj.saveAndFlush(prntfirmObj);
		firmObj.setFirmsName(firmsName);
		firmObj.setOwnersName(ownersName);
		firmObj.setDateOfRegistration(todayDate);
		firmObj.setArea(area);
		firmObj.setLandmark(landmark);
		firmObj.setCity(city);
		firmObj.setState(state);
		firmObj.setPincode(pCode);
		firmObj.setEmailId(emailId);
		firmObj.setMobileNumber(mobileNumber);
		firmObj.setLandlineNumber(landlineNumber);
		firmObj.setGstNumber(gstNumber);
		firmObj.setPanNumber(panNumber);
		firmObj.setTermsAndConditions(termsAndConditions);
		firmObj.setParentFirmObj(prntfirmObj);
		firmRegistrationRepository.saveAndFlush(firmObj);
		return prntfirmObj;
	}
	
	public UserRegistrationModel saveInitialUserOfFirm(String empName,String emailId,String mailPasswrd,String mNo,Date dateOfBirth,String empId,String street,String city,String state,int pCode,String username,String password,ParentFirmsModel prntFirmObj) {
		Designation desigObj = designationRepository.findByDesignation("ADMIN");
		DepartmentsModel departmentObj = departmentsRepositoryObj.findByDepartmentname("ADMIN");
		UserRegistrationModel userRegObj = new UserRegistrationModel();
		userRegObj.setEmployeeName(empName);
		userRegObj.setEmailId(emailId);
		userRegObj.setMailpassword(mailPasswrd);
		userRegObj.setMobileNo(mNo);
		userRegObj.setDateOfBirth(dateOfBirth);
		userRegObj.setEmployeeId(empId);
		userRegObj.setArea(street);
		userRegObj.setCity(city);
		userRegObj.setState(state);
		userRegObj.setPinCode(pCode);
		userRegObj.setUsername(username);
		userRegObj.setPassword(password);
		userRegObj.setDepartmentModelObj(departmentObj);
		userRegObj.setStatus("Active");
		userRegObj.setDesignationObj(desigObj);
		userRegObj.setParentFirmObj(prntFirmObj);
		userRegistrationRepository.save(userRegObj);
		return userRegObj;
	}

	public void saveLicenseKeyLocal(String licenKey,ParentFirmsModel prntFirmObj,UserRegistrationModel userObj)
	{
		LicenseKeyModel licenseKeyObj = new LicenseKeyModel();
		licenseKeyObj.setLicenseKey(licenKey);
		licenseKeyObj.setRegistrationdate(todayDate);
		licenseKeyObj.setUserRegistrationModelObj(userObj);
		licenseKeyObj.setParentFirmObj(prntFirmObj);
		licenseKeyRepositoryObj.saveAndFlush(licenseKeyObj);
	}

	private void saveUserPermissionsForAdmin(UserRegistrationModel userobj) 
	{
		List<DepartmentsModel> deptList1 = departmentsRepositoryObj.findAll();
		for(DepartmentsModel deptObj :deptList1) 
		{
			UserAccessPermissionsModel userAccessPermissionsModel = new UserAccessPermissionsModel();
			userAccessPermissionsModel.setRegistrationsIdObj(userobj);
			userAccessPermissionsModel.setPermissionGrantDate(todayDate);
			userAccessPermissionsModel.setDepartmentsIdObj(deptObj);
			userAccessPermissionRepositoryObj.save(userAccessPermissionsModel);
		}
	}

	@RequestMapping("/Admin/savefirmdetail")
	@ResponseBody
	public String FirmDetails(HttpServletRequest request) 
	{
		JsonArray jArray = new JsonArray();
		JsonObject json = new JsonObject();
		String firmsName = request.getParameter("firmsName");
		String ownersName = request.getParameter("ownersName");
		String area = request.getParameter("area");
		String landmark = request.getParameter("landmark");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pinCode = request.getParameter("pinCode");
		String emailId = request.getParameter("emailId");
		String mobileNumber = request.getParameter("mobileNumber");
		String gstNumber = request.getParameter("gstNumber");
		String landlineNumber = request.getParameter("landlineNumber");
		String panNumber = request.getParameter("panNumber");
		String termsAndConditions = request.getParameter("termsAndConditions");
		//String firmsUserName = request.getParameter("firmsUserName");
		//String userName = request.getParameter("userName");
		//String password = request.getParameter("password");
		//String empId = request.getParameter("empId");
		//String mailPasswrd = request.getParameter("mailPasswrd");
		//System.out.println("dateOfBirth,." + dateOfBirth);	
		//UserRegistrationModel userRegistrationModel = new UserRegistrationModel();
		List<FirmRegistrationModel> subFirmsList = firmRegistrationRepository.findAll();

		int flag = 0;
		int Gstflag = 0;
		for (FirmRegistrationModel subFirmObj : subFirmsList) {
			if (flag == 0) {
				if (subFirmObj.getFirmsName().equals(firmsName)) {
					flag = 1;
					json.addProperty("Firms", "Ffail");
				}
			}
			if (Gstflag == 0) {
				if (subFirmObj.getGstNumber().equals(gstNumber)) {
					System.out.println("aa");
					Gstflag = 1;
					json.addProperty("Firms", "Gfail");
				}
			}
		}

		if (flag == 0 && Gstflag == 0) {
			try {
				State stateobj1 = stateRepositoryObj.findByState(state);
				if (stateobj1 == null) {
					State saveStatesobj = new State();
					saveStatesobj.setState(state);
					stateRepositoryObj.saveAndFlush(saveStatesobj);
				}
				State stateobj2 = stateRepositoryObj.findByState(state);
				City cityobj = cityRepositoryObj.findByCityAndState(city, stateobj2);
				System.out.println("stateobj2 " + stateobj2 + "cityobj " + cityobj);
				if (cityobj == null) {
					City SaveCityObj = new City();
					SaveCityObj.setCity(city);
					SaveCityObj.setState(stateobj2);
					cityRepositoryObj.saveAndFlush(SaveCityObj);
				}
				City cityobj1 = cityRepositoryObj.findByCityAndState(city, stateobj2);
				Area areaObj=areaRepositoryObj.findByAreaAndCityAndState(area, cityobj1, stateobj2);
				System.out.println("stateobj2 " + stateobj2 + "cityobj " + areaObj);
				if(areaObj==null)
				{
					Area saveAreaObj=new Area();
					saveAreaObj.setArea(area);
					saveAreaObj.setAreaCode(pinCode);
					saveAreaObj.setCity(cityobj1);
					saveAreaObj.setState(stateobj2);
					areaRepositoryObj.saveAndFlush(saveAreaObj);
				}
			} catch (Exception e) {
			}
			//Designation DesignationDetails = designationRepository.findByDesignation("ADMIN");
			//DepartmentsModel departmentDetails = departmentsRepositoryObj.findByDepartmentname("ADMIN");
			HttpSession session = request.getSession(false);
			String firmsUsername=(String) session.getAttribute("firmsUsername");
			ParentFirmsModel parentFirmObj = parentFirmRepoObj.findByParentFirmsUserName(firmsUsername);
			FirmRegistrationModel firmRegiObj = new FirmRegistrationModel();
			firmRegiObj.setFirmsName(firmsName);
			firmRegiObj.setOwnersName(ownersName);
			firmRegiObj.setArea(area);
			firmRegiObj.setLandmark(landmark);
			firmRegiObj.setCity(city);
			firmRegiObj.setState(state);
			firmRegiObj.setGstNumber(gstNumber);
			firmRegiObj.setPincode(Integer.parseInt(pinCode));
			firmRegiObj.setEmailId(emailId);
			firmRegiObj.setDateOfRegistration(todayDate);
			firmRegiObj.setMobileNumber(mobileNumber);
			firmRegiObj.setPanNumber(panNumber);
			firmRegiObj.setLandlineNumber(landlineNumber);
			firmRegiObj.setTermsAndConditions(termsAndConditions);
			//firmRegiObj.setFirmsUserName(firmsUserName);
			firmRegiObj.setParentFirmObj(parentFirmObj);
			firmRegistrationRepository.save(firmRegiObj);
			/*userRegistrationModel.setEmployeeName(ownersName);
			userRegistrationModel.setEmailId(emailId);
			userRegistrationModel.setMailpassword(mailPasswrd);
			userRegistrationModel.setMobileNo(mobileNumber);
			userRegistrationModel.setDateOfBirth(dateOfBirth);
			userRegistrationModel.setEmployeeId(empId);
			userRegistrationModel.setArea(area);
			userRegistrationModel.setCity(city);
			userRegistrationModel.setState(state);
			userRegistrationModel.setPinCode(Integer.parseInt(pinCode));
			userRegistrationModel.setUsername(userName);
			userRegistrationModel.setPassword(password);
			userRegistrationModel.setDepartmentModelObj(departmentDetails);
			userRegistrationModel.setStatus("Deactive");
			userRegistrationModel.setDesignationObj(DesignationDetails);
			FirmRegistrationModel firmRegistrationObj = firmRegistrationRepository.findByFirmsUserName(firmsUserName);
			userRegistrationModel.setFirmRegistrationModelObj(firmRegistrationObj);
			userRegistrationRepository.save(userRegistrationModel);
			saveUserPermissionsForAdmin(userRegistrationModel);*/
			
			json.addProperty("Firms", "success");
		}
		jArray.add(json);
		return new Gson().toJson(jArray);
	}

	@RequestMapping("/Admin/firmTableDetail")
	@ResponseBody
	public String firmTableDetail(HttpServletRequest request) {
		JsonArray jArray = new JsonArray();
		HttpSession session = request.getSession(false);
		String firmsUsername=(String) session.getAttribute("firmsUsername");
		ParentFirmsModel prntFirmObj = parentFirmRepoObj.findByParentFirmsUserName(firmsUsername);
		List<FirmRegistrationModel> subFirmsList = firmRegistrationRepository.findByParentFirmObj(prntFirmObj);
		for (FirmRegistrationModel subFirmObj : subFirmsList) {
			JsonObject json = new JsonObject();
			json.addProperty("firmName", subFirmObj.getFirmsName());
			json.addProperty("ownersName", subFirmObj.getOwnersName());
			json.addProperty("firmRegiId", subFirmObj.getFirmId());
			json.addProperty("gstNo", subFirmObj.getGstNumber());
			json.addProperty("city", subFirmObj.getCity());
			json.addProperty("state", subFirmObj.getState());
			//json.addProperty("FirmsUsername", subFirmObj.getFirmsUserName());
			jArray.add(json);
		}

		return new Gson().toJson(jArray);
	}

	@RequestMapping("/Admin/updatefirmdetail")
	@ResponseBody
	public String updateFirmData(HttpServletRequest request)
	{
		JsonArray jArray = new JsonArray();
		String firmsName = request.getParameter("firmsName");
		int firmRegiId = Integer.parseInt(request.getParameter("firmRegiId"));
		String ownersName = request.getParameter("ownersName");
		String area = request.getParameter("area");
		String landmark = request.getParameter("landmark");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pinCode = request.getParameter("pinCode");
		String emailId = request.getParameter("emailId");
		String mobileNumber = request.getParameter("mobileNumber");
		String landlineNumber = request.getParameter("landlineNumber");
		String panNumber = request.getParameter("panNumber");
		String termsAndConditions = request.getParameter("termsAndConditions");
		//String firmsUserName = request.getParameter("firmsUserName");
		
		try {
			State stateobj1 = stateRepositoryObj.findByState(state);

			if (stateobj1 == null) {
				State newStateObj = new State();
				newStateObj.setState(state);
				stateRepositoryObj.save(newStateObj);
			}
			State stateobj2 = stateRepositoryObj.findByState(state);
			City cityobj = cityRepositoryObj.findByCityAndState(city, stateobj2);
			if (cityobj == null) {

				City SaveCityObj = new City();
				SaveCityObj.setCity(city);
				SaveCityObj.setState(stateobj2);
				cityRepositoryObj.save(SaveCityObj);
			}
		} catch (Exception e) {

		}
		HttpSession session = request.getSession(false);
		String firmsUsername=(String) session.getAttribute("firmsUsername");
		ParentFirmsModel parentFirmObj = parentFirmRepoObj.findByParentFirmsUserName(firmsUsername);
		FirmRegistrationModel subFirmObj = firmRegistrationRepository.findByFirmId(firmRegiId);
		subFirmObj.setFirmsName(firmsName);
		subFirmObj.setOwnersName(ownersName);
		subFirmObj.setArea(area);
		subFirmObj.setLandmark(landmark);
		subFirmObj.setCity(city);
		subFirmObj.setState(state);
		subFirmObj.setPincode(Integer.parseInt(pinCode));
		subFirmObj.setEmailId(emailId);
		subFirmObj.setMobileNumber(mobileNumber);
		subFirmObj.setLandlineNumber(landlineNumber);
		subFirmObj.setPanNumber(panNumber);
		subFirmObj.setTermsAndConditions(termsAndConditions);
		subFirmObj.setParentFirmObj(parentFirmObj);
		//FirmDetails.setFirmsUserName(firmsUserName);
		firmRegistrationRepository.save(subFirmObj);
		return new Gson().toJson(jArray);
	}

	@RequestMapping("/Admin/EditFirmData")
	@ResponseBody
	public String editFirmData(HttpServletRequest request) {
		JsonArray jArray = new JsonArray();
		JsonObject json = new JsonObject();
		int firmRegiId = Integer.parseInt(request.getParameter("firmRegiId"));
		FirmRegistrationModel subFirmObj = firmRegistrationRepository.findByFirmId(firmRegiId);
		json.addProperty("firmName", subFirmObj.getFirmsName());
		json.addProperty("ownersName", subFirmObj.getOwnersName());
		json.addProperty("area", subFirmObj.getArea());
		json.addProperty("firmRegiId", subFirmObj.getFirmId());
		json.addProperty("pinCode", subFirmObj.getPincode());
		json.addProperty("state", subFirmObj.getState());
		json.addProperty("city", subFirmObj.getCity());
		json.addProperty("landmark", subFirmObj.getLandmark());
		json.addProperty("emailId", subFirmObj.getEmailId());
		json.addProperty("mobileNumber", subFirmObj.getMobileNumber());
		json.addProperty("landlineNumber", subFirmObj.getLandlineNumber());
		json.addProperty("gstNumber", subFirmObj.getGstNumber());
		json.addProperty("panNumber", subFirmObj.getPanNumber());
		json.addProperty("termsAndConditions", subFirmObj.getTermsAndConditions());
		//json.addProperty("firmsUserName", subFirmObj.getFirmsUserName());
		jArray.add(json);
		return new Gson().toJson(jArray);

	}

	/*@RequestMapping("/Admin/DeleteFirmData")
	@ResponseBody
	public String deleteFirmData(HttpServletRequest request) {
		JsonArray jArray = new JsonArray();
		Integer firmRegiId = Integer.parseInt(request.getParameter("firmRegiId"));
		FirmRegistrationModel subFirmObj = firmRegistrationRepository.findByFirmId(firmRegiId);
		firmRegistrationRepository.delete(subFirmObj);
		return new Gson().toJson(jArray);
	}*/

	@RequestMapping(value="/Admin/getstate")
	@ResponseBody
	public String getstate() {
		JsonArray jArray = new JsonArray();
		List<State> stateModelObj = stateRepositoryObj.findAll();
		for (State state : stateModelObj) {
			JsonObject jObject = new JsonObject();
			jObject.addProperty("searchState", state.getState());
			jArray.add(jObject);
		}
		return new Gson().toJson(jArray);
	}

	@RequestMapping(value="/Admin/getcity")
	@ResponseBody
	public String getcity(HttpServletRequest request) {
		String states = request.getParameter("state");
		State statesobjct = stateRepositoryObj.findByState(states);
		JsonArray jArray = new JsonArray();
		List<City> CityModelOBj = cityRepositoryObj.findByState(statesobjct);
		for (City city : CityModelOBj) {
			JsonObject jObject = new JsonObject();
			jObject.addProperty("searchCity", city.getCity());
			jArray.add(jObject);
		}
		return new Gson().toJson(jArray);
	}
	
	@RequestMapping("/getUnusedLic")
	@ResponseBody
	public String getUnusedLic(HttpServletRequest request) {
		JsonArray jArray = new JsonArray();
		HttpSession session = request.getSession(false);
		String firmUsername=(String) session.getAttribute("firmsUsername");
		ParentFirmsModel prntFirmObj = parentFirmRepoObj.findByParentFirmsUserName(firmUsername);
		List<LicenseKeyModel> licenList = licenseKeyRepositoryObj.findByParentFirmObj(prntFirmObj);
		for (LicenseKeyModel licenObj : licenList) {
			if(licenObj.getUserRegistrationModelObj()==null)
			{
				JsonObject json = new JsonObject();
				json.addProperty("licenKey", licenObj.getLicenseKey());
				jArray.add(json);
			}	
		}
		return new Gson().toJson(jArray);
	}
}