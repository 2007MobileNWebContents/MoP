package com.kh.mop.freeboard.domain;

import java.sql.Date;

public class FreeBoard {

	private int fId; 
	private String fTitle;
	private String fContent; 
	private String fWriter;
	private Date fCreateDate;
	private Date fModifyDate;
	private String fStatus;
	private String fOriginalFileName;
	private String fRenameFileName;
	private int fCount;
	private int replycount;
	
	public int getReplycount() {
		return replycount;
	}



	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}



	public FreeBoard() {}

	
	
	



	public FreeBoard(int fId, String fTitle, String fContent, String fWriter, Date fCreateDate, Date fModifyDate,
			String fStatus, String fOriginalFileName, String fRenameFileName, int fCount, int replycount) {
		super();
		this.fId = fId;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.fWriter = fWriter;
		this.fCreateDate = fCreateDate;
		this.fModifyDate = fModifyDate;
		this.fStatus = fStatus;
		this.fOriginalFileName = fOriginalFileName;
		this.fRenameFileName = fRenameFileName;
		this.fCount = fCount;
		this.replycount = replycount;
	}



	public int getfId() {
		return fId;
	}

	public void setfId(int fId) {
		this.fId = fId;
	}

	public String getfTitle() {
		return fTitle;
	}

	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getfWriter() {
		return fWriter;
	}

	public void setfWriter(String fWriter) {
		this.fWriter = fWriter;
	}

	public Date getfCreateDate() {
		return fCreateDate;
	}

	public void setfCreateDate(Date fCreateDate) {
		this.fCreateDate = fCreateDate;
	}

	public Date getfModifyDate() {
		return fModifyDate;
	}

	public void setfModifyDate(Date fModifyDate) {
		this.fModifyDate = fModifyDate;
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
	}

	public String getfOriginalFileName() {
		return fOriginalFileName;
	}

	public void setfOriginalFileName(String fOriginalFileName) {
		this.fOriginalFileName = fOriginalFileName;
	}

	public String getfRenameFileName() {
		return fRenameFileName;
	}

	public void setfRenameFileName(String fRenameFileName) {
		this.fRenameFileName = fRenameFileName;
	}

	public int getfCount() {
		return fCount;
	}

	public void setfCount(int fCount) {
		this.fCount = fCount;
	}

	@Override
	public String toString() {
		return "FreeBoard [fId=" + fId + ", fTitle=" + fTitle + ", fContent=" + fContent + ", fWriter=" + fWriter
				+ ", fCreateDate=" + fCreateDate + ", fModifyDate=" + fModifyDate + ", fStatus=" + fStatus
				+ ", fOriginalFileName=" + fOriginalFileName + ", fRenameFileName=" + fRenameFileName + ", fCount="
				+ fCount + "]";
	}
	
	
}
