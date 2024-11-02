package examples;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/12_1")
public class exam12_1 implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화 ...");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException 
	{
		
		System.out.println("filter01.jsp 수행...");
		String name = request.getParameter("name");
		
		if(name == null || name.equals(""))
		{
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset = UTF-8");
			PrintWriter writer = response.getWriter();
			String message = "입력된 name 값은 null입니다.";
			writer.println(message);
			return;
		}
			filterChain.doFilter(request, response);
	}
			
	

	@Override
	public void destroy() {
		System.out.println("Filter01 해제...");
	}

	
}
