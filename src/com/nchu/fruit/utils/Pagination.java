package com.nchu.fruit.utils;

public class Pagination {

	private int pageSize;	// 每页数量
	
	private int totalPage;	// 总页数
	
	private int currentPage; // 当前页
	
	private int totalCount;	// 总数量

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		if (totalCount%pageSize == 0)
				return totalCount/pageSize;
		else
			return (int)Math.ceil(totalCount*1.0 / pageSize);
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
