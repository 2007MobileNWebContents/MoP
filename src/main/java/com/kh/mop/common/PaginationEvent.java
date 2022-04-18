package com.kh.mop.common;

import com.kh.mop.eventboard.domain.EventboardPageInfo;

public class PaginationEvent {
   public static EventboardPageInfo getEventBoardPageInfo(int currentPage, int listCount) {
      //즉 pagination 클래스에서 만드는 페이징 처리에 대한 정보를
      //PageInfo 클래스가 저장을 하는 것임
      EventboardPageInfo pi = null;

      int pageLimit = 5; //한페이지에서 보여줄 네비게이션 수
      int maxPage;   //전체 페이지 중 가장 마지막 페이지
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
      pi = new EventboardPageInfo(currentPage, boardLimit, pageLimit, startPage , endPage, listCount, maxPage);
      return pi;
   }
}