package com.khrd.handler.intranet;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dto.Member;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetJoinHandler implements CommandHandler {
	//관리자 가입
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/intranet/intranetJoinForm.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				
				String mName = request.getParameter("name");
				String mBirth = request.getParameter("birth");
				String mMail = request.getParameter("mail");
				String mZipcode = request.getParameter("zip");
				String mAddr1 = request.getParameter("addr1");
				String mAddr2 = request.getParameter("addr2");
				String mId = request.getParameter("id");
				String mPwd = request.getParameter("password");
				
				//전화번호 뚝딱뚝딱 재조립
				String mPhone1 = request.getParameter("phone1");
				String mPhone2 = request.getParameter("phone2");
				String mPhone3 = request.getParameter("phone3");
				String phone = mPhone1+"-"+mPhone2+"-"+mPhone3;
				
				String mTel1 = request.getParameter("tel1");
				String mTel2 = request.getParameter("tel2");
				String mTel3 = request.getParameter("tel3");
				String tel = mTel1+"-"+mTel2+"-"+mTel3;
				
				//날짜 변환
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date birth = sdf.parse(mBirth);
				
				Member m = new Member(0, 
									  mName, 
									  birth, 
									  mMail, 
									  phone, 
									  tel, 
									  mZipcode, 
									  mAddr1, 
									  mAddr2, 
									  mId, 
									  mPwd, 
									  new Date(), 
									  null, 
									  1);
				
				int result = dao.insert(conn, m);
				
				if(result > 0) {
					response.sendRedirect(request.getContextPath() + "/intranet/login.do");
					
				} else {
					return ""; //에러페이지
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		}
		
		return null;
	}//process

}//IntranetJoinHandler
