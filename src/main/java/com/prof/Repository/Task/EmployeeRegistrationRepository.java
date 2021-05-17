package com.prof.Repository.Task;

import java.sql.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.prof.POJO.Task.EmployeeRegistrationModel;
import com.prof.POJO.Task.ManagerRegistrationModel;


public interface EmployeeRegistrationRepository extends JpaRepository<EmployeeRegistrationModel, Integer> {

    ManagerRegistrationModel findByEmployeeId(Integer employeeRegiId);

	ManagerRegistrationModel findByFirstName(String firstName);
	
	ManagerRegistrationModel findByLastName(String lastName);
     EmployeeRegistrationModel findByUserId(Integer regiId);

}