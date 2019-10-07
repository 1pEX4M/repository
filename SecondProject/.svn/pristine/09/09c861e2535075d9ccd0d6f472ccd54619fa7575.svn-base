package com.qs.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.qs.dao.AlipayDao;
import com.qs.utils.C3P0Utils;

public class AlipayDaoImpl implements AlipayDao {

	@Override
	public void pay(String oid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update orders set state = 2 where oid =?";
		try {
			query.update(sql,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
