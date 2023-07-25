package com.marryme.member.service.Impl;

import java.util.ArrayList;
import java.util.List;

import com.marryme.member.dao.MemberDao;
import com.marryme.member.dao.impl.MemberDaoImpl;
import com.marryme.member.service.MemberService;
import com.marryme.member.vo.Member;

public class MemberServiceImpl implements MemberService {

	private MemberDao dao;

	public MemberServiceImpl() {
		dao = new MemberDaoImpl();
	}

	@Override
	public Member register(Member member) {
		if (member.getMemberId() == null) {
			member.setMessage("帳號未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (member.getMemberPassword() == null) {
			member.setMessage("密碼未輸入");
			member.setSuccessful(false);
			return member;
		}

		beginTransaction();
		try {
			if (dao.selectByMemberId(member.getMemberId()) != null) {
				member.setMessage("信箱重複使用");
				member.setSuccessful(false);
				rollback();
				return member;
			}
			dao.insert(member);
			commit();
			member.setMessage("註冊成功");
			member.setSuccessful(true);
			return member;
		} catch (Exception e) {
			e.printStackTrace();
			member.setMessage("註冊錯誤，請聯絡管理員!");
			member.setSuccessful(false);
			rollback();
			return member;
		}
	}

	@Override
	public Member login(Member member) {
		final String username = member.getMemberId();
		final String password = member.getMemberPassword();

		if (username == null) {
			member.setMessage("使用者名稱未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (password == null) {
			member.setMessage("密碼未輸入");
			member.setSuccessful(false);
			return member;
		}

		member = dao.selectForLogin(username, password);
		beginTransaction();
		try {
			if (member == null) {
				member = new Member();
				member.setMessage("使用者名稱或密碼錯誤");
				member.setSuccessful(false);
				rollback();
				return member;
			}
			commit();
			member.setMessage("登入成功");
			member.setSuccessful(true);
			return member;
		} catch (Exception e) {
			e.printStackTrace();
			member.setMessage("登入錯誤,請重新確認");
			member.setSuccessful(false);
			rollback();
			return member;
		}
	}

	@Override
	public Member edit(Member member) {
	    try {
	        beginTransaction();
	        Member persistedMember = dao.selectByMemberId(member.getMemberId());
	        if (persistedMember == null) {
	            member.setMessage("會員不存在");
	            member.setSuccessful(false);
	            rollback();
	            return member;
	        }
	        // 更新會員資料
	        persistedMember.setMemberPhone(member.getMemberPhone());
	        persistedMember.setMemberEmail(member.getMemberEmail());
	        persistedMember.setMemberAddress(member.getMemberAddress());
	        persistedMember.setMemberGender(member.getMemberGender());
	        int resultCount = dao.update(persistedMember);
	        commit();
	        member.setSuccessful(resultCount > 0);
	        member.setMessage(resultCount > 0 ? "修改成功" : "修改失敗");
	        return member;
	    } catch (Exception e) {
	        e.printStackTrace();
	        member.setMessage("修改失敗");
	        member.setSuccessful(false);
	        rollback();
	        return member;
	    }
	}

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

	@Override
	public boolean save(Member member) {
		try {
			beginTransaction();
			final int resultCount = dao.update(member);
			commit();
			return resultCount > 0;
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
			return false;
		}
	}

}
