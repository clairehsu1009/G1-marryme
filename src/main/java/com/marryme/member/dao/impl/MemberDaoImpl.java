package com.marryme.member.dao.impl;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Root;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

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

//	@Override
//	public void update(Member member) {
//	    Member existingMember = getSession().get(Member.class, member.getMemberId());
//	    if (existingMember != null) {
//	        // 只set 可以修改的欄位
//	        if (member.getMemberPassword() != null && !member.getMemberPassword().isEmpty()) {
//	            existingMember.setMemberPassword(member.getMemberPassword());
//	        }
//	        existingMember.setMemberName(member.getMemberName());
//	        existingMember.setMemberPhone(member.getMemberPhone());
//	        existingMember.setMemberEmail(member.getMemberEmail());
//	        existingMember.setMemberAddress(member.getMemberAddress());
//	        existingMember.setMemberGender(member.getMemberGender());
//
//	        getSession().merge(existingMember);
//	    }
//	}
	
//	@Override
//	public int update(Member member) {
//		final StringBuilder hql = new StringBuilder()
//				.append("UPDATE Member SET ");
//		final String password = member.getMemberPassword();
//		if (password != null && !password.isEmpty()) {
//			hql.append("memberPassword = :memberPassword,");
//		}
//		 hql.append("memberName = :memberName, ")
//	       .append("memberPhone = :memberPhone, ")
//	       .append("memberEmail = :memberEmail, ")
//	       .append("memberAddress = :memberAddress, ")
//	       .append("memberGender = :memberGender, ")
//	       .append("memberLastLoginTime = NOW() ")
//	       .append("WHERE memberId = :memberId");
//		Query query = getSession().createQuery(hql.toString());
//		if (password != null && !password.isEmpty()) {
//			query.setParameter("memberPassword", member.getMemberPassword());
//		}
//		return query.setParameter("memberName", member.getMemberName())
//				.setParameter("memberPhone", member.getMemberPhone())
//				.setParameter("memberEmail", member.getMemberEmail())
//				.setParameter("memberAddress", member.getMemberAddress())
//				.setParameter("memberGender", member.getMemberGender())
//				.setParameter("memberId", member.getMemberId())
//				.executeUpdate();
//	}

	
	
	
	
	
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

//	@Override
//	public Member selectByMemberId(String memberId) {
//		Session session = getSession();
//		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
//		CriteriaQuery<Member> criteriaQuery = criteriaBuilder.createQuery(Member.class);
//		Root<Member> root = criteriaQuery.from(Member.class);
//		criteriaQuery.where(criteriaBuilder.equal(root.get("memberId"), memberId));
//		return session.createQuery(criteriaQuery).uniqueResult();
//	}

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
//    	final String memberId = member.getMemberId();
        // 只set 可以修改的欄位
        member.setMemberName(member.getMemberName());
        member.setMemberPhone(member.getMemberPhone());
        member.setMemberAddress(member.getMemberAddress());
        member.setMemberGender(member.getMemberGender());
        member.setMemberPassword(member.getMemberPassword());

        getSession().merge(member);

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
