package com.kh.mop.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mop.member.domain.Member;
import com.kh.mop.member.store.Store;
@Service
public class ServiceImpl implements MemberService{
	
	@Autowired
	private Store store;

	@Override
	public Member loginMember(Member member) {
		return store.selectOneMember(member);
	}

	@Override
	public int checkIdDup(String memberId) {
		return store.checkIdDup(memberId);
	}

	@Override
	public int insertMember(Member member) {
		return store.insertMember(member);
	}

	@Override

	public int updateMember(Member member) {
		return store.updateMember(member);
	}

	@Override
	public int reservationMember(Member member) {
		System.out.println("This is MemberServiceImpl" + member);
		return store.reservationMember(member);
	}

	@Override
	public int deleteMember(String memberId) {
		return store.deleteMember(memberId);
	}

}
