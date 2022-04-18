package com.kh.mop.eventboard.domain;

import java.sql.Date;

public class Eventboard {
	
	private int eId;
	private String eTitle;
	private String eWriter;
	private String eContent;
	private String eOriginalfilename;
	private Date eCreateDate;
	private int eCount;
	
	public Eventboard() {}

	public Eventboard(int eId, String eTitle, String eWriter, String eContent, String eOriginalfilename,
			Date eCreateDate, int eCount) {
		super();
		this.eId = eId;
		this.eTitle = eTitle;
		this.eWriter = eWriter;
		this.eContent = eContent;
		this.eOriginalfilename = eOriginalfilename;
		this.eCreateDate = eCreateDate;
		this.eCount = eCount;
	}

	public int geteId() {
		return eId;
	}

	public void seteId(int eId) {
		this.eId = eId;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public String geteWriter() {
		return eWriter;
	}

	public void seteWriter(String eWriter) {
		this.eWriter = eWriter;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public String geteOriginalfilename() {
		return eOriginalfilename;
	}

	public void seteOriginalfilename(String eOriginalfilename) {
		this.eOriginalfilename = eOriginalfilename;
	}

	public Date geteCreateDate() {
		return eCreateDate;
	}

	public void seteCreateDate(Date eCreateDate) {
		this.eCreateDate = eCreateDate;
	}

	public int geteCount() {
		return eCount;
	}

	public void seteCount(int eCount) {
		this.eCount = eCount;
	}

	@Override
	public String toString() {
		return "Eventboard [eId=" + eId + ", eTitle=" + eTitle + ", eWriter=" + eWriter + ", eContent=" + eContent
				+ ", eOriginalfilename=" + eOriginalfilename + ", eCreateDate=" + eCreateDate + ", eCount=" + eCount
				+ "]";
	}
	
	
}
