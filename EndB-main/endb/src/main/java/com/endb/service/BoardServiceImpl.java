package com.endb.service;

import java.util.HashMap;
import java.util.List;

import com.endb.dto.BoardAttach;
import com.endb.dto.BoardComment;
import com.endb.dto.Comment;
import com.endb.dto.Room;
import com.endb.mapper.BoardMapper;

import lombok.Setter;

public class BoardServiceImpl implements BoardService {

    @Setter
    private BoardMapper boardMapper; // Spring Mybatis가 자동으로 생성한 DAO 주입

    @Override
    public void writeBoard(Room room) {

        // 게시물 데이터를 DB에 저장
        // c1. 이 위치에서 boardNo : 없음
        // boardDao.insertBoard(board); // c1., c2. 를 반영해서 insertBoard에서 boardNo 조회하도록 구현
        boardMapper.insertBoard(room);
        // c2. 이 위치에서 boardNo : 데이터베이스에 있음 ( 데이터베이스의 boardNo를 조회할 필요 있음 )

        // 첨부파일 데이터를 DB에 저장
        if (room.getFiles() != null) {
            for (BoardAttach file : room.getFiles()) {
                file.setRoomId(room.getRoom_id()); // insertBoard 실행할 때 조회된 자동증가 boardNo 사용
                // boardDao.insertBoardAttach(file);
                boardMapper.insertBoardAttach(file);
            }
        }

    }

    @Override
    public List<Room> findAll() {

        // List<Board> boardList = boardDao.selectAll();
        List<Room> boardList = boardMapper.selectAll();
        return boardList;
    }

    @Override
    public List<Room> findByPage(int pageNo, int pageSize) {

        int from = (pageNo - 1) * pageSize;
        int count = pageSize;

        HashMap<String, Object> params = new HashMap<>();
        params.put("from", from);
        params.put("count", count);

        // List<Board> boardList = boardDao.selectByRange(params);
        List<Room> boardList = boardMapper.selectByRange(params);

        return boardList;
    }

    @Override
    public Room findByBoardNo(int room_id) {

        // Board board = boardDao.selectByBoardNo(boardNo); // 게시물 데이터 조회
        Room room = boardMapper.selectByBoardNo(room_id); // 게시물 데이터 조회

        // List<BoardAttach> files = boardDao.selectBoardAttachByBoardNo(boardNo);	// 첨부 파일 데이터 조회
        List<BoardAttach> files = boardMapper.selectBoardAttachByBoardNo(room_id);    // 첨부 파일 데이터 조회
        for (BoardAttach file : files) {
            System.out.println("file = " + file);
        }
        if (files != null && room != null) {
            room.cloneFiles(files);
        }

        // boardDao.updateBoardReadCount(boardNo);
        //boardMapper.updateBoardReadCount(room_id);
        /* room.setReadCount(room.getReadCount() + 1); */

        return room;
    }

    @Override
    public void delete(int room_id) {

        boardMapper.delete(room_id);
    }

    @Override
    public void update(Room room) {

        // boardDao.update(board);
        boardMapper.update(room);

    }

    @Override
    public int findBoardCount() {
        // int count = boardDao.selectBoardCount();
        int count = boardMapper.selectBoardCount();
        return count;
    }

    @Override
    public BoardAttach findBoardAttachByAttachNo(int attachNo) {
        // BoardAttach attach = boardDao.selectBoardAttachByAttachNo(attachNo);
        BoardAttach attach = boardMapper.selectBoardAttachByAttachNo(attachNo);
        return attach;
    }


    @Override
    public void writeBoardComment(BoardComment comment) {
        boardMapper.insertReview(comment);
    }

    @Override
    public List<Comment> findCommentsByBoardNo(int room_id) {

        return boardMapper.selectBoardComments(room_id);
    }

    @Override
    public void deleteComment(int commentNo) {

        boardMapper.deleteComment(commentNo);
    }

    @Override
    public void updateBoardComment(BoardComment comment) {
        boardMapper.updateComment(comment);
    }


}












