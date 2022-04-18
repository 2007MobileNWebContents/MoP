package com.kh.mop.review.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mop.review.domain.ReviewPageInfo;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.RvReply;
import com.kh.mop.review.domain.ReviewSelect;
import com.kh.mop.review.store.ReviewStore;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	public ReviewStore vStore;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Review> selectList(ReviewPageInfo pi, int vNo) {
		return vStore.selectList(pi, vNo);
	}
	
	@Override
	public Review selectReview(int vId) {
		return vStore.selectReview(vId);
	}

	@Override
	@Transactional
	public int insertReview(Review review) {
		return vStore.insertReview(review);
	}

	@Override
	@Transactional
	public int updateReview(Review review) {
		return vStore.updateReview(review);
	}

	@Override
	public int deleteReview(int vId) {
		return vStore.deleteReview(vId);
	}

	@Override
	@Transactional
	public int insertRvReply(RvReply rvReply) {
		return vStore.insertRvReply(rvReply);
	}

	@Override
	public ArrayList<RvReply> selectRvReplyList(int vId) {
		return vStore.selectRvReplyList(vId);
	}

	@Override
	public RvReply selectRvReply(int reId) {
		return vStore.selectRvReply(reId);
	}

	@Override
	@Transactional
	public int deleteRvReply(int reId) {
		return vStore.deleteRvReply(reId);
	}

	@Override
	public ArrayList<Review> selectBoxList(ReviewSelect select, int vNo) {
		return vStore.selectBoxList(select, vNo);
	}

}
