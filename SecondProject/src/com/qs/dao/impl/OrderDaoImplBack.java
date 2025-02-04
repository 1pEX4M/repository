package com.qs.dao.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qs.dao.OrderDaoBack;
import com.qs.javabean.OrderItem;
import com.qs.javabean.Orders;
import com.qs.javabean.Product;
import com.qs.javabean.Tea;
import com.qs.javabean.User;
import com.qs.service.OrderService;
import com.qs.service.impl.OrderServiceImpl;
import com.qs.utils.C3P0Utils;

/**b'w'j
 * @author HASEE
 *
 */
public class OrderDaoImplBack implements OrderDaoBack {
        //得到所有订单的数量
	@Override
	public int getorderform() {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from orders ";
		Long count ;
		try {
			count = (Long) query.query(sql,new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return count.intValue();
	}
	  //通过起始位置,拿到相应的得到订单的数据
	@Override
	public List<User> getorderformAndPage(int begin, int pageSize) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql="select * from orders o ,user u where u.uid=o.uid limit ?,?";
		List<User>userlist = null;
		try {
		  List<Map<String, Object>> list = query.query(sql, new MapListHandler(),begin,pageSize);
		  if (list != null &&list.size() > 0) {
			  userlist = new ArrayList<>();
			for (Map<String, Object> map : list) {
				User user = new User();
				Orders orders = new Orders();
				BeanUtils.populate(user, map);
				BeanUtils.populate(orders, map);
				System.out.println(orders);
				user.getOrderss().add(orders);
				userlist.add(user);
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userlist;
	}
	 //展示订单详情
	@Override
	public List<Orders> SeekService(String oid,String uid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		//查询订单,降序排序
		String sql = "select * from orders where oid = ? order by ordertime desc";
		List<Orders> orders = null;
		try {
			 orders=query.query(sql, new BeanListHandler<>(Orders.class), oid);
			if (orders != null && orders.size() > 0) {
				for (Orders order : orders) {
				sql = "select * from orderitem oi, product p where oi.pid = p.pid and oi.oid = ?";
					List<Map<String, Object>> list = query.query(sql, new MapListHandler(), oid);
					if (list != null && list.size() > 0) {
						for (Map<String, Object> map : list) {
							// 创建订单项对象
							OrderItem item = new OrderItem();
							// 创建商品对象
							Product product = new Product();
							// 使用beanutils，快速封装数据
							BeanUtils.populate(item, map);
							BeanUtils.populate(product, map);
							String[] split = product.getPimage().split(",");
							product.setImagelist(Arrays.asList(split));
							// 将封装号的商品信息关联到订单项中
							item.setProduct(product);
							// 将订单项与订单进行关联
							item.setOrder(order);
							order.getOrderItems().add(item);
							
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orders;
	}
	   //取消订单
	@Override
	public void CancleServlet(String oid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql="update orders set state= 5 where oid=? ";
		try {
			query.update(sql ,oid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	 //多条件搜索订单的数量
	@Override
	public int getTea(Tea tea) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from user u ,orders o where u.uid=o.uid and 1=1 ";
		Long count ;
		if (tea.getOid() != null && !(tea.getOid().equals(""))) {
			sql += " and oid like '%"+tea.getOid()+"%'";
		}
		if (tea.getOrdertime() != null && !(tea.getOrdertime().equals(""))) {
			sql += " and ordertime like '%"+tea.getOrdertime()+"%'";
		}
		if (tea.getUsername() != null && !(tea.getUsername().equals(""))) {
			sql +=" and username like '%"+tea.getUsername()+"%'" ;
		}
		try {
			//因为只需要得到查到信息的数量,所有这里不需要用map接收
			 count = (Long) query.query(sql, new ScalarHandler());
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return count.intValue();
	}
	//多条件搜索,分页展示
	@Override
	public List<User> getTeaAndPage(Tea tea, int begin, int pageSize) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user u ,orders o where u.uid=o.uid and 1=1 ";
		List<User>userlist = null;
		if (tea.getOid() != null && !(tea.getOid().equals(""))) {
			sql += " and oid like '%"+tea.getOid()+"%'";
		}
		if (tea.getOrdertime() != null && !(tea.getOrdertime().equals(""))) {
			sql += " and ordertime like '%"+tea.getOrdertime()+"%'";
		}
		if (tea.getUsername() != null && !(tea.getUsername().equals(""))) {
			sql +=" and username like '%"+tea.getUsername()+"%'" ;
		}
		 sql  += " limit ?,?";
		try {
			List<Map<String, Object>> list = query.query(sql, new MapListHandler(),begin,pageSize);
			if (list != null && list.size() > 0) {
				//因为需要返回List<User>,所有这里我们创建一个,接收每次循环封装好的商品信息
				userlist = new ArrayList<>();
				for (Map<String, Object> map : list) {
					User user = new User();
					Orders orders = new Orders();
					BeanUtils.populate(user, map);
					BeanUtils.populate(orders, map);
					user.getOrderss().add(orders);
					userlist.add(user);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userlist;
	}
	@Override
	public int getproduct() {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from product ";
		Long count ;
		try {
			count = (Long) query.query(sql,new ScalarHandler());
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return count.intValue();
	}
	@Override
	public List<Product> getpageSizeAndPage(int begin, int pageSize) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product  limit ?,?";
		List<Product> list = null;
		try {
			list = query.query(sql, new BeanListHandler<>(Product.class),begin,pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for (Product product : list) {
			String[] split = product.getPimage().split(",");
			product.setImagelist(Arrays.asList(split));
		}
		return list;
	}
	@Override
	public Product getproquery(int pid) {
		QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where pid=?";
		Product product = null;
		try {
			product = query.query(sql, new BeanHandler<>(Product.class),pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	@Override
	public void poralter(Product p) {
		 QueryRunner query= new QueryRunner(C3P0Utils.getDataSource()); 
		 String sql = "update product set pname=?,price=?,pimage=?, color=?,size=?,pdesc=?,count=?,cid=?,popularity=? where pid=?";
		try {
			query.update(sql,p.getPname(),p.getPrice(),p.getPimage(),p.getColor(),p.getSize(),p.getPdesc(),p.getCount(),p.getCid(),p.getPopularity(),p.getPid());
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	

	

}
