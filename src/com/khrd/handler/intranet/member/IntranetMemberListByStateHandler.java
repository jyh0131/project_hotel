package com.khrd.handler.intranet.member;

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
import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetMemberListByStateHandler implements CommandHandler {
	//인트라넷 회원 관리에서 회원 상태에 따른 리스트 조회
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		String state = request.getParameter("memState");

		try {
			conn = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			List<Member> list = null;

			switch (state) {
			case "전체":
				list = dao.selectList(conn);
				break;
				
			case "회원만":
				list = dao.selectMemberList(conn);
				break;
				
			case "탈퇴회원만":
				list = dao.selectQuitMember(conn);
				break;
				
			case "관리자만":
				list = dao.selectAdminMemberList(conn);
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
	}

}
