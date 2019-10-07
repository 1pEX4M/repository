package com.qs.javabean;

import java.text.DecimalFormat;
import java.util.List;

/*pid` int(10) NOT NULL AUTO_INCREMENT,
`pname` varchar(32) DEFAULT NULL,
`price` double DEFAULT NULL,
`pimage` varchar(255) DEFAULT NULL,
`color` varchar(32) DEFAULT NULL,
`size` varchar(32) DEFAULT NULL,
`pdesc` varchar(64) DEFAULT NULL,
`count` int(10) DEFAULT NULL,
`cid` int(10) DEFAULT NULL,*/

public class Product {
	public List<String> getColorlist() {
		return colorlist;
	}
	public void setColorlist(List<String> colorlist) {
		this.colorlist = colorlist;
	}
	public List<String> getSizelist() {
		return sizelist;
	}
	public void setSizelist(List<String> sizelist) {
		this.sizelist = sizelist;
	}
	public int getPopularity() {
		return popularity;
	}
	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}
	public List<String> getImagelist() {
		return imagelist;
	}
	public void setImagelist(List<String> imagelist) {
		this.imagelist = imagelist;
	}
	
	@Override
	public String toString() {
		return "Product [shop_price=" + shop_price + "]";
	}
	public String getPimage() {
		return Pimage;
	}
	public void setPimage(String pimage) {
		Pimage = pimage;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	private String Pimage;
	private String pname;
	private String color;
	private String size;
	private String pdesc;
	private int pid;
	private int count;
	private int cid;
	private double price;
	private int popularity;
	List<String> imagelist;
	List<String> colorlist;
	List<String> sizelist;
	private String shop_price;
	
	public String getShop_price() {
		DecimalFormat myformat = new DecimalFormat("#####0.00");
		this.shop_price = myformat.format(price*0.8);
		return this.shop_price;
	}
	
	public Product() {
		super();
		
	}
	public Product(String pimage, String pname, String color, String size, String pdesc, int pid, int count, int cid,
			double price) {
		super();
		Pimage = pimage;
		this.pname = pname;
		this.color = color;
		this.size = size;
		this.pdesc = pdesc;
		this.pid = pid;
		this.count = count;
		this.cid = cid;
		this.price = price;
	}
	
}
