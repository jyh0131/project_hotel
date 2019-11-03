package com.khrd.handler.intranet.sales;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khrd.controller.CommandHandler;
import com.khrd.jdbc.ConnectionProvider;

public class IntranetSalesMonthHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		
		if(request.getMethod().equalsIgnoreCase("get")) {
			conn = ConnectionProvider.getConnection();
			String state = request.getParameter("state");
			
			switch(state) {
			case "2019":
				
				break;
			case "2019-1":
				break;
			case "2019-2":
				break;
			case "2019-3":
				break;
			case "2019-4":
				break;
			}
		
		
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			
		}
		
		return null;
	}//process

}//IntranetSalesMonthHandler
