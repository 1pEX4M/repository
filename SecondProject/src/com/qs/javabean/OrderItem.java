package com.qs.javabean;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
  `itemid` varchar(32) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` varchar(32) DEFAULT NULL,
  `oid` varchar(32) DEFAULT NULL,
 */
public class OrderItem {
	private String itemid;
	private Orders order;
	private Product product;
	private int counts;
	private double subtotal;
	private String shop_price;
	

	
	public String getShop_price() {
		return shop_price;
	}

	public void setShop_price(String shop_price) {
		this.shop_price = shop_price;
	}

	public String getItemid() {
		return itemid;
	}

	public void setItemid(String itemid) {
		this.itemid = itemid;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int count) {
		this.counts = count;
	}

	public double getSubtotal() {
		BigDecimal bd = new BigDecimal(subtotal);
        Double subtota = bd.setScale(2,BigDecimal.ROUND_FLOOR).doubleValue();
		return subtota;
		
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	@Override
	public String toString() {
		return "OrderItem [itemid=" + itemid + ", product=" + product + ", count=" + counts + ", subtotal=" + subtotal
				+ "]";
	}
	
	
}
