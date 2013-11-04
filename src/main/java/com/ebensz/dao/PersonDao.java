package com.ebensz.dao;

import java.util.List;

import com.ebensz.model.dto.Person;

/**
 * The interface operate mongodb database, implemention CRUD
 *  
 * @author Chasel.li
 *
 */

public interface PersonDao {

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
