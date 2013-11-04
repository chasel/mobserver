package com.ebensz.dao;


import java.util.List;

import com.ebensz.model.Role;
 
/**
 * Lookup Data Access Object (GenericDao) interface.  This is used to lookup values in
 * the database (i.e. for drop-downs).
 *
 * @author <a href="mailto:chasel.java@gmail.com">Chasel Li</a>
 */
public interface LookupDao {
   //~ Methods ================================================================
 
   /**
     * Returns all Roles ordered by name
     * @return populated list of roles
     */
   List<Role> getRoles();
}
