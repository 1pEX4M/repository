package com.qs.service;

import com.qs.javabean.Cart;
import com.qs.javabean.User;



public interface UserService {

	Cart getCart(String uid);
	User query(User user);

	void save(String Path, User user);

	void activeAccount(String code);

	String query1(String username);

	User getUserByLogin(User user);

	User findByUsername(String username);


}
