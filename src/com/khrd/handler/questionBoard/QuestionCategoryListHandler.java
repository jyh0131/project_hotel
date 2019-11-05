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

public class QuestionCategoryListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category = Integer.parseInt(request.getParameter("category"));
		Connection conn = null;

		try {  
			conn = ConnectionProvider.getConnection();
			QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
			List<QuestionBoard> list;
			
			switch (category) {
			case 0: // 전체보기
				list = dao.selectBoardList(conn);
				break;
			default: 
				list = dao.selectCategoryList(conn, category);
				break;
			}

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
