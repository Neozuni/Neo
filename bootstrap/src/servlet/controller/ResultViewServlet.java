package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import context.model.MemberVO;

public class ResultViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		MemberVO vo = (MemberVO)request.getAttribute("vo");
		
		out.println("<h2>다음 정보는 해당하는 id에 대한 결과입니다..</h2><p>");
		out.println("id : "+vo.getId()+"<br>");
		out.println("id : "+vo.getName()+"<br>");
		out.println("id : "+vo.getAddress()+"<br>");
		
		out.close();
	}

}













