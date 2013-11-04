package com.ebensz.model.dto;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotEmpty;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotNull;

/**
 * The class order to test spring mongodb support data
 * @author Chasel.li
 *
 */

@Document
public class Person {

	@Id
	private String personId;
	
	@NotNull
	@NotEmpty
	private String email;
	
	private String firstName;
	
	private String lastName;
	
	private Integer age;

	public String getPersonId() {
		return personId;
	}

	public void setPersonId(String personId) {
		this.personId = personId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public String toString() {
		 return "Person{" +
		         "personId='" + personId + '\'' +
		         ", email='" + email + '\'' +
		         ", firstName='" + firstName + '\'' +
		         ", lastName='" + lastName + '\'' +
		         ", age=" + age +
		         '}';
	}
	
}
