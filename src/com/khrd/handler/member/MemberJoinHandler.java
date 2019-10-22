package com.khrd.handler.member;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberJoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/joinForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String name = request.getParameter("name");
			String date = request.getParameter("date");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date regDate = sdf.parse(date);
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String tel = request.getParameter("tel");
			String zip = request.getParameter("zip");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member member = new Member(0, name, regDate, email, phone, tel,
						zip, addr1, addr2, id, password, null, null, 0);
				int result = dao.insert(conn, member);
				request.setAttribute("result", result);
				 return "/WEB-INF/view/member/joinResult.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
				
		}
		return null;
	}

}
