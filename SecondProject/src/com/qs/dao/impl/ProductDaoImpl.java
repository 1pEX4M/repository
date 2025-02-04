package com.qs.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qs.dao.ProductDao;
import com.qs.javabean.Condition;
import com.qs.javabean.Product;
import com.qs.utils.C3P0Utils;

public class ProductDaoImpl implements ProductDao {

	/**
	 * @author 张玉环
	 * 得到所有商品信息
	 *
	 */
	QueryRunner  query = new QueryRunner(C3P0Utils.getDataSource());
	
	@Override
	public List<Product> getAllProduct() {
		String sql = "select * from product order by  popularity desc";
		List<Product> list;
		try {
			list = query.query(sql, new BeanListHandler<>(Product.class));
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new RuntimeException();
		}
		return list;
	}

	@Override
	public List getProductListByCondition(Condition c, int begin, Integer pageSize) {
		QueryRunner query =new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product p , category c where p.cid = c.cid  ";
		ArrayList list = new ArrayList();
		
		if(c.getCid()!=null && !"".equals(c.getCid())){
			sql = sql+" and c.parentId = ?";
			list.add(c.getCid());
		}
		
		if(c.getCname() !=null&& !"".equals(c.getCname())){
			sql=sql+" and c.cname = ?";
			list.add(c.getCname());
			
		}
		if(c.getColor() !=null&& !"".equals(c.getColor())){
			sql=sql+" and p.color like concat('%',?,'%')";
			list.add(c.getColor());
			
		}
		if(c.getSize() !=null&& !"".equals(c.getSize())){
			sql=sql+" and p.size like concat('%',?,'%')";
			list.add(c.getSize());
			
		}
		if(c.getMaxPrice()!=null){
			sql=sql+" and p.price <= ?";
			list.add(c.getMaxPrice());
		}
		if(c.getMinPrice()!=null){
			sql=sql +"  and p.price >= ?";
			list.add(c.getMinPrice());
		}	
		
		sql=sql+" limit ?,?";
		list.add(begin);
		list.add(pageSize);
		List<Product> list2 = null;
		try {
			list2 = query.query(sql, new BeanListHandler<>(Product.class), list.toArray());
			for (Product product : list2) {
				String pic[] = product.getPimage().split(",");
				product.setImagelist(Arrays.asList(pic));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list2;
	}

	@Override
	public Integer getCount(Condition c) {
		QueryRunner query =new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from product p , category c where p.cid = c.cid  ";
		ArrayList list = new ArrayList();
		
		if(c.getCid()!=null && !"".equals(c.getCid())){
			sql = sql+" and c.parentId = ?";
			list.add(c.getCid());
		}
		
		if(c.getCname() !=null&& !"".equals(c.getCname())){
			sql=sql+" and c.cname = ?";
			list.add(c.getCname());
			
		}
		if(c.getColor() !=null&& !"".equals(c.getColor())){
			sql=sql+" and p.color like concat('%',?,'%')";
			list.add(c.getColor());
			
		}
		if(c.getSize() !=null&& !"".equals(c.getSize())){
			sql=sql+" and p.size like concat('%',?,'%')";
			list.add(c.getSize());
			
		}
		if(c.getMaxPrice()!=null){
			sql=sql+" and p.price <= ?";
			list.add(c.getMaxPrice());
		}
		if(c.getMinPrice()!=null){
			sql=sql +"  and p.price >= ?";
			list.add(c.getMinPrice());
		}	
		Long count =0L;
		try {
			count=(Long) query.query(sql, new ScalarHandler(),list.toArray());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return count.intValue();
	}


}
