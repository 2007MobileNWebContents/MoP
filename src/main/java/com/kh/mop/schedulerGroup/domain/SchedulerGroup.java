package com.kh.mop.schedulerGroup.domain;

public class SchedulerGroup {
	
	private int gId;
	private String title;
	private String description;
	private String start;
	private String end;
	private String type;
	private String username;
	private int schedulerGroup;
	private String backgroundColor;
	private String textColor;
	private String allDay;
	
	public SchedulerGroup() {}

	public SchedulerGroup(int gId, String title, String description, String start, String end, String type,
			String username, int schedulerGroup, String backgroundColor, String textColor, String allDay) {
		super();
		this.gId = gId;
		this.title = title;
		this.description = description;
		this.start = start;
		this.end = end;
		this.type = type;
		this.username = username;
		this.schedulerGroup = schedulerGroup;
		this.backgroundColor = backgroundColor;
		this.textColor = textColor;
		this.allDay = allDay;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getSchedulerGroup() {
		return schedulerGroup;
	}

	public void setSchedulerGroup(int schedulerGroup) {
		this.schedulerGroup = schedulerGroup;
	}

	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getAllDay() {
		return allDay;
	}

	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}

	@Override
	public String toString() {
		return "SchedulerGroup [gId=" + gId + ", title=" + title + ", description=" + description + ", start=" + start
				+ ", end=" + end + ", type=" + type + ", username=" + username + ", schedulerGroup=" + schedulerGroup
				+ ", backgroundColor=" + backgroundColor + ", textColor=" + textColor + ", allDay=" + allDay + "]";
	}

	
	
	
}
