package com.kh.mop.eventboard.store;

import java.util.ArrayList;

import com.kh.mop.eventboard.domain.Eventboard;
import com.kh.mop.eventboard.domain.EventboardPageInfo;
import com.kh.mop.eventboard.domain.EventboardReply;

public interface EventboardStore {
	public int getListCount();
	public ArrayList<Eventboard> selectList(EventboardPageInfo pi);
	public int addReadCount(int eId);
	public Eventboard selectEventboard(int eId);
	public int updateEvnetboard(Eventboard eventboard);
	public int deleteEvnetboard(int eId);
	public int insertEventboard(Eventboard eventboard);
	public ArrayList<EventboardReply> selecteventboardReplyList(int eId);
	public int insertEvnetboardReply(EventboardReply eventboardReply);
	public int updateEvnetboardReply(EventboardReply eventboardReply);
	public int deleteEvnetboardReply(int ebrId);
}
