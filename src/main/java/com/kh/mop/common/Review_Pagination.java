package com.kh.mop.common;

import com.kh.mop.freeboard.domain.FreeBoardPageInfo;
import com.kh.mop.review.domain.ReviewPageInfo;

public class Review_Pagination {

	//PageInfo 객체를 리턴해주는 메소드를 추가
	//PageInfo라는 클래스는 페이징 처리에 필요한 데이터를 담는 클래스
	//클래스가 계속 생성이 되면 정보들이 초기화 되기 때문에
	//한번만 생성하여 정보를 저장할 수 있도록 해야함
	//그래서 그냥 메소드가 아닌 static 메소드로 만들어줌

	public static ReviewPageInfo getReviewPageInfo(int currentPage, int listCount) {
		//즉 pagination 클래스에서 만드는 페이징 처리에 대한 정보를
		//PageInfo 클래스가 저장을 하는 것임
		ReviewPageInfo pi = null;

		int pageLimit = 5; //한페이지에서 보여줄 네비게이션 수
		int maxPage;	//전체 페이지 중 가장 마지막 페이지
		int startPage; //현재 페이지에서 시작하는 첫번쩨 페이지
		int endPage; //현재 페이지에서 끝나는 마지막 페이지

		int boardLimit = 5; //한페이지에 보여줄 게시글 갯수

		//전체 게시그 갯수 123 한 페이지당 5개씩
		//총페이지수는 25페이지
		//0.1일때 int로 형변환하면 나머지 게시글이 짤리기 때문에
		//0.9를 더하여 크게만들어줌
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		//현재페이지에서 시작하는 첫번째 페이지 값
		startPage = (((int)((double)currentPage / pageLimit + 0.9)) -1) * pageLimit +1;

		//현재페이지에서 끝나는 마지막 페이지 값
		endPage = startPage + pageLimit -1;

		//오류방지용
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new ReviewPageInfo(currentPage, boardLimit, pageLimit, startPage , endPage, listCount, maxPage);
		return pi;
	}
}

