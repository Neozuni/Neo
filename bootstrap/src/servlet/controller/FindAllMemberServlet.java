package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import context.model.MemberDAO;
import context.model.MemberVO;

/**
 * Servlet implementation class FindAllMemberServlet
 */
public class FindAllMemberServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		
		
		MemberDAO dao = MemberDAO.getInstance();
		
		try {
			ArrayList<MemberVO> list =dao.findAllMember();//rvo, pvo
			request.setAttribute("list", list);
			
			out.println("<h2>RequestDispatcher....Getting....</h2><p>");
			
			/*
			 * 1.RequetDispatcher를 얻어내고 |ResultViewServlet....path
			 * 2.forward()
			 */
			//RequestDispatcher rdp =request.getRequestDispatcher("ResultViewServlet");
			RequestDispatcher rdp =request.getRequestDispatcher("showAllMember.jsp");
			rdp.forward(request, response);
		
			//request.getRequestDispatcher("include.jsp").include(request, response);
			
			
			out.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}