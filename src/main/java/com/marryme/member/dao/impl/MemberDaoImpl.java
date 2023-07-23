package com.marryme.member.dao.impl;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;

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
	public int update(Member member) {
		final StringBuilder hql = new StringBuilder()
				.append("UPDATE Member SET ");
		final String password = member.getMemberPassword();
		if (password != null && !password.isEmpty()) {
			hql.append("password = :password,");
		}
		hql.append("memberName = :memberName, ")
			.append("memberPhone = :memberPhone, ")
			.append("memberEmail = :memberEmail, ")
			.append("memberAddress = :memberAddress, ")
			.append("memberGender = :memberGender, ")
			.append("memberLastLoginTime = NOW() ")
			.append("WHERE memberId = :memberId");
		Query query = getSession().createQuery(hql.toString());
		if (password != null && !password.isEmpty()) {
			query.setParameter("password", member.getMemberPassword());
		}
		return query.setParameter("memberName", member.getMemberName())
		        .setParameter("memberPhone", member.getMemberPhone())
		        .setParameter("memberEmail", member.getMemberEmail())
		        .setParameter("memberAddress", member.getMemberAddress())
		        .setParameter("memberGender", member.getMemberGender())
		        .setParameter("memberId", member.getMemberId())
				.executeUpdate();
	}
	@Override
	public Member selectById(String memberId) {
		return getSession().get(Member.class, memberId);
	}

	@Override
	public List<Member> selectAll() {
		final String hql = "FROM Member ORDER BY memberid";
		return getSession()
				.createQuery(hql, Member.class)
				.getResultList();
	}

	@Override
	public Member selectByMemberId(String memberId) {
		Session session = getSession();
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Member> criteriaQuery = criteriaBuilder.createQuery(Member.class);
		Root<Member> root = criteriaQuery.from(Member.class);
		criteriaQuery.where(criteriaBuilder.equal(root.get("memberId"), memberId));
		return session.createQuery(criteriaQuery).uniqueResult();
	}

	@Override
	public Member selectForLogin(String memberId, String memberPassword) {
		final String sql = "select * from MEMBER "
				+ "where memberId = :memberId and memberPassword = :memberPassword";
		return getSession().createNativeQuery(sql, Member.class)
				.setParameter("memberId", memberId)
				.setParameter("memberPassword", memberPassword)
				.uniqueResult();
	}


}
