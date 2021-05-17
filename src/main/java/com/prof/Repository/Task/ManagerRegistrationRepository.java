package com.prof.Repository.Task;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prof.POJO.Task.ManagerRegistrationModel;

public interface ManagerRegistrationRepository extends JpaRepository<ManagerRegistrationModel, Integer> {


	ManagerRegistrationModel findByFirmId(Integer firmRegiId);

	ManagerRegistrationModel findByFirstName(String firstName);
	
	ManagerRegistrationModel findByLastName(String lastName);
	
	
}
