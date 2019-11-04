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
import com.khrd.dto.QuestionBoard;
import com.khrd.dto.QuestionReply;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionReplyUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			int qrNo = Integer.parseInt(request.getParameter("qrNo"));
			int qbNo = Integer.parseInt(request.getParameter("qbNo"));
			String qrContent = request.getParameter("qrContent");
			Connection conn = null;
System.out.println("qrNo : " + qrNo);
System.out.println("qbNo : " + qbNo);
System.out.println("qrContent : " + qrContent);
			try {
				conn = ConnectionProvider.getConnection();
				QuestionReplyDAO dao = QuestionReplyDAO.getInstance();
				QuestionBoard qb = new QuestionBoard(qbNo, null, null, null, null, null, null, null, null, null, null);
				QuestionReply qr = new QuestionReply(qrNo, qrContent, null, qb);
				System.out.println("qb : " + qb);
				System.out.println("qr : " + qr);
				int result = dao.update(conn, qr);
				request.setAttribute("result", result);
				System.out.println("result : " + result);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("result", result);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				
//				// response.sendRedirect(request.getContextPath() + "/qb/list.do");
//				response.sendRedirect(request.getContextPath() + "/qr/detail.do?qbNo=" + qbNo);
//				return null;

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}

			return null;
//			return "/WEB-INF/view/question_reply/qrDetailForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
