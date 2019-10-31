package com.khrd.handler.intranet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class IntranetLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/intranet/intranetLoginForm.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			
		}
		
		return null;
		
	}//process

}//IntranetLoginHandler
