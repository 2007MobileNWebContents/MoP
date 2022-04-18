package com.kh.mop.schedulerGroup.store;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.schedulerGroup.domain.SchedulerGroup;

@Repository
public class SchedulerGroupStoreLogic implements SchedulerGroupStore {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertSchedulerGroup(SchedulerGroup schedulergroup) {
		int result= sqlSession.insert("SchedulerGroupMapper.insertSchedulerGroup", schedulergroup);
		return result;
	}

	@Override
	public int updateSchdedulerGroup(SchedulerGroup schedulergroup) {
		int result = sqlSession.update("SchedulerGroupMapper.updateSchedulerGroup", schedulergroup);
		return result;
	}

	@Override
	public int selectOneSchedulerGroup(int gId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSchedulerGroup(int gId) {
		int result = sqlSession.delete("SchedulerGroupMapper.deleteSchedulerGroup", gId);
		return result;
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
		return (ArrayList)sqlSession.selectList("SchedulerGroupMapper.schedulerGroupList");
	}

}
