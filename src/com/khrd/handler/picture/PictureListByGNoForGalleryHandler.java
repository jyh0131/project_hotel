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
import com.khrd.dto.Picture;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class PictureListByGNoForGalleryHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/picture/gallery.jsp";
			
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;
			int gNo = Integer.parseInt(request.getParameter("gNo"));
			
			try {
				conn = ConnectionProvider.getConnection();
				PictureDAO dao = PictureDAO.getInstance();  
				List<Picture> list = dao.selectPicListByGNo(conn, gNo);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				
				ObjectMapper om = new ObjectMapper();
				String json = om.writeValueAsString(map);
				
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();			
				
			} catch (Exception e) {
				e.printStackTrace();
				
			} finally {
				JDBCUtil.close(conn);
			}
		}
		
		return null;
	
	}//process

}//PIctureListByGNoForGalleryHandler
