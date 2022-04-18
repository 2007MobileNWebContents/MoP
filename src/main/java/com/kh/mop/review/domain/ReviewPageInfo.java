package com.kh.mop.review.domain;

public class ReviewPageInfo {

	// 현재 페이지
	// 몇개 게시글
	// 몇개의 네비게이션
	// 네비게이션 첫번째값
	// 네비게이션 마지막값
	// 전체 게시글 갯수
	// 페이지 마지막 번호
	private int currentPage;
	private int reviewLimit;
	private int pageLimit;
	private int startPage;
	private int endPage;
	private int listCount;
	private int maxPage;
	
	public ReviewPageInfo() {}

	public ReviewPageInfo(int currentPage, int reviewLimit, int pageLimit, int startPage, int endPage, int listCount,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		this.reviewLimit = reviewLimit;
		this.pageLimit = pageLimit;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
		this.maxPage = maxPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getReviewLimit() {
		return reviewLimit;
	}

	public void setReviewLimit(int reviewLimit) {
		this.reviewLimit = reviewLimit;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", reviewLimit=" + reviewLimit + ", pageLimit=" + pageLimit
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", listCount=" + listCount + ", maxPage="
				+ maxPage + "]";
	}

}
