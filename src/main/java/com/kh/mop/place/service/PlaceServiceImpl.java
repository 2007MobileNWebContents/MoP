package com.kh.mop.place.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.place.domain.Place;
import com.kh.mop.place.store.PlaceStore;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.ReviewPageInfo;
import com.kh.mop.review.store.ReviewStore;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired 
	private PlaceStore pStore;
	
	@Autowired
	private ReviewStore rStore;
	
	@Override
	public ArrayList<Place> selectList() {
		return pStore.selectList();
				
	}

	@Override
	public Place selectOne(int pId) {
		return pStore.selectOne(pId);
	}

	@Override
	public ArrayList<Place> categoryList(Map m) {
		return pStore.categoryList(m);
	}

	@Override
	public ArrayList<Review> reviewList(ReviewPageInfo pi, int vNo) {
		return rStore.selectList(pi, vNo);
	}

}
