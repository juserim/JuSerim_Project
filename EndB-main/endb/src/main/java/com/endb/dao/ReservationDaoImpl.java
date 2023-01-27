package com.endb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;

import com.endb.dto.Check;
import com.endb.dto.Reservation;
import com.endb.dto.Room;

import lombok.Setter;


public class ReservationDaoImpl implements ReservationDao {

	
	@Setter
	private SqlSessionTemplate sqlSessionTemplate;

	private final String namespace = "com.endb.mapper.ReservationMapper";

	@Override
	public void reservation_number_people(Reservation dto) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert(namespace + ".reservation_number_people", dto);

	}

	@Override
	public int RoomPrice(Reservation dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(namespace + ".RoomPrice", dto);
	}

	@Override
	public void reservationInsert(Reservation dto) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.selectOne(namespace + ".reservationInsert", dto);
	}

	@Override
	public int DuplicateFind(Reservation dto) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(namespace + ".DuplicateFind", dto);
	}

	@Override
	public String PayCheck(String userNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(namespace + ".PayCheck", userNo);
	}

	@Override
	public void PayCheckUpdate(String number) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.selectOne(namespace + ".PayCheckUpdate", number);

	}

	@Override
	public void ReservationDelete() {
		// TODO Auto-generated method stub
		sqlSessionTemplate.selectOne(namespace + ".ReservationDelete");
		
	}
	@Override
	public List<Reservation> ReservationSelect(int userNo) {
		List<Reservation> list = sqlSessionTemplate.selectList(namespace+".ReservationSelect", userNo);
		return list;
	}
	@Override
	public String SearchPW(String userNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne(namespace+".SearchPW",userNo);
	}
	@Override
	public Room findAll(int roomId) {
		return sqlSessionTemplate.selectOne(namespace+".findAll",roomId);
	}
	@Override
	public List<Check> ReservationSelectByRoomId(int roomId) {
		List<Check> List = sqlSessionTemplate.selectList(namespace+".ReservationSelectByRoomId", roomId);
		return List;
	}
}
