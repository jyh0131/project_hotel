package com.khrd.handler.rsv;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Reservation;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvUpdateStep1Handler implements CommandHandler {
		
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			int rNo = Integer.parseInt(request.getParameter("no"));
			
			try {
				conn = ConnectionProvider.getConnection();
				RsvDAO dao = RsvDAO.getInstance();
				Reservation rsv = dao.selectRsvByRNo(conn, rNo);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String inD = sdf.format(rsv.getrIn());
				String[] inArr = inD.split("-");
				
				String outD = sdf.format(rsv.getrOut());
				String[] outArr = outD.split("-");
				
				
				request.setAttribute("doPath", "updateStep1.do");
				request.setAttribute("ckIn", inArr);
				request.setAttribute("ckOut", outArr);
				request.setAttribute("psnAdt", rsv.getrPsnAdt());
				request.setAttribute("psnCdr", rsv.getrPsnCdr());
				
				return "/WEB-INF/view/rsv/rsvStep1.jsp"; //예약1단계(수정모드)
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		} else if(request.getMethod().equalsIgnoreCase("post")){
			return null;
		}
		
		return null;
	
	}//process

}//RsvUpdateForMember
