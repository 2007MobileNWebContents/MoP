package com.kh.mop.freeboard.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.freeboard.domain.FreeBoard;
import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.freeboard.domain.FreeBoardReply;
import com.kh.mop.freeboard.domain.FreeBoardSearch;

@Repository
public class FreeBoardStoreLogic implements FreeBoardStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return sqlSession.selectOne("FreeBoardMapper.getListCount");
	}

	@Override
	public ArrayList<FreeBoard> selectList(FreeBoardPageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("FreeBoardMapper.selectList",null,rowBounds);
	}
	

	@Override
	public int addReadCount(int fId) {
		return sqlSession.update("FreeBoardMapper.updateCount",fId);
	}

	@Override
	public int addReplyCount(int refFBId) {
		return sqlSession.update("FreeBoardMapper.updateReplyCount",refFBId);
	}

	@Override
	public FreeBoard selectFreeBoard(int fId) {
		return sqlSession.selectOne("FreeBoardMapper.selectOne",fId);
	}

	@Override
	public int deleteReplyCount(int refFBId) {
		return sqlSession.update("FreeBoardMapper.deleteReplyCount",refFBId);
	}

	@Override
	public int updateFreeBoard(FreeBoard freeBoard) {
		return sqlSession.update("FreeBoardMapper.updateFreeBoard",freeBoard);
	}

	@Override
	public int deleteFreeBoard(int fId) {
		return sqlSession.update("FreeBoardMapper.deleteFreeBoard",fId);
	}

	@Override
	public int insertFreeBoard(FreeBoard freeBoard) {
		return sqlSession.insert("FreeBoardMapper.insertFreeBoard",freeBoard);
	}

	@Override
	public ArrayList<FreeBoardReply> selectFreeBoardReplyList(int fId) {
		return (ArrayList)sqlSession.selectList("FreeBoardMapper.selectFBReplyList",fId);
	}

	@Override
	public ArrayList<FreeBoard> selectSearchList(FreeBoardSearch search) {
		return (ArrayList)sqlSession.selectList("FreeBoardMapper.searchList",search);
	}

	@Override
	public int insertFreeBoardReply(FreeBoardReply freeBoardReply) {
		return sqlSession.insert("FreeBoardMapper.insertFBReply",freeBoardReply);
	}

	@Override
	public int updateFreeBoardReply(FreeBoardReply freeBoardReply) {
		return sqlSession.update("FreeBoardMapper.updateFBReply",freeBoardReply);
	}

	@Override
	public int deleteFreeBoardReply(int fbrId) {
		return sqlSession.update("FreeBoardMapper.deleteFBReply",fbrId);
	}

}
