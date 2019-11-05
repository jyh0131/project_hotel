package com.khrd.handler.notice;

import java.io.File;
import java.sql.Connection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dao.NoticeDAO;
import com.khrd.dto.Member;
import com.khrd.dto.Notice;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/notice/noticeInsertForm.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			//upload 폴더 만들기
	         String uploadPath = request.getRealPath("upload");
	         
	         File dir = new File(uploadPath);
	         if(dir.exists() == false) {
	            dir.mkdir();
	         }
	         
	         int size = 1024 * 1024 * 10;
	         MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	         String ntTitle = multi.getParameter("title");
	         String ntContent = multi.getParameter("content");
	         String ntFile = multi.getFilesystemName("file");
	         String mId = multi.getParameter("id");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO mDao = MemberDAO.getInstance();
				Member member = mDao.selectById(conn, mId);
				
				NoticeDAO dao = NoticeDAO.getInstance();
				Notice nt = new Notice(0, 
									   ntTitle, 
									   ntContent, 
									   new Date(), 
									   null,
									   ntFile, 
									   member);
				
				int result = dao.insertNotice(conn, nt);
				
				request.getSession().setAttribute("inputResult", result);
				response.sendRedirect(request.getContextPath() + "/notice/noticeResult.do");
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		}
		
		return null;
	}//process

}//NoticeInsertHandler
