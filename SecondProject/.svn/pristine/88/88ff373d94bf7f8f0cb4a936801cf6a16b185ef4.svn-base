package com.qs.web.servlet;

import java.io.IOException;
/**
 * @author 张玉环
 *
 */

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qs.javabean.News;
import com.qs.service.AlipayService;
import com.qs.service.NewsService;
import com.qs.service.impl.AlipayServiceImpl;
import com.qs.service.impl.NewsServiceImpl;
import com.qs.utils.BaseServlet;
import com.qs.utils.PageBean;

public class AlipayServlet extends BaseServlet {

	public String pay(HttpServletRequest request, HttpServletResponse response){
		String oid =request.getParameter("oid");
		AlipayService service = new AlipayServiceImpl();
		service.pay(oid);
		String money = request.getParameter("money");
		String pname = request.getParameter("pname");
		request.setAttribute("oid",oid);
		request.setAttribute("money",money);
		
		return "/alipay/index.jsp";
	}
	
}


