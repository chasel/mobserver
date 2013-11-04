package com.ebensz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebensz.dao.PersonDao;
import com.ebensz.model.dto.Person;
import com.ebensz.service.PersonManager;

/**
 * Implementation of PersonManager interface.
 * 
 * @author Chasel.li
 *
 */
@Service("personManager")
public class PersonManagerImpl implements PersonManager {

	PersonDao personDao;
	
	@Autowired
	public PersonManagerImpl(PersonDao personDao) {
		super();
		this.personDao = personDao;
	}

	@Override
	public void save(Person person) {
		personDao.save(person);

	}
	
	@Override
	public Person findByEmail(String email) {
		return personDao.findByEmail(email);
	}

	@Override
	public List<Person> findAll() {
		return personDao.findAll();
	}

	@Override
	public void removeAll() {
		personDao.removeAll();
	}

}
