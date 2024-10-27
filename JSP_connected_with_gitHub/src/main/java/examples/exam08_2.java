package examples;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/8_2")
public class exam08_2 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher ds = req.getRequestDispatcher("JSP_exam/validation02.jsp");
		ds.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw =request.getParameter("pw");
		
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		
		RequestDispatcher ds = request.getRequestDispatcher("JSP_exam/validation02_process.jsp");
		ds.forward(request, response);
	}

	
}
