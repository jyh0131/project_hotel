package com.khrd.handler.rsv;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

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
		if(request.getMethod().equalsIgnoreCase("get")) { /* 예약페이지 디폴트 설정 */
			//디폴트로 ckIn에 오늘 날짜, ckOut 내일 날짜 설정하기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			//new Date로 해도되는데 그레고리안 캘린더를 써보고 싶었따
			Calendar cal = new GregorianCalendar();
			//오늘날짜
			cal.add(Calendar.DATE, 0);
			Date ckInDate = cal.getTime();
			String sIn = sdf.format(ckInDate);
			String[] inArr = sIn.split("-");
			
			//내일날짜
			cal.add(Calendar.DATE, 1);
			Date ckOutDate = cal.getTime();
			String sOut = sdf.format(ckOutDate);
			String[] outArr = sOut.split("-");
			
			//방 리스트 가져오기
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomDAO dao = RoomDAO.getInstance();
				List<Room> list = dao.selectList(conn);
				
				request.setAttribute("list", list);
				request.setAttribute("ckIn", inArr);
				request.setAttribute("ckOut", outArr);
				request.setAttribute("psnAdt", "1");
				request.setAttribute("psnCdr", "0");
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn);
			}
			

			
			return "/WEB-INF/view/rsv/rsvStep1.jsp"; //예약1단계(기본정보)
			
		} else if(request.getMethod().equalsIgnoreCase("post")) { /* form에서 받은 정보 처리 */
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RsvDAO dao = RsvDAO.getInstance();
				
				HttpSession session = request.getSession();
				String mId = (String) session.getAttribute("Auth");
				
				//Member 객체 생성
				MemberDAO mDao = MemberDAO.getInstance();
				Member m = mDao.selectById(conn, mId);
				
				//방 번호
				String rc = request.getParameter("roomCate");
				String bt = request.getParameter("bedType");
				String vt = request.getParameter("viewType");
				
				RoomDAO rDao = RoomDAO.getInstance();
				List<Integer> list = dao.selectEmptyRoomByCondition(conn, rc, bt, vt);
				Room r = rDao.selectedByRoomNo(conn, list.get(0));
				
				//ckIn ckOut 날짜 받기
				String inDate = request.getParameter("ckInDate");
				String outDate = request.getParameter("ckOutDate");
				
				//String -> Date
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date inD = sdf.parse(inDate);
				Date outD = sdf.parse(outDate);
				
				
				//총 가격 -> room 가격 받고 date 차 구한 다음에 곱해서 넣기
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
												  4,
												  "예약중");
				
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
