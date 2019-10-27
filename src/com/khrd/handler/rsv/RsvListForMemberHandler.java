package com.khrd.handler.rsv;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvListForMemberHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			RsvDAO rDao = RsvDAO.getInstance();
			MemberDAO mDao = MemberDAO.getInstance();
			
			String mId = (String) request.getSession().getAttribute("Auth");
			Member m = mDao.selectById(conn, mId);
			
			List<Reservation> list = rDao.selectByMNo(conn, m.getmNo());
			
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/rsv/rsvListForMember.jsp"; //마이페이지 예약확인
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}//process

}//RsvMyReservationHandler
