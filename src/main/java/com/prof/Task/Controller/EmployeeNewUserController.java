package com.prof.Task.Controller;

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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.prof.POJO.ADMIN.EmployeeRegistrationModel;
import com.prof.Repository.ADMIN.EmployeeRegistrationRepository;
import com.prof.Repository.ADMIN.ManagerRegistrationRepository;


@Controller
public class EmployeeNewUserController {

	@Autowired
	EmployeeRegistrationRepository userRepoObj;
	@Autowired
	ManagerRegistrationRepository firmRegistrationRepositoryObj;
	@Autowired
	EmployeeRegistrationRepository userRegistrationReposObj;
	
	
	java.util.Date utilDate = new java.util.Date();
	java.sql.Date todayDate = new java.sql.Date(utilDate.getTime());


	@RequestMapping("/CreateUser")
	public ModelAndView userbrowse(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = null;
		Integer userId = null;
		int flag = 0;

		try {
			username = (String) session.getAttribute("usernames");
		} catch (Exception e) {
			System.out.println(e);
		}
		if (username != null) {
			return new ModelAndView("Task/CreateNewUser");
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
		String EmpId = request.getParameter("empId");
		String City = request.getParameter("city");
	    String NewUsername = request.getParameter("userName");
		String NewPassword = request.getParameter("passWordnew");
		String employeeName = FirstName.concat(" " + LastName);
		System.out.println("employeeName" + employeeName);
		Calendar exDateCal = Calendar.getInstance();
		exDateCal.add(Calendar.DAY_OF_MONTH,0);
		
		HttpSession session = request.getSession(false);
		String firmsUsername=(String) session.getAttribute("firmsUsername");
	
		
		EmployeeRegistrationModel userObj = userRepoObj.findByUsername(NewUsername);
		JsonArray jArray = new JsonArray();
		JsonObject jObject = new JsonObject();
		if (userObj == null) {
			EmployeeRegistrationModel userObj1 = userRepoObj.findByemployeeId(EmpId);
			if (userObj1 == null)
			{
				try {
				   City cityObj1 = cityRepositoryObj.findByCityAndState(City, stateobj2);
					
					if (cityObj1 == null) {
						City SaveCityObj = new City();
						SaveCityObj.setCity(City);
						SaveCityObj.setState(stateobj2);
						cityRepositoryObj.saveAndFlush(SaveCityObj);
					}
					City cityObj2 = cityRepositoryObj.findByCityAndState(City, stateobj2);

					
				} catch (Exception e) {

				}
				EmployeeRegistrationModel userregistrationObj = new EmployeeRegistrationModel();
				userregistrationObj.setEmployeeName(employeeName);
				userregistrationObj.setEmailId(EmailId);
				userregistrationObj.setMailpassword(mailPasswrd);
				userregistrationObj.setMobileNo(MobNumbr);
				userregistrationObj.setDateOfBirth(dateofBirth);
				userregistrationObj.setEmployeeId(EmpId);
			    userregistrationObj.setCity(City);
				userRepoObj.save(userregistrationObj);
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



}