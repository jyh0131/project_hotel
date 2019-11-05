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
import com.khrd.dao.MemberDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dao.ViewDAO;
import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvListByDateForMemberHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//회원 예약확인 페이지에서 날짜별 예약조회.........
		Connection conn = null;
		String inDate = request.getParameter("inDate");
		String outDate = request.getParameter("outDate");
		
		try {
			conn = ConnectionProvider.getConnection();
			ViewDAO view = ViewDAO.getInstance();
			view.createViewAllTable(conn);
			
			MemberDAO mDao = MemberDAO.getInstance();
			RsvDAO dao = RsvDAO.getInstance();
			
			String mId = (String) request.getSession().getAttribute("Auth");
			Member m = mDao.selectById(conn, mId);
			
			List<Reservation> list = dao.selectReservedListForMem(conn, inDate, outDate, m.getmNo());
			
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

}//RsvListByDateForMemberHandler
