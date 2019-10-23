package com.khrd.handler.rsv;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class RsvInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/rsv/rsvStep1.jsp"; //예약1단계(기본정보)
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			
			return "/WEB-INF/view/rsv/rsvStep2.jsp"; //예약2단계(옵션선택)
		}
		
		return null;
		
	}//process

}//RsvInsertHandler
