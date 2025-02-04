package com.qs.utils;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String methodName=request.getParameter("method");
		if (methodName != null && !"".equals(methodName)) {
			Class<? extends BaseServlet> clazz = this.getClass();
			try {
				Method method = clazz.getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
				String path = (String) method.invoke(this, request,response);
				if (path != null && !"".equals(path)) {
					if (path.contains(request.getContextPath())) {
							System.out.println("111");
							response.sendRedirect(path);
					}else {
						System.out.println("222");
						   request.getRequestDispatcher(path).forward(request, response);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
