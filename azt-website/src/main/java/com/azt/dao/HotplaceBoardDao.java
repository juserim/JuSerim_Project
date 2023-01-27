package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.HotplaceBoard;
import com.azt.dto.HotplaceBoardAttach;
import com.azt.dto.HotplaceBoardComment;



public class HotplaceBoardDao {
	
	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dbPwd = "azt";

	public void insertHotplaceBoard(HotplaceBoard hotplaceBoard) {
		
		Connection conn = null;				
		PreparedStatement pstmt = null,	pstmt2 = null;
		ResultSet rs = null;
		
		try {		
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "insert into hotplace(title, writer, place, loc, content) "
						+ "values(?,?,?,?,?)";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotplaceBoard.getTitle());
			pstmt.setString(2, hotplaceBoard.getWriter());
			pstmt.setString(3, hotplaceBoard.getPlace());
			pstmt.setString(4, hotplaceBoard.getLoc());
			pstmt.setString(5, hotplaceBoard.getContent());
			pstmt.executeUpdate(); 
			
			sql = "select last_insert_id()"; // oracle : select sequence.currval from dual
			pstmt2 = conn.prepareStatement(sql);
			rs = pstmt2.executeQuery();
			
			rs.next();
			int newBoardNo = rs.getInt(1);
			hotplaceBoard.setBoardNo(newBoardNo);
			
			
			
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {						
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { pstmt2.close();} catch (Exception ex) {}		
			try { conn.close();} catch (Exception ex) {}
		}
		
	}

	public List<HotplaceBoard> selectAll() {

		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HotplaceBoard> boardList = new ArrayList<HotplaceBoard>(); 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select boardno, title, writer, writedate , readcount, deleted , place, loc "
						+ "from hotplace "
						+ "order by boardno desc";					
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				HotplaceBoard board = new HotplaceBoard();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setWriteDate(rs.getDate(4));
				board.setReadCount(rs.getInt(5));				
				board.setDeleted(rs.getBoolean(6));
				board.setPlace(rs.getString(7));
				board.setLoc(rs.getString(8));
				
				boardList.add(board);
			}
								
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return boardList;
	}
	
	public List<HotplaceBoard> selectByRange(int from, int count) {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HotplaceBoard> boardList = new ArrayList<HotplaceBoard>(); // 조회 결과를 저장 할 변수
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select boardno, title, writer, readcount, writedate , deleted , loc , place "
						+ "from hotplace "
						+ "order by boardno desc "
						+ "limit ?, ?";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, from);
			pstmt.setInt(2, count);
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				HotplaceBoard board = new HotplaceBoard();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setReadCount(rs.getInt(4));
				board.setWriteDate(rs.getDate(5));
				board.setDeleted(rs.getBoolean(6));
				board.setLoc(rs.getString(7));
				board.setPlace(rs.getString(8));
				
				boardList.add(board);
			}
								
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return boardList;
	}

	public HotplaceBoard selectByBoardNo(int boardNo) {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HotplaceBoard board = null; 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select boardno, title, writer, place, loc, content, writedate, readcount "
						+ "from hotplace "
						+ "where boardno = ? and deleted = false";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery(); 

			if (rs.next()) {
				board = new HotplaceBoard();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setPlace(rs.getString(4));
				board.setLoc(rs.getString(5));
				board.setContent(rs.getString(6));				
				board.setWriteDate(rs.getDate(7));
				board.setReadCount(rs.getInt(8));
			}
								
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return board;
		
	}

	public void delete(int boardNo) {
		
		Connection conn = null;				
		PreparedStatement pstmt = null;		
		
		try {
			Class.forName(driverClass);
		 	
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "update hotplace set deleted = true where boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
		
			pstmt.executeUpdate(); 

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {			
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}
		
	}

	public void editBoard(HotplaceBoard hotplaceBoard) {
		Connection conn = null;				
		PreparedStatement pstmt = null;		
		
		try {
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "update hotplace set "
						+ "title = ? , content = ? , loc = ? , place = ? "
						+ "where boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotplaceBoard.getTitle());
			pstmt.setString(2, hotplaceBoard.getContent());
			pstmt.setString(3, hotplaceBoard.getLoc());
			pstmt.setString(4, hotplaceBoard.getPlace());
			pstmt.setInt(5, hotplaceBoard.getBoardNo());
			pstmt.executeUpdate(); 

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {			
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}
		
		
	}
	

	public int selectBoardCount() {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0; 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select count(*) from hotplace ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			rs.next(); 
			count = rs.getInt(1);
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return count;
	}

	public List<HotplaceBoardAttach> selectHotplaceBoardAttachByBoardNo(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //조회 결과를 참조하는 변수
		
		// 조회 결과를 저장할 변수
		ArrayList<HotplaceBoardAttach> files = new ArrayList<>(); 
		
		try {
			Class.forName(driverClass);
			
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
		
		String sql = 
		"select attachno, boardno, userfilename, savedfilename, downloadcount " +
		"from hotplaceattach " +
		"where boardno = ?";					
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		
		//4. 명령 실행
		rs = pstmt.executeQuery(); // select를 위한 메서드
		
		//5. 결과가 있다면 결과 처리 (select)
		while (rs.next()) { //조회된 데이터가 있다면
		//조회된 데이터를 UploadFile 객체에 저장
		HotplaceBoardAttach file = new HotplaceBoardAttach();
		file.setAttachNo(rs.getInt(1));
		file.setBoardNo(rs.getInt(2));
		file.setUserFileName(rs.getString(3));
		file.setSavedFileName(rs.getString(4));
		file.setDownloadCount(rs.getInt(5));
		//한 건의 데이터를 목록에 추가
		files.add(file);
		}
		} catch (Exception ex) {
		ex.printStackTrace();
		} finally {
		//6. 연결 종료
		try { rs.close(); } catch (Exception ex) {}
		try { pstmt.close(); } catch (Exception ex) {}
		try { conn.close(); } catch (Exception ex) {}
		}
		
		return files;
	}

	public HotplaceBoardAttach selectHotplaceBoardAttachByAttachNo(int attachNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //조회 결과를 참조하는 변수
		
		// 조회 결과를 저장할 변수
		HotplaceBoardAttach file = null;
		
		try {
			Class.forName(driverClass);
			
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
		
		//3. SQL 작성 + 명령 만들기
		String sql = 
		"select attachno, boardno, userfilename, savedfilename, downloadcount " +
		"from hotplaceattach " +
		"where attachno = ?";					
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, attachNo);
		
		//4. 명령 실행
		rs = pstmt.executeQuery(); // select를 위한 메서드
		
		//5. 결과가 있다면 결과 처리 (select)
		if (rs.next()) { //조회된 데이터가 있다면
		//조회된 데이터를 UploadFile 객체에 저장
		file = new HotplaceBoardAttach();
		file.setAttachNo(rs.getInt(1));
		file.setBoardNo(rs.getInt(2));
		file.setUserFileName(rs.getString(3));
		file.setSavedFileName(rs.getString(4));
		file.setDownloadCount(rs.getInt(5));
		
		}
		} catch (Exception ex) {
		ex.printStackTrace();
		} finally {
		//6. 연결 종료
		try { rs.close(); } catch (Exception ex) {}
		try { pstmt.close(); } catch (Exception ex) {}
		try { conn.close(); } catch (Exception ex) {}
		}
		
		return file; //조회된 데이터를 저장한 객체 반환
	}

	public void insertHotplaceBoardAttach(HotplaceBoardAttach attach) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverClass);
			
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
		
		//3. SQL 작성 + 명령 만들기
		String sql = 
		"insert hotplaceattach " +
		"(boardno, userfilename, savedfilename) " +
		"values (?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, attach.getBoardNo());			
		pstmt.setString(2, attach.getUserFileName());
		pstmt.setString(3, attach.getSavedFileName());
		
		//4. 명령 실행
		pstmt.executeUpdate(); // insert, update, delete를 위한 메서드
		
		//5. 결과가 있다면 결과 처리 (select)
		} catch (Exception ex) {
		ex.printStackTrace();
		} finally {
		//6. 연결 종료
		try { pstmt.close(); } catch (Exception ex) {}
		try { conn.close(); } catch (Exception ex) {}
		}
		}



	public void insertHotplaceBoardComment(HotplaceBoardComment hotplaceBoardComment) {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		
		try {		
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "insert into hotplacecomment(writer, content) "
						+ "values(?,?)";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hotplaceBoardComment.getWriter());
			pstmt.setString(2, hotplaceBoardComment.getContent());
						
			pstmt.executeUpdate(); 		
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {									
			try { pstmt.close();} catch (Exception ex) {}	
			try { conn.close();} catch (Exception ex) {}
		}
		
	}
	
	

}
