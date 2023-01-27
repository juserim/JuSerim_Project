package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.WalkingDogBoard;
import com.azt.dto.WalkingDogBoardAttach;

public class WalkingDogDao {
	
	   private final String driverClass = "com.mysql.cj.jdbc.Driver";
	   private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	   private final String dbId = "azt";
	   private final String dbPwd = "azt";

	public void insertBoard(WalkingDogBoard board) {
		
		Connection conn = null;
		PreparedStatement pstmt =null, pstmt2 = null;
		ResultSet rs = null;
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId ,dbPwd); // 계정 정보
			
			String sql = "insert into walktogether (title, writer, dogname, breed, weight, content, location ) " +
						 "values (?, ?, ?, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getDogName());
			pstmt.setString(4, board.getBreed());
			pstmt.setString(5, board.getWeight());
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getLocation());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			sql = "select last_insert_id() ";
			pstmt2 = conn.prepareStatement(sql);
			rs = pstmt2.executeQuery();
			
			rs.next();
			int newBoardNo = rs.getInt(1);
			board.setBoardNo(newBoardNo);
				 
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {rs.close();}catch(Exception ex) {}
			try {pstmt.close();}catch(Exception ex) {}
			try {pstmt2.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		
	}

	public List<WalkingDogBoard> selectAll() {

		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		ArrayList<WalkingDogBoard> boardList = new ArrayList<WalkingDogBoard>(); // 조회 결과를 저장할 변수
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId,dbPwd); // 계정 정보
			
			//3. SQL 작성 + 명령 객체 만들기
			String sql = "select boardno, title, writer, dogname, breed, weight ,location ,writedate, readcount, deleted " +
						 "from walktogether " + 
						 "order by boardno desc "; //최근에 작성된 글을 제일 앞에 표시
			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			
			//4. 명령 실행 (select인 경우 ResultSet 형식의 결과 반환)
			rs = pstmt.executeQuery(); // excuteQuery : select, excuteUpdate : select 이외의 sql
			
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			while(rs.next()) {
				WalkingDogBoard board = new WalkingDogBoard();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setDogName(rs.getString(4));
				board.setBreed(rs.getString(5));
				board.setWeight(rs.getString(6));
				board.setLocation(rs.getString(7));
				board.setWriteDate(rs.getDate(8));
				board.setReadCount(rs.getInt(9));
				board.setDeleted(rs.getBoolean(10));
				
				boardList.add(board);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {rs.close();}catch(Exception ex) {}
			try {pstmt.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		return boardList;
		
	}

	public WalkingDogBoard selectByBoardNo(int boardNo) {
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		WalkingDogBoard dogBoard = null; // 조회 결과를 저장할 변수
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId,dbPwd); // 계정 정보
			
			//3. SQL 작성 + 명령 객체 만들기
			String sql = "select boardno, title, writer, dogname, breed, weight ,content, location, writedate, readcount " +
						 "from walktogether " + 
						 "where boardno= ? and deleted = false ";
			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setInt(1, boardNo);
			
			//4. 명령 실행 (select인 경우 ResultSet 형식의 결과 반환)
			rs = pstmt.executeQuery(); // excuteQuery : select, excuteUpdate : select 이외의 sql
			
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			if (rs.next()) {
				dogBoard = new WalkingDogBoard();
				dogBoard.setBoardNo(rs.getInt(1));
				dogBoard.setTitle(rs.getString(2));
				dogBoard.setWriter(rs.getString(3));
				dogBoard.setDogName(rs.getString(4));
				dogBoard.setBreed(rs.getString(5));
				dogBoard.setWeight(rs.getString(6));
				dogBoard.setContent(rs.getString(7)); // 추가
				dogBoard.setLocation(rs.getString(8));
				dogBoard.setWriteDate(rs.getDate(9));
				dogBoard.setReadCount(rs.getInt(10));
				
				
			}
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {rs.close();}catch(Exception ex) {}
			try {pstmt.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		return dogBoard;
	}

	public void delete(int boardNo) {
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId ,dbPwd); // 계정 정보
			
			String sql = "update walktogether set deleted = true where boardno = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			pstmt.executeUpdate();
		
				 
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {pstmt.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		
		
		
	}

	public void update(WalkingDogBoard dogBoard) {
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId ,dbPwd); // 계정 정보
			
			String sql = "update walktogether set title =?,  dogname=?,  breed=?, " +
					     					"  weight=?,  location=?,  content=? " +
					     					" where boardno=?  ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dogBoard.getTitle());
			pstmt.setString(2, dogBoard.getDogName());
			pstmt.setString(3, dogBoard.getBreed());
			pstmt.setString(4, dogBoard.getWeight());
			pstmt.setString(5, dogBoard.getLocation());
			pstmt.setString(6, dogBoard.getContent());
			pstmt.setInt(7, dogBoard.getBoardNo());
			
			
			pstmt.executeUpdate();
		
				 
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {pstmt.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		
		
	}

	public int selectBoardCount() {
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		int count = 0;
		
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId ,dbPwd); // 계정 정보
			
			String sql = "select count(*) from walktogether ";
			
			pstmt = conn.prepareStatement(sql);
		
			
			rs = pstmt.executeQuery();
		
			rs.next();
			count=rs.getInt(1);
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {rs.close();}catch(Exception ex) {}
			try {pstmt.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		return count;
	}

	public List<WalkingDogBoard> selectByRange(int from, int count) {

		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		ArrayList<WalkingDogBoard> boardList = new ArrayList<WalkingDogBoard>();
		
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId ,dbPwd); // 계정 정보
			
			String sql = "select boardno, title, writer, dogname, breed, weight ,content, location, writedate, readcount, deleted " +
						 "from walktogether " +
						 "order by boardno desc " +
						 "limit ?, ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, from);
			pstmt.setInt(2, count);
			
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				WalkingDogBoard dogBoard = new WalkingDogBoard();
				dogBoard.setBoardNo(rs.getInt(1));
				dogBoard.setTitle(rs.getString(2));
				dogBoard.setWriter(rs.getString(3));
				dogBoard.setDogName(rs.getString(4));
				dogBoard.setBreed(rs.getString(5));
				dogBoard.setWeight(rs.getString(6));
				dogBoard.setContent(rs.getString(7)); // 추가
				dogBoard.setLocation(rs.getString(8));
				dogBoard.setWriteDate(rs.getDate(9));
				dogBoard.setReadCount(rs.getInt(10));
				dogBoard.setDeleted(rs.getBoolean(11));
				
				boardList.add(dogBoard);
			}
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {rs.close();}catch(Exception ex) {}
			try {pstmt.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		return boardList;
		
	}

	public void insertBoardAttach(WalkingDogBoardAttach attach) {
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		try {	
			//1. JDBC 드라이버 준비
			Class.forName(driverClass);
			//DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			
			//2. 데이터베이스에 연결 ( 연결 객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, // db server url
					dbId ,dbPwd); // 계정 정보
			
			String sql = "insert walktogetherattach " +
						 "(boardno, userfilename, savedfilename) " +
						 "VALUES (?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attach.getBoardNo());
			pstmt.setString(2, attach.getUserFilename());
			pstmt.setString(3, attach.getSavedFilename());
			
			pstmt.executeUpdate();
		
				 
			//5. 결과가 있으면(select 명령인 경우) 결과 처리
			
		}catch(Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		}finally {
			//6. 연결 종료
			try {pstmt.close();}catch(Exception ex) {}
			try {conn.close();}catch(Exception ex) {}
		}
		
	}

	public List<WalkingDogBoardAttach> selectWalkingDogBoardAttachByBoardNo(int boardNo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //조회 결과를 참조하는 변수
		
		// 조회 결과를 저장할 변수
		ArrayList<WalkingDogBoardAttach> files = new ArrayList<>(); 
		
		try {
			Class.forName(driverClass);
			
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
		
		String sql = 
		"select attachno, boardno, userfilename, savedfilename, downloadcount " +
		"from walktogetherattach " +
		"where boardno = ?";					
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		
		//4. 명령 실행
		rs = pstmt.executeQuery(); // select를 위한 메서드
		
		//5. 결과가 있다면 결과 처리 (select)
		while (rs.next()) { //조회된 데이터가 있다면
		//조회된 데이터를 UploadFile 객체에 저장
		WalkingDogBoardAttach file = new WalkingDogBoardAttach();
		file.setAttachNo(rs.getInt(1));
		file.setBoardNo(rs.getInt(2));
		file.setUserFilename(rs.getString(3));
		file.setSavedFilename(rs.getString(4));
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

}
