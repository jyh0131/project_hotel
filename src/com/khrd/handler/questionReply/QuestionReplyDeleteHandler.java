package com.khrd.handler.questionReply;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionReplyDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionReplyDeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int qrNo = Integer.parseInt(request.getParameter("qrNo"));
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			QuestionReplyDAO dao = QuestionReplyDAO.getInstance();
			int result = dao.delete(conn, qrNo);
			request.setAttribute("result", result);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("result", result);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		return null;
	}

}
