package com.qs.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qs.javabean.User;
import com.qs.service.UserService;
import com.qs.service.impl.UserServiceImpl;




public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String username = request.getParameter("username");
		
		//调用业务层
		UserService service =new UserServiceImpl();
		User user=service.findByUsername(username);
		//判断
		response.setContentType("text/html;charset=UTF-8");
		if (user==null) {
			//可以使用
			if("".equals(username)){
				response.getWriter().println(3);
			}else{
				response.getWriter().println(1);
			}
			
		}else {
			//用户已存在
			response.getWriter().println(2);
		}
		
		
		
	}

}