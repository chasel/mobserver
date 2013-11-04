package com.ebensz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebensz.dao.LookupDao;
import com.ebensz.model.LabelValue;
import com.ebensz.model.Role;
import com.ebensz.service.LookupManager;
 
import java.util.ArrayList;
import java.util.List;
 
 
/**
 * Implementation of LookupManager interface to talk to the persistence layer.
 *
 * @author <a href="mailto:chasel.java@gmail.com">Chasel Li</a>
 */
@Service("lookupManager")
public class LookupManagerImpl implements LookupManager {
   @Autowired
   LookupDao dao;
 
   /**
     * {@inheritDoc}
     */
   public List<LabelValue> getAllRoles() {
       List<Role> roles = dao.getRoles();
       List<LabelValue> list = new ArrayList<LabelValue>();
 
       for (Role role1 : roles) {
           list.add(new LabelValue(role1.getName(), role1.getName()));
       }
 
       return list;
   }
}
