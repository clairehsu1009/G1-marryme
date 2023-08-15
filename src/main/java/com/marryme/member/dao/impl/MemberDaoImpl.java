package com.marryme.member.dao.impl;


import java.util.List;

import org.hibernate.Session;

import com.marryme.member.dao.MemberDao;
import com.marryme.member.vo.Member;

public class MemberDaoImpl implements MemberDao{
	
	public void insert(Member member) {
	    getSession().persist(member);
	}

	@Override
	public int deleteById(Integer id) {
		Session session = getSession();
		Member member = session.load(Member.class, id);
		session.remove(member);
		return 1;
	}

	
	
	
	@Override
	public Member selectByMemberId(String memberId) {
		return getSession().get(Member.class, memberId);
	}
	
	
	

	@Override
	public List<Member> selectAll() {
		final String hql = "FROM Member ORDER BY memberId";
		return getSession()
				.createQuery(hql, Member.class)
				.getResultList();
	}


	@Override
	public Member selectForLogin(String memberId, String memberPassword) {
		final String sql = "select * from MEMBER "
				+ "where member_id = :memberId and member_password = :memberPassword";
		return getSession().createNativeQuery(sql, Member.class)
				.setParameter("memberId", memberId)
				.setParameter("memberPassword", memberPassword)
				.uniqueResult();
	}

	
	
	public void update(Member member) {
	    if (member == null || member.getMemberId() == null) {
	        return;
	    }
	    
	    Member existingMember = getSession().get(Member.class, member.getMemberId());
	    
	    if (existingMember == null) {
	        return;
	    }
	    
	    if (member.getMemberName() != null) {
	        existingMember.setMemberName(member.getMemberName());
	    }
	    
	    if (member.getMemberPhone() != null) {
	        existingMember.setMemberPhone(member.getMemberPhone());
	    }
	    
	    if (member.getMemberAddress() != null) {
	        existingMember.setMemberAddress(member.getMemberAddress());
	    }
	    
	    if (member.getMemberGender() != null) {
	        existingMember.setMemberGender(member.getMemberGender());
	    }
	    
	    if (member.getMemberPassword() != null) {
	        existingMember.setMemberPassword(member.getMemberPassword());
	    }
	    
	    getSession().merge(existingMember);
	}
	
	
	
	
	@Override
	public int updateById(Member member) {
		final String memberId = member.getMemberId();
		if (memberId == null || memberId.isEmpty()) {
			return -1;
		}
		
		Session session = getSession();
		final Member oMember = session.get(Member.class, memberId);
		final String name = member.getMemberName();
		if (name != null && !name.isEmpty()) {
			oMember.setMemberName(name);
		}
		
		final String phone = member.getMemberPhone();
		if (phone != null && !phone.isEmpty()) {
			oMember.setMemberPhone(phone);
		}
		
		final String address = member.getMemberAddress();
		if (address != null && !address.isEmpty()) {
			oMember.setMemberAddress(address);
		}
		
		final String pwd = member.getMemberPassword();
		if (pwd != null && !pwd.isEmpty()) {
			oMember.setMemberPassword(pwd);
		}
		
		return 1;
	}
}
