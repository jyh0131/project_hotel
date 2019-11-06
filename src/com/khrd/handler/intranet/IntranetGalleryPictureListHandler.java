package com.khrd.handler.intranet;

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
import com.khrd.dto.Picture;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetGalleryPictureListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;

		if(request.getMethod().equalsIgnoreCase("get")) {
			try {
				conn = ConnectionProvider.getConnection();
				PictureDAO dao = PictureDAO.getInstance();
				List<Picture> list = dao.selectPicListForIntranet(conn); //갤러리사진 관리에 들어갈 사진 리스트
				request.setAttribute("list", list);
				
				return "/WEB-INF/view/intranet/intranetGalleryPicMng.jsp";
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			//상태에 따라 리스트 반환
			int state = Integer.parseInt(request.getParameter("state"));
			
			try {
				conn = ConnectionProvider.getConnection();
				PictureDAO dao = PictureDAO.getInstance();
				List<Picture> list;
				
				switch(state) {
				case 0: //전체
					list = dao.selectPicListForIntranet(conn);
					break;
				default: //카테고리별
					list = dao.selectPicListByGNo(conn, state);
					break;
				}
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);

				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);

				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();

				return null;
				
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
			
		}
		
		return null;

	}//process

}//IntranetGalleryPictureList
