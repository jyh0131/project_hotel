package com.khrd.handler.room;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomDAO;
import com.khrd.dto.Room;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			RoomDAO dao = RoomDAO.getInstance();
			List<Room> list = dao.selectList(conn);
			request.setAttribute("list", list);
			
			return "/WEB-INF/view/room/roomList.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn);
		}
		
		return null;
	}

}
