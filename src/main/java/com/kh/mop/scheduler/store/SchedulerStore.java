package com.kh.mop.scheduler.store;

import java.util.ArrayList;

import com.kh.mop.scheduler.domain.Scheduler;

public interface SchedulerStore {
	
	public int insertScheduler(Scheduler scheduler);
	public int deleteScheduler(int sId);
	public int updateScheduler(Scheduler scheduler);
	public int detailScheduler(int sId);
	public ArrayList<Scheduler> selectSubView();
	public ArrayList<Scheduler> selectList();
	public int selectOneScheduler(int sId);
}
