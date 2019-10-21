package com.khrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {
	//형태를 정하는
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	
}//CommandHandler
