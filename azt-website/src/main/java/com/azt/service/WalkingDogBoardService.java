package com.azt.service;

import java.util.List;

import com.azt.dao.WalkingDogDao;
import com.azt.dto.WalkingDogBoard;
import com.azt.dto.WalkingDogBoardAttach;


public class WalkingDogBoardService {

	WalkingDogDao boardDao = new WalkingDogDao();
	
	public void writeBoard(WalkingDogBoard board) {
		
		boardDao.insertBoard(board);
		
		// 첨부파일 데이터를 DB에 저장
		for(WalkingDogBoardAttach file : board.getFiles() ) {
			file.setBoardNo(board.getBoardNo());
			boardDao.insertBoardAttach(file);
		}
	}

	public List<WalkingDogBoard> findAll() {
		
		List<WalkingDogBoard> boardList = boardDao.selectAll();
		return boardList;
		
	}

	public WalkingDogBoard findByBoardNo(int boardNo) {
		
		WalkingDogBoard dogBoard = boardDao.selectByBoardNo(boardNo);

		List<WalkingDogBoardAttach> files = boardDao.selectWalkingDogBoardAttachByBoardNo(boardNo);
		dogBoard.setFiles(files);
		
		return dogBoard;
	}

	public void delete(int boardNo) {
		
		boardDao.delete(boardNo);
		
	}

	public void update(WalkingDogBoard dogBoard) {
		
		boardDao.update(dogBoard);
		
	}

	public int finBoardCount() {
		
		int count = boardDao.selectBoardCount();
		
		return count;
	}

	public List<WalkingDogBoard> findByPage(int pageNo, int pageSize) {

		int from = (pageNo -1 ) * pageSize;
		int count = pageSize;
		
		List<WalkingDogBoard> boardList = boardDao.selectByRange(from , count);
		
		return boardList;
	}

}
