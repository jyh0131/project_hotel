package com.khrd.handler.member;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class MemberSecessionHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/member/secessionForm.jsp";
			
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;

			//사용자 입력 정보
			String ipId = request.getParameter("id");
			String ipPw = request.getParameter("password");
			
			//세션 저장 정보
			String crId = (String) request.getSession().getAttribute("Auth");
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				Member mem = dao.selectById(conn, crId);
				
				if(crId.equals(ipId) == false) {
					request.setAttribute("notIdMatch", true);
					
					return "/WEB-INF/view/member/secessionForm.jsp";
					
				}else if(ipPw.equals(mem.getmPwd()) == false) {
					request.setAttribute("notPwdMatch", true);
					
					return "/WEB-INF/view/member/secessionForm.jsp";
				}
				
				int result = dao.updateMemberToSecession(conn, crId);
				request.getSession().setAttribute("result", result);
				
				//Auth키 삭제
				request.getSession().removeAttribute("Auth");
				response.sendRedirect(request.getContextPath() + "/WEB-INF/view/secessionSuccess.jsp");

				return null;
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				JDBCUtil.close(conn);
			}
		}
		
		return null;
		
	}//process

}//MemberSecessionHandler
