package board.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerAction extends HttpServlet {
	private static final long serialVersionUID = 1L; // 명령어와 명령어 처리 클래스를 쌍으로 저장
	private Map<String, Object> commandMap = new HashMap<String, Object>();
/*	
 * 명령어와 처리클래스가 매핑되어있는 properties 파일을 읽어서
 * Map 객체인 commandMap에 저장 
 * 명령어와 처리 클래스가 매핑되어있는 properties 파일은 
 * Command.properties파일
 */	

	@SuppressWarnings("unchecked")
	public void init(ServletConfig config) throws ServletException {	//web.xml에서 propertyconfig 에 해당하는 ini-param의 값을 읽어옴
		String props = config.getInitParameter("propertyConfig"); 		//명령어와 처리클래스의 매핑정보를 저장할 properties 객체 생성
		Properties pr = new Properties();
		FileInputStream f = null;
		String path = config.getServletContext().getRealPath("/web-inf");
		try {			//Command.properties 파일의 내용을 읽어옴
			f = new FileInputStream(new File(path, props));			//Command.properties 파일의 정보를 properties 객체에 저장
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if(f!=null) try { f.close(); } catch(IOException ex) {}	
		}
		Iterator<Object> keyIter = pr.keySet().iterator();		//Iterator 객체는 Eunmeration 객체를 확장시킨 개념의 객체
		while (keyIter.hasNext()) {//객체를 하나씩 꺼내서 그 객체명으로 Properties 객체에 저장된 객체에 접근
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			try { // 해당 문자열을 클래스로 만든다 .
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance(); // 해당클래스의 객체를 생성
				commandMap.put(command, commandInstance);// Map 객체인 commandMap 에 객체 저장
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
			
	}
	
	

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get방식의 서비스 메소드
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	//사용자의 요청을 분석해서 해당 작업을 처리
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String view = null;
		CommandAction com = null;
		try {
			String command = request.getRequestURI();
			if(command.indexOf(request.getContextPath())==0) {
				command = command.substring(request.getContextPath().length());
			}
			com=(CommandAction)commandMap.get(command);
			view=com.requestPro(request,response);
			
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
