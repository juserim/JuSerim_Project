package com.azt.service;

import java.util.List;

import com.azt.common.Util;
import com.azt.dao.DogMemberDao;
import com.azt.dao.MemberDao;
import com.azt.dao.MyPageDao;
import com.azt.dto.DogMember;
import com.azt.dto.Member;

public class AccountService2 {
	
	MemberDao memberDao = new MemberDao();
	MyPageDao myPageDao = new MyPageDao();
	
	public void registerMember(Member member) {
		
		String passwd = member.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256"); // 암호화
		member.setPasswd(passwd);
	
		MemberDao memberDao = new MemberDao();
		memberDao.insertMember(member);
		
	}
	

	public Member findMemberByIdAndPasswd(Member member) {
		
		String passwd = member.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256"); // 암호화
		member.setPasswd(passwd);
		
		MemberDao memberDao = new MemberDao();
		
		Member member2 = memberDao.selectMemberByIdAndPasswd(member);
		
		return member2;
	}
	
}
