package com.endb.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.endb.dto.Message;
import com.endb.dto.User;

@Mapper
public interface MessageMapper {
	
	void insertMessage(Message message);
	
	List<Message> selectAll();

	int selectMessageCount(int userNo);
	
	int selectMessageCount2(int userNo);
	
	Message selectByMessageNo(int messageNo);

	void delete(int messageNo);

	void update(Message message);
	
	List<User> selectUserId();

	void receiver(User user);

	List<Message> selectByRange(@Param("from") int from, @Param("count") int count, @Param("userNo")int userNo);
	
	List<Message> selectByRange2(@Param("from") int from, @Param("count") int count, @Param("userNo")int userNo);

	List<Message> selectMessageList(String userId);

	List<Message> selectMessageListByUserNo(int userNo);
	
	void insertReplyMessage(Message message);


}
