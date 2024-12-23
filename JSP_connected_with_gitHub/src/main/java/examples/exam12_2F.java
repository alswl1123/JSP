package examples;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class exam12_2F implements Filter{
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화...");
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		System.out.println("Filter02 수행...");
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String message;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(id.equals(param1) && pw.equals(param2))
			message = "로그인 성공했습니다.";
		else
			message = "로그인 실패했습니다.";
		
		writer.println(message);
		
		filterChain.doFilter(request, response);
	}


	@Override
	public void destroy() {
		System.out.println("Filter02 해제...");
	}
}
