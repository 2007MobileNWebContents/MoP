package com.kh.mop.schedulerGroup.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.schedulerGroup.domain.SchedulerGroup;
import com.kh.mop.schedulerGroup.store.SchedulerGroupStore;

@Service
public class SchedulerGroupImpl implements SchedulerGroupService {
	
	@Autowired
	private SchedulerGroupStore gStore;
	
	@Override
	public int insertSchedulerGroup(SchedulerGroup schedulergroup) {
		return gStore.insertSchedulerGroup(schedulergroup);
	}

	@Override
	public int updateSchdedulerGroup(SchedulerGroup schedulergroup) {
		return gStore.updateSchdedulerGroup(schedulergroup);
	}

	@Override
	public int selectOneSchedulerGroup(int gId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSchedulerGroup(int gId) {
		return gStore.deleteSchedulerGroup(gId);
	}

	@Override
	public int detailSchedulerGroup(int gId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<SchedulerGroup> selectSubView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<SchedulerGroup> selectList() {
		return gStore.selectList();
	}

}
