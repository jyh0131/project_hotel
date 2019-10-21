package com.khrd.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class AgreeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/agreeForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String agree = request.getParameter("agree");
			String agree1 = request.getParameter("agree1");
			if(agree1.equals("yes1")&&agree.equals("yes")) {
				return "/WEB-INF/view/joinForm.jsp";
			}
		}
		return null;
	}

}
