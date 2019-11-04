package com.khrd.handler.intranet.chart;

import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.khrd.controller.CommandHandler;
import com.khrd.dao.ChartDAO;
import com.khrd.dao.ViewDAO;
import com.khrd.jdbc.ConnectionProvider;

public class IntranetSalesChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			//매출관ㄹ리로 고고싱로 고고싱
			return "/WEB-INF/view/intranet/intranetSalesMng.jsp";
			
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			//방 별 월매출 차트 json
			Connection conn = null;
			conn = ConnectionProvider.getConnection();
			ViewDAO view = ViewDAO.getInstance();
			view.createViewAllTable(conn);
			
			ChartDAO dao = ChartDAO.getInstance();
			List<int[]> list = dao.selectMonthlyRoomSales(conn);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			
			ObjectMapper om = new ObjectMapper();
			String json = om.writeValueAsString(map);
			
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			
		}
		
		return null;

	}//process

}//IntranetSalesChartHandler
