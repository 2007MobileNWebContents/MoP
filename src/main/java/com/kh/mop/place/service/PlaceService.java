package com.kh.mop.place.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.mop.place.domain.Place;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.ReviewPageInfo;

public interface PlaceService {
	
	// place 리스트 전체 출력
	public ArrayList<Place> selectList();
	
	// place 상세 페이지 출력 하기 위한 selectOne 
	public Place selectOne(int pId); 
	
	// place category별 페이지 출력 
	public ArrayList<Place> categoryList(Map m);
	
	public ArrayList<Review> reviewList(ReviewPageInfo pi, int vNo); 
	
}
