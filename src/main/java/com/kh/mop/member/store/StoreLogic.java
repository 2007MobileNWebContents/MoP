package com.kh.mop.member.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mop.member.domain.Member;

@Repository
public class StoreLogic implements Store{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int checkIdDup(String memberId) {
		int result = sqlSession.selectOne("MemberMapper.checkIdDup",memberId);
		return result;
	}

	@Override
	public int insertMember(Member member) {
		int result = sqlSession.insert("MemberMapper.insertMember",member);
		return result;
		}

	@Override
	public int updateMember(Member member) {
		int result = sqlSession.update("MemberMapper.updateMember",member);
		return result;
	}

	@Override

	public int deleteMember(String memberId) {
		int result = sqlSession.delete("MemberMapper.deleteMember",memberId);
		return result;
	}
	
	@Override
	public int reservationMember(Member member) {
		System.out.println("this is MemberStoreLogic");
		return sqlSession.update("MemberMapper.reservationMember",member);
		/* System.out.println("StoreLogic" + result); */
		

	}

	@Override
	public Member selectOneMember(Member member) {
		Member loginMember = sqlSession.selectOne("MemberMapper.selectOne",member);
		return loginMember;
	}

}
