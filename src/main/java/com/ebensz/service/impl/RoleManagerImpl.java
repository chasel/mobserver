package com.ebensz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebensz.dao.RoleDao;
import com.ebensz.model.Role;
import com.ebensz.service.RoleManager;
 
import java.util.List;
 
/**
 * Implementation of RoleManager interface.
 *
 * @author <a href="mailto:chasel.java@gmail.com">Chasel Li</a>
 */
@Service("roleManager")
public class RoleManagerImpl extends GenericManagerImpl<Role, Long> implements RoleManager {
   RoleDao roleDao;
 
   @Autowired
   public RoleManagerImpl(RoleDao roleDao) {
       super(roleDao);
       this.roleDao = roleDao;
   }
 
   /**
     * {@inheritDoc}
     */
   public List<Role> getRoles(Role role) {
       return dao.getAll();
   }
 
   /**
     * {@inheritDoc}
     */
   public Role getRole(String rolename) {
       return roleDao.getRoleByName(rolename);
   }
 
   /**
     * {@inheritDoc}
     */
   public Role saveRole(Role role) {
       return dao.save(role);
   }
 
   /**
     * {@inheritDoc}
     */
   public void removeRole(String rolename) {
       roleDao.removeRole(rolename);
   }
}