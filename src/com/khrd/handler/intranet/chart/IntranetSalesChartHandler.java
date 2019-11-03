package com.khrd.handler.intranet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class IntranetSalesChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return "/WEB-INF/view/intranet/intranetSalesMng.jsp";
	}

}
