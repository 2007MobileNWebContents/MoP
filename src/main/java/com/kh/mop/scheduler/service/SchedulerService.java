package com.kh.mop.scheduler.service;

import java.util.ArrayList;

import com.kh.mop.scheduler.domain.Scheduler;

public interface SchedulerService {
	
	
	public int insertScheduler(Scheduler scheduler);
	public int updateSchdeduler(Scheduler scheduler);
	public int selectOneScheduler(int sId);
	public int deleteScheduler(int sId);
	public int detailScheduler(int sId);
	public ArrayList<Scheduler> selectSubView();
	public ArrayList<Scheduler> selectList();
}
