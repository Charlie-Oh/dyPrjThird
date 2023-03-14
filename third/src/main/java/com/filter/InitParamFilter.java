package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
public class InitParamFilter implements Filter {
	private FilterConfig filterConfig=null;
	
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화...");
		this.filterConfig=filterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("Filter02 수행...");
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String passwd=request.getParameter("passwd");
		
		String param1=filterConfig.getInitParameter("param1");
		String param2=filterConfig.getInitParameter("param2");
		
		String message;
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer=response.getWriter();
		
		if(id.equals(param1)&&passwd.equals(param2))
			message="로그인에 성공했습니다.";
		else
			message="로그인에 실패했습니다.";
		writer.println(message);
		
		chain.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("Filter02 해제...");
		this.filterConfig=null;
	}
}
