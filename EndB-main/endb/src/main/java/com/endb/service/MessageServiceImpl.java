package com.endb.service;

import java.util.HashMap;
import java.util.List;

import com.endb.dto.Message;
import com.endb.dto.User;
import com.endb.mapper.MessageMapper;

import lombok.Setter;

public class MessageServiceImpl implements MessageService{

	@Setter
	private MessageMapper messageMapper;
//	public void setMessageMapper(MessageMapper messageMapper) {
//		this.messageMapper = messageMapper;
//	}
	
	
	@Override
	public void writeMessage(Message message) {
	
		messageMapper.insertMessage(message);
		
	}

	@Override
	public List<Message> findAll() {
		
		List<Message> messageList = messageMapper.selectAll();
		
		return messageList;
	}
	
	@Override
	public List<Message> findAllList() {
		
		List<Message> messageSandList = messageMapper.selectAll();
		
		return messageSandList;
		
	}
		
	
	@Override
	public List<Message> findByPage2(int pageNo, int pageSize, int userNo) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("from", from);
//		params.put("count", count);
//		params.put("userNo", userNo);
//		
		List<Message> messageList = messageMapper.selectByRange2(from, count, userNo);
		return messageList;
		
	
	}
	
	
	@Override
	public List<Message> findByPage(int pageNo, int pageSize, int userNo) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
//		HashMap<String, Object> params = new HashMap<>();
//		params.put("from", from);
//		params.put("count", count);
		
		List<Message> messageList = messageMapper.selectByRange(from, count, userNo);
		return messageList;
 	}
	
	
	@Override
	public Message findByMessageNo(int messageNo) {
		Message message = messageMapper.selectByMessageNo(messageNo);
		return message;
	}
	
	
	
	@Override
	public int findMessageCount(int userNo) {
		int count = messageMapper.selectMessageCount(userNo);
		return count;
	}
	@Override
	public int findMessageCount2(int userNo) {
		int count = messageMapper.selectMessageCount2(userNo);
		return count;
	}
	
	@Override
	public List<User> findUserList() {
		List<User> userList = messageMapper.selectUserId();
		return userList;
	}
 	
	@Override
	public void replyMessage(Message message) {
		
		messageMapper.insertReplyMessage(message);
		
	}
	
	@Override
	public void delete(int messageNo) {
		messageMapper.delete(messageNo);
	}
	
	@Override
	public void update(Message message) {
		
		messageMapper.update(message);
		
	}

	@Override
	public void receiver(User user) {
		messageMapper.receiver(user);
	}


	

}
