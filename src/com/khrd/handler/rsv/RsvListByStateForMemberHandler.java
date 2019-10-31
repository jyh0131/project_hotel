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
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvListByStateForMemberHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//예약확인 페이지에서 상태에 따라 조회하고 싶을때 쓰는거
		Connection conn = null;
		String state = request.getParameter("rsvState");
		
		try {
			conn = ConnectionProvider.getConnection();
			RsvDAO dao = RsvDAO.getInstance();
			
			String mId = (String) request.getSession().getAttribute("Auth");
			
			List<Reservation> list;
			
			switch(state) {
			case "전체":
				list = dao.selectRsvByMId(conn, mId);
				break;
			default:
				list = dao.selectRsvListByStateForMem(conn, mId, state);
				break;
			}
				
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

}//RsvListByStateForMember

