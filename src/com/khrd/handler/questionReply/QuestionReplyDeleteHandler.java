package com.khrd.handler.questionReply;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dao.QuestionReplyDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionReplyDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//int qbNo = Integer.parseInt(request.getParameter("qbNo"));
		int qrNo = Integer.parseInt(request.getParameter("qrNo"));
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			QuestionReplyDAO dao = QuestionReplyDAO.getInstance();
			int result = dao.delete(conn, qrNo);
			
			conn.commit();
			
			response.sendRedirect(request.getContextPath() + "/qr/list.do");
			return null;
			
		}catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
