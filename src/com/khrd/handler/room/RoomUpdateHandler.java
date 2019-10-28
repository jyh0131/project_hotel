package com.khrd.handler.room;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomDAO;
import com.khrd.dto.BedType;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.dto.RoomSize;
import com.khrd.dto.ViewType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			int roomNo = Integer.parseInt(request.getParameter("rNo"));
			request.setAttribute("rNo", roomNo);
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomDAO dao = RoomDAO.getInstance();
				Room room = dao.selectedByRoomNo(conn, roomNo);
	
				request.setAttribute("room", room);
				
				return "/WEB-INF/view/room/roomUpdateForm.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			int rcNo = Integer.parseInt(request.getParameter("rc_no"));
			int vtNo = Integer.parseInt(request.getParameter("vt_no"));
			int btNo = Integer.parseInt(request.getParameter("bt_no"));
			int rsNo = Integer.parseInt(request.getParameter("rs_no"));
			int roomNo = Integer.parseInt(request.getParameter("room_no"));
			int roomPrice = Integer.parseInt(request.getParameter("room_price"));
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false);
				RoomDAO dao = RoomDAO.getInstance();
				Room room = new Room(roomNo, 
									 roomPrice, 
									 new RoomCategory(rcNo, null, null), 
									 new ViewType(vtNo, null),
									 new BedType(btNo, null),
									 new RoomSize(rsNo, 0));
				dao.update(conn, room);  
				conn.commit();
				
				response.sendRedirect(request.getContextPath() + "/room/list.do");
				return null;
			}catch (Exception e) {
				e.printStackTrace();
				conn.rollback();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
