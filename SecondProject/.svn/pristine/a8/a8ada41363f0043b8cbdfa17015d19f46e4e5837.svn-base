package com.qs.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.qs.dao.ClassifyDao;
import com.qs.javabean.Category;
import com.qs.utils.C3P0Utils;

public class ClassifyDaoImpl implements ClassifyDao {

	@Override
	public List<Category> getClassifyService() {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from  category";
		List<Category> list = null;
		try {
			list = query.query(sql,new BeanListHandler<>(Category.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
