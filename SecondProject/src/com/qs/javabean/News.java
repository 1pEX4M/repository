package com.qs.javabean;

public class News {
@Override
	public String toString() {
		return "News [nid=" + nid + ", title=" + title + ", content=" + content + "]";
	}
public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
private int nid;
private String title;
private String content;
public News() {
	super();
	
}
public News(int nid, String title, String content) {
	super();
	this.nid = nid;
	this.title = title;
	this.content = content;
}

}
