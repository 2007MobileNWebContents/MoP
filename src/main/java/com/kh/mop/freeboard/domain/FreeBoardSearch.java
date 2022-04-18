package com.kh.mop.freeboard.domain;

public class FreeBoardSearch {

	private String searchType;
	private String searchValue;
	
	
	public FreeBoardSearch() {}
	
	
	
	@Override
	public String toString() {
		return "FreeBoardSearch [searchType=" + searchType + ", searchValue=" + searchValue + "]";
	}



	public FreeBoardSearch(String searchType, String searchValue) {
		super();
		this.searchType = searchType;
		this.searchValue = searchValue;
	}



	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
}
