package com.endb.service;

import java.util.List;

import com.endb.dto.Board;
import com.endb.dto.Reservation;
import com.endb.dto.User;

public interface MypageService {

	void editInfo(User user);

	User findUserInfo(int userNo);

	void userDelete(int userNo);

	List<Reservation> reservationInfo(int userNo);

	List<Board> boardInfo(int userNo);

}