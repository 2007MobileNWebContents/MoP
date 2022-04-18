package com.kh.mop.place.domain;

public class Place {
	private int pId;
	private String pCode;
	private String pImg;
	private String pName;
	private String pAddress;
	private int price;
	private int pMax;
	private String pTel;
	private String pDetail;
	
	public Place() {}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpAddress() {
		return pAddress;
	}

	public void setpAddress(String pAddress) {
		this.pAddress = pAddress;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getpMax() {
		return pMax;
	}

	public void setpMax(int pMax) {
		this.pMax = pMax;
	}

	public String getpTel() {
		return pTel;
	}

	public void setpTel(String pTel) {
		this.pTel = pTel;
	}

	public String getpDetail() {
		return pDetail;
	}

	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	@Override
	public String toString() {
		return "Place [pId=" + pId + ", pCode=" + pCode + ", pImg=" + pImg + ", pName=" + pName + ", pAddress="
				+ pAddress + ", price=" + price + ", pMax=" + pMax + ", pTel=" + pTel + ", pDetail=" + pDetail + "]";
	}

}
