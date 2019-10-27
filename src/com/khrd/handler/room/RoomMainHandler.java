package com.khrd.handler.room;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomCategoryDAO;
import com.khrd.dao.RoomDAO;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomMainHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
			int rcNo = Integer.parseInt(request.getParameter("rcNo"));
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				
				RoomCategoryDAO dao = RoomCategoryDAO.getInstance();
				List<RoomCategory> list = dao.selectList(conn);
				request.setAttribute("list", list);
			
				RoomCategory roomCategory = dao.selectedByNo(conn, rcNo);
				request.setAttribute("rc", roomCategory);
				
				return "/WEB-INF/view/room/roomMain.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}  
		return null;
	}
}
