package com.qs.service.impl;

import java.util.List;

import com.qs.dao.OrderDao;
import com.qs.dao.impl.OrderDaoImpl;
import com.qs.javabean.Orders;
import com.qs.javabean.ShippingAddress;
import com.qs.service.OrderService;
import com.qs.utils.PageBean;

public class OrderServiceImpl implements OrderService {

	private OrderDao orderDao = new OrderDaoImpl();

	/**
	 * 添加订单 处理事务
	 * 
	 * @param order
	 */
	public void add(Orders order) {
		orderDao.add(order);
	}

	/**
	 * 加载订单
	 * 
	 * @param oid
	 * @return
	 */
	public Orders load(String oid) {
		// TODO Auto-generated method stub
		return orderDao.load(oid);
	}
	public Orders load1(String oid) {
		// TODO Auto-generated method stub
		return orderDao.load1(oid);
	}

	/**
	 * 确认收货
	 * 
	 * @param oid
	 * @throws OrderException
	 */
	public void confirm(String oid) {
		/*
		 * 校验订单状态 不是3，抛出异常 修改订单状态为4，表示交易成功
		 */
		int state = orderDao.getStateByOid(oid);

		// 修改状态为4
		orderDao.updateState(oid, 4);

	}

	/**
	 * 支付方法
	 * 
	 * @param oid
	 */
	public void pay(String oid) {
		/*
		 * 1. 获取订单的状态 * 如果状态为1，那么执行下面代码 * 如果状态不为1，那么本方法什么都不做
		 */
		int state = orderDao.getStateByOid(oid);
		if (state == 1) {
			// 修改订单状态为2
			orderDao.updateState(oid, 2);
		}
	}

	//取消订单
	@Override
	public void cancleOrder(String oid) {
		// TODO Auto-generated method stub
		int state = orderDao.getStateByOid(oid);
		
		// 修改订单状态为5
		orderDao.updateState(oid, 5);
		
	}


	//发货
	@Override
	public void shipments(String oid) {
		// TODO Auto-generated method stub
		int state = orderDao.getStateByOid(oid);
		orderDao.updateState(oid,3);
	}

	@Override
	public PageBean myOrders(String uid, int currentPage, int pageSize) {
		if (currentPage < 1) {
			currentPage = 1;
		}
		//pageSize
		if (pageSize < 4) {
			pageSize = 4;
		}
		//根据uid得到对应用户订单的总数

		int count = orderDao.getAllOrders(uid);
		
		
		//计算总记录数
		int totalPage = count % pageSize == 0 ? count/pageSize : count/pageSize + 1;
		if (currentPage > totalPage) {
			totalPage=currentPage;
		}
		
		int begin = (currentPage - 1) * pageSize;
		//根据分类和分页数据，查询对应的商品信息
		
		List<Orders> list = orderDao.findByUid(uid,begin,pageSize);
		
		//创建pageBean对象，并封装数据
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setTotalCount(count);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalPage(totalPage);
		
		
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public List<Orders> myOrders(String uid, int i) {
		// TODO Auto-generated method stub
		return orderDao.findByUid(uid,i);
	}

	@Override
	public void del(String oid) {
		// TODO Auto-generated method stub
		orderDao.del(oid);
	}

	@Override
	public ShippingAddress getadd(String aid) {
		// TODO Auto-generated method stub
		return orderDao.getadd(aid);
	}

}



