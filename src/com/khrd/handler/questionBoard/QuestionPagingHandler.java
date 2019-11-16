package com.khrd.handler.questionBoard;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dto.QuestionBoard;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionPagingHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
			List<QuestionBoard> list = new ArrayList<QuestionBoard>();
			List<QuestionBoard> reqList = (ArrayList<QuestionBoard>)request.getAttribute("list");
			
			int pageNum = 1; // 페이지 번호
			if(request.getParameter("boardPage") != null) {
				pageNum = Integer.parseInt(request.getParameter("boardPage"));
			}
			
			int size = 15;
			int tot;
			int cnt = dao.qbNoTotalCount(conn);
			tot = cnt/size;
			if(cnt % size != 0) {
				tot++;
			}
			
			int start = (pageNum -1) * size;
			int end = pageNum * size -1;
			if(reqList == null) {
				list = dao.selectByQbNoList(conn, start, end);
			}else {
				list = reqList;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
