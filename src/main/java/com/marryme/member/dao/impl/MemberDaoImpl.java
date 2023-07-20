package com.marryme.member.dao.impl;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.marryme.member.dao.MemberDao;
import com.marryme.member.vo.Member;
import com.marryme.plan.vo.Item;

public class MemberDaoImpl implements MemberDao{
	
	public Integer insert(Member member) {
		getSession().persist(member);
		return 1;
	}
	
	public void deleteById(Integer id) {
		Session session = getSession();
		Member member = session.load(Member.class, id);
		session.remove(member);
	}
	
	public void update(String id, Member vo) {
	    final StringBuilder hql = new StringBuilder()
	            .append("UPDATE Member SET ");
	    final String password = vo.getMemberPassword();
	    if (password != null && !password.isEmpty()) {
	        hql.append("memberPassword = :password, ");
	    }
	    hql.append("memberName = :memberName, ")
	            .append("memberPhone = :memberPhone, ")
	            .append("memberEmail = :memberEmail, ")
	            .append("memberAddress = :memberAddress, ")
	            .append("memberRegistrationTime = NOW(), ")
	            .append("memberLastLoginTime = NOW() ")
	            .append("WHERE memberId = :memberId");
	    Query query = getSession().createQuery(hql.toString());
	    if (password != null && !password.isEmpty()) {
	        query.setParameter("password", vo.getMemberPassword());
	    }
	    query.setParameter("memberName", vo.getMemberName())
	            .setParameter("memberPhone", vo.getMemberPhone())
	            .setParameter("memberEmail", vo.getMemberEmail())
	            .setParameter("memberAddress", vo.getMemberAddress())
	            .setParameter("memberId", vo.getMemberId())
	            .executeUpdate();
	}
	
	public Member selectById(Integer id) {
        return getSession().get(Member.class, id);
    }
	
	public List<Member> selectAll() {
		final String hql = "FROM Member ORDER BY id";
		return getSession()
				.createQuery(hql, Member.class)
				.getResultList();
	}
	
	public Member selectByMemberId(String memberId) {
		Session session = getSession();
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Member> criteriaQuery = criteriaBuilder.createQuery(Member.class);
		Root<Member> root = criteriaQuery.from(Member.class);
		criteriaQuery.where(criteriaBuilder.equal(root.get("memberId"), memberId));
		return session.createQuery(criteriaQuery).uniqueResult();
	}
	
	
	public Member selectForLogin(String memberId, String memberPassword) {
		final String sql = "select * from MEMBER "
				+ "where member_id = :memberId and member_password = :memberPassword";
		return getSession().createNativeQuery(sql, Member.class)
				.setParameter("memberId", memberId)
				.setParameter("memberPassword", memberPassword)
				.uniqueResult();
	}

	@Override
	public void update(Integer id, Member pojo) {
		// TODO Auto-generated method stub
		
	}

	
	

}
