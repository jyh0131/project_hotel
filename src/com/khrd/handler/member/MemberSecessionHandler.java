package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberSecessionHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/member/secessionForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String dId = request.getParameter("did");
			Connection conn = null;
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member dbmember = dao.selectById(conn, id);
				if(id.equals(dId)==false) {
					request.setAttribute("notIdMatch",true );
					return "/WEB-INF/view/member/secessionForm.jsp";
				}else if(password.equals(dbmember.getmPwd())==false) {
					request.setAttribute("notPwdMatch",true );
					return "/WEB-INF/view/member/secessionForm.jsp";
				}else if(password.equals(dbmember.getmPwd())==true) {
					int result = dao.delete(conn, dbmember.getmNo());
					request.setAttribute("result", result);
					return "/WEB-INF/view/member/secessionSuccess.jsp";
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
