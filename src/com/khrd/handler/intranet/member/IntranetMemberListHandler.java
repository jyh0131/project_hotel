package com.khrd.handler.intranet.member;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetMemberListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			List<Member> list = dao.selectList(conn);

			request.setAttribute("list", list);

			return "/WEB-INF/view/intranet/intranetMemberMng.jsp";

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			JDBCUtil.close(conn);
		}

		return null;
		
		
	}// process

}// IntranetMemberMngHandler
