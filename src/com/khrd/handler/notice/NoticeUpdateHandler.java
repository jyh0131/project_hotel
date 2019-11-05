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

public class NoticeUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;

		if(request.getMethod().equalsIgnoreCase("get")) {
			int ntNo = Integer.parseInt(request.getParameter("no"));
			
			try {
				conn = ConnectionProvider.getConnection();
				NoticeDAO dao = NoticeDAO.getInstance();
				Notice nt = dao.selectNotice(conn, ntNo);
				
				request.setAttribute("nt", nt);

				return "/WEB-INF/view/notice/noticeUpdateForm.jsp";

				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}

			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			// upload폴더 만들기
			String uploadPath = request.getRealPath("upload");
			File dir = new File(uploadPath);
			if(dir.exists() == false) {
				dir.mkdir();
			}
			int size = 1024 * 1024 * 10;
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy()); // 중복 파일 저장 안되게함.
			
			int ntNo = Integer.parseInt(multi.getParameter("no"));
			String ntTitle = multi.getParameter("title");
			String ntContent = multi.getParameter("content");
			String mId = multi.getParameter("id");
			
			String oldFile = multi.getParameter("oldFile"); // 게시글에 이미 업로드 되어있는 파일
			String newFile = multi.getFilesystemName("newFile"); // 수정하기에서 '파일선택'한 파일
			
			// 수정할 때 파일은 수정하지 않은 경우
			if(newFile == null) { 
				newFile = oldFile; // 업로드 될 파일에 예전에 올린 파일 대입. 
			}
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO mDao = MemberDAO.getInstance();
				Member member = mDao.selectById(conn, mId);
				
				NoticeDAO dao = NoticeDAO.getInstance();
				Notice nt = new Notice(ntNo, 
									   ntTitle, 
									   ntContent, 
									   new Date(), 
									   null,
									   newFile, 
									   member);
				
				int result = dao.updateNotice(conn, nt);
				
				request.getSession().setAttribute("updateResult", result);
				response.sendRedirect(request.getContextPath() + "/notice/noticeResult.do");

				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		}
		
		return null;
	}//process

}//NoticeUpdateHandler
