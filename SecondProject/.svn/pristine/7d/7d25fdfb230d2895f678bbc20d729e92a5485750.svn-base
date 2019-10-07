package com.qs.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qs.dao.OrderDao;
import com.qs.javabean.OrderItem;
import com.qs.javabean.Orders;
import com.qs.javabean.Product;
import com.qs.javabean.ShippingAddress;
import com.qs.utils.C3P0Utils;
import com.qs.utils.CommonUtils;


public class OrderDaoImpl implements OrderDao {

	QueryRunner query = new QueryRunner(C3P0Utils.getDataSource());
	//添加订单
	public void add(Orders order){
		try {
			String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
			
			//处理util的Date转换成sqlTimestamp(sql中的时间类型与java中时间类型不同)
			//Timestamp timestamp = new Timestamp(order.getOrdertime().getTime());
			//order.setOrdertime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			
			//order.getUser().setUid("1");
			//order.setAddress("千硕教育");
			Object[] params = {
					order.getOid(),order.getOrdertime(),
					order.getState(),order.getAddress(),
					order.getAname(),
					order.getTelephone(),
					order.getUser().getUid(),
					order.getTotal()};

			query.update(sql,params);
			//根据订单编号保存订单项
			//遍历订单中的订单项集合
			List<OrderItem> list = order.getOrderItems();
			//Product product = new Product();
			//String[] split = product.getPimage().split(",");
			//product.setImagelist(Arrays.asList(split));
			for (OrderItem orderItem : list) {
				sql = "insert into orderitem values(?,?,?,?,?)";
				Object[] params2 = {
					orderItem.getItemid(),orderItem.getCounts(),orderItem.getSubtotal(),
					orderItem.getProduct().getPid(),order.getOid()
				};
				query.update(sql,params2);
				
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 使用uid查询订单
	 * @param uid
	 * @return
	 */
	public List<Orders> findByUid(String uid,int begin, int pageSize) {
		/*
		 * 1.通过uid查询出当前用户的所有List<Order>
		 * 2.循环遍历每个Order,加载每个Order下所有OrderItem
		 */
		try{
			//1.得到当前用户所有订单
			String sql = "select * from orders where uid = ? order by ordertime desc  limit ?,?";
			List<Orders> orderList = query.query(sql, new BeanListHandler<>(Orders.class),uid,begin,pageSize);
		
			//2.循环遍历每个Order,加载每个订单下每个条目
			for (Orders order : orderList) {
				loadOrderItems(order);
			}
			return orderList;
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	
	}
	/**
	 * 加载指定Order的所有订单条目 
	 * 		查询结果为mapList，需要将mapListz转为OrderItem
	 * @param order
	 * @throws SQLException 
	 */
	private void loadOrderItems(Orders order) throws SQLException {
		
		//查询两张表：orderitem book	
		String sql = "select * from orderitem i, product p where i.pid=p.pid and oid = ?";
		/*
		 * 使用MapListHandler()结果集
		 * 		因为一行结果集不再对应一个JavaBean，所以不能使用BeanListHandler。
		 * 
		 * mapList是多个map，每个map对应多个结果集。
		 * map中的每个键值对为表的列名
		 */
		List<Map<String,Object>> mapList = query.query(sql, new MapListHandler(),order.getOid());
	
		/*
		 * 需求：
		 * 1）需要使用每一个map生成两个对象：OrderItem和Book
		 * 2）然后建立两者间关系（把Book设置给OrderItem）
		 * 3）最终得到一个OrderItem
		 * 做法：创建toOrderItemList()方法来完成。
		 */
		List<OrderItem> orderItemList = toOrderItemList(mapList);
		order.setOrderItems(orderItemList);
	}
	
	/**
	 * 把一大堆map生成一大堆OrderItem
	 * 		使mapList中每个map生成两个对象，并建立关系.
	 *
	 * @param mapList
	 * @return 一个完整的OrderItem
	 */
	private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
		/*
		 * 做法：
		 * 	1.循环遍历 每个map
		 * 	2.建立方法完成2.3.（toOrderItem）
		 * 		2.使map生成两个对象
		 * 		3.建立关系(把Book设置给OrderItem)，最终结果为一个OrderItem
		 * 	4.保存OrderItem
		 */
		//创建集合：用来存放所有的 OrderItem
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for (Map<String, Object> map : mapList) {
			
			OrderItem item = toOrderItem(map);
			orderItemList.add(item);
		}
		return orderItemList;
	}
	
	/**
	 * 把一个Map转换成一个OrderItem对象
	 * @param map
	 * @return
	 */
	private OrderItem toOrderItem(Map<String, Object> map) {
		/*
		 * 做法：
		 * 1.使用toBean方法，使map分别转换出两个对象：OrderItem对象、Book对象
		 * 2.对OrderItem设置book属性
		 * 3.返回OrderItem
		 */
		//1.使用toBean方法，使map转换出OrderItem对象、Book对象
		OrderItem orderItem = CommonUtils.toBean(map, OrderItem.class);
		Product product = CommonUtils.toBean(map,	Product.class);
		
		//2.对OrderItem设置product属性,完成返回
		String[] split = product.getPimage().split(",");
		product.setImagelist(Arrays.asList(split));
		orderItem.setProduct(product);
		return orderItem;
	}
	
	/**
	 * 加载订单
	 * @param oid
	 * @return
	 */
	public Orders load(String oid){
		
		try{
			//1.得到订单
			String sql = "select * from orders where oid= ? ";
			Orders order = query.query(sql, new BeanHandler<>(Orders.class),oid);
		
			//加载订单下每个条目
			loadOrderItems(order);

			return order;
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 查询订单状态
	 * @param oid
	 * @return
	 */
	public int getStateByOid(String oid){
		String sql = "select state from orders where oid = ?";
		try {
			
			Number num = (Number) query.query(sql,new ScalarHandler(),oid);
			return num.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 修改订单状态
	 * @param oid
	 * @param state
	 */
	public void updateState(String oid,int state){
		String sql = "update orders set state=? where oid = ?";
		try {
			query.update(sql,state,oid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public List<Orders> findByUid(String uid, int i) {
		/*
		 * 1.通过uid查询出当前用户的所有List<Order>
		 * 2.循环遍历每个Order,加载每个Order下所有OrderItem
		 */
		try{
			//1.得到当前用户所有订单
			String sql = "select * from orders where uid= ?and state = ? ";
			List<Orders> orderList = query.query(sql, new BeanListHandler<>(Orders.class),uid,i);
		
			//2.循环遍历每个Order,加载每个订单下每个条目
			for (Orders order : orderList) {
				loadOrderItems(order);
			}
			return orderList;
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	@Override
	public int getAllOrders(String uid) {
		String sql = "select count(*) from orders where uid= ?";
		Long count;
		try {
			count = (Long) query.query(sql, new ScalarHandler(),uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
		return count.intValue();
	}

	@Override
	public void del(String oid) {
		// TODO Auto-generated method stub
		String s = ""+ oid;
		String sql1 = "set foreign_key_checks=0";
		String sql2 = "delete from orderitem where oid = ?";
		String sql3 = "delete from orders where oid = ?";
		String sql4 = "set foreign_key_checks=1";
		try {
			query.update(sql1);
			query.update(sql2,s);
			query.update(sql4);
			query.update(sql1);
			query.update(sql3,s);
			query.update(sql4);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public ShippingAddress getadd(String aid) {
		// TODO Auto-generated method stub
		String sql = "select * from shippingaddress where aid= ?";
		System.out.println(aid);
		ShippingAddress address;
		try {
			address = query.query(sql, new BeanHandler<>(ShippingAddress.class),aid);
			System.out.println(address);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
			
		}
		return address;
	}

	@Override
	public Orders load1(String oid) {
		// TODO Auto-generated method stub
		
		try{
			//1.得到订单
			String sql = "select * from orders where oid= ? ";
			Orders order = query.query(sql, new BeanHandler<>(Orders.class),oid);
		
			//加载订单下每个条目
			loadOrderItems(order);

			return order;
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

	//@Override
	//public List<ShippingAddress> getadd(String uid) {
		//List list;
		//try {
			//list = query.query(sql, new BeanListHandler<>(ShippingAddress.class),uid);
		//} catch (SQLException e) {
			//e.printStackTrace();
			//throw new RuntimeException();
		//}
		//return list;
	//}


}
