package com.khrd.handler.questionBoard;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dto.QuestionBoard;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionAllListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String category = request.getParameter("selectCategory");
		String mId = request.getParameter("mId");
//		int category = Integer.parseInt(request.getParameter("selectCategory"));
//		System.out.println(category);

		Connection conn = null;
		try {  
			conn = ConnectionProvider.getConnection();
			QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
			List<QuestionBoard> list = dao.selectBoardList(conn);
			request.setAttribute("list", list);

			// 전체 리스트

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("allList", list);

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
