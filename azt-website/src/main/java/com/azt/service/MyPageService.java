package com.azt.service;

import java.util.List;

import com.azt.common.Util;
import com.azt.dao.DogMemberDao;
import com.azt.dao.MemberDao;
import com.azt.dao.MyPageDao;
import com.azt.dto.DogBreedIntro;
import com.azt.dto.DogMember;
import com.azt.dto.HotplaceBoard;
import com.azt.dto.Member;
import com.azt.dto.ShowMyDogBoard;
import com.azt.dto.ShowMyDogBoardComment;
import com.azt.dto.WalkingDogBoard;

public class MyPageService {
	
	MemberDao memberDao = new MemberDao();
	MyPageDao myPageDao = new MyPageDao();
	
	public Member findByMemberId(String memberId) {

		Member member = myPageDao.selectAll(memberId);
		return member;
	}

	public DogMember findByOwner(String owner) {

		DogMember dogMember = myPageDao.selectDogAll(owner);		
		return dogMember;
	}

	public List<ShowMyDogBoard> findShowMyDogBoardList(String writer) {
		
		List<ShowMyDogBoard> boardList = myPageDao.selectShowMyDogBoardList(writer);
		
		return boardList;
	}

	public List<HotplaceBoard> findHotPlaceBoardList(String writer) {
		
		List<HotplaceBoard> boardList2 = myPageDao.selectHotPlaceBoardList(writer);
		
		return boardList2;
	}

	public List<WalkingDogBoard> findWalkingDogBoardList(String writer) {
		
		List<WalkingDogBoard> boardList3 = myPageDao.selectWalkingDogBoardList(writer);
		
		return boardList3;
	}

	public List<DogBreedIntro> findDogBreedIntroList(String writer) {
		
		List<DogBreedIntro> boardList4 = myPageDao.selectListDogBreedIntroList(writer);
				
		return boardList4;
	}

	public int findShowMyDogBoardCount(String writer) {
		
		int count = myPageDao.selectShowMyDogBoardCount(writer);
		
		return count;
	}

	public int findHotPlaceBoardCount(String writer) {
		
		int count2 = myPageDao.selectHotPlaceBoardCount(writer);
		
		return count2;
	}

	public int findWalkingDogBoardCount(String writer) {
		
		int count3 = myPageDao.selectWalkingDogBoardCount(writer);
		
		return count3;
	}

	public int findBreedIntroCount(String writer) {
		
		int count4 = myPageDao.selectBreedIntroCount(writer);
		
		return count4;
	}

	public List<ShowMyDogBoardComment> findShowMyDogBoardComment(String writer) {
		
		List<ShowMyDogBoardComment> comments = myPageDao.selectShowMyDogBoarComment(writer);
		
		return comments;
	}

		
}
