package com.khrd.handler.rsv;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.MemberDAO;
import com.khrd.dao.PayInfoDAO;
import com.khrd.dao.RoomDAO;
import com.khrd.dao.RsvDAO;
import com.khrd.dto.Member;
import com.khrd.dto.PayInfo;
import com.khrd.dto.Reservation;
import com.khrd.dto.Room;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RsvStep2Handler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/rsv/rsvStep2.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;
			
			//예약 객체 생성에 필요한 것들
			int roomNo = Integer.parseInt(request.getParameter("roomNo"));
			String ckIn = request.getParameter("ckIn");
			String ckOut = request.getParameter("ckOut");
			int stay = Integer.parseInt(request.getParameter("stay"));
			String psn = request.getParameter("psn").trim();
			int psnAdt = Integer.parseInt(psn.substring(psn.indexOf("명")-1, psn.indexOf("명")));
			int psnCdr = Integer.parseInt(psn.substring(psn.lastIndexOf("명")-1, psn.lastIndexOf("명")));
			int totalPrice = Integer.parseInt(request.getParameter("totalPrice").replace("원", "").replace(",", "").trim());
			String[] options = request.getParameterValues("room-op"); //옵션배열
			String cReq = request.getParameter("cReq"); //고객 요청
			
			//카드정보 받기
			String cardType = request.getParameter("cardType");
			String cardNum1 = request.getParameter("cardNum1");
			String cardNum2 = request.getParameter("cardNum2");
			String cardNum3 = request.getParameter("cardNum3");
			String cardNum4 = request.getParameter("cardNum4");
			String cardNum = cardNum1+cardNum2+cardNum3+cardNum4;
			String validMonth = request.getParameter("cardNumMonth");
			String validYear = request.getParameter("cardNumYear");
			
			//룸 관련 옵션들 -> 룸에서 뽑아내기
			//투숙자 정보 -> 멤버에서 뽑아내기
			
			try {
				conn = ConnectionProvider.getConnection();
				conn.setAutoCommit(false); //commit 끄기
				
				RsvDAO rDao = RsvDAO.getInstance();
				MemberDAO mDao = MemberDAO.getInstance();
				RoomDAO rmDao = RoomDAO.getInstance();
				PayInfoDAO piDao = PayInfoDAO.getInstance();
				
				//멤버객체, 룸객체, 카드인포 객체 생성
				String id = (String) request.getSession().getAttribute("Auth");
				Member m = mDao.selectById(conn, id);
				Room r = rmDao.selectListByRoomNo(conn, roomNo);
				
				//체크인, 체크아웃 날짜 변환
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date rIn = sdf.parse(ckIn);
				Date rOut = sdf.parse(ckOut);
				
				//옵션값
				String op = "";
				int opNo = 4;
				if(options != null) {
					for(String o : options) {
						op += o;
					}
					opNo = Integer.parseInt(op);
				}
				
				
				
				Reservation rsv = new Reservation(0, 
												  m, 
												  r, 
												  rIn, 
												  rOut, 
												  stay,
												  totalPrice, 
												  cReq, 
												  psnAdt, 
												  psnCdr,
												  new Date(), 
												  opNo);
				
				//다음 페이지에서 내용 뿌리려고 저장함
				request.getSession().setAttribute("rsv", rsv);
				request.getSession().setAttribute("mem", m);
				request.getSession().setAttribute("room", r);
				
				//페이인포 집어넣기~!
				int resultRsv = rDao.insert(conn, rsv);
				PayInfo pi = new PayInfo(0, cardType, cardNum, validMonth, validYear, null, null, null, rsv, m);
				int resultPi = piDao.insert(conn, pi);
				conn.commit(); 

				if(resultPi > 0 && resultRsv > 0) {
					response.sendRedirect("rsvStep3.do"); //예약 완료 페이지로.
				} else {
					return request.getContextPath()+"/index.jsp"; //에러 메세지 송출
				}
				   
				
				
			} catch (Exception e) {
				e.printStackTrace();
				conn.rollback();
				
			} finally {
				JDBCUtil.close(conn);
			}
		}
		
		return null;
		
	}//process

}//RsvAddOptionHandler
