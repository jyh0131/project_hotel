package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

import com.khrd.dao.MemberDAO;

import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		if (request.getMethod().equalsIgnoreCase("get")) {
			String id = request.getParameter("id");

			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member member = dao.selectById(conn, id);
				request.setAttribute("member", member);

				return "/WEB-INF/view/member/memberUpdate.jsp";

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				JDBCUtil.close(conn);
			}

		} else if (request.getMethod().equalsIgnoreCase("post")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String tel = request.getParameter("tel");
			String zipcode = request.getParameter("zipcode");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member member = new Member(0, name, null, email, phone, tel, zipcode, addr1, addr2, id, null, null,
						null, 0);
				dao.MemberUpdate(conn, member);
				response.sendRedirect(request.getContextPath() + "/member/mypage.do");

				return null;

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				JDBCUtil.close(conn);
			}

		}

		return null;

	}// process

}// MemberUpdateHandler
