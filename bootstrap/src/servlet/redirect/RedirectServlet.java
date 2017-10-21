package servlet.redirect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String choose = request.getParameter("choose");
		if(choose==null) { //선택하지 않는 경우
			response.sendRedirect("error/error.html");
		}else { //선택한 경우
			PrintWriter out = response.getWriter();
			out.println("<h3>This is Redirect Test....</h3><p>");
			out.println("<h3><b>"+choose+"</b></h3>");
		}
	}
}






