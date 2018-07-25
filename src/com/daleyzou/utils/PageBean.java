package com.daleyzou.utils;

import java.util.List;

/**
 * 封装分页参数
 * @author 11543
 *
 */
public class PageBean<T> {

	private int currentPage;	//当前页
	private int pageCount = 8;	//每页显示的记录数，默认一页8张图片
	private int totalCount;		//总记录数
	private int totalPage;		//总页数
	private List<T> pageData;	//每页的数据
	private Condition condition;//封装查询的条件
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		//总页数 = 总记录 / 每页显示的记录数 （+1）
		if (totalCount % pageCount == 0){
			totalPage = totalCount / pageCount;
		}else {
			totalPage = totalCount / pageCount + 1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
	
	public Condition getCondition() {
		return condition;
	}
	public void setCondition(Condition condition) {
		this.condition = condition;
	}
	
}
