package com.prof.POJO.Task;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



import java.sql.Date;

@Entity
@Table(name="Manager_Registration")
public class ManagerRegistrationModel 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Firm_Id" , updatable = false)
	Integer firmId;
	
	@Column (name="Email_Id")
	String emailId; 
	
	@Column(name="First_Name")
	String firstName;
	
	@Column(name="Last_Name")
	String LastName;
	
	@Column(name = "PASSWORD")
	String password;
	
	@Column(name = "Address")
	String area;
	
	@Column(name = "DATE_OF_BIRTH")
	Date dateOfBirth;
	
	@Column(name="Firms_Name")
	String firmsName;

	public Integer getFirmId() {
		return firmId;
	}

	public void setFirmId(Integer firmId) {
		this.firmId = firmId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getFirmsName() {
		return firmsName;
	}

	public void setFirmsName(String firmsName) {
		this.firmsName = firmsName;
	}
	
	
}
