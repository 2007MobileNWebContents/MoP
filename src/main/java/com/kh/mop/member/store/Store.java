package com.kh.mop.member.store;

import com.kh.mop.member.domain.Member;

public interface Store {
public Member selectOneMember(Member member);
	
	
	public int checkIdDup(String memberId);
	
	public int insertMember(Member member);
	
	public int updateMember(Member member);
	
	public int deleteMember(String memberId);

	public int reservationMember(Member member);
}
