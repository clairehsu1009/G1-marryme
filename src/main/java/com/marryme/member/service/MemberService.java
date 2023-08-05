package com.marryme.member.service;

import java.util.List;

import com.marryme.core.service.CoreService;
import com.marryme.member.vo.Member;

public interface MemberService extends CoreService{
	
	
	Member register(Member member);

	Member login(Member member);
	
	
	Member edit(Member member);
	
	List<Member> findAll();

	boolean remove(Integer id);
	
	Member findById(String memberId);
	
//	boolean findById(Member member);

//	void save(Member member);

	
	

}
