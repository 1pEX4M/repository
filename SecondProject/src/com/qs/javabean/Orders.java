package com.qs.javabean;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;


public class Orders {
	private String oid;
	private String address;
	private String aname;
	private String telephone;
	private User user ;
	private double total ;
	private String total1;
	private String ordertime;
	private int state;
	private String uid;
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	// 在订单中描述订单项信息
	private List<OrderItem> orderItems = new ArrayList<>();

	
	public String getTotal1() {
		DecimalFormat myformat = new DecimalFormat("#####0.00");
		this.total1 = myformat.format(total);
		return this.total1;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public double getTotal() {
		BigDecimal bd = new BigDecimal(total);
        Double tem = bd.setScale(2,BigDecimal.ROUND_FLOOR).doubleValue();
		return  tem;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Orders [oid=" + oid + ", address=" + address + ", aname=" + aname + ", telephone=" + telephone + ", user="
				+ user + ", total=" + total + ", ordertime=" + ordertime + ", state=" + state + "]";
	}

}
