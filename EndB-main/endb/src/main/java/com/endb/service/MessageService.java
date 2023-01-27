package com.endb.service;

import java.util.List;

import com.endb.dto.Message;
import com.endb.dto.User;

public interface MessageService {

	
	void writeMessage(Message message);
	
	List<Message> findAll();

	int findMessageCount(int userNo);
	
	int findMessageCount2(int userNo);

	Message findByMessageNo(int messageNo);

	void delete(int messageNo);

	void update(Message message);

	List<User> findUserList();

	void receiver(User user);

	List<Message> findByPage(int pageNo, int pageSize, int userNo);
    
	List<Message> findByPage2(int pageNo, int pageSize, int userNo);
	
	void replyMessage(Message message);

	List<Message> findAllList();

}
