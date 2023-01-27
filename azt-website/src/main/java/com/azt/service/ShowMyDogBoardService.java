package com.azt.service;

import java.util.List;

import com.azt.dao.ShowMyDogBoardCommentDao;
import com.azt.dao.ShowMyDogBoardDao;
import com.azt.dto.ShowMyDogBoard;
import com.azt.dto.ShowMyDogBoardAttach;
import com.azt.dto.ShowMyDogBoardComment;

public class ShowMyDogBoardService {
	
	private ShowMyDogBoardDao showMyDogBoardDao = new ShowMyDogBoardDao();

	public void writeBoard(ShowMyDogBoard board) {
		
		// 게시물 데이터를 DB에 저장
		// c1. 이 위치에서 boardNo : 없음
		showMyDogBoardDao.insertBoard(board); // c1., c2.를 반영해서 insertBoard에서 boardNo 조회하도록 구현		
		// c2.이 위치에서 boardNo : 데이터베이스에 있음 ( 데이터베이스의 boardNo를 조회할 필요 있음 )
		
		// 첨부파일 데이터를 DB에 저장
		for (ShowMyDogBoardAttach file : board.getFiles()) {
			file.setBoardNo(board.getBoardNo()); // insertBoard 실행할 때 조회된 자동증가 값 사용
			showMyDogBoardDao.insertBoardAttach(file);
		}
	}
	
	public List<ShowMyDogBoard> findAll() {
		
		List<ShowMyDogBoard> boardList = showMyDogBoardDao.selectAll();
		return boardList;
	}
	
	public List<ShowMyDogBoard> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		List<ShowMyDogBoard> boardList = showMyDogBoardDao.selectByRange(from, count);
		
		return boardList;
	}

	public ShowMyDogBoard findByBoardNo(int boardNo) {
		
		ShowMyDogBoard board = showMyDogBoardDao.selectByBoardNo(boardNo); // 게시물 데이터 조회
		List<ShowMyDogBoardAttach> files = showMyDogBoardDao.selectBoardAttachByBoardNo(boardNo); // 첨부 파일 데이터 조회
		board.setFiles(files);
		return board;
	}
	
	public void delete(int boardNo) {
		
		showMyDogBoardDao.delete(boardNo);
	}
	
	public void update(ShowMyDogBoard board)  {

		showMyDogBoardDao.update(board);
		
	}
	
	public int findBoardCount() {
		
		int count = showMyDogBoardDao.selectBoardCount();
		return count;
	}
	
	public ShowMyDogBoardAttach findBoardAttachByAttachNo(int attachNo) {
		
		ShowMyDogBoardAttach attach = showMyDogBoardDao.selectBoardAttachByAttachNo(attachNo);
		return attach;
	}

	////////////////////////////////////////////////////////////////////////////////////////////////
	
	private ShowMyDogBoardCommentDao boardCommentDao = new ShowMyDogBoardCommentDao();
	
	public void writeBoardComment(ShowMyDogBoardComment comment) {
	
			boardCommentDao.insertBoardComment(comment);
	}

	public List<ShowMyDogBoardComment> findCommentsByBoardNo(int boardNo) {
		
		List<ShowMyDogBoardComment> comments = boardCommentDao.selectByBoardNo(boardNo);
		
		return comments;
	}

	public void deleteComment(int commentNo) {
		
		boardCommentDao.delete(commentNo);
		
	}

	public void updateBoardComment(ShowMyDogBoardComment comment) {

		boardCommentDao.update(comment);
		
	}

	
	
}
