package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/member/loginForm.jsp";
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;

			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member member = dao.selectIdAndPw(conn, id, password);
				
				if(member == null) { //회원 정보가 존재하지 않을 경우
					request.setAttribute("idNotExist", true);
					
					return "/WEB-INF/view/member/loginForm.jsp";
					
				} else if (member.getmQuitdate() != null) { //탈퇴된 회원일 경우
					request.setAttribute("idNotExist", true);

					return "/WEB-INF/view/member/loginForm.jsp";
					
				} else if (!member.getmPwd().equals(password)) { //비밀번호가 틀릴 경우
					request.setAttribute("pwdNotMatch", true);

					return "/WEB-INF/view/member/loginForm.jsp";
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("Auth", member.getmId());
				
				response.sendRedirect(request.getContextPath() + "/main.do");
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				JDBCUtil.close(conn);
			}
		}
		
		return null;
	}//process

}//MemberLoginHandler
