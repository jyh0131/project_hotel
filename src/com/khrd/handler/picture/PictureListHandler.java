package com.khrd.handler.picture;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.PictureDAO;
import com.khrd.dto.Picture;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class PictureListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			PictureDAO dao = PictureDAO.getInstance();
			List<Picture> list = dao.selectList(conn);
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/picture/pictureList.jsp"; 
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		
		return null;     
	}

}
