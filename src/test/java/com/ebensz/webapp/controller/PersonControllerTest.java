package com.ebensz.webapp.controller;

import static junit.framework.Assert.*;
import static org.junit.Assert.assertFalse;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.DataBinder;

import com.ebensz.model.dto.Person;

public class PersonControllerTest extends BaseControllerTestCase {

	@Autowired
	private PersonController controller = null;
	private Person person;
	
	@Test
	public void testSave() {
		person = new Person();
		person.setEmail("chasel_li@sina.com");
		person.setFirstName("Chasel");
		person.setLastName("Li");
		person.setAge(23);
		
		BindingResult errors = new DataBinder(person).getBindingResult();
		String result = controller.save(person, errors);
		assertFalse("errors returned in model", errors.hasErrors());
		assertNotNull(result);
	}
}
