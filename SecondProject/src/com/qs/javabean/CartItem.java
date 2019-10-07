package com.qs.javabean;

import java.text.DecimalFormat;

/**
 *
 */
public class CartItem {
	private Product product;
	private int countss;
	private double subtotal;
	private String subtotal1;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCountss() {
		return countss;
	}

	public void setCountss(int countss) {
		this.countss = countss;
	}

	public double getSubtotal() {
		
		return product.getPrice() * countss *0.8;
		
	}

	public String getSubtotal1() {
		DecimalFormat myformat = new DecimalFormat("#####0.00");
		this.subtotal1= myformat.format(subtotal);
		return this.subtotal1;
	}

	@Override
	public String toString() {
		return "CartItem [product=" + product + ", countss=" + countss + ", subtotal=" + subtotal + "]";
	}

}
