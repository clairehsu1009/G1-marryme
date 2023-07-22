package com.marryme.member.dao;

import com.marryme.core.dao.CoreDao;
import com.marryme.member.vo.Member;

public interface MemberDao extends CoreDao<Member, String> {
	
	/** 搜尋使用者帳號 */
	Member selectByMemberId(String memberId);
	
	/** 搜尋登入使用者帳號密碼 */
	Member selectForLogin(String memberId, String memberPassword);

	void update(Integer id, Member pojo);

	
}