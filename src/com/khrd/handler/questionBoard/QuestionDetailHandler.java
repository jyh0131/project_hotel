package com.khrd.handler.questionBoard;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dto.QuestionBoard;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionDetailHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int qbNo = Integer.parseInt(request.getParameter("qbNo"));
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
			QuestionBoard qb = dao.selectByQbNo(conn, qbNo);
			request.setAttribute("qb", qb);
			
			return "/WEB-INF/view/question_board/qbDetailForm.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
