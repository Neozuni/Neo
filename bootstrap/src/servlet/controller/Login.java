package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import context.model.MemberDAO;
import context.model.MemberVO;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDAO dao = MemberDAO.getInstance();
		
		try {
			
			
			MemberVO rvo=dao.findByIdMember(id, password);//rvo, pvo
			
			if(rvo != null){
				HttpSession session= request.getSession();
				session.setAttribute("name", rvo.getName());
				
				RequestDispatcher rdp =request.getRequestDispatcher("index.jsp");
				rdp.forward(request, response);
			}else{
				
				request.setAttribute("error", "login 실패");
				System.out.println("실패");
				RequestDispatcher rdp =request.getRequestDispatcher("login.jsp");
				rdp.forward(request, response);
				
			}

			
		}catch(SQLException e) {
			
			
			
			
		}
	}
}














