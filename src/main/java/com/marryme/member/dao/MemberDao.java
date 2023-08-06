package com.marryme.member.dao;

import java.util.List;

import org.hibernate.Session;

import com.marryme.core.util.HibernateUtil;
import com.marryme.member.vo.Member;

public interface MemberDao {

	List<Member> selectAll();

	void insert(Member member);

	void update(Member member);
	
	int updateById(Member member);
	
	int deleteById(Integer id);

	/** 搜尋會員帳號 */
	Member selectByMemberId(String memberId);

	/** 搜尋登入會員帳號密碼 */
	Member selectForLogin(String memberId, String memberPassword);


	default Session getSession() {
		return HibernateUtil.getSessionFactory().getCurrentSession();
	}

}