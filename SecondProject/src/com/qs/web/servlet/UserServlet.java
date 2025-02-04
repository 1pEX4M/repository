package com.qs.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.qs.javabean.User;
import com.qs.service.UserService;
import com.qs.service.impl.UserServiceImpl;
import com.qs.utils.BaseServlet;
import com.qs.utils.UUIDUtils;




public class UserServlet extends BaseServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	//用户的注册功能
	public String regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		//创建对象
		User user=new User();
		//封装数据
		try {
			BeanUtils.populate(user, request.getParameterMap());
			
			//调用业务层方法根据用户名查询是否存在用户
			UserService service= new UserServiceImpl();
			User existUser=service.query(user);
			if (existUser==null ) {
				//可以注册
//				response.getWriter().write("ok");
				//封装用户的uid和code
				user.setUid(UUIDUtils.getUUID());
				user.setCode(UUIDUtils.getUUID()+UUIDUtils.getUUID());
				
				//调用业务层保存用户信息
				UserService service1=new UserServiceImpl();
				service1.save(request.getContextPath(),user);
				//发送激活邮件					
				return request.getContextPath()+"/toEmail.jsp";

			}
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
				return null;
		
		
	}
	//激活账号
	public String active(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收激活码
		String code =request.getParameter("code");
		if (code!=null && !"".equals(code)) {
			//调用业务层
			UserService service=new UserServiceImpl();
			//根据激活码，修改用户的账号状态
			service.activeAccount(code);
			//重定向
			return request.getContextPath()+"/login.jsp";
		}else {
			request.setAttribute("msg", "账号激活失败");
			return "/error.jsp";
		}
				
		
	}
	//利用ajax校验用户名是否存在
//	public String ajax (HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		//获得参数
//		String username= request.getParameter("username");
//		//调用业务层方法
//		UserService service =new UserServiceImpl();
//		String existUserName = service.query1(username);
//		
//				return existUserName;
//				//判断是否为空
//				if (existUserName != null) {
//					//不能注册
//					response.getWriter().write("on");
//				}else {
//					//可以注册
//					response.getWriter().write("ok");
//				}
//		
//	}
	//用户登陆的功能
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收参数
		User user = new User();
		//调用工具类封参数
		try {
			BeanUtils.populate(user, request.getParameterMap());
			//调用业务层方法
			UserService service = new UserServiceImpl();
			User existUser=service.getUserByLogin(user);
			if (existUser!=null && !"".equals(existUser)) {
//登陆成功，要将user放到session域中绑定
				
				//将用户存在session域中
				request.getSession().setAttribute("existUser", existUser);
				//重定向
				response.sendRedirect(request.getContextPath());
			
			}else {
				request.setAttribute("msg", "用户名或者密码错误");
				//请求转发
			request.getRequestDispatcher("/login.jsp").forward(request, response);;
//				return  "/login.jsp";
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
//				return request.getContextPath()+"/index.jsp";
		return null;
		
	}
	//用户的退出功能
	public String logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//退出的基本操作是销毁对应session对象即可
		request.getSession().invalidate();
		//退出后跳首页
		
		return request.getContextPath();
		
	}
	

	//找回密码功能
	public String findPwdpublic(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//创建对象
		User user=new User();
		//调用javabean封装对象
		try {
			BeanUtils.populate(user, request.getParameterMap());
			//调用业务层方法查找用户名是否存在
			UserService service=new UserServiceImpl();
		
		} catch (IllegalAccessException | InvocationTargetException e) {
			
			e.printStackTrace();
		}
				return null;
		
	}

}