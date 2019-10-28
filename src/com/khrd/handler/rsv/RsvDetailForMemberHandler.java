package com.khrd.handler.rsv;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.PayInfoDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.PayInfo;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvDetailForMemberHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		int rNo = Integer.parseInt(request.getParameter("no"));
		
		try {
			conn = ConnectionProvider.getConnection();
			RsvDAO rsvDao = RsvDAO.getInstance();
			Reservation rsv = rsvDao.selectRsvByRNo(conn, rNo);
			
			PayInfoDAO piDao = PayInfoDAO.getInstance();
			PayInfo pay = piDao.selectPayInfoByRNo(conn, rNo);
			
//			pay.setpCardNum(pay.getpCardNum().replaceAll("(^.{12})","*"));
			
			request.setAttribute("rsv", rsv);
			request.setAttribute("pay", pay);
			
			return "/WEB-INF/view/rsv/rsvDetailForMember.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}//process

}//RsvDetailForMember
