package com.endb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.endb.dto.Check;
import com.endb.dto.Reservation;
import com.endb.dto.Room;

@Mapper
public interface ReservationMapper {
	
	void reservation_number_people(Reservation dto);

	
	int RoomPrice(int roomId);

	void reservationInsert(Reservation dto);

	int DuplicateFind(Reservation dto);

	String PayCheck(int userNo);

	void PayCheckUpdate(int number);
    
	void ReservationDelete();
	
	List<Reservation> ReservationSelect(int userNo);
	
	String SearchPW(int userNo);
	
	Room findAll(int roomId);

	List<Reservation> ReservationSelectByRoomId(int roomId);
}
