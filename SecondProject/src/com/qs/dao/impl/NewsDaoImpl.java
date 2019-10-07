package com.qs.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qs.dao.NewsDao;
import com.qs.javabean.News;
import com.qs.utils.C3P0Utils;

/**
 * @author 张玉环
 *
 */
public class NewsDaoImpl implements NewsDao {

	private static final String News = null;
//	得到所有新闻信息
	@Override
	public List<News> getAllNews() {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from news";
		List<News> query2 = null;
		try {
			query2 = query.query(sql, new BeanListHandler<>(News.class));
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return query2;
	}
//	根据nid 得到新闻信息
	@Override
	public News getNewsByNid(String nid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from news where nid = ?";
		News news = null;
		try {
			news = query.query(sql, new BeanHandler<>(News.class),nid);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return news;
	}
//	得到新闻的总条数
	@Override
	public int getCount() {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from news";
		Number number = null;
		try {
			number = (Number) query.query(sql, new ScalarHandler());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return number.intValue();
	}
//	分页查询新闻
	@Override
	public List<News> getAllNewsByPage(int begin, int pageSize) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from news limit ? ,?";
		List<News> list = null;
		try {
			list = query.query(sql, new  BeanListHandler<>(News.class),begin,pageSize);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}

}
