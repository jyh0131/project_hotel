package com.khrd.handler.picture;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.PictureDAO;
import com.khrd.dao.RoomCategoryDAO;
import com.khrd.dto.Picture;
import com.khrd.dto.RoomCategory;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class PictureListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 처음 뿌려지는 전체 리스트
		if(request.getMethod().equalsIgnoreCase("get")) { 
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				
				// 전체 리스트 table
				PictureDAO dao = PictureDAO.getInstance();
				List<Picture> getList = dao.selectList(conn);
				request.setAttribute("getList", getList); 
				        
				// 객실분류 select부분
				RoomCategoryDAO rcDao = RoomCategoryDAO.getInstance();
				List<RoomCategory> rc = rcDao.selectList(conn);
				request.setAttribute("rc", rc); //
				
				return "/WEB-INF/view/picture/pictureList.jsp"; 
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn);
			}
			return null;     
		}
		
		// 선택한 객실 분류별로 나오는 리스트
		else if(request.getMethod().equalsIgnoreCase("post")) { 
			int rcNo = Integer.parseInt(request.getParameter("rcNo"));
			
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				PictureDAO dao = PictureDAO.getInstance();
				List<Picture> list;
				
				switch(rcNo) {
				case 0:
					list = dao.selectList(conn);
					break;
				default:
					list = dao.selectedByRcNoList(conn, rcNo);
					break;
				}

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("postList", list);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				
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
