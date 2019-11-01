package com.khrd.handler.questionBoard;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Member;
import com.khrd.dto.QuestionBoard;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class QuestionInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/question_board/qbInsertForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			String qbCategory = request.getParameter("qb_category"); // 문의분류
			String qbTitle = request.getParameter("qb_title"); // 제목
			String qbName = request.getParameter("qb_name"); // 성명
			String qbEmail = request.getParameter("qb_email"); // 이메일
			String qbPhone = request.getParameter("qb_phone"); // 휴대전화
			String qbTel = request.getParameter("qb_tel"); // 자택전화
			int rsvNo = Integer.parseInt(request.getParameter("qb_rNo")); // 예약번호
			String qcContent = request.getParameter("qc_content"); // 내용
			String qbPath = request.getParameter("qb_file"); // 첨부파일
			
			System.out.println(qbCategory);
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
				RsvDAO rDao = RsvDAO.getInstance();
				MemberDAO mDao = MemberDAO.getInstance();
				
				HttpSession session = request.getSession();
				String id = (String)session.getAttribute("Auth");
				
				Reservation rNo = rDao.selectRsvByRNo(conn, rsvNo);
				Member writer_id = mDao.selectById(conn, id);
				
				QuestionBoard qb = new QuestionBoard(0, 
													 qbTitle, 
													 qbName, 
													 qbEmail, 
													 qbCategory, 
													 qbPhone, 
													 qbTel, 
													 null, 
													 qbPath, 
													 rNo, 
													 writer_id, 
													 qcContent);
				dao.insertArticle(conn, qb);
				dao.insertContent(conn, qcContent);
				
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/qb/list.do");
				return null;
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
