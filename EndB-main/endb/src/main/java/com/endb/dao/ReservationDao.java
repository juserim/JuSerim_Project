package com.endb.dao;

import java.util.List;

import com.endb.dto.Check;
import com.endb.dto.Reservation;
import com.endb.dto.Room;

public interface ReservationDao {
	
	public void reservation_number_people(Reservation dto);

	public int RoomPrice(Reservation dto);

	public void reservationInsert(Reservation dto);

	public int DuplicateFind(Reservation dto);

	public String PayCheck(String m_id);

	public void PayCheckUpdate(String number);
    
	public void ReservationDelete();
	
	public List<Reservation> ReservationSelect(int UserNo);
	
	public String SearchPW(String m_id);
	
	public Room findAll(int roomId);
	
	public List<Check> ReservationSelectByRoomId(int roomId);
}
