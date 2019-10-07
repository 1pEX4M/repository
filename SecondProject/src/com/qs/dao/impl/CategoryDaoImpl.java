package com.qs.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.qs.dao.CategoryDao;
import com.qs.javabean.Category;
import com.qs.javabean.Product;
import com.qs.utils.C3P0Utils;


public class CategoryDaoImpl implements CategoryDao {

	/**
	 * @author 张玉环
	 *得到所有商品分类信息
	 */
	@Override
	public List<Category> getAllCategory() {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from category";
		List<Category> list;
		try {
			list = query.query(sql, new BeanListHandler<>(Category.class));
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		return list;
	}
	/**
	 * @author 张玉环
	 *根据pid 查询商品
	 */
	@Override
	public Product getProductByPid(String pid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where pid = ?";
		Product product;
		try {
			product = query.query(sql, new BeanHandler<>(Product.class),pid);
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new RuntimeException();
		}
		return product;
	}

}
