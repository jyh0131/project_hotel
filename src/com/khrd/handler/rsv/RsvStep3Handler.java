package com.khrd.handler.rsv;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class RsvStep3Handler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/WEB-INF/view/rsv/rsvStep3.jsp";
		
	}//process

}//RsvStep3Handler
