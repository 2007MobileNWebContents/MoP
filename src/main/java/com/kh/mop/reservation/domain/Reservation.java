package com.kh.mop.reservation.domain;

import java.sql.Date;
import java.sql.Time;

public class Reservation {

	private int rId;
	private String rMemberId;
	private String rMemberName;
	private String rDate;
	private String rPlace;
	private int rPrice;
	private String rPhone;
	private int rPeople;

	public Reservation () {}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrMemberId() {
		return rMemberId;
	}

	public void setrMemberId(String rMemberId) {
		this.rMemberId = rMemberId;
	}

	public String getrMemberName() {
		return rMemberName;
	}

	public void setrMemberName(String rMemberName) {
		this.rMemberName = rMemberName;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public String getrPlace() {
		return rPlace;
	}

	public void setrPlace(String rPlace) {
		this.rPlace = rPlace;
	}

	public int getrPrice() {
		return rPrice;
	}

	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}

	public String getrPhone() {
		return rPhone;
	}

	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}

	public int getrPeople() {
		return rPeople;
	}

	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}

	public Reservation(int rId, String rMemberId, String rMemberName, String rDate, String rPlace, int rPrice,
			String rPhone, int rPeople) {
		super();
		this.rId = rId;
		this.rMemberId = rMemberId;
		this.rMemberName = rMemberName;
		this.rDate = rDate;
		this.rPlace = rPlace;
		this.rPrice = rPrice;
		this.rPhone = rPhone;
		this.rPeople = rPeople;
	}

	@Override
	public String toString() {
		return "Reservation [rId=" + rId + ", rMemberId=" + rMemberId + ", rMemberName=" + rMemberName + ", rDate="
				+ rDate + ", rPlace=" + rPlace + ", rPrice=" + rPrice + ", rPhone=" + rPhone + ", rPeople=" + rPeople
				+ "]";
	}
}
