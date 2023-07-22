package com.marryme.member.dao;


import java.util.List;

import org.hibernate.Session;

import com.marryme.core.util.HibernateUtil;
import com.marryme.member.vo.Member;

public interface MemberDao{
	
	List<Member> selectAll();
	
	void insert(Member member);
	
	int update(Member member);
	
	int deleteById(Integer id);
	
	/** 搜尋使用者帳號 */
	Member selectByMemberId(String memberId);
	
	/** 搜尋登入使用者帳號密碼 */
	Member selectForLogin(String memberId, String memberPassword);

	
	 default Session getSession() {
	        return HibernateUtil.getSessionFactory().getCurrentSession();
	    }

	Member selectById(String memberId);



	
	
}