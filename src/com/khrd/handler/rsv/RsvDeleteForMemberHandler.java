package com.khrd.handler.rsv;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RsvDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvDeleteForMemberHandler implements CommandHandler {
	//예약 삭제 -> 예약상태를 취소로 변경 (논리삭제)
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		int rNo = Integer.parseInt(request.getParameter("no"));
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			RsvDAO rsvDao = RsvDAO.getInstance();
			
			int rResult = rsvDao.updateRsvStateForCancel(conn, rNo);
			conn.commit();
			
			if(rResult > 0) {
				response.sendRedirect("list.do");
			} else {
				return null; //예약 실패시 에러페이지 만들어서 넣을 예정
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
			
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	
	}//process

}//RsvDeleteForMemberHandler
