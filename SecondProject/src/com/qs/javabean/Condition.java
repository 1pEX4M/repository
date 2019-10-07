package com.qs.javabean;

public class Condition {
	
	
	private String cname;
	private String color;
	private String size;
	private Double minPrice;
	private Double maxPrice;
	private String cid;
	
	
	
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Double getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(Double minPrice) {
		if(minPrice == 0.0){
			this.minPrice = null;
		}else{
			this.minPrice = minPrice;
		}
	}
	public Double getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(Double maxPrice) {
		if(maxPrice == 0.0){
			this.maxPrice = null;
		}else{
			this.maxPrice = maxPrice;
		}
	}
	
}
