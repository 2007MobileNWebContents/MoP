package com.kh.mop.member.service;

import com.kh.mop.member.domain.Member;

public interface MemberService {
	
	
	public Member loginMember(Member member);
	
	public int checkIdDup(String memberId);
	
	public int insertMember(Member member);
	
	public int updateMember(Member member);
	
	public int deleteMember(String memberId);
	
	public int reservationMember(Member member);

}