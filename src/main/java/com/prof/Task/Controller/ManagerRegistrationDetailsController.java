package com.prof.Task.Controller;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.prof.POJO.MASTER.Area;
import com.prof.POJO.MASTER.City;
import com.prof.POJO.MASTER.DepartmentsModel;
import com.prof.POJO.MASTER.Designation;
import com.prof.POJO.MASTER.State;
import com.prof.POJO.MASTER.SubDepartmentsModel;
import com.prof.POJO.Task.FirmRegistrationModel;
import com.prof.POJO.Task.LicenseKeyModel;
import com.prof.POJO.Task.ParentFirmsModel;
import com.prof.POJO.Task.UserAccessPermissionsModel;
import com.prof.POJO.Task.UserRegistrationModel;
import com.prof.Repository.MASTER.AreaRepository;
import com.prof.Repository.MASTER.CityRepository;
import com.prof.Repository.MASTER.DesignationRepository;
import com.prof.Repository.MASTER.StateRepository;
import com.prof.Repository.ADMIN.EmployeeRegistrationRepository;
import com.prof.Repository.ADMIN.ManagerRegistrationRepository;
import com.prof.Repository.Task.DepartmentsRepository;
import com.prof.Repository.Task.FirmRegistrationRepository;
import com.prof.Repository.Task.LicenseKeyRepository;
import com.prof.Repository.Task.ParentFirmsRepository;
import com.prof.Repository.Task.SubDepartmentsRepository;
import com.prof.Repository.Task.UserAccessPermissionRepository;
import com.prof.Repository.Task.UserRegistrationRepository;

@Controller
public class ManagerRegistrationDetailsController {
	@Autowired
	EmployeeRegistrationRepository userRegistrationRepository;
	@Autowired
	ManagerRegistrationRepository firmRegistrationRepository;
	@Autowired
    ManagerRegistrationRepository firmRegistrationRepositoryObj;
	@Autowired
	EmployeeRegistrationRepository userRegistrationReposObj;
	
	
	

	java.util.Date utilDate = new java.util.Date();
	java.sql.Date todayDate = new java.sql.Date(utilDate.getTime());
	@RequestMapping("/FirmDetails")
	public ModelAndView firmregistrationdetails(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = null;
		Integer userId = null;
		int flag = 0;
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

	@RequestMapping(value = "Task/FirstTimeRegistrationdetails", method = RequestMethod.POST)
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
				/*if (rs.next()) 
				{*/
					
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
						List<SubDepartmentsModel> deptList2 = subdeptRepoObj.findAll();
						if(deptList2.isEmpty())
						{
							String[] departments= {"Admin",                 "Master",                     "CRM",                      "Engineering",           "Site",                  "Purchase",                 "Sales",              "Contract",           "Store",              "Account",            "Manufacturing",            
									               "Firm Details",          "Create User",                "User Browser",             "User Permission",       "Add License Key",       "Database Backup",          "Save Database",      "Deactive Key",       "View Licence Key",   "Save License Key",   "UpdateAccePerm",           
									               "View Browse",           "Transfer Key",               "Delete Browse",            "Update Browse",         "Save Users",            "Save Firms",               "Update Firms",       "View Firms",         
									               "Master"  ,              "Setting Master"  ,           "Address Master",           "SMS Master",               
									               "Employee Master",       "Add Year",                   "Add Unit",                 "Add Taxation",          "Mail Setting",          "API Setting",              "Add Currency",       "Add State",          "Add City"  ,         "Add Area",           "SMS Setting",              
									               "SMS Getway",            "Bill Print",                 "Logo Bill",                "Add Designation",       "Create Designation",    "Save Year",                "View Year",          "Save Unit",          "Update Unit"  ,      "Import Unit",        "Export Unit",                                                      
									               "View Unit",             "Delete Unit",                "Set Tax Type",             "Save Mail",             "Save Port",             "Update Port",              "View Mail",          "Delete Mail",        "Save IndiaMart Api", "Save Konwlarity Api","View Recptionist No",      
									               "Set Currency",          "Save State",                 "Save Area",                "View Area",             "Delete Area",           "Save SMS Setting",         "Update SMS Setting", "View SMS Setting",   "Delete SMS Setting", "Save Bill Prefix",   "Save Bill Submit",         
									               "Save Designation",      "View Designation",           "Save Structure",           "View Structure",       
									               "CRM"  ,                 "CRM Master",                 "Leads",                    "Compaigns",             "Reports",               "Product Master",           "Add Mark.Activity",  "SMS MASTER CRM",           
									               "Add Budget",            "Target Assignment",          "Call Logs",                "Leads Page",            "New Leads",             "Pending Folloups",         "Proposals",          "Bulk SMS Compaigns", "Bulk Email Copaigns","Imports Leads",      "Leads Reports",           
									               "Followups Reports",     "Achievments Reports",        "Activity Analysis",        "Work Reports",          "Save Product",          "View Product",             "Save Activity",      "Update Activity",    "View Activity",      "Delete Activity",    "Add SMS Category",         
									               "Set SMS Category",      "View SMS Category",          "Save Budget",              "View Budget",           "Add Target",            "Save Target",              "Update Target",      "View Target",        "Lead Search",        "Assigns Leads",      "New Leads Create",         
									               "Import Leads",          "Export Leads",               "View Leads",               "New Lead Save",         "View PendingFollowup",  "View Proposals",           "Leads Exports",      "Ex-Submit Leads",    "View Leads Report",  "Lead Summary2",      "Lead Summary3",            
									               "Lead Summary4",         "Lead Summary5",              "Lead Summary6",            "Lead Summary7",         "Lead Summary8",         "Lead Summary9",            "Lead Summary10",     "Lead Summary11",     "Lead Summary12",     "Lead Summary13",     "Lead Summary14",           
									               "ViewFollowup report1",  "ViewFollowup report2",       "Achievment Report1",       "Achievment Report2 ",   "Achievment Report3",    "Act. Analysis Report",     "Work Report1",       "Work Report2"                                                                             
							                      };
							
							for(int i=0;i<=departments.length-1;i++)
							{
								SubDepartmentsModel deptModel = new SubDepartmentsModel();
								String deptsName=departments[i];
								deptModel.setSubdepartmentname(deptsName);
								subdeptRepoObj.save(deptModel);
							}
						}
						
						try
						{
						State stateobj1 = stateRepositoryObj.findByState(state);
						if (stateobj1 == null) {
							State saveStatesobj = new State();
							saveStatesobj.setState(state);
							stateRepositoryObj.save(saveStatesobj);
						}
						State stateobj2 = stateRepositoryObj.findByState(state);
						City cityobj = cityRepositoryObj.findByCityAndState(city, stateobj2);
						if (cityobj == null) {
							City SaveCityObj = new City();
							SaveCityObj.setCity(city);
							SaveCityObj.setState(stateobj2);
							cityRepositoryObj.save(SaveCityObj);
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
							//areaRepositoryObj.save(saveAreaObj);
							
						}}catch (Exception e) {
							e.printStackTrace();
						}
						boolean f = licenseKeyCtrlObj.saveParentFirmOnServer(todayDate, firmsName, prntFirmsUsername, ownersName, area,city,emailId,gstNumber,landlineNumber,landmark,mobileNumber,panNumber,pinCode,state,termsAndConditions);
						if(f) 
						{
							prntFirmObj = saveParentFirm(firmsName,ownersName,area,landmark,city,state,pCode,emailId,mobileNumber,landlineNumber,gstNumber,panNumber,termsAndConditions,prntFirmsUsername);
							int firmId =0;
							ResultSet rs2 =licenseKeyCtrlObj.checkParentFirmOnServer(prntFirmsUsername);
							System.out.println("check1"+rs2);
							System.out.println("check22"+prntFirmObj);
							System.out.println("firm welcome save");
							System.out.println("firm end save");
							if (rs2.next() && prntFirmObj !=null) 
							{
								firmId = rs2.getInt("parent_firm_id");
							//int	firmIdA = rs2.getInt("firm_id");
								//System.out.println("welcome to user registration"+firmIdA);
								boolean rss= licenseKeyCtrlObj.saveFirm(area,city,todayDate,emailId,firmsName,prntFirmsUsername,gstNumber,landlineNumber,landmark,mobileNumber,ownersName,panNumber,pinCode,state,termsAndConditions,firmId);
								
								boolean f1 =licenseKeyCtrlObj.saveUserOnServer(employeesName,username,password,"Active",firmId,state, area, city, dateOfBirth, emailId, emplayeeId, mobileNo, PinCode,mailPasswrd);
								System.out.println("welcome to user registration"+f1);
								if(f1) 
								{
									int userId =0;
									UserRegistrationModel userObj = saveInitialUserOfFirm(employeesName, emailId, mailPasswrd, mobileNo, dateOfBirth, emplayeeId, street, city, state, pCode, username, password, prntFirmObj);
									saveUserPermissionsForAdmin(userObj);
									ResultSet rs3 =licenseKeyCtrlObj.checkUserOnServer(username,password,"Active",firmId);
									if (rs3.next()) 
									{
										userId = rs3.getInt("user_id");
										System.out.println("firmIdfirmId"+firmId);
										System.out.println("userIduserId"+userId);
										licenseKeyCtrlObj.registerKeyOnSeverForFirm(todayDate,licenseKey,firmId,userId);
										saveLicenseKeyLocal(licenseKey, prntFirmObj, userObj);
									}
								}
							}
						}
						json.addProperty("parentFirmP", "false");
					
					}
					json.addProperty("keyPresent", "true");
					
				//}
				/*else
				{
					json.addProperty("keyPresent", "false");
				}*/
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
	
		
	}

	
}