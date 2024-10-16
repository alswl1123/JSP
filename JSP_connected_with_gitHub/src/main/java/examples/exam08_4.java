package examples;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/8_4")
public class exam08_4 extends HttpServlet
{

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      RequestDispatcher ds = req.getRequestDispatcher("JSP_exam/validation04.jsp");
      ds.forward(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      String id = request.getParameter("id");
      String passwd = request.getParameter("passwd");
      
      System.out.println(passwd);

      request.setAttribute("id", id);
      request.setAttribute("passwd", passwd);
      
      RequestDispatcher ds = request.getRequestDispatcher("JSP_exam/validation04_process.jsp");
      ds.forward(request, response);
   }
   
}
