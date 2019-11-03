package com.khrd.handler.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class RedirectToMainHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		
		return null;
	}//process

}//RedirectToMainHandler
