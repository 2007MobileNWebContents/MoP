package com.kh.mop.freeboard.store;

import java.util.ArrayList;

import com.kh.mop.freeboard.domain.FreeBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.freeboard.domain.FreeBoardReply;
import com.kh.mop.freeboard.domain.FreeBoardSearch;

public interface FreeBoardStore {
	public int getListCount();
	public ArrayList<FreeBoard> selectList(FreeBoardPageInfo pi) ;
	public int addReadCount(int fId);
	public FreeBoard selectFreeBoard(int fId);
	public int updateFreeBoard(FreeBoard freeBoard);
	public int deleteFreeBoard(int fId);
	public int insertFreeBoard(FreeBoard freeBoard);
	public ArrayList<FreeBoardReply> selectFreeBoardReplyList(int fId);
	public int insertFreeBoardReply(FreeBoardReply freeBoardReply);
	public int updateFreeBoardReply(FreeBoardReply freeBoardReply);
	public int deleteFreeBoardReply(int fbrId);
	public int addReplyCount(int refFBId);
	public int deleteReplyCount(int refFBId);
	public ArrayList<FreeBoard> selectSearchList(FreeBoardSearch search);
}
