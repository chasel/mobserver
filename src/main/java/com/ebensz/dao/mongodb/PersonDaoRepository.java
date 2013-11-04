package com.ebensz.dao.mongodb;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.ebensz.dao.PersonDao;
import com.ebensz.model.dto.Person;

import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

/**
 * The class operate mongodb database, implemention CRUD 
 * @author Chasel.li
 *
 */

@Repository
public class PersonDaoRepository implements PersonDao{

	private static final Log log = LogFactory.getLog(PersonDaoRepository.class);
	
	private MongoTemplate mongoTemplate;

	public PersonDaoRepository() {
		super();
	}

	/**
	 * if {@link MongoTemplate} haven't {@link Person} collection, create it. 
	 * @param mongoTemplate
	 */
	@Autowired
	public PersonDaoRepository(MongoTemplate mongoTemplate) {
		super();
		this.mongoTemplate = mongoTemplate;
		if (!mongoTemplate.collectionExists(Person.class)){
			log.debug("Creating the Person collection");
			
			mongoTemplate.createCollection(Person.class);
		}
	}
	/**
	 * save {@link Person} collection into mongodb.
	 * @param person
	 */
	public void save(Person person) {
		log.debug("Saving the following Person Object:" + person);
		
		mongoTemplate.save(person);
	}
	
	/**
	 * find {@link Person} by condition equal email.
	 * @param email
	 * @return {@link Person}
	 */
	public Person findByEmail(String email) {
		log.debug("Finding an Person by this Email:" + email);
		
		return mongoTemplate.findOne(query(where("email").is(email)), Person.class);
	}
	
	/**
	 * find all collection from mongodb.
	 * @return {@link List&ltPerson&gt}
	 */
	public List<Person> findAll() {
		return mongoTemplate.findAll(Person.class);
	}
	
	/**
	 * remove all collection from mongodb.
	 */
	public void removeAll() {
		log.debug("Removing all Persons");
		
		mongoTemplate.remove(new Query(), Person.class);
	}
}
