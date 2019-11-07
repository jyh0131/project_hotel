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

public class MemberUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		if (request.getMethod().equalsIgnoreCase("get")) {
			String id = null;
			
			if(request.getSession().getAttribute("Admin") != null) { //관리자로 로그인 했을 때
				id = (String)request.getSession().getAttribute("Admin");
			} else if (request.getSession().getAttribute("Auth") != null) { //회원으로 로그인 했을 때
				id = (String)request.getSession().getAttribute("Auth");
			}

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
			String mId = request.getParameter("id");
			String zipcode = request.getParameter("zipcode");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			
			//전화번호 뚝딱뚝딱 재조립
			String mPhone1 = request.getParameter("phone1");
			String mPhone2 = request.getParameter("phone2");
			String mPhone3 = request.getParameter("phone3");
			String phone = mPhone1+"-"+mPhone2+"-"+mPhone3;
			
			String mTel1 = request.getParameter("tel1");
			String mTel2 = request.getParameter("tel2");
			String mTel3 = request.getParameter("tel3");
			String tel = mTel1+"-"+mTel2+"-"+mTel3;
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member m = new Member(0, 
									  null, 
									  null, 
									  null, 
									  phone, 
									  tel, 
									  zipcode, 
									  addr1, 
									  addr2, 
									  mId, 
									  null, 
									  new Date(), 
									  null, 
									  0);
				int result = dao.MemberUpdate(conn, m);
				request.getSession().setAttribute("result", result);
				
				response.sendRedirect(request.getContextPath() + "/member/updateResult.do");

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
