package com.khrd.handler.picture;

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

public class PictureUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			String picFile = request.getParameter("picFile");
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				PictureDAO dao = PictureDAO.getInstance();
				Picture picture = dao.selectedByNo(conn, picFile);
				
				request.setAttribute("picture", picture);
				
				return "/WEB-INF/view/picture/pictureUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			String picFile = request.getParameter("pic_file");
			int gNo = Integer.parseInt(request.getParameter("g_no"));
			int rcNo = Integer.parseInt(request.getParameter("rc_no"));
			int fc = Integer.parseInt(request.getParameter("fileCategory"));
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				PictureDAO dao = PictureDAO.getInstance();
				Picture picture = new Picture(picFile,
											  new GType(gNo, null, null), 
											  new RoomCategory(rcNo, null, null),
											  fc);
				dao.update(conn, picture);
				
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
