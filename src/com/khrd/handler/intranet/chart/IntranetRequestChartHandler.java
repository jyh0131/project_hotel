package com.khrd.handler.intranet.chart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;

public class IntranetRequestChartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//문의관리로 고고싱로 고고싱
		
		return "/WEB-INF/view/intranet/intranetRequestMng.jsp";
	}//process

}//IntranetRequestChartHandler
