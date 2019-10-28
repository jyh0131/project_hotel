package com.khrd.handler.rsv;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dao.RoomDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Member;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvStep1Handler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/rsv/rsvStep1.jsp"; //예약1단계(기본정보)
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RsvDAO dao = RsvDAO.getInstance();
				
				HttpSession session = request.getSession();
				String mId = (String) session.getAttribute("Auth");
				
				//Member 객체 생성
				MemberDAO mDao = MemberDAO.getInstance();
				Member m = mDao.selectById(conn, mId);
				
				//Room 객체 생성
				RoomDAO rDao = RoomDAO.getInstance();
				int rNo = Integer.parseInt(request.getParameter("roomNum"));
				Room r = rDao.selectedByRoomNo(conn, rNo);
				
				//ckIn ckOut 날짜 받기
				String date = request.getParameter("rsvDate");
				
				String[] dateArr = date.split("/");
				String inDate = dateArr[2] + "-" + dateArr[0] + "-" + dateArr[1];
				String outDate = dateArr[5] + "-" + dateArr[3] + "-" + dateArr[4];
				
				//총 가격 -> room 가격 받고 date 차 구한 다음에 곱해서 넣기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date inD = sdf.parse(inDate);
				Date outD = sdf.parse(outDate);
				
				long diff = outD.getTime() - inD.getTime();
			    int stay = (int) (diff / (24 * 60 * 60 * 1000));
			    
				int totalPrice = r.getRoomPrice() * stay;
				
				//인원수
				int adtNum =  Integer.parseInt(request.getParameter("adtNum"));
				int chdNUm = Integer.parseInt(request.getParameter("chdNum"));
				
				Reservation rsv = new Reservation(0, 
												  m, 
												  r, 
												  inD, 
												  outD, 
												  stay,
												  totalPrice, 
												  "", 
												  adtNum,
												  chdNUm,
												  new Date(), 
												  4);
				
				request.setAttribute("adtNum", adtNum);
				request.setAttribute("chdNUm", chdNUm);
				request.setAttribute("stay", stay);
				request.setAttribute("rsv", rsv); //지금까지 예약정보 저장해서 다음 페이지에 뿌림
				
				return "/WEB-INF/view/rsv/rsvStep2.jsp"; 
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		}
		
		return null;
		
	}//process

}//RsvInsertHandler
