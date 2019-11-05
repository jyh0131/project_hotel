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
		if (request.getMethod().equalsIgnoreCase("get")) { // detail.form에서 ajax를 거쳐 여기로 옴. 수정버튼 눌렀을 때 원래 데이터 값이 들어가 있게 하려고 하는 것
			int qrNo = Integer.parseInt(request.getParameter("qrNo"));
			int qbNo = Integer.parseInt(request.getParameter("qbNo"));
			String qrContent = request.getParameter("qrContent");
			Connection conn = null;

			try {
				conn = ConnectionProvider.getConnection();
				QuestionReplyDAO dao = QuestionReplyDAO.getInstance();
				QuestionBoard qb = new QuestionBoard(qbNo, null, null, null, 0, null, null, null, null, null, null);
				QuestionReply qr = new QuestionReply(qrNo, qrContent, null, qb);

				QuestionReply qrResult = dao.selectByQrNo(conn, qrNo);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("qrResult", qrResult);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);

				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			
		}else if (request.getMethod().equalsIgnoreCase("post")) { // form action="update.do"에서 submit하면 여기로 옴
			int qrNo = Integer.parseInt(request.getParameter("qrNo_hidden")); // form action="update.do"에서 넘어온 값
			int qbNo = Integer.parseInt(request.getParameter("qbNo_hidden"));
			String newContent = request.getParameter("newContent");
			Connection conn = null;

			try {
				conn = ConnectionProvider.getConnection();
				QuestionReplyDAO dao = QuestionReplyDAO.getInstance();
				QuestionBoard qb = new QuestionBoard(qbNo, null, null, null, 0, null, null, null, null, null, null);
				QuestionReply qr = new QuestionReply(qrNo, newContent, null, qb);

				dao.update(conn, qr);
				
				response.sendRedirect(request.getContextPath() + "/qr/detail.do?qbNo=" + qbNo); // update한 내용을 detail에 뿌림
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}                
		return null;
	}
}
