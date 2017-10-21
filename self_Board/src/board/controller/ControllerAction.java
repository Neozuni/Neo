package board.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import board.action.CommandAction;

// #00001 : ContorllerAction.java 생성 (누락되어있었음)

public class ControllerAction extends HttpServlet {
	private static final long serialVerstionUID = 1L;
	//명령어와 명령어 처리 클래스를 쌍으로 저장
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	//명령어와 처리클래스가 매핑되어 있는 properties 파일을 읽어서
	//map 객체인 commandMap 에 저장 
	//명령어와 처리클래스가 매핑 되어있는 properties 파일은
	//command.properties 파일
	
	@SuppressWarnings("unchecked")
	public void  init(ServletConfig config) throws ServletException {
		//web.xml 에서 propertyconfig 에 해당하는 init-param 의 값을 읽어옴
		String props = config.getInitParameter("propertyConfig");
		//명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
		
		Properties pr = new Properties();
		FileInputStream f= null;
		String path = config.getServletContext().getRealPath("/web-inf");
		
		try {
			//Command.properties 파일의 내용을 읽어옴
			f = new FileInputStream(new File(path,props));
			//Command.properties 파일의 정보를 Properties 객체에 저장
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);

		} finally {
			if(f!=null) try {f.close();} catch(IOException ex) {}
		}
		//Iterator 객체는 Enumeration 객체를 확장시킨 개념의 객체
		Iterator<Object> keyIter = pr.keySet().iterator();
		//객체를 하나씩 꺼내서 그 객체명으로 Properties 객체에 저장된 객체에 접근
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				//Map 객체인 commandMap에 객체 저장
				commandMap.put(command, commandInstance);
				
			} catch (ClassNotFoundException e) { throw new ServletException();
			} catch (InstantiationException e) { throw new ServletException();
			} catch (IllegalAccessException e) { throw new ServletException();
			
				}
			}//while
		}//init

	//get방식의 서비스 메소드
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		requestPro(request,response);	
	}
	
	//post방식의 서비스 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		requestPro(request,response);
	}

	//사용자의 요청을 분석해서 해당 작업을 처리
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null ;
		CommandAction com = null;
		
		try {
			String command = request.getRequestURI();
			if (command.indexOf(request.getContextPath())==0){
				command = command.substring(request.getContextPath().length());
			}
			com=(CommandAction)commandMap.get(command);
			view = com.requestPro(request,response);
			
		} catch (Throwable e) {
			throw new ServletException();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
	
	
}//class

		
	

