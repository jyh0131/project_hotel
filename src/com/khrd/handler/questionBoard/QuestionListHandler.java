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

public class QuestionListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 처음 전체 list
		if(request.getMethod().equalsIgnoreCase("get")) { 
			String mId = request.getParameter("id");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
				List<QuestionBoard> list = dao.selectBoardList(conn);
				request.setAttribute("list", list);

				return "/WEB-INF/view/question_board/qbList.jsp";
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			return null;
		}
		// 아이디별 리스트
		else if(request.getMethod().equalsIgnoreCase("post")) { 
			
			String mId = request.getParameter("mId");
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
				
				
				// 선택한 리스트만
				List<QuestionBoard> idList = dao.selectByMIdList(conn, mId);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("idList", idList);

				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				
				//return "/WEB-INF/view/question_board/qbList.jsp";
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
