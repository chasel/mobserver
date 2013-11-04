package com.ebensz.service;

import java.util.List;

import com.ebensz.model.LabelValue;

/**
 * Business Service Interface to talk to persistence layer and
 * retrieve values for drop-down choice lists.
 *
 * @author <a href="mailto:chasel.java@gmail.com">Chasel Li</a>
 */
public interface LookupManager {
   /**
     * Retrieves all possible roles from persistence layer
     * @return List of LabelValue objects
     */
   List<LabelValue> getAllRoles();
}
