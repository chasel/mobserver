package com.ebensz.webapp.controller;

import java.util.List;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ebensz.model.dto.Person;
import com.ebensz.service.PersonManager;

/**
 * The Controller to receive front web parameter, validation parameter isn't valid,
 * transfer data to business interface.
 * 
 * @author Chasel.li
 *
 */

@Controller
public class PersonController {
	
	private PersonManager personManager;
	
	@Autowired
	public void setPersonManager(PersonManager personManager) {
		this.personManager = personManager;
	} 
	
	@RequestMapping(value = "/person", method = RequestMethod.POST)
	public @ResponseBody String save (@Validated Person person, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return bindingResult.getAllErrors().toString();
		}
		personManager.save(person);
		return "Person added!";
	}
	
	@RequestMapping(value = "/person/delete/all", method = RequestMethod.POST)
	public @ResponseBody String removeAll() {
		personManager.removeAll();
		
		return "All Persons removed";
	}
	
	@RequestMapping(value = "/person/list")
	public @ResponseBody String findAll() {
		List<Person> personList = personManager.findAll();
		
		return personList.toString();
	}
	
	@RequestMapping(value = "/person")
	public @ResponseBody String findByEmail(@RequestParam String email) {
		if (StringUtils.isEmpty(email)) {
			return "Unable to find an Person without email value";
		}
		Person person = personManager.findByEmail(email);
		if (ObjectUtils.NULL.equals(person)){
			return "Person not found with the following email:" + email;
		}
		return "Found the following person:" + person;
	}
}
