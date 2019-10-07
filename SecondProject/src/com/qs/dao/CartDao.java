package com.qs.dao;

import java.util.List;

import com.qs.javabean.Cart;
import com.qs.javabean.Product;
import com.qs.javabean.ShippingAddress;

public interface CartDao {

	Product getProductByPid(String pid);

	Cart getCart(String uid);

	void saveAddress(String username, String address, String phone, String telephone,String uid);

	List<ShippingAddress> getAddress();

	void saveProduct(String uid, String pid, int count);

}
