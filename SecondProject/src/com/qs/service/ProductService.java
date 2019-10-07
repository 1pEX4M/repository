package com.qs.service;

import java.util.List;

import com.qs.javabean.Category;
import com.qs.javabean.Condition;
import com.qs.javabean.PageBean;
import com.qs.javabean.Product;

public interface ProductService {

	List<Product> getAllProduct();

	List<Category> getAllCategory();
	
	Product getProductByPid(String pid);
	public PageBean getProductListByCondition(Condition c,Integer currentPage,Integer pageSize);
}
