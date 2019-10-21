package com.khrd.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ControllerUsingURI extends HttpServlet {

	private HashMap<String, CommandHandler> commandHandlerMap = new HashMap<>();

	@Override
	public void init() throws ServletException {
		//configFile = 프로퍼티의 상대주소(/WEB-INF/commandHandler.properties)
		String configFile = getInitParameter("configFile");
		//configFile의 절대주소를 리턴
		String configFilePath = getServletContext().getRealPath(configFile);

		Properties prop = new Properties();
		

		try (FileReader fis = new FileReader(configFilePath)) {
			prop.load(fis); //prop에 담음
		} catch (Exception e) {
			throw new ServletException(e);
		}

		Iterator keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next(); // key값이 들어감 (ex./simple.do)
			String handlerClassName = prop.getProperty(command); // value값이 들어감(ex. com.khrd.handler.SimpleHandler)

			try {
				//클래스 이름을 인스턴스화 함 -> handler = new SimpleHandler();
				Class<?> handlerClass = Class.forName(handlerClassName); 
				CommandHandler handler = (CommandHandler) handlerClass.newInstance();
				//map에 담음
				commandHandlerMap.put(command, handler);

			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}// init

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}// doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}// doPost
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getRequestURI(); // localhost:8080 이후의 주소가 옴
		if(command.indexOf(request.getContextPath()) == 0) { //contextpath -> 프로젝트 이름(ex. /chapter18)
			command = command.substring(request.getContextPath().length()); //
		}
		
		CommandHandler handler = commandHandlerMap.get(command); //있는 command면 클래스를 리턴
		if(handler == null) { //없는 command로 들어오면 null이 리턴됨
			handler = new NullHandler();
		}
		
		String viewPage = null; //화면에 보일 jsp파일 
		try {
			viewPage = handler.process(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		if(viewPage != null) { //forward 처리
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
	}//process

}// ControllerUsingURI
