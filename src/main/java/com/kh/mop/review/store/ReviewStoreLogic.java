package com.kh.mop.review.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.review.domain.ReviewPageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.RvReply;
import com.kh.mop.review.domain.ReviewSelect;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Review> selectList(ReviewPageInfo pi, int vNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getReviewLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getReviewLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", vNo, rowBounds);
	}
	
	@Override
	public Review selectReview(int vId) {
		return sqlSession.selectOne("reviewMapper.selectOne", vId);
	}

	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}

	@Override
	public int updateReview(Review review) {
		return sqlSession.update("reviewMapper.updateReview", review);
	}

	@Override
	public int deleteReview(int vId) {
		return sqlSession.update("reviewMapper.deleteReview", vId);
	}

	@Override
	public int insertRvReply(RvReply rvReply) {
		return sqlSession.insert("reviewMapper.insertRvReply", rvReply);
	}

	@Override
	public ArrayList<RvReply> selectRvReplyList(int vId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectRvReplyList", vId);
	}

	@Override
	public RvReply selectRvReply(int reId) {
		return sqlSession.selectOne("reviewMapper.selectRvReply", reId);
	}

	@Override
	public int deleteRvReply(int reId) {
		return sqlSession.delete("reviewMapper.deleteRvReply", reId);
	}

	@Override
	public ArrayList<Review> selectBoxList(ReviewSelect select, int vNo) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("select", select);
		paramMap.put("vNo", vNo);
		return (ArrayList)sqlSession.selectList("reviewMapper.selectBoxList", paramMap);
	}

}
