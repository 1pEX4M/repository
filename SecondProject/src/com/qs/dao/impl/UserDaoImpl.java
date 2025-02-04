package com.qs.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qs.dao.UserDao;
import com.qs.javabean.User;
import com.qs.utils.C3P0Utils;


public class UserDaoImpl implements UserDao {
	@Override
	public User query(User user) {
		//调用dbutils工具
		QueryRunner query=new QueryRunner(C3P0Utils.getDataSource());
		//sql
		String sql="select * from user where username=? ";
		//执行sql
		User existUser=null;
		try {
			 existUser =  (User) query.query(sql, new BeanHandler<>(User.class), user.getUsername());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return existUser;
	}

	@Override
	public void save(User user) {
		//调用工具类
		QueryRunner query= new QueryRunner(C3P0Utils.getDataSource());
		//sql
		String sql="insert into user values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params={
				user.getUid(),user.getUsername(),user.getPassword(),user.getEmail(),
				user.getTelephone(),user.getStates(),user.getCode(),user.getType(),
				user.getNickname(),user.getMoney(),
		};
		try {
			query.update(sql, params);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
    //账号激活
	@Override
	public void activeAccount(String code) {
		//调用dbutils工具类
		QueryRunner query= new QueryRunner(C3P0Utils.getDataSource());
		//sql
		String sql="update user set states=1,code=null where code=?";
		try {
			query.update(sql, code);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public String query1(String username) {
		//调用dbutols工具类
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		//sql
		String sql="select username from user where username=?";
		//执行
		String existUserName=null;
		try {
			 existUserName = (String) query.query(sql, new ScalarHandler(),username);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		return existUserName;
	}

	@Override
	public User getUserByLogin(User user) {
		//调用dbutils工具类
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		//sql
		String sql="select * from user where username=? and password=? and states=1";
		//执行sql
		User existUser = null;
		try {
			existUser = query.query(sql, new BeanHandler<>(User.class), user.getUsername(),user.getPassword());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return existUser;
	}

	@Override
	public User findByUsername(String username) {
		//创建链接
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		//sql
		String sql ="select username from user where username=?";
		User user=null;
		try {
			 user = query.query(sql, new BeanHandler<>(User.class),username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
