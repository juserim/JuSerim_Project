package com.endb.service;

import com.endb.dto.User;

public interface AccountService {

	void register(User user);
	User login(User user);
	int checkId(String checkId);

}