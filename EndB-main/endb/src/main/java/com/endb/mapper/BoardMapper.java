package com.endb.mapper;

import java.util.HashMap;
import java.util.List;

import com.endb.dto.BoardComment;
import com.endb.dto.Comment;
import org.apache.ibatis.annotations.Mapper;

import com.endb.dto.Room;
import com.endb.dto.BoardAttach;

@Mapper
public interface BoardMapper {

	void insertBoard(Room room);

	List<Room> selectAll();

	List<Room> selectByRange(HashMap<String, Object> params);

	Room selectByBoardNo(int Room_id);

	void delete(int room_Id);

	void update(Room room);

	int selectBoardCount();

	void insertBoardAttach(BoardAttach attach);

	List<BoardAttach> selectBoardAttachByBoardNo(int Room_id);

	BoardAttach selectBoardAttachByAttachNo(int Room_id);

	void updateBoardReadCount(int Room_id);
	List<Comment> selectBoardComments(int Room_id);

	void insertReview(BoardComment comment);

	void deleteComment(int commentNo);

	void updateComment(BoardComment comment);
}