package com.khrd.handler.intranet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class IntranetJoinResultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/WEB-INF/view/intranet/intranetJoinResult.jsp";
		
	}//process

}//IntranetJoinResultHandler
