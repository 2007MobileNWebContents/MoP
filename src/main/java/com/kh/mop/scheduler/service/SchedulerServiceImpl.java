package com.kh.mop.scheduler.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.scheduler.domain.Scheduler;
import com.kh.mop.scheduler.store.SchedulerStore;

@Service
public class SchedulerServiceImpl implements SchedulerService {
	
	@Autowired
	private SchedulerStore sStore;
	
	@Override
	public int insertScheduler(Scheduler scheduler) {
		return sStore.insertScheduler(scheduler);
	}

	@Override
	public int updateSchdeduler(Scheduler scheduler) {
		return sStore.updateScheduler(scheduler);
	}

	@Override
	public int selectOneScheduler(int sId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteScheduler(int sId) {
		return sStore.deleteScheduler(sId);
	}

	@Override
	public int detailScheduler(int sId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Scheduler> selectSubView() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ArrayList<Scheduler> selectList() {
		return sStore.selectList();
	}

}
