package com.azt.service;

import java.util.List;

import com.azt.dao.HotplaceBoardCommentDao;
import com.azt.dao.HotplaceBoardDao;
import com.azt.dto.HotplaceBoard;
import com.azt.dto.HotplaceBoardAttach;
import com.azt.dto.HotplaceBoardComment;





public class HotplaceBoardService {
	private HotplaceBoardDao hotplaceBoardDao = new HotplaceBoardDao();
	
	public void hotplaceWriteBoard(HotplaceBoard hotplaceBoard) {
		
		hotplaceBoardDao.insertHotplaceBoard(hotplaceBoard);
		for (HotplaceBoardAttach file : hotplaceBoard.getFiles()) {
			file.setBoardNo(hotplaceBoard.getBoardNo());  // insertBoard 실행할 때 조회된 자동증가 값 사용
			hotplaceBoardDao.insertHotplaceBoardAttach(file);
		}
		
	}
		
	public List<HotplaceBoard> findAll() {

		List<HotplaceBoard> boardList = hotplaceBoardDao.selectAll();
		return boardList;
	}
	
	public List<HotplaceBoard> FindByPage(int pageNo, int pageSize) {
			
			int from = (pageNo - 1)* pageSize;
			int count = pageSize;
			
			List<HotplaceBoard> boardList = hotplaceBoardDao.selectByRange(from, count);
			return boardList;
		}
	
	
	public HotplaceBoard findByBoardNo(int boardNo) {
		HotplaceBoard board = hotplaceBoardDao.selectByBoardNo(boardNo);
		List<HotplaceBoardAttach> files = hotplaceBoardDao.selectHotplaceBoardAttachByBoardNo(boardNo);
		board.setFiles(files);
		return board;
	}
	
	public HotplaceBoardAttach findHotplaceBoardAttachByAttachNo(int attachNo) {
		HotplaceBoardAttach attach = hotplaceBoardDao.selectHotplaceBoardAttachByAttachNo(attachNo);
		return attach;
		
	}

	
	public void delete(int boardNo) {
		hotplaceBoardDao.delete(boardNo);
	}

	
	public void Edit(HotplaceBoard hotplaceBoard) {
		hotplaceBoardDao.editBoard(hotplaceBoard);
		
	}

	public int findBoardCount() {
		int count = hotplaceBoardDao.selectBoardCount();		
		return count;
	}

	

	public void hotplaceBoardComment(HotplaceBoardComment hotplaceBoardComment) {
		
		hotplaceBoardDao.insertHotplaceBoardComment(hotplaceBoardComment);
	}

	private HotplaceBoardCommentDao hotplaceBoardCommentDao = new HotplaceBoardCommentDao();
	public void writeHotplaceBoardComment(HotplaceBoardComment comment) {
		
		hotplaceBoardCommentDao.insertComment(comment);
		
	}

	public List<HotplaceBoardComment> findCommentByBoardNo(int boardNo) {
		
		List<HotplaceBoardComment> comments = hotplaceBoardCommentDao.selectByBoardNo(boardNo);
		return comments;
	}

	public void deleteHotplaceBoardComment(int commentNo) {
		
		hotplaceBoardCommentDao.deletComment(commentNo);
		
	}

	public void updateHotplaceBoardComment(HotplaceBoardComment comment) {
		
		hotplaceBoardCommentDao.updateComment(comment);
		
	}




	
	
	
	
	
	
	
}
