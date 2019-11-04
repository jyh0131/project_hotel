package com.khrd.handler.questionReply;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dao.QuestionReplyDAO;
import com.khrd.dto.QuestionBoard;
import com.khrd.dto.QuestionReply;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionReplyDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int qbNo = Integer.parseInt(request.getParameter("qbNo"));
		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			
			QuestionBoardDAO qbDao = QuestionBoardDAO.getInstance();
			QuestionBoard qb = qbDao.selectByQbNo(conn, qbNo);
			request.setAttribute("qb", qb);
			
			QuestionReplyDAO arDao = QuestionReplyDAO.getInstance();
			QuestionReply qr = arDao.selectByQbNo(conn, qbNo);
			request.setAttribute("qr", qr);
			
			return "/WEB-INF/view/question_reply/qrDetailForm.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
