package com.khrd.handler.intranet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class IntranetAdminCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/intranet/intranetAdminCheck.jsp";
			
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String inCord = request.getParameter("cord");
			
			if(inCord.equals("realadmin00")) { //내가 임의로 설정한 관리자 인증코드
				response.sendRedirect(request.getContextPath() + "/intranet/join.do"); //회원가입 페이지로
				return null;
				
			} else {
				request.setAttribute("notAdmin", "존재하지 않는 코드입니다.");
				return "/WEB-INF/view/intranet/intranetAdminCheck.jsp";
			}
			
		}
		
		return null;
		
	}//process

}//IntranetAdminCheckHandler
