package com.qs.service.impl;

import javax.mail.MessagingException;

import com.qs.dao.CartDao;
import com.qs.dao.UserDao;
import com.qs.dao.impl.CartDaoImpl;
import com.qs.dao.impl.UserDaoImpl;
import com.qs.javabean.Cart;
import com.qs.javabean.User;
import com.qs.service.UserService;
import com.qs.utils.MailUtils;

public class UserServiceImpl implements UserService {

	@Override
	public Cart getCart(String uid) {
		CartDao dao = new CartDaoImpl();
		return dao.getCart(uid);
	}

	@Override
	public User query(User user) {
		UserDao dao=new UserDaoImpl();
		
		
		return dao.query(user);
	}

	@Override
	public void save(String path, User user) {
		UserDao dao=new UserDaoImpl();
		dao.save(user);
		String emailMsg="恭喜注册成功，请点击下面链接激活账号："
		+"<a href='http://192.168.10.110:8080"+path+"/userServlet?method=active&code="+user.getCode()+"'>激活链接</a>";
		//保存用户信息成功之后才能发送激活邮件
		try {
			MailUtils.sendMail(user.getEmail(), emailMsg);
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public void activeAccount(String code) {
		UserDao dao=new UserDaoImpl();
		dao.activeAccount(code);
		
	}

	@Override
	public String query1(String username) {
		UserDao dao =new UserDaoImpl();
		return dao.query1(username);
		
		
	}

	@Override
	public User getUserByLogin(User user) {
		UserDao dao = new UserDaoImpl();
		return dao.getUserByLogin(user);
	}

	@Override
	public User findByUsername(String username) {
		UserDao dao = new UserDaoImpl();
		return dao.findByUsername(username);
	}
}
