package com.khrd.handler.member;

import java.sql.Connection;
import java.util.Date;

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
			return "/WEB-INF/view/member/changePwdForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			Connection conn = null;
			try { 
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member member = new Member(0, name, null, null, null, null,
						null, null, null, id, confirmPassword, null, null, 0);
				Member dbmember = dao.selectById(conn, id);
				if(password.equals(dbmember.getmPwd())==true) {
					int result = dao.PwdUpdate(conn, member);
					request.setAttribute("result", result);
					return "/WEB-INF/view/member/changePwdSuccess.jsp";
				}else {
					request.setAttribute("notMatch",true );
					return "/WEB-INF/view/member/changePwdForm.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		
		return null;
	}

}
