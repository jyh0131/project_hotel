package com.khrd.handler.intranet.chart;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ChartDAO;
import com.khrd.dao.ViewDAO;
import com.khrd.jdbc.ConnectionProvider;
import com.khrd.jdbc.JDBCUtil;

public class IntranetRequestChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("get")) {
			//문의관리로 고고싱로 고고싱
			
			return "/WEB-INF/view/intranet/intranetRequestMng.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			Connection conn = null;
			
			try {
				conn = ConnectionProvider.getConnection();
				ViewDAO view = ViewDAO.getInstance();
				view.createViewAllTable(conn);
				
				ChartDAO dao = ChartDAO.getInstance();
				int[] cntArr = dao.selectCountRequestCategory(conn);

				//send json
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", cntArr);
				
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

}//IntranetRequestChartHandler
