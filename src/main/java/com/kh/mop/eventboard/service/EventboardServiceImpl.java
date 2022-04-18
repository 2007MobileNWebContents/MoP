package com.kh.mop.eventboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.eventboard.domain.Eventboard;
import com.kh.mop.eventboard.domain.EventboardPageInfo;
import com.kh.mop.eventboard.domain.EventboardReply;
import com.kh.mop.eventboard.store.EventboardStore;

@Service
public class EventboardServiceImpl implements EventboardService{

	@Autowired
	private EventboardStore eStore;
	
	@Override
	public int getListCount() {
		return eStore.getListCount();
	}

	@Override
	public ArrayList<Eventboard> selectList(EventboardPageInfo pi) {
		return eStore.selectList(pi);
	}

	@Override
	public int addReadCount(int eId) {
		return eStore.addReadCount(eId);
	}

	@Override
	public Eventboard selectEventboard(int eId) {
		return eStore.selectEventboard(eId);
	}

	@Override
	public int updateEvnetboard(Eventboard eventboard) {
		return eStore.updateEvnetboard(eventboard);
	}

	@Override
	public int deleteEvnetboard(int eId) {
		return eStore.deleteEvnetboard(eId);
	}

	@Override
	public int insertEventboard(Eventboard eventboard) {
		return eStore.insertEventboard(eventboard);
	}

	@Override
	public ArrayList<EventboardReply> selecteventboardReplyList(int eId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertEvnetboardReply(EventboardReply eventboardReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateEvnetboardReply(EventboardReply eventboardReply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteEvnetboardReply(int ebrId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
