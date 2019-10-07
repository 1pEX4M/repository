package com.qs.javabean;

import java.util.List;

public class PageBean {
	private Integer currentPage;
	private Integer totalPage;
	private Integer pageSize;
	private Integer totalCount;
	private List list;
	
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	
	public PageBean() {
		super();
		
	}
	public PageBean(Integer currentPage, Integer totalPage, Integer pageSize, Integer totalCount, List list) {
		this.currentPage = currentPage;
		this.totalPage = totalPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.list = list;
	}
	@Override
	public String toString() {
		final int maxLen = 10;
		return "PageBean [currentPage=" + currentPage + ", totalPage=" + totalPage + ", pageSize=" + pageSize
				+ ", totalCount=" + totalCount + ", list="
				+ (list != null ? list.subList(0, Math.min(list.size(), maxLen)) : null) + "]";
	}
	
	
}
