package com.edzeal.Admin.Controller;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.edzeal.Controller.MacAddresses;
import com.edzeal.POJO.ADMIN.ParentFirmsModel;
import com.edzeal.POJO.ADMIN.UserAccessPermissionsModel;
import com.edzeal.POJO.ADMIN.UserLoginDetailsModel;
import com.edzeal.POJO.ADMIN.UserRegistrationModel;
import com.edzeal.POJO.MASTER.DepartmentsModel;
import com.edzeal.Repository.ADMIN.DepartmentsRepository;
import com.edzeal.Repository.ADMIN.ParentFirmsRepository;
import com.edzeal.Repository.ADMIN.UserAccessPermissionRepository;
import com.edzeal.Repository.ADMIN.UserLoginRepository;
import com.edzeal.Repository.ADMIN.UserRegistrationRepository;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class LoginController {
	@Autowired
	UserRegistrationRepository userRegistrationReposObj;
	@Autowired
	DepartmentsRepository departmentsReposObj;
	@Autowired
	UserLoginRepository userLoginRepositoryObj;
	@Autowired
	UserAccessPermissionRepository userAccessPermissionReposObj;

	@Autowired
	UserRegistrationRepository userRegistrationRepositoryObj;
	
	@Autowired
	ParentFirmsRepository prntFirmRepoObj;

	@RequestMapping("/")
	public ModelAndView index (ModelMap model, HttpServletRequest request)
	{
		List<UserRegistrationModel> userlist = userRegistrationReposObj.findAll();
		if (userlist.isEmpty()) {
			return new ModelAndView("redirect:/LicenseKey");
		} else {
						String URL= "redirect:/LoginPage";

			try {
				 String str = "";
			     String macAddress = ""; 
			     String remoteAddr = "";
			     String xyz="";

		        if (request != null) {
		            remoteAddr = request.getHeader("X-FORWARDED-FOR");
		            xyz=request.getHeader("user-agent");   
		            if (remoteAddr == null || "".equals(remoteAddr)) {
		                remoteAddr = request.getRemoteAddr();
		              
		            }
		        }
		        System.out.println("remoteAddr"+remoteAddr+"xyz"+xyz);
		        InetAddress IPAddress = null;
		        String MACAddress = "";
		        if(remoteAddr.equalsIgnoreCase("0:0:0:0:0:0:0:1"))
		        {
		        	IPAddress = InetAddress.getLocalHost();
		        	System.out.println("ipaddress>>>>" + IPAddress.toString());
					NetworkInterface network = NetworkInterface.getByInetAddress(IPAddress);

					byte[] mac = network.getHardwareAddress();

					System.out.print("Current MAC address : "+mac.toString());

					StringBuilder sb = new StringBuilder();
					for (int i = 0; i < mac.length; i++) {
						sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
					}
					MACAddress = sb.toString();
					System.out.println("MACAddress"+MACAddress);
		        }
		        else
		        {
		        Process p = Runtime.getRuntime().exec("nbtstat -A " + remoteAddr); 
	            InputStreamReader ir = new InputStreamReader(p.getInputStream()); 
	            LineNumberReader input = new LineNumberReader(ir); 
	            for (int i = 1; i <100; i++) { 
	                str = input.readLine(); 
	                if (str != null) { 
	                    if (str.indexOf("MAC Address") > 1) { 
	                        macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length()); 
	                        break; 
	                    } 
	                } 
	            } 
	            System.out.println("macAddress"+macAddress);
	            MACAddress=macAddress;
		        }
		        HttpSession session = request.getSession();
		        String LoginStatus = "Login";
				UserLoginDetailsModel UserAlreadyLoggedIn = userLoginRepositoryObj.findByMacAddressAndLoginStatus(MACAddress, LoginStatus);
		        if(session.getAttribute("userId")==null)
		        {
		        	if (UserAlreadyLoggedIn != null)
		        	{
		        	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy hh:mm:ss a");
		    		LocalDateTime now = LocalDateTime.now();
		    		String logoutDateAndTime = dtf.format(now);
		        	UserAlreadyLoggedIn.setLoginOutDetails(logoutDateAndTime);
		        	UserAlreadyLoggedIn.setLoginStatus("LogOut");
					userLoginRepositoryObj.save(UserAlreadyLoggedIn);
					}
		        }
		        else
		        {
					if (UserAlreadyLoggedIn != null) {
						System.out.println("UserAlreadyLoggedIn");
						String userDept = UserAlreadyLoggedIn.getUserRegistrationModelObj().getDepartmentModelObj().getDepartmentname();
						session.setAttribute("usernames", UserAlreadyLoggedIn.getUserRegistrationModelObj().getUsername());
						session.setAttribute("password", UserAlreadyLoggedIn.getUserRegistrationModelObj().getPassword());
						session.setAttribute("firmsUsername", UserAlreadyLoggedIn.getUserRegistrationModelObj().getParentFirmObj().getParentFirmsUserName());
						session.setAttribute("firmsName", UserAlreadyLoggedIn.getUserRegistrationModelObj().getParentFirmObj().getParentfirmName());
						session.setAttribute("empName", UserAlreadyLoggedIn.getUserRegistrationModelObj().getEmployeeName());
						session.setAttribute("userId", UserAlreadyLoggedIn.getUserRegistrationModelObj().getUserId());
						if(userDept.equalsIgnoreCase("Admin"))
						{
							URL="redirect:/"+userDept +"Dashboard";
						}
						else
						{
							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy hh:mm:ss a");
				    		LocalDateTime now = LocalDateTime.now();
				    		String logoutDateAndTime = dtf.format(now);
				        	UserAlreadyLoggedIn.setLoginOutDetails(logoutDateAndTime);
				        	UserAlreadyLoggedIn.setLoginStatus("LogOut");
							userLoginRepositoryObj.save(UserAlreadyLoggedIn);
						}
					}
				}
			} catch (UnknownHostException e) {
				e.printStackTrace();
			} catch (SocketException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}		
			return new ModelAndView(URL);		
		}
	}

	@RequestMapping("/LoginPage")
	public ModelAndView Loginpage() {
		return new ModelAndView("/Login");
	}
	
	@RequestMapping("/Admin/LicenseKey")
	public ModelAndView LicenseKey() {
		return new ModelAndView("/LicenseKey");
	}
	
	@RequestMapping("/ActivateUser")
	public ModelAndView ActivateUser() {
		return new ModelAndView("/ActivateUser");
	}

	@RequestMapping(value = "/Admin/login", method = RequestMethod.POST)
	@ResponseBody
	public String dashboard(HttpServletRequest request) throws UnknownHostException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String prntFirmUsername = request.getParameter("FirmsUserName");
		JsonArray jarray = new JsonArray();
		JsonObject json = new JsonObject();
		HttpSession session = request.getSession();
		
		//FirmRegistrationModel FirmsDetails = firmRegistrationRepositoryObj.findByFirmsUserName(FirmsUserName);
		ParentFirmsModel parentFirm = prntFirmRepoObj.findByParentFirmsUserName(prntFirmUsername);
		MacAddresses macObj = new MacAddresses();
		String MACAddress = "";
		MACAddress = macObj.getMacAddressOfReqSender(request);
			
		if (parentFirm != null && !MACAddress.equalsIgnoreCase("")) 
		{
			LicenseKeyController licenseKeyCtrlObj = new LicenseKeyController();
			int firmId =0;
			ResultSet rs =licenseKeyCtrlObj.checkParentFirmOnServer(prntFirmUsername);
			try
			{
				if (rs.next()) 
				{
					firmId = rs.getInt("parent_firms_id");
					UserRegistrationModel userObj = userRegistrationReposObj.findByUsernameAndPasswordAndParentFirmObj(username, password, parentFirm);
					ResultSet rs1 =licenseKeyCtrlObj.checkUserOnServer(username,password,"Active",firmId);
					if (rs1.next()) 
					{
						if (userObj != null) 
						{
							UserLoginDetailsModel usrLoginObj = userLoginRepositoryObj.findByUserRegistrationModelObj(userObj);
							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy hh:mm:ss a");
							LocalDateTime now = LocalDateTime.now();
							String loginDateAndTime = dtf.format(now);
							if (userObj.getStatus().equalsIgnoreCase("Active"))
							{
								session.setAttribute("userId", userObj.getUserId());
								session.setAttribute("usernames", username);
								session.setAttribute("password", password);
								session.setAttribute("firmsUsername", prntFirmUsername);
								session.setAttribute("firmsName", parentFirm.getParentfirmName());
								session.setAttribute("empName", userObj.getEmployeeName());
							if (usrLoginObj != null)
							{
								if (usrLoginObj.getLoginStatus().equals("Login") && !MACAddress.equalsIgnoreCase(usrLoginObj.getMacAddress())) 
								{
									json.addProperty("Anotherdevice", "alreadyLoggedIn");
								} else {
									usrLoginObj.setMacAddress(MACAddress);
									usrLoginObj.setLoginStatus("Login");
									usrLoginObj.setLoginDetails(loginDateAndTime);
									usrLoginObj.setUserRegistrationModelObj(userObj);
									userLoginRepositoryObj.save(usrLoginObj);
								}
							} else {
								UserLoginDetailsModel userLoginObj = new UserLoginDetailsModel();
								userLoginObj.setMacAddress(MACAddress);
								userLoginObj.setLoginStatus("Login");
								userLoginObj.setLoginDetails(loginDateAndTime);
								userLoginObj.setUserRegistrationModelObj(userObj);
								userLoginRepositoryObj.save(userLoginObj);
							}
							json.addProperty("Auth", "true");
							json.addProperty("departsName", userObj.getDepartmentModelObj().getDepartmentname());
							json.addProperty("Firm", prntFirmUsername);
							json.addProperty("uname", userObj.getUsername());
							json.addProperty("password",password );
						} else if (userObj.getStatus().equalsIgnoreCase("Suspend")) {

							json.addProperty("UserStatus", "Suspend");
						} else {
							json.addProperty("UserStatus", "Deactive");
						}
						}
					} else {
						json.addProperty("Auth", "false");
					}
					json.addProperty("FirmsName", "Correct");
				
			}else {
				json.addProperty("FirmsName", "wrong");
			}
				
			}
			catch (SQLException e) {
				e.printStackTrace();
				json.addProperty("FirmsName", "Exception");
			}
			} else {
				json.addProperty("FirmsName", "wrong");
			}

			jarray.add(json);
		return new Gson().toJson(jarray);
	}

	@RequestMapping("/AdminDashboard")
	public ModelAndView Admindashboard(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = null;
		Integer userId = null;
		int flag = 0;
		try {
			username = (String) session.getAttribute("usernames");
			userId = (Integer) session.getAttribute("userId");
			System.out.println("uId>>>>>"+userId);
			UserRegistrationModel userObj = userRegistrationReposObj.findByUserId(userId);
			DepartmentsModel deptObj = departmentsReposObj.findByDepartmentname("Admin");
			UserAccessPermissionsModel userPermissionObj=null;
			if(userObj!=null && deptObj !=null)
			{
				userPermissionObj = userAccessPermissionReposObj.findByuserRegistrationModelObjAndDepartmentsIdObj(userObj, deptObj);
			}
			
			if(userPermissionObj!=null) 
			{
				flag= 1;
			}
		} 
		catch (NullPointerException e)
		{
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy hh:mm:ss a");
			LocalDateTime now = LocalDateTime.now();
			String logoutDateAndTime = dtf.format(now);
			MacAddresses macObj = new MacAddresses();
			String macAddress = macObj.getMacAddressOfReqSender(request);
			UserLoginDetailsModel userLoginObj =userLoginRepositoryObj.findByMacAddress(macAddress);
			userLoginObj.setLoginOutDetails(logoutDateAndTime);
			userLoginObj.setLoginStatus("LogOut");
			userLoginRepositoryObj.save(userLoginObj);
			session.invalidate();
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		if (username != null && flag==1) {
			return new ModelAndView("ADMIN/AdminDashboard");
		} else {
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping("/Signout")
	public ModelAndView signout(HttpServletRequest request) {
		System.out.println("Inside Signout Method");
		HttpSession session = request.getSession();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy hh:mm:ss a");
		LocalDateTime now = LocalDateTime.now();
		String logoutDateAndTime = dtf.format(now);
		String username = (String) session.getAttribute("usernames");
		String pass = (String) session.getAttribute("password");
		String firm = (String) session.getAttribute("firmsUsername");
		try 
		{
			//FirmRegistrationModel firmObj = firmRegistrationRepositoryObj.findByFirmsUserName(firm);
			ParentFirmsModel prntFirmobj = prntFirmRepoObj.findByParentFirmsUserName(firm);
			UserRegistrationModel userObj = userRegistrationRepositoryObj.findByUsernameAndPasswordAndParentFirmObj(username, pass, prntFirmobj);
			UserLoginDetailsModel userLoginObj = userLoginRepositoryObj.findByUserRegistrationModelObj(userObj);
			userLoginObj.setLoginOutDetails(logoutDateAndTime);
			userLoginObj.setLoginStatus("LogOut");
			userLoginRepositoryObj.save(userLoginObj);	
		} catch (Exception e) {
			e.printStackTrace();	
		}		
		session.invalidate();
		return new ModelAndView("redirect:/");
	}
}
