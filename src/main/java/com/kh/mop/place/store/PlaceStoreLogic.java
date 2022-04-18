package com.kh.mop.place.store;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.place.domain.Place;
import com.kh.mop.review.domain.Review;
import com.kh.mop.review.domain.ReviewPageInfo;

@Repository
public class PlaceStoreLogic implements PlaceStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Place> selectList() {
		return (ArrayList)sqlSession.selectList("PlaceMapper.selectList");
	}

	@Override
	public Place selectOne(int pId) {
		return sqlSession.selectOne("PlaceMapper.selectOne", pId);
	}

	@Override
	public ArrayList<Place> categoryList(Map m) {
		Object obj = m.get("pCode");
		ArrayList<Place> ctgList = null; 
		if (obj.equals("%all%") ) {
			ctgList = selectList(); 
		} else {
			ctgList = (ArrayList)sqlSession.selectList("PlaceMapper.selectCtgList", m);
		}
		return ctgList;
	}

	@Override
	public ArrayList<Review> reviewList(ReviewPageInfo pi, int vNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getReviewLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getReviewLimit());
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", vNo, rowBounds);
	}

}
