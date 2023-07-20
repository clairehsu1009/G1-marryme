package com.marryme.member.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.member.vo.Member;

public interface MemberDao extends CoreDao<Member, Integer> {
	
	Member selectByMemberId(String memberId);
	
	Member selectForLogin(String username, String password);
}