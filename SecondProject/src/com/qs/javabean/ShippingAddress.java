package com.qs.javabean;

import java.io.Serializable;

public class ShippingAddress implements Serializable{
	
	private String aid;
	private String username;
	private String address;
	private String specific;
	private String phone;
	private String telephone;
	private String uid;
	
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSpecific() {
		return specific;
	}
	public void setSpecific(String specific) {
		this.specific = specific;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	@Override
	public String toString() {
		return "ShippingAddress [aid=" + aid + ", username=" + username + ", address=" + address + ", specific="
				+ specific + ", phone=" + phone + ", telephone=" + telephone + ", uid=" + uid + "]";
	}


	
	
}
