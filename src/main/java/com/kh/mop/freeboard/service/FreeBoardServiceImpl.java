package com.kh.mop.freeboard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.freeboard.domain.FreeBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.freeboard.domain.FreeBoardReply;
import com.kh.mop.freeboard.domain.FreeBoardSearch;
import com.kh.mop.freeboard.store.FreeBoardStore;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardStore fStore;
	
	@Override
	public int addReplyCount(int refFBId) {
		return fStore.addReplyCount(refFBId);
	}

	@Override
	public int getListCount() {
		return fStore.getListCount();
	}

	@Override
	public ArrayList<FreeBoard> selectList(FreeBoardPageInfo pi) {
		return fStore.selectList(pi);
	}

	@Override
	public int deleteReplyCount(int refFBId) {
		return fStore.deleteReplyCount(refFBId);
	}

	@Override
	public int addReadCount(int fId) {
		return fStore.addReadCount(fId);
	}

	@Override
	public FreeBoard selectFreeBoard(int fId) {
		return fStore.selectFreeBoard(fId);
	}

	@Override
	public int updateFreeBoard(FreeBoard freeBoard) {
		return fStore.updateFreeBoard(freeBoard);
	}

	@Override
	public int deleteFreeBoard(int fId) {
		return fStore.deleteFreeBoard(fId);
	}

	@Override
	public int insertFreeBoard(FreeBoard freeBoard) {
		return fStore.insertFreeBoard(freeBoard);
	}

	@Override
	public ArrayList<FreeBoard> selectSearchList(FreeBoardSearch search) {
		return fStore.selectSearchList(search);
	}

	@Override
	public ArrayList<FreeBoardReply> selectFreeBoardReplyList(int fId) {
		return fStore.selectFreeBoardReplyList(fId);
	}

	@Override
	public int insertFreeBoardReply(FreeBoardReply freeBoardReply) {
	return fStore.insertFreeBoardReply(freeBoardReply);
	}
	

	@Override
	public int updateFreeBoardReply(FreeBoardReply freeBoardReply) {
		return fStore.updateFreeBoardReply(freeBoardReply);
	}

	@Override
	public int deleteFreeBoardReply(int fbrId) {
		return fStore.deleteFreeBoardReply(fbrId);
	}

}
