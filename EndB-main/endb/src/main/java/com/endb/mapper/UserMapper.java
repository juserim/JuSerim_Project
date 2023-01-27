package com.endb.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.endb.dto.User;

@Mapper
public interface UserMapper {

	void insertUser(User user);
	User login(User user);
	int checkId(String checkId);


}
