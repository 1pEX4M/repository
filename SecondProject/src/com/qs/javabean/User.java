package com.qs.javabean;

import java.util.ArrayList;
import java.util.List;

public class User {
	private String uid;
	private String username;
	private String password;
	private String email;
	private String telephone;
	private int states;
	private String code;
	private String type;
	private String nickname;
	private String money;
	private List<Orders> orderss = new ArrayList<>();
	public User() {
		super();	
	}
	public User(String uid, String username, String password, String email, String telephone, int states, String code,
			String type, String nickname, String money,List<Orders> orderss) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.telephone = telephone;
		this.states = states;
		this.code = code;
		this.type = type;
		this.nickname = nickname;
		this.money = money;
		this.orderss = orderss;
	}
	public List<Orders> getOrderss() {
		return orderss;
	}
	public void setOrderss(List<Orders> orderss) {
		this.orderss = orderss;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getStates() {
		return states;
	}
	public void setStates(int states) {
		this.states = states;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", telephone=" + telephone + ", states=" + states + ", code=" + code + ", type=" + type + ", nickname="
				+ nickname + ", money=" + money + "]";
	}
	
	
}
