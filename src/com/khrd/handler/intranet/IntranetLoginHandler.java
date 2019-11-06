package com.khrd.handler.intranet;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetLoginHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/intranet/intranetLoginForm.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;

			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member m = dao.selectById(conn, id);
				
				if(m == null) {
					request.setAttribute("idNotExist", true);
					
					return "/WEB-INF/view/intranet/intranetLoginForm.jsp";
				} else if (!password.equals(m.getmPwd())) {
					request.setAttribute("pwdNotMatch", true);
					
					return "/WEB-INF/view/intranet/intranetLoginForm.jsp";
				} else if (m.getmIsAdmin() == 0) {
					request.setAttribute("notAdmin", true);
					
					return "/WEB-INF/view/intranet/intranetLoginForm.jsp";
				}
				
				HttpSession session = request.getSession();
				session.removeAttribute("Auth");
				session.removeAttribute("Admin");
				
				session.setAttribute("Admin", m.getmId());
				
				response.sendRedirect(request.getContextPath() + "/intranet/mng/sales.do");
				
				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
		}
		
		return null;
		
	}//process

}//IntranetLoginHandler
