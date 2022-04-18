package com.kh.mop.eventboard.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.eventboard.domain.Eventboard;
import com.kh.mop.eventboard.domain.EventboardPageInfo;
import com.kh.mop.eventboard.domain.EventboardReply;

@Repository
public class EventboardStoreLogic implements EventboardStore {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Override
   public int getListCount() {
      return sqlSession.selectOne("EventBoardMapper.getListCount");
   }

   @Override
   public ArrayList<Eventboard> selectList(EventboardPageInfo pi) {
      int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
      return (ArrayList)sqlSession.selectList("EventBoardMapper.selectList",null,rowBounds);
   }

   @Override
   public int addReadCount(int eId) {
      return sqlSession.update("EventBoardMapper.updateCount", eId);
   }

   @Override
   public Eventboard selectEventboard(int eId) {
      Eventboard eb = sqlSession.selectOne("EventBoardMapper.selectOne", eId);
      return sqlSession.selectOne("EventBoardMapper.selectOne", eId);
   }

   @Override
   public int updateEvnetboard(Eventboard eventboard) {
      return sqlSession.update("EventBoardMapper.updateEventBoard", eventboard);
   }

   @Override
   public int deleteEvnetboard(int eId) {
      return sqlSession.delete("EventBoardMapper.deleteEventBoard", eId);
   }

   @Override
   public int insertEventboard(Eventboard eventboard) {
      return sqlSession.insert("EventBoardMapper.insertEventBoard", eventboard);
   }

   @Override
   public ArrayList<EventboardReply> selecteventboardReplyList(int eId) {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public int insertEvnetboardReply(EventboardReply eventboardReply) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int updateEvnetboardReply(EventboardReply eventboardReply) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int deleteEvnetboardReply(int ebrId) {
      // TODO Auto-generated method stub
      return 0;
   }

}