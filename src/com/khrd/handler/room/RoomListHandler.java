package com.khrd.handler.room;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomCategoryDAO;
import com.khrd.dao.RoomDAO;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 처음 뿌려지는 전체 리스트
		if(request.getMethod().equalsIgnoreCase("get")) { 
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				
				// 전체리스트 뿌리기
				RoomDAO dao = RoomDAO.getInstance();
				List<Room> list = dao.selectList(conn);
				request.setAttribute("list", list);
				
				// 객실 분류 뽑아오기
				RoomCategoryDAO rcDao = RoomCategoryDAO.getInstance();
				List<RoomCategory> rcList = rcDao.selectList(conn);
				request.setAttribute("rcList", rcList);
				
				
				return "/WEB-INF/view/room/roomList.jsp";
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			
			return null;
		}
		// 선택한 객실 분류별로 나오는 리스트
		else if(request.getMethod().equalsIgnoreCase("post")) {
			String rcName = request.getParameter("rcName"); // ajax에서 넘어오는 부분
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				
				RoomDAO dao = RoomDAO.getInstance();
				List<Room> list;
				
				switch(rcName) {
				case "전체보기":
					list = dao.selectList(conn);
					break;
				default:
					list = dao.selectedRcNameList(conn, rcName);
					break;
				}

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("postList", list);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}
