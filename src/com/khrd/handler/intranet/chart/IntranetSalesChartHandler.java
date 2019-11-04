package com.khrd.handler.intranet.chart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class IntranetSalesChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//매출관ㄹ리로 고고싱로 고고싱
		
		return "/WEB-INF/view/intranet/intranetSalesMng.jsp";
		
	}//process

}//IntranetSalesChartHandler
