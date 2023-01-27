package com.azt.service;

import com.azt.common.Util;
import com.azt.dao.DogMemberDao;
import com.azt.dto.DogMember;

public class AccountService3 {
	
	DogMemberDao dogMemberDao = new DogMemberDao();
	
	public void registerDogMember(DogMember dogmember) {
		
		//String owner = dogmember.getOwner();
		//owner = Util.getHashedString(owner, "SHA-256"); // 암호화
		//dogmember.setOwner(owner);
	
		// MemberDao memberDao = new MemberDao();
		dogMemberDao.insertDogMember(dogmember);
		
	}

	public DogMember findDogMemberByOwner(DogMember dogmember) {
		
		//String owner = dogmember.getOwner();
		//owner = Util.getHashedString(owner, "SHA-256"); // 암호화
		//dogmember.setOwner(owner);
		
		// DogemberDao dogmemberDao = new DogMemberDao();
		DogMember dogmember2 = dogMemberDao.selectDogMemberByOwner(dogmember);
		
		return dogmember2;
	}

	
}