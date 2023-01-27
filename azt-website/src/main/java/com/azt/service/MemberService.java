package com.azt.service;

import java.util.List;

import com.azt.dao.MemberDao;
import com.azt.dto.Member;

public class MemberService {

	public List<Member> findMembers() {
		MemberDao memberDao = new MemberDao();
		List<Member> members = memberDao.findAllMembers();
		return members;
	}

}
