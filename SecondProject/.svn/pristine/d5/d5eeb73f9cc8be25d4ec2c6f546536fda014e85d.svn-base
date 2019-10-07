package com.qs.javabean;

import java.text.DecimalFormat;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	private String ordertime;
	private String oid;
	private String address;
	private double totalprice;
	private String totalprice1;
	
	

	

	
	private Map<Integer, CartItem> cartItems = new LinkedHashMap<>();

	public double getTotalprice() {
		return totalprice;
	}

	public Collection getCartItems(){	
		return cartItems.values();
	}
	
	
	@Override
	public String toString() {
		return "Cart [ordertime=" + ordertime + ", oid=" + oid + ", address=" + address + "]";
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
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

	// �����Ʒ
	public void add(CartItem cartItem){    // 1     ----   1  ������
		// 1.��cartItem�еõ�pid
		int pid = cartItem.getProduct().getPid();
		// 2.����pid��ѯmap�Ƿ������pid
		if(cartItems.containsKey(pid)){
			// ���ظ���
			CartItem exist_item = cartItems.get(pid);
			// ��������
			exist_item.setCountss(exist_item.getCountss() + cartItem.getCountss());
		}else {
			cartItems.put(pid, cartItem);
		}
		totalprice += cartItem.getSubtotal();
		
		
	}
	
	// ��������
	public void sub(int countss, String pid){
		// ����pid�õ����������
		CartItem cartItem = cartItems.get(pid);
		cartItem.setCountss(countss);
	}
	
	// ������Ʒidɾ����Ʒ
	public void remove(int pid){
		CartItem cartItem = cartItems.remove(pid);
		totalprice -= cartItem.getSubtotal();
		
	}
	// ��չ��ﳵ
	public void clear(){
		// ��չ��ﳵ�������Ƴ�map�е�����
		cartItems.clear();
		totalprice = 0;
	}
	public String getTotalprice1() {
		DecimalFormat myformat = new DecimalFormat("#####0.00");
		this.totalprice1 = myformat.format(totalprice);
		return this.totalprice1;
	}
}
