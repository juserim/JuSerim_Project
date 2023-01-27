package com.azt.service;

import java.util.List;

import com.azt.dao.DogBreedIntroDao;
import com.azt.dto.DogBreedIntro;
import com.azt.dto.DogBreedIntroAttach;

public class DogBreedIntroService {
	
	private DogBreedIntroDao dogBreedIntroDao = new DogBreedIntroDao();

	public void writeBoard(DogBreedIntro board) {
		
		// 게시물 데이터를 DB에 저장
		// c1. 이 위치에서 boardNo : 없음
		dogBreedIntroDao.insertBoard(board); // c1., c2.를 반영해서 insertBoard에서 boardNo 조회하도록 구현
		
		// c2.이 위치에서 boardNo : 데이터베이스에 있음 ( 데이터베이스의 boardNo를 조회할 필요 있음 )
		
		// 첨부파일 데이터를 DB에 저장
		
		for (DogBreedIntroAttach file : board.getFiles()) {
			
			file.setBoardNo(board.getBoardNo()); // insertBoard 실행할 때 조회된 자동증가 값 사용
			dogBreedIntroDao.insertBoardAttach(file);
		}
			}
	
	public List<DogBreedIntro> findAll() {
		
		List<DogBreedIntro> boardList = dogBreedIntroDao.selectAll();
		return boardList;
	}
	
	public List<DogBreedIntro> findByPage(int pageNo, int pageSize) {
		
		int from = (pageNo - 1) * pageSize;
		int count = pageSize;
		
		List<DogBreedIntro> boardList = dogBreedIntroDao.selectByRange(from, count);
		
		return boardList;
	}

	public DogBreedIntro findByBoardNo(int boardNo) {
		
		DogBreedIntro board = dogBreedIntroDao.selectByBoardNo(boardNo); // 게시물 데이터 조회
		List<DogBreedIntroAttach> files = dogBreedIntroDao.selectBoardAttachByBoardNo(boardNo); // 첨부 파일 데이터 조회
		board.setFiles(files);
		return board;
	}
	
	public void delete(int boardNo) {
		
		dogBreedIntroDao.delete(boardNo);
	}
	
	public void update(DogBreedIntro board)  {

		dogBreedIntroDao.update(board);
		
	}
	
	public int findBoardCount() {
		
		int count = dogBreedIntroDao.selectBoardCount();
		return count;
	}
	
	public DogBreedIntroAttach findBoardAttachByAttachNo(int attachNo) {
		
		DogBreedIntroAttach attach = dogBreedIntroDao.selectBoardAttachByAttachNo(attachNo);
		return attach;
	}

	public void dogBreedIntroComment(DogBreedIntro dogBreedIntro) {
		// TODO Auto-generated method stub
		
	}
	
	
}
