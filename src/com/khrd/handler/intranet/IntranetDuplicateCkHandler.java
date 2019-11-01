package com.khrd.handler.intranet;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetDuplicateCkHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		MemberDAO dao = MemberDAO.getInstance();

		if(request.getMethod().equalsIgnoreCase("get")) {
			String id = request.getParameter("id");

			try {
				conn = ConnectionProvider.getConnection();
				Member mem = dao.selectById(conn, id);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member", mem);
				
				if (mem == null) {
					map.put("result", "available");
				} else {
					map.put("result", "duplicated");
				}

				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);

				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println(json);
				out.flush();

				return null;

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				JDBCUtil.close(conn);
			}
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			String mail = request.getParameter("mail");
			
			try {
				conn = ConnectionProvider.getConnection();
				Member mem = dao.selectByEmail(conn, mail);

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("member", mem);
				
				if (mem == null) {
					map.put("result", "available");
				} else {
					map.put("result", "duplicated");
				}

				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);

				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println(json);
				out.flush();

				return null;

			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				JDBCUtil.close(conn);
			}
		}

		return null;
	}

}
