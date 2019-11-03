package com.khrd.handler.questionBoard;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qbNo = Integer.parseInt(request.getParameter("qbNo"));
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
			dao.deleteContent(conn, qbNo);
			dao.deleteArticle(conn, qbNo);
			
			conn.commit();
			
			response.sendRedirect(request.getContextPath() + "/qb/list.do");
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
