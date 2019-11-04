package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberChangePwdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/member/memberChangePwdForm.jsp";
		
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;

			String id = (String) request.getSession().getAttribute("Auth");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			
			try { 
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member mem = dao.selectById(conn, id);
				
				if(password.equals(mem.getmPwd()) == true) { //현재 비밀번호 일치
					mem.setmPwd(confirmPassword);
					int result = dao.PwdUpdate(conn, mem);
					request.getSession().setAttribute("result", result);
					
					response.sendRedirect(request.getContextPath() + "/WEB-INF/view/changePwdSuccess.jsp");
					
				}else { //비밀번호가 일치X
					request.setAttribute("pwdNotMatch", true);
					
					return "/WEB-INF/view/member/memberChangePwdForm.jsp";
				}
		
			} catch (Exception e) {
				e.printStackTrace();
		
			}finally {
				JDBCUtil.close(conn);
			}
			
		}
		
		return null;
	}//process

}//MemberChangePwdHandler
