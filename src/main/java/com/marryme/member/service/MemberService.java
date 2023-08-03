package com.marryme.member.service;

import java.util.List;
import java.util.Map;

import com.marryme.core.service.CoreService;
import com.marryme.member.vo.Member;

public interface MemberService extends CoreService{
	
	boolean register(Member member);

	
	boolean login(Member member);

	boolean edit(Member member);
	
//	Member edit(Member member);
	
	List<Member> findAll();

	boolean remove(Integer id);
	
	Member findById(String memberId);
	
//	boolean findById(Member member);

//	void save(Member member);

	
	

}
