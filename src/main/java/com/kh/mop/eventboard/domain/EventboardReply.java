package com.kh.mop.eventboard.domain;

import java.sql.Date;

public class EventboardReply {
	
	private int ebrId;
	private int eefEBId;
	private String ebrWriter;
	private String ebrContent;
	private Date ebrCreateDate;
	private Date ebrModifyDate;
	private String ebrStatus;
	public EventboardReply(int ebrId, int eefEBId, String ebrWriter, String ebrContent, Date ebrCreateDate,
			Date ebrModifyDate, String ebrStatus) {
		super();
		this.ebrId = ebrId;
		this.eefEBId = eefEBId;
		this.ebrWriter = ebrWriter;
		this.ebrContent = ebrContent;
		this.ebrCreateDate = ebrCreateDate;
		this.ebrModifyDate = ebrModifyDate;
		this.ebrStatus = ebrStatus;
	}
	public int getEbrId() {
		return ebrId;
	}
	public void setEbrId(int ebrId) {
		this.ebrId = ebrId;
	}
	public int getEefEBId() {
		return eefEBId;
	}
	public void setEefEBId(int eefEBId) {
		this.eefEBId = eefEBId;
	}
	public String getEbrWriter() {
		return ebrWriter;
	}
	public void setEbrWriter(String ebrWriter) {
		this.ebrWriter = ebrWriter;
	}
	public String getEbrContent() {
		return ebrContent;
	}
	public void setEbrContent(String ebrContent) {
		this.ebrContent = ebrContent;
	}
	public Date getEbrCreateDate() {
		return ebrCreateDate;
	}
	public void setEbrCreateDate(Date ebrCreateDate) {
		this.ebrCreateDate = ebrCreateDate;
	}
	public Date getEbrModifyDate() {
		return ebrModifyDate;
	}
	public void setEbrModifyDate(Date ebrModifyDate) {
		this.ebrModifyDate = ebrModifyDate;
	}
	public String getEbrStatus() {
		return ebrStatus;
	}
	public void setEbrStatus(String ebrStatus) {
		this.ebrStatus = ebrStatus;
	}
	@Override
	public String toString() {
		return "EventboardReply [ebrId=" + ebrId + ", eefEBId=" + eefEBId + ", ebrWriter=" + ebrWriter + ", ebrContent="
				+ ebrContent + ", ebrCreateDate=" + ebrCreateDate + ", ebrModifyDate=" + ebrModifyDate + ", ebrStatus="
				+ ebrStatus + "]";
	}
	
	
}
