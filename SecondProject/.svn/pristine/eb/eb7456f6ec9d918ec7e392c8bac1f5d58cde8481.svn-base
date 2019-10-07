package com.qs.service;

import java.util.List;

import com.qs.javabean.Orders;
import com.qs.javabean.ShippingAddress;
import com.qs.utils.PageBean;



public interface OrderService {

	public void add(Orders order);
	//public List<Orders> myOrders(String uid);
	public Orders load(String oid);
	public void confirm(String oid);
	public void pay(String oid);
	public void cancleOrder(String oid);
	public List<Orders> myOrders(String uid, int i);
	public void shipments(String oid);
	public PageBean myOrders(String uid, int currentPage, int pageSize);
	public void del(String oid);
	public ShippingAddress getadd(String aid);
	public Orders load1(String oid);	
	
}
