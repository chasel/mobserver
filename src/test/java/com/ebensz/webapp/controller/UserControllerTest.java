package com.ebensz.webapp.controller;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.ebensz.application.Constants;
import com.ebensz.service.UserManager;

import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

public class UserControllerTest extends BaseControllerTestCase {
    @Autowired
    private UserController c;

    @SuppressWarnings("rawtypes")
	@Test
    public void testHandleRequest() throws Exception {
        ModelAndView mav = c.handleRequest(null);
        Map m = mav.getModel();
        assertNotNull(m.get(Constants.USER_LIST));
        assertEquals("admin/userList", mav.getViewName());
    }

    @SuppressWarnings("rawtypes")
	@Test
    public void testSearch() throws Exception {
        // reindex before searching
        UserManager userManager = (UserManager) applicationContext.getBean("userManager");
        userManager.reindex();

        ModelAndView mav = c.handleRequest("admin");
        Map m = mav.getModel();
        List results = (List) m.get(Constants.USER_LIST);
        assertNotNull(results);
        assertTrue(results.size() >= 1);
        assertEquals("admin/userList", mav.getViewName());
    }
}
