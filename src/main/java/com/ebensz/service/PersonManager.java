package com.ebensz.service;

import java.util.List;

import com.ebensz.model.dto.Person;

/**
 * 
 * Business Service Interface to handle communication between web and
 * persistence layer order to manager person information.
 * 
 * @author Chasel.li
 *
 */

public interface PersonManager {

	/**
	 * save {@link Person} collection into mongodb.
	 * @param person
	 */
	public void save(Person person);
	
	/**
	 * find {@link Person} by condition equal email.
	 * @param email
	 * @return {@link Person}
	 */
	public Person findByEmail(String email);
	
	/**
	 * find all collection from mongodb.
	 * @return {@link List&ltPerson&gt}
	 */
	public List<Person> findAll();
	
	/**
	 * remove all collection from mongodb.
	 */
	public void removeAll();
}
