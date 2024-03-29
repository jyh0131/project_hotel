package com.khrd.handler.questionReply;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dao.QuestionReplyDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionReplyDeleteListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int qbNo = Integer.parseInt(request.getParameter("qbNo"));

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
			QuestionReplyDAO qrDao = QuestionReplyDAO.getInstance();
			int result1 = qrDao.deleteBoardList(conn, qbNo);
			int result2 = dao.deleteContent(conn, qbNo);
			int result3 = dao.deleteArticle(conn, qbNo);

			if(result1 >= 0 && result2 > 0 && result3 > 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result1", result1);
			map.put("result2", result2);
			map.put("result3", result3);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			
			conn.commit();
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
//			response.sendRedirect(request.getContextPath() + "/qr/list.do");
//			return null;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
