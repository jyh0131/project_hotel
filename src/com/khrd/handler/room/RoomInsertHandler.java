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

public class RoomInsertHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/room/roomInsertForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			int rcNo = Integer.parseInt(request.getParameter("rc_no")); // 객실분류 : 스탠다드...
			int vtNo = Integer.parseInt(request.getParameter("vt_no")); // 산 바다 정원
			int btNo = Integer.parseInt(request.getParameter("bt_no")); // 더블 트윈 온돌
			int rsNo = Integer.parseInt(request.getParameter("rs_no")); // 40 46 ...
			int roomNo = Integer.parseInt(request.getParameter("room_no")); // 호수 : 301 302...
			int roomPrice = Integer.parseInt(request.getParameter("room_price")); // 룸 가격
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomDAO dao = RoomDAO.getInstance();
				
				Room result = dao.selectedByRoomNo(conn, roomNo);
				
				if(result == null) { // 중복되는 호수 없음
					Room room = new Room(roomNo, 
							 roomPrice, 
							 new RoomCategory(rcNo, null, null),
							 new ViewType(vtNo, null),
							 new BedType(btNo, null),
							 new RoomSize(rsNo, 0));
		
					dao.insert(conn, room);
					
					/*request.setAttribute("room", room);*/
					
					response.sendRedirect(request.getContextPath() + "/room/list.do");
				}else {// 중복되는 호수가 있을 경우
					request.setAttribute("error", true);
					
					return "/WEB-INF/view/room/roomInsertForm.jsp";
				}
				
//				Room room = new Room(roomNo, 
//									 roomPrice, 
//									 new RoomCategory(rcNo, null, null),
//									 new ViewType(vtNo, null),
//									 new BedType(btNo, null),
//									 new RoomSize(rsNo, 0));
//				
//				dao.insert(conn, room);
//				
//				request.setAttribute("room", room);
				
				
				
				
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

