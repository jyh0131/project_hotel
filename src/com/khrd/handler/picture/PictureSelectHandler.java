package com.khrd.handler.picture;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.PictureDAO;
import com.khrd.dto.Picture;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class PictureSelectHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rcNo = Integer.parseInt(request.getParameter("rcNo"));
		System.out.println(rcNo);
		Connection conn = null;
		
		try {
			conn =  ConnectionProvider.getConnection();
			PictureDAO dao = PictureDAO.getInstance();
			
			Picture picture = dao.selectedByContent(conn, rcNo);
			request.setAttribute("picture", picture);
			
			return "/WEB-INF/view/room/roomMain.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}  
		return null;
	}
}
