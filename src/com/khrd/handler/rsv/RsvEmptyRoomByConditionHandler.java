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
import com.khrd.dto.Room;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvEmptyRoomByConditionHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		String date = request.getParameter("rsvDate");
		
		String[] dateArr = date.split("/");
		String inDate = dateArr[2] + "-" + dateArr[0] + "-" + dateArr[1];
		String outDate = dateArr[5] + "-" + dateArr[3] + "-" + dateArr[4];
		
		String rc = request.getParameter("roomCate");
		String bt = request.getParameter("bedType");
		String vt = request.getParameter("viewType");
		
		try {
			conn = ConnectionProvider.getConnection();
			RsvDAO dao = RsvDAO.getInstance();
			List<Room> list = dao.selectEmptyRoomByCondition(conn, inDate, outDate, rc, bt, vt);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			
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
		
		return null;
	}//process

}//RsvEmptyRoomListHandler
