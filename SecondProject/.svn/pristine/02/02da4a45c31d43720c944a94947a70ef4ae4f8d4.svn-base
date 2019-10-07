package com.qs.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.qs.dao.AlterDao;
import com.qs.utils.C3P0Utils;

public class AlterDaoImpl implements AlterDao {

	@Override
	public void getAlterService(int cid, String cname) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update category  set cname=? where cid= ?";
		try {
			query.update(sql,cname,cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
