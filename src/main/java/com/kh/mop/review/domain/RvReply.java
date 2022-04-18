package com.kh.mop.review.domain;

import java.sql.Date;

public class RvReply {
	
	private int reId;
	private String reContent;
	private int refBid;
	private String reWriter;
	private Date reCreateDate;
	
	public RvReply() {}

	public RvReply(int reId, String reContent, int refBid, String reWriter, Date reCreateDate) {
		super();
		this.reId = reId;
		this.reContent = reContent;
		this.refBid = refBid;
		this.reWriter = reWriter;
		this.reCreateDate = reCreateDate;
	}

	public int getReId() {
		return reId;
	}

	public void setReId(int reId) {
		this.reId = reId;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public int getRefBid() {
		return refBid;
	}

	public void setRefBid(int refBid) {
		this.refBid = refBid;
	}

	public String getReWriter() {
		return reWriter;
	}

	public void setReWriter(String reWriter) {
		this.reWriter = reWriter;
	}

	public Date getReCreateDate() {
		return reCreateDate;
	}

	public void setReCreateDate(Date reCreateDate) {
		this.reCreateDate = reCreateDate;
	}

	@Override
	public String toString() {
		return "RvReply [reId=" + reId + ", reContent=" + reContent + ", refBid=" + refBid + ", reWriter=" + reWriter
				+ ", reCreateDate=" + reCreateDate + "]";
	}
}
