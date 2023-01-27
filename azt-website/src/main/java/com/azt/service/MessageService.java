package com.azt.service;

import java.util.List;

import com.azt.dao.MemberDao;
import com.azt.dao.MessageDao;
import com.azt.dto.Message;

public class MessageService {
	MessageDao messageDao = new MessageDao();

	public void sendMessage(Message messageDto) {
				
		messageDao.insertMessage(messageDto);
		
	}

	public List<Message> readMessage(String memberId) {
		List<Message> messageList = messageDao.readMessages(memberId);
		return messageList;
	}
	
	public List<Message> sendMessage(String memberId) {
		List<Message> messageList = messageDao.sendMessages(memberId);
		return messageList;
	}


	public Message findByMessageNo(int messageNo) {
		Message messages = messageDao.selectByMessageNo(messageNo);	
		return messages;
	}

	public void delete(int messageNo) {
		messageDao.deleteMessage(messageNo);
		
	}

	
	public List<Message> readMessagePage(String memberId, int pageNo, int pageSize) {
		int from = (pageNo - 1)* pageSize;
		int count = pageSize;
		
		List<Message> messageList = messageDao.selectByMessageRange(memberId, from, count);
		return messageList;
	}

	public int findMessageCount() {
		int count = messageDao.selectByReceiveMssCount();
		return count;
	}

	public List<Message> readMessagePage2(String memberId, int pageNo, int pageSize) {
		int from = (pageNo - 1)* pageSize;
		int count = pageSize;
		
		List<Message> messageList = messageDao.selectByMessageRange2(memberId, from, count);
		return messageList;
	}

	

	
}
