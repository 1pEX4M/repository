package com.qs.service.impl;

import java.util.List;

import com.qs.dao.CategoryDao;
import com.qs.dao.ProductDao;
import com.qs.dao.impl.CategoryDaoImpl;
import com.qs.dao.impl.ProductDaoImpl;
import com.qs.javabean.Category;
import com.qs.javabean.Condition;
import com.qs.javabean.PageBean;
import com.qs.javabean.Product;
import com.qs.service.ProductService;

public class ProductServiceImpl implements ProductService {

	@Override
	public List<Product> getAllProduct() {

		ProductDao dao = new ProductDaoImpl();
		return dao.getAllProduct();
	}

	@Override
	public List<Category> getAllCategory() {
		CategoryDao dao = new CategoryDaoImpl();
		return dao.getAllCategory();
	}

	@Override
	public Product getProductByPid(String pid) {
		CategoryDao dao = new CategoryDaoImpl();
		return dao.getProductByPid(pid);
	}

	@Override
	public PageBean getProductListByCondition(Condition c, Integer currentPage, Integer pageSize) {
		ProductDao dao = new ProductDaoImpl();
		if(currentPage<1){
			currentPage=1;			
		}
		
		Integer totalCount = dao.getCount(c);
		Integer totalPage = totalCount % pageSize ==0 ? totalCount / pageSize:totalCount / pageSize+1;
		if(currentPage > totalPage&&totalPage>0){
			currentPage=totalPage;
		}
		//计算分页的起始位置
		int  begin = (currentPage - 1) * pageSize;
		
		// 封装成PageBean对象
		PageBean pageBean =new PageBean();
		 pageBean.setList(dao.getProductListByCondition(c,begin, pageSize)) ;		 
		 pageBean.setCurrentPage(currentPage);
		 pageBean.setPageSize(pageSize);
		 pageBean.setTotalPage(totalPage);
		 pageBean.setTotalCount(totalCount);		
		return pageBean;
	}
	
}
