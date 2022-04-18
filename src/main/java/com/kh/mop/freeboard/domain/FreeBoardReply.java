package com.kh.mop.freeboard.domain;

import java.sql.Date;

public class FreeBoardReply {

	private int fbrId;
	private int refFBId;
	private String fbrWriter;
	private String fbrContent;
	private Date fbrCreateDate;
	private Date fbrModifyDate;
	private String fbrStatus;
	
	public FreeBoardReply() {}

	public FreeBoardReply(int fbrId, int refFBId, String fbrWriter, String fbrContent, Date fbrCreateDate,
			Date fbrModifyDate, String fbrStatus) {
		super();
		this.fbrId = fbrId;
		this.refFBId = refFBId;
		this.fbrWriter = fbrWriter;
		this.fbrContent = fbrContent;
		this.fbrCreateDate = fbrCreateDate;
		this.fbrModifyDate = fbrModifyDate;
		this.fbrStatus = fbrStatus;
	}

	public int getFbrId() {
		return fbrId;
	}

	public void setFbrId(int fbrId) {
		this.fbrId = fbrId;
	}

	public int getRefFBId() {
		return refFBId;
	}

	public void setRefFBId(int refFBId) {
		this.refFBId = refFBId;
	}

	public String getFbrWriter() {
		return fbrWriter;
	}

	public void setFbrWriter(String fbrWriter) {
		this.fbrWriter = fbrWriter;
	}

	public String getFbrContent() {
		return fbrContent;
	}

	public void setFbrContent(String fbrContent) {
		this.fbrContent = fbrContent;
	}

	public Date getFbrCreateDate() {
		return fbrCreateDate;
	}

	public void setFbrCreateDate(Date fbrCreateDate) {
		this.fbrCreateDate = fbrCreateDate;
	}

	public Date getFbrModifyDate() {
		return fbrModifyDate;
	}

	public void setFbrModifyDate(Date fbrModifyDate) {
		this.fbrModifyDate = fbrModifyDate;
	}

	public String getFbrStatus() {
		return fbrStatus;
	}

	public void setFbrStatus(String fbrStatus) {
		this.fbrStatus = fbrStatus;
	}

	@Override
	public String toString() {
		return "FreeBoardReply [fbrId=" + fbrId + ", refFBId=" + refFBId + ", fbrWriter=" + fbrWriter + ", fbrContent="
				+ fbrContent + ", fbrCreateDate=" + fbrCreateDate + ", fbrModifyDate=" + fbrModifyDate + ", fbrStatus="
				+ fbrStatus + "]";
	}
	
	
	
}
