package com.endb.service;

import com.endb.common.Util;
import com.endb.dto.User;
import com.endb.mapper.UserMapper;

public class AccountServiceImpl implements AccountService {

	private UserMapper userMapper;
	
	public AccountServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Override
	public void register(User user) {		
		String passwd = user.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256"); // 암호화
		user.setPasswd(passwd);
		userMapper.insertUser(user);		
	}
	
	public User login(User user) {
		String passwd = user.getPasswd();
		passwd = Util.getHashedString(passwd, "SHA-256");
		user.setPasswd(passwd);
		
		User user2 = userMapper.login(user);
		return user2;
	}

	@Override
	public int checkId(String checkId) {

		int count = userMapper.checkId(checkId);
		return count; 
	}

}
