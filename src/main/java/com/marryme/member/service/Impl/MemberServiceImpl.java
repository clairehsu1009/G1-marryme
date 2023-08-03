package com.marryme.member.service.Impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import static com.marryme.common.CommonString.EXCEPTION;

import java.util.HashMap;
import java.util.Map;

import com.marryme.member.dao.MemberDao;
import com.marryme.member.dao.impl.MemberDaoImpl;
import com.marryme.member.service.MemberService;
import com.marryme.member.vo.Member;


public class MemberServiceImpl implements MemberService {

	private MemberDao dao;

	public MemberServiceImpl() {
		dao = new MemberDaoImpl();
	}

	public boolean register(Member member) {
	    if (member.getMemberId() == null || member.getMemberPassword() == null) {
	        return false;
	    }
	    
	    beginTransaction();
	    Member existingMember = dao.selectByMemberId(member.getMemberId());
	    try {
	        if (existingMember != null) {
	            rollback();
	            return false;
	        }
	        member.setMemberRegistrationTime(LocalDate.now());
	        dao.insert(member);
	        commit();
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        rollback();
	        return false;
	    }
	}



	public boolean login(Member member) {
	    final String username = member.getMemberId();
	    final String password = member.getMemberPassword();

	    if (username == null || password == null) {
	        return false;
	    }

	    beginTransaction();
	    member = dao.selectForLogin(username, password);
	    try {
	        if (member == null) {
	            rollback();
	            return false;
	        } else {
	            commit();
	            return true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        rollback();
	        return false;
	    }
	}

	@Override
	public boolean edit(Member member) {
		if (member == null) {
            return false;
		}
		
		if (member.getMemberId() == null) {
            return false;
		}
		
		try {
			beginTransaction();
			dao.update(member);
			commit();
			return true;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		     return false;
		}
	}
	
//	@Override
//	public Member edit(Member member) {
//		if (member == null) {
//			member = new Member();
//            return member;
//		}
//		
//		if (member.getMemberId() == null) {
//            return member;
//		}
//		
//		try {
//			beginTransaction();
//			dao.updateById(member);
//			commit();
//			return member;
//		} catch (Exception e) {
//			rollback();
//			e.printStackTrace();
//		     return member;
//		}
//	}
	
	
//	@Override
//	public Member findById(Member member) {
//		final String name = member.getMemberName();
//	    final String phone = member.getMemberPhone();
//	    final String address = member.getMemberAddress();
//	    try {
//	        beginTransaction();
//	        member = dao.update(member);
//	        commit();
//	    } catch (Exception e) {
//	        rollback();
//	        e.printStackTrace();
//	    }
//	    return member;
//	}
	
	@Override
	public Member findById(String memberId) {
	    Member member = null;
	    try {
	        beginTransaction();
	        member = dao.selectByMemberId(memberId);
	        commit();
	    } catch (Exception e) {
	        rollback();
	        e.printStackTrace();
	    }
	    return member;
	}
	
	
//	@Override
//	public boolean findById(Member member) {
//		final String name = member.getMemberName();
//	    final String phone = member.getMemberPhone();
//	    final String address = member.getMemberAddress();
//	    try {
//	        beginTransaction();
//	        member = dao.updateByMember(name, phone, address);
//	        commit();
//	    } catch (Exception e) {
//	        rollback();
//	        e.printStackTrace();
//	    }
//	    return false;
//	}

	@Override
	public List<Member> findAll() {
		List<Member> memberList = new ArrayList<>();
		try {
			beginTransaction();
			memberList = dao.selectAll();
			commit();
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
		}
		return memberList;
	}

	@Override
	public boolean remove(Integer id) {
		try {
			beginTransaction();
			final int resultCount = dao.deleteById(id);
			commit();
			return resultCount > 0;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
			return false;
		}
	}

//	@Override
//    public void save(Member member) {
//        try {
//            beginTransaction();
//            Session session = dao.getSession();
//            Member persistentMember = (Member) session.merge(member); // 將 member 物件合併為持久狀態
//            dao.update(persistentMember);
//            commit();
//        } catch (Exception e) {
//            rollback();
//            e.printStackTrace();
//        }
//    }

}
