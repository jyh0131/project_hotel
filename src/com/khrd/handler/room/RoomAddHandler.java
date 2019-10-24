package com.khrd.handler.room;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.RoomDAO;
import com.khrd.dto.BedType;
import com.khrd.dto.Room;
import com.khrd.dto.RoomCategory;
import com.khrd.dto.RoomSize;
import com.khrd.dto.ViewType;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class RoomAddHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/room/roomAddForm.jsp";
		}else if(request.getMethod().equalsIgnoreCase("post")) {
			
			int rcNo = Integer.parseInt(request.getParameter("rc_no")); // 객실분류 : 스탠다드...
			int vtNo = Integer.parseInt(request.getParameter("vt_no")); // 산 바다 정원
			int btNo = Integer.parseInt(request.getParameter("bed_no")); // 더블 트윈 온돌
			int rsNo = Integer.parseInt(request.getParameter("rs_no")); // 40 46 ...
			int roomNo = Integer.parseInt(request.getParameter("room_no")); // 호수 : 301 302...
			int roomPrice = Integer.parseInt(request.getParameter("room_price")); // 룸 가격
			
			// upload폴더 만들기
//			String uploadPath = request.getRealPath("upload");
//			File dir = new File(uploadPath);
//			if(dir.exists() == false) {
//				dir.mkdir();
//			}
//			
//			int size = 1024 * 1024 * 10; // 파일 사이즈 제한 // 10메가
//			MultipartRequest multi = new MultipartRequest(request,
//														  uploadPath,
//														  size,
//														  "utf-8",
//														  new DefaultFileRenamePolicy());
//			int rcNo = Integer.getInteger(multi.getParameter("rc_no")); // 객실분류 : 스탠다드...
//			int vtNo = Integer.getInteger(multi.getParameter("vt_no")); // 산 바다 정원
//			int btNo = Integer.getInteger(multi.getParameter("bed_no")); // 더블 트윈 온돌
//			int rsNo = Integer.getInteger(multi.getParameter("rs_no")); // 40 46 ...
//			int roomNo = Integer.getInteger(multi.getParameter("room_no")); // 호수 : 301 302...
//			int roomPrice = Integer.getInteger(multi.getParameter("room_price")); // 룸 가격
			
//			String file = multi.getFilesystemName("file"); // 파일
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				RoomDAO dao = RoomDAO.getInstance();
				
//				RoomCategory rc = new RoomCategory();
//				rc.setRcNo(rcNo);
//				ViewType vt = new ViewType();
//				vt.setVtNo(vtNo);
//				BedType bt = new BedType();
//				bt.setBtNo(btNo);
//				RoomSize rSize = new RoomSize();
//				rSize.setRsNo(rsNo);
//				
//				Room room = new Room(roomNo, roomPrice, rc, vt, bt, rSize);
				
				Room room = new Room(roomNo, 
									 roomPrice, 
									 new RoomCategory(rcNo, null),
									 new ViewType(vtNo, null),
									 new BedType(btNo, null),
									 new RoomSize(rsNo, 0));
				
				dao.insert(conn, room);
				
				request.setAttribute("room", room);
				response.sendRedirect(request.getContextPath() + "/room/list.do");
//				response.sendRedirect("index.jsp");
				return null;
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
		}
		return null;
	}

}

