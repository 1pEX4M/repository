package com.qs.service.impl;

import java.util.List;

import com.qs.dao.ClassifyDao;
import com.qs.dao.impl.ClassifyDaoImpl;
import com.qs.javabean.Category;
import com.qs.service.ClassifyBackProductService;

public class ClassifyBackProductServiceImpl implements ClassifyBackProductService {

	@Override
	public List<Category> getClassifyService() {
		ClassifyDao dao = new ClassifyDaoImpl();
		return dao.getClassifyService();
	}

}
