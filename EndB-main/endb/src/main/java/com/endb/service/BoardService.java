package com.endb.service;

import java.util.List;

import com.endb.dto.Comment;
import com.endb.dto.Room;
import com.endb.dto.BoardAttach;
import com.endb.dto.BoardComment;

public interface BoardService {

	void writeBoard(Room room);
	List<Room> findAll();
	List<Room> findByPage(int pageNo, int pageSize);
	Room findByBoardNo(int room_id);
	void delete(int room_id);
	
	  void update(Room room); 
	  int findBoardCount(); 
	  BoardAttach findBoardAttachByAttachNo(int attachNo);
	 


	void writeBoardComment(BoardComment comment);
	List<Comment> findCommentsByBoardNo(int room_id);
	void deleteComment(int commentNo);
	void updateBoardComment(BoardComment comment);

}