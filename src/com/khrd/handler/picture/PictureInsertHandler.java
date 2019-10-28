package com.khrd.handler.picture;

import java.io.File;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.PictureDAO;
import com.khrd.dto.GType;
import com.khrd.dto.Picture;
import com.khrd.dto.RoomCategory;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PictureInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/picture/pictureInsertForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			// upload폴더 만들기
			
			String uploadPath = request.getRealPath("upload");
			File dir = new File(uploadPath);
			if(dir.exists() == false) {
				dir.mkdir();
			}
			
			int size = 1024 * 1024 * 10; // 파일 사이즈 제한(10메가)
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			
			int gNo = Integer.parseInt(multi.getParameter("g_no"));
			int rcNo = Integer.parseInt(multi.getParameter("rc_no"));
			String file = multi.getFilesystemName("pic_file");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				PictureDAO dao = PictureDAO.getInstance();
				Picture picture = new Picture(file, 
											  new GType(gNo, null, null), 
											  new RoomCategory(rcNo, null, null));
				dao.insert(conn, picture);
				
				response.sendRedirect(request.getContextPath() + "/picture/list.do");
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
