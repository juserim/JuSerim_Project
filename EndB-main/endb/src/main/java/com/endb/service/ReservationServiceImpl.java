package com.endb.service;

import java.util.List;

import org.apache.ibatis.cache.CacheKey;

import com.endb.dao.ReservationDao;
import com.endb.dto.Check;
import com.endb.dto.Reservation;
import com.endb.dto.Room;
import com.endb.mapper.ReservationMapper;

import lombok.Setter;

public class ReservationServiceImpl implements ReservationService{
	
	@Setter
	private ReservationDao reservationDao;
	
	@Setter
	private ReservationMapper reservationMapper;

	@Override
	public void reservation_number_people(Reservation dto) {
		reservationMapper.reservation_number_people(dto);
	}

	@Override
	public int RoomPrice(int roomId) {

		return reservationMapper.RoomPrice(roomId);
	}

	@Override
	public void reservationInsert(Reservation dto) {

		reservationMapper.reservationInsert(dto);
	}

	@Override
	public int DuplicateFind(Reservation dto) {

		return reservationMapper.DuplicateFind(dto);
	}

	@Override
	public String PayCheck(int m_id) {

		return reservationMapper.PayCheck(m_id);
	}

	@Override
	public void PayCheckUpdate(int number) {

		reservationMapper.PayCheckUpdate(number);

	}
	@Override
	public void ReservationDelete() {
		// TODO Auto-generated method stub
		reservationMapper.ReservationDelete();
		
	}
	@Override
	public List<Reservation> ReservationSelect(int userNo) {
		// TODO Auto-generated method stub
		return reservationMapper.ReservationSelect(userNo);
	}
	
	@Override
	public String SearchPW(int m_id) {
		// TODO Auto-generated method stub
		return reservationMapper.SearchPW(m_id);
	}
	@Override
	public Room findAll(int roomId) {
		return reservationMapper.findAll(roomId);
	}
	@Override
	public List<Reservation> ReservationSelectByRoomId(int roomId) {
		
		return reservationMapper.ReservationSelectByRoomId(roomId);
	}
}
