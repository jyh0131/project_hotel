package com.khrd.handler.rsv;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RsvDAO;
import com.khrd.dao.ViewDAO;
import com.khrd.dto.Room;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvAvailableRoomListByDateHandler implements CommandHandler {
	//날짜에 따라 예약 가능한 방 카테고리 (get) & 방 카테고리 별 옵션 (post) 
	
	Connection conn = null;
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) { //예약 가능한 방 카테고리
			String inDate = request.getParameter("inDate");
			String outDate = request.getParameter("outDate");
			
			try {
				conn = ConnectionProvider.getConnection();
				//빈방 정보 view 생성
				ViewDAO view = ViewDAO.getInstance();
				view.createViewAvailableRoom(conn, inDate, outDate);
				
				//리스트 뿌리기
				RsvDAO dao = RsvDAO.getInstance();
				List<Room> list = dao.selectAvailableRoomList(conn);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("ar", list);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		} else if (request.getMethod().equalsIgnoreCase("post")) { //카테고리 별 옵션
			String rcName = request.getParameter("name");
			
			try {
				conn = ConnectionProvider.getConnection();
				RsvDAO dao = RsvDAO.getInstance();
				List<String[]> list = dao.selectOptionByRoomCategory(conn, rcName);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("options", list);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		}
		
		return null;
		
	}//process

}//RsvAvailableRoomListByDate
