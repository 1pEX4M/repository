package com.qs.service.impl;

import java.util.List;
/**
 * @author 张玉环
 *
 */

import com.qs.dao.NewsDao;
import com.qs.dao.impl.NewsDaoImpl;
import com.qs.javabean.News;
import com.qs.service.NewsService;
import com.qs.utils.PageBean;

public class NewsServiceImpl implements NewsService {

	@Override
	public List<News> getAllNews() {
		NewsDao dao = new NewsDaoImpl();
		
		return dao.getAllNews();
	}

	@Override
	public News getNewsByNid(String nid) {
		NewsDao dao = new NewsDaoImpl();
		return dao.getNewsByNid(nid);
	}

	@Override
	public PageBean getNewsByPage(int pageSize, int currentPage) {
		if(pageSize > 10){
			pageSize = 10;
		}	
		
		if(currentPage < 1){
			currentPage = 1;
		}
//		调用dao层方法得到新闻的总条数
		NewsDao dao = new NewsDaoImpl();
		int totalCount = dao.getCount();
//		总页数
		int totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize +1 ;
		
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
//		封装数据
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		
		int begin = (currentPage -1) * pageSize;
		List<News> list = dao.getAllNewsByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

}
