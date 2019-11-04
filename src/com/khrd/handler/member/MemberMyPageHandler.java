package com.khrd.handler.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class MemberMyPageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//마이페이지로 이동
		
		return "/WEB-INF/view/member/memberMyPage.jsp";
	
	}//process

}//MemberMyPageHandler
