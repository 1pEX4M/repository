package com.qs.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.qs.dao.GainDao;
import com.qs.javabean.Category;
import com.qs.utils.C3P0Utils;

public class GainDaoImpl implements GainDao {

	@Override
	public Category getGainService(int cid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "select * from category where cid=? ";
        Category list = null;
		try {
			list = query.query(sql, new BeanHandler<>(Category.class),cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
