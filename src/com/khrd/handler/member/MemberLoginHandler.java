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
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member member = dao.selectIdAndPw(conn, id, password);
				if(member == null) {
					request.setAttribute("notMatch", true);
					return "/WEB-INF/view/member/loginForm.jsp";
				}
				HttpSession session = request.getSession();
				session.setAttribute("Auth", member.getmId());
				
				return "../index.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
