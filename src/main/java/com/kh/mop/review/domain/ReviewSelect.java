package com.kh.mop.review.domain;

public class ReviewSelect {

	private String selectCondition;
	
	public ReviewSelect() {}

	public ReviewSelect(String selectCondition) {
		super();
		this.selectCondition = selectCondition;
	}

	public String getSelectCondition() {
		return selectCondition;
	}

	public void setSelectCondition(String selectCondition) {
		this.selectCondition = selectCondition;
	}

	@Override
	public String toString() {
		return "Select [selectCondition=" + selectCondition + "]";
	}
	
}
