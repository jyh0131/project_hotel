package com.khrd.handler.questionReply;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionReplyDAO;
import com.khrd.dto.QuestionBoard;
import com.khrd.dto.QuestionReply;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionReplyInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * if(request.getMethod().equalsIgnoreCase("get")) { return
		 * "/WEB-INF/view/question_board/qbDetailForm.jsp";
		 * 
		 * }else if(request.getMethod().equalsIgnoreCase("post")) {
		 */
		int qbNo = Integer.parseInt(request.getParameter("qbNo"));
		String qrContent = request.getParameter("qr_content");
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			QuestionReplyDAO dao = QuestionReplyDAO.getInstance();
			QuestionBoard qb = new QuestionBoard(qbNo, null, null, null, 0, null, null, null, null, null, null);
			QuestionReply qr = new QuestionReply(0, qrContent, null, qb);

			int result = dao.insert(conn, qr);
			request.setAttribute("result", result);

			// response.sendRedirect(request.getContextPath() + "/qb/list.do");
			response.sendRedirect(request.getContextPath() + "/qr/detail.do?qbNo=" + qbNo);
			return null;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}

		// }
		return null;
	}

}
