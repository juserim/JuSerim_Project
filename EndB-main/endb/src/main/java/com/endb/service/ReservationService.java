package com.endb.service;

import java.util.List;

import com.endb.dto.Check;
import com.endb.dto.Reservation;
import com.endb.dto.Room;

public interface ReservationService {
	public void reservation_number_people(Reservation dto);

	public int RoomPrice(int roomId);

	public void reservationInsert(Reservation dto);

	public int DuplicateFind(Reservation dto);

	public String PayCheck(int m_id);

	public void PayCheckUpdate(int number);
	
	public void ReservationDelete();
	
	public List<Reservation> ReservationSelect(int userNo);
	
	public String SearchPW(int m_id);

	public Room findAll(int roomId);

	public List<Reservation> ReservationSelectByRoomId(int roomId);
}
