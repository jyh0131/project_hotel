package com.khrd.handler.intranet.rsv;

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
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetRsvListByDateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//관리자 페이지에서 날짜별 예약조회.........
		Connection conn = null;
		String inDate = request.getParameter("inDate");
		String outDate = request.getParameter("outDate");
		
		try {
			conn = ConnectionProvider.getConnection();
			ViewDAO view = ViewDAO.getInstance();
			view.createViewAllTable(conn);
			
			RsvDAO dao = RsvDAO.getInstance();
			List<Reservation> list = dao.selectReservedListByDate(conn, inDate, outDate);
			
			request.setAttribute("list", list);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			JDBCUtil.close(conn);
		}
		
		return null;
		
	}//process

}//IntranetRsvListByDate
