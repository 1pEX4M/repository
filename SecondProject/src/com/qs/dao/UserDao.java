package com.qs.dao;

import com.qs.javabean.User;

public interface UserDao {
	User query(User user);

	void save(User user);

	void activeAccount(String code);

	String query1(String username);

	User getUserByLogin(User user);

	User findByUsername(String username);
}
