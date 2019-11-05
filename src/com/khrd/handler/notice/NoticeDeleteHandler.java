package com.khrd.handler.notice;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.NoticeDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class NoticeDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		int ntNo = Integer.parseInt(request.getParameter("no"));
		
		try {
			conn = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			int result = dao.deleteNotice(conn, ntNo);
			
			request.getSession().setAttribute("deleteResult", result);
			
			response.sendRedirect(request.getContextPath() + "/notice/noticeResult.do");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}//process

}//NoticeDeleteHandler
