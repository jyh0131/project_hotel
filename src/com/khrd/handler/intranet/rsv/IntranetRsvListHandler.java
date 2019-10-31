package com.khrd.handler.intranet.rsv;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetRsvListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			RsvDAO dao = RsvDAO.getInstance();
			List<Reservation> list = dao.selectRsvListAll(conn);
			
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/intranet/intranetRsvMng.jsp";
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}//process

}//RsvListForAdminHandler
