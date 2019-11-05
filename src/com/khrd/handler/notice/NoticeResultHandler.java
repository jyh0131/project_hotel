package com.khrd.handler.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class NoticeResultHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//이건 정말 왜 이렇게 만들었는지 알다가도 모를..
		return "/WEB-INF/view/notice/noticeResult.jsp";
		
	}//process

}//NoticeResultHandler
