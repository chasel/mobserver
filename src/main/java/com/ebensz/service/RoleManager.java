package com.ebensz.service;

import java.util.List;

import com.ebensz.model.Role;

/**
 * Business Service Interface to handle communication between web and
 * persistence layer.
 *
 * @author <a href="mailto:chasel.java@gmail.com">Chasel Li</a>
 */
@SuppressWarnings("rawtypes")
public interface RoleManager extends GenericManager<Role, Long> {
   /**
     * {@inheritDoc}
     */
   
	List getRoles(Role role);
 
   /**
     * {@inheritDoc}
     */
   Role getRole(String rolename);
 
   /**
     * {@inheritDoc}
     */
   Role saveRole(Role role);
 
   /**
     * {@inheritDoc}
     */
   void removeRole(String rolename);
}
