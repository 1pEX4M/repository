package com.qs.javabean;

public class Tea {
	private String oid;
	private String  username;
	private String  ordertime;
	public Tea(String oid, String username, String ordertime) {
		super();
		this.oid = oid;
		this.username = username;
		this.ordertime = ordertime;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	@Override
	public String toString() {
		return "Tea [oid=" + oid + ", username=" + username + ", ordertime=" + ordertime + "]";
	}
	public Tea() {
		super();
		
	}

}
