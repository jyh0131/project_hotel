package com.khrd.handler.questionBoard;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.QuestionBoardDAO;
import com.khrd.dto.QuestionBoard;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class QuestionUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			int qbNo = Integer.parseInt(request.getParameter("qbNo"));
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
				QuestionBoard qb = dao.selectByQbNo(conn, qbNo);
				
				request.setAttribute("qb", qb);
				
				return "/WEB-INF/view/question_board/qbUpdateForm.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			// upload폴더 만들기
			String uploadPath = request.getRealPath("upload");
			File dir = new File(uploadPath);
			if(dir.exists() == false) {
				dir.mkdir();
			}
			int size = 1024 * 1024 * 10;
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8"); // 중복 파일 저장 안되게함.
			
			int qbNo = Integer.parseInt(multi.getParameter("qbNo"));
			String qbCategory = multi.getParameter("qb_category");
			String qbTitle = multi.getParameter("qb_title");
			String qcContent = multi.getParameter("qc_content");
			String qbPath = multi.getFilesystemName("qb_file");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				
				QuestionBoardDAO dao = QuestionBoardDAO.getInstance();
				QuestionBoard qb = new QuestionBoard(qbNo, qbTitle, null, null, qbCategory, null, null, null, qbPath, null, qcContent);
				dao.updateArticle(conn, qb);
				dao.updateContent(conn, qb);
				
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/qb/list.do");
				return null;
			} catch (Exception e) {
				e.printStackTrace();
				conn.rollback();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
