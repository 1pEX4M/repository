package com.qs.dao;

import java.util.List;

import com.qs.javabean.Condition;
import com.qs.javabean.Product;

public interface ProductDao {
	List<Product> getAllProduct();

	List getProductListByCondition(Condition c, int begin, Integer pageSize);

	Integer getCount(Condition c);



}
