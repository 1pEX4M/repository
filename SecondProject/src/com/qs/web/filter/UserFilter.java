package com.qs.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qs.javabean.User;


public class UserFilter implements Filter {

  
    public UserFilter() {
        
    }

	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		User existUser=(User) req.getSession().getAttribute("existUser");
		if(existUser!=null){
			chain.doFilter(req, resp);
		}else{
			req.setAttribute("goLogin", "您尚未登录，请先登录!");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
		
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
