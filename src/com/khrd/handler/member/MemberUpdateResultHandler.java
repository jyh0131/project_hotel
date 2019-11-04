package com.khrd.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class MemberUpdateResultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "/WEB-INF/view/member/memberUpdateResult.jsp";
	}//process

}//MemberResult1Handler
