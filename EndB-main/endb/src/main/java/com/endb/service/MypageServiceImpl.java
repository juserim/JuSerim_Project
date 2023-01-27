package com.endb.service;

import java.util.List;

import com.endb.common.Util;
import com.endb.dto.Board;
import com.endb.dto.Reservation;
import com.endb.dto.User;
import com.endb.mapper.MypageMapper;
import com.endb.mapper.UserMapper;

public class MypageServiceImpl implements MypageService{

	private MypageMapper mypageMapper;
	
	public MypageServiceImpl(MypageMapper mypageMapper) {
		this.mypageMapper = mypageMapper;
	}

	@Override
	public void editInfo(User user) {

		mypageMapper.editInfo(user);
	}

	@Override
	public User findUserInfo(int userNo) {

		User user = mypageMapper.findUserInfo(userNo);
		return user;
	}

	@Override
	public void userDelete(int userNo) {

		mypageMapper.userDelete(userNo);
	}

	@Override
	public List<Reservation> reservationInfo(int userNo) {

		List<Reservation> reservationList = mypageMapper.reservationInfo(userNo);
		
		return reservationList;
	}

	@Override
	public List<Board> boardInfo(int userNo) {
		
		List<Board> boardList = mypageMapper.boardInfo(userNo);
		
		return boardList;
	}
	
}
