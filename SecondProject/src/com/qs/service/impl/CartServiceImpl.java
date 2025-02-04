package com.qs.service.impl;

import java.util.List;

import com.qs.dao.CartDao;
import com.qs.dao.impl.CartDaoImpl;
import com.qs.javabean.ShippingAddress;
import com.qs.service.CartService;

public class CartServiceImpl implements CartService {

	@Override
	public void saveAddress(String username, String address, String phone, String telephone,String uid) {
		CartDao dao = new CartDaoImpl();
		dao.saveAddress(username, address, phone, telephone,uid);
	}

	@Override
	public List<ShippingAddress> getAddress() {
		CartDao dao = new CartDaoImpl();
		return dao.getAddress();
	}

	@Override
	public void saveProduct(String uid, String pid, int count) {
		CartDao dao = new CartDaoImpl();
		dao.saveProduct(uid,pid,count) ;
	}

}
