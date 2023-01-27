package com.endb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.endb.dto.Board;
import com.endb.dto.Reservation;
import com.endb.dto.User;

@Mapper
public interface MypageMapper {

	void editInfo(User user);
	User findUserInfo(int userNo);
	void userDelete(int userNo);
	List<Reservation> reservationInfo(int userNo);
	List<Board> boardInfo(int userNo);

}
