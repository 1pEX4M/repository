package com.qs.dao;

import java.util.List;

import com.qs.javabean.Orders;
import com.qs.javabean.ShippingAddress;

public interface OrderDao {

	public void add(Orders order);
	//public List<Orders> findByUid(String uid);
	public Orders load(String oid);
	public int getStateByOid(String oid);
	public void updateState(String oid,int state);
	public List<Orders> findByUid(String uid, int i);
	public int getAllOrders(String uid);
	public List<Orders> findByUid(String uid, int begin, int pageSize);
	public void del(String oid);
	public ShippingAddress getadd(String aid);
	public Orders load1(String oid);
	
}
