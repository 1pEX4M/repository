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
import com.qs.service.NewsService;
import com.qs.service.impl.NewsServiceImpl;
import com.qs.utils.BaseServlet;
import com.qs.utils.PageBean;

public class NewsServlet extends BaseServlet {


	public String getNewsByNid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nid = request.getParameter("nid");
		NewsService service = new NewsServiceImpl();
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int pageSize = 8;
//		调用service层方法得到分页的新闻信息
		PageBean pageBean = service.getNewsByPage(pageSize,currentPage);
//		根据nid 得到新闻信息
		News onenews = service.getNewsByNid(nid);
		request.setAttribute("onenews", onenews);
		request.setAttribute("pageBean", pageBean);
		return "/udai_notice.jsp";
	} 

	

}
