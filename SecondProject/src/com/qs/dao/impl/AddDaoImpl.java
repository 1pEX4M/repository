package com.qs.dao.impl;


import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.qs.dao.AddDao;
import com.qs.utils.C3P0Utils;

public class AddDaoImpl implements AddDao {

	
	public void getAddService(String cname) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into category values(null,null,?)";
		try {
			query.update(sql,cname);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
