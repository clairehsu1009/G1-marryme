package com.marryme.member.service.Impl;

import java.util.List;

import com.marryme.member.dao.MemberDao;
import com.marryme.member.dao.impl.MemberDaoImpl;
import com.marryme.member.service.MemberService;
import com.marryme.member.vo.Member;

public class MemberServiceImpl implements MemberService{
	
	
	private MemberDao dao;

	public MemberServiceImpl() {
		dao = new MemberDaoImpl();
	}

	@Override
	public Member register(Member member) {
		if (member.getMemberId() == null) {
			member.setMessage("使用者名稱未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (member.getMemberPassword() == null) {
			member.setMessage("密碼未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (member.getMemberName() == null) {
			member.setMessage("使用者名稱未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (dao.selectByMemberId(member.getMemberId()) != null) {
			member.setMessage("信箱重複使用");
			member.setSuccessful(false);
			return member;
		}

//		member.setRoleId(2);
//		final int resultCount = dao.insert(member);
//		if (resultCount < 1) {
//			member.setMessage("註冊錯誤，請聯絡管理員!");
//			member.setSuccessful(false);
//			return member;
//		}

		member.setMessage("註冊成功");
		member.setSuccessful(true);
		return member;
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
		if (member == null) {
			member = new Member();
			member.setMessage("使用者名稱或密碼錯誤");
			member.setSuccessful(false);
			return member;
		}

		member.setMessage("登入成功");
		member.setSuccessful(true);
		return member;
	}

	@Override
	public Member edit(Member member) {
		final Member oMember = dao.selectByMemberId(member.getMemberId());
		member.setMemberPhone(oMember.getMemberPhone());
		member.setMemberEmail(oMember.getMemberEmail());
		member.setMemberAddress(oMember.getMemberAddress());
		member.setMemberId(member.getMemberId());
		final int resultCount = dao.update(member);
		member.setSuccessful(resultCount > 0);
		member.setMessage(resultCount > 0 ? "修改成功" : "修改失敗");
		return member;
	}

	@Override
	public List<Member> findAll() {
		return dao.selectAll();
	}

	@Override
	public boolean remove(Integer id) {
		return dao.deleteById(id) > 0;
	}

	@Override
	public boolean save(Member member) {
		return dao.update(member) > 0;
	}

}
