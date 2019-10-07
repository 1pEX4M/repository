package com.qs.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.qs.dao.CartDao;
import com.qs.javabean.Cart;
import com.qs.javabean.Product;
import com.qs.javabean.ShippingAddress;
import com.qs.utils.C3P0Utils;

public class CartDaoImpl implements CartDao {

	@Override
	public Product getProductByPid(String pid) {
		return null;
	}

	@Override
	public Cart getCart(String uid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * form cart where uid = ?";
		Cart cart= null;
		try {
			cart = query.query(sql, new BeanHandler<>(Cart.class),uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cart;
	}
	
	@Override
	public void saveAddress(String username, String address, String phone, String telephone,String uid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "INSERT INTO shippingaddress VALUES(null,?,?,?,?,?)";
		Object[] params = {
				username,address,
				phone,telephone,uid
			};
		try {
			query.update(sql,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ShippingAddress> getAddress() {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from shippingaddress";
		List<ShippingAddress> list = null;
		try {
			list = query.query(sql, new BeanListHandler<>(ShippingAddress.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void saveProduct(String uid, String pid, int count) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "INSERT INTO cart VALUES(null,?,?,?)";
		Object[] params = {
				uid,pid,
				count
			};
		try {
			query.update(sql,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
