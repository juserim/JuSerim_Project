package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.ShowMyDogBoardAttach;
import com.azt.dto.ShowMyDogBoard;

public class ShowMyDogBoardDao {
	
	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dvPwd = "azt";
	
	public void insertBoard(ShowMyDogBoard board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null , pstmt2 = null;
		ResultSet rs = null; 
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);

			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보

			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "insert into showmydog (title, writer, content) " + 
						 "values (?, ?, ?) ";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setString(1, board.getTitle()); // SQL의 1번째 ?에 사용될 데이터
			pstmt.setString(2, board.getWriter()); // SQL의 2번째 ?에 사용될 데이터
			pstmt.setString(3, board.getContent()); // SQL의 3번째 ?에 사용될 데이터

			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			pstmt.executeUpdate(); // executeQuery : select, exeucteUpdate : select 이외의 sql

			// 자동 증가 컬럼값 조회를 위한 sql 실행
			sql = "select last_insert_id()"; // oarcle : select sequence.currval from dual
			pstmt2= conn.prepareStatement(sql);
			rs = pstmt2.executeQuery();
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			rs.next();
			int newBoardNo =rs.getInt(1);
			board.setBoardNo(newBoardNo);
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		} finally {
				// 6. 연결 종료
				try { pstmt2.close(); } catch (Exception ex) {}
				try { pstmt.close(); } catch (Exception ex) {}
				try { conn.close(); } catch (Exception ex) {}
			}
	}
	
	public List<ShowMyDogBoard> selectAll() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<ShowMyDogBoard> boardList = new ArrayList<ShowMyDogBoard>(); // 조회 결과를 저장할 변수
				
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select boardno, title, writer, readcount, writedate, deleted " +
						 "from showmydog " +
						 "where deleted = false " +
						 "order by boardno desc "; // 최근에 작성된 글을 앞에 표시			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			while (rs.next()) {
				ShowMyDogBoard board = new ShowMyDogBoard();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setReadCount(rs.getInt(4));
				board.setWriteDate(rs.getDate(5));
				board.setDeleted(rs.getBoolean(6));
				
				boardList.add(board);
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return boardList;
	}
	
	
	public List<ShowMyDogBoard> selectByRange(int from, int count) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<ShowMyDogBoard> boardList = new ArrayList<ShowMyDogBoard>(); // 조회 결과를 저장할 변수
				
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select boardno, title, writer, readcount, writedate, deleted  " +
						 "from showmydog " +
						 "order by boardno desc " +
						 "limit ? , ? "; // 최근에 작성된 글을 앞에 표시			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setInt(1, from);
			pstmt.setInt(2, count);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			while (rs.next()) {
				ShowMyDogBoard board = new ShowMyDogBoard();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setReadCount(rs.getInt(4));
				board.setWriteDate(rs.getDate(5));
				board.setDeleted(rs.getBoolean(6));
				
				boardList.add(board);
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return boardList;
	}
	
	public ShowMyDogBoard selectByBoardNo(int boardNo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ShowMyDogBoard board = null; // 조회 결과를 저장할 변수
				
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보

						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select boardno, title, writer, content, readcount, writedate  " +
						 "from showmydog " +
						 "where boardno = ? and deleted = false ";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setInt(1, boardNo);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			if (rs.next()) {
				board = new ShowMyDogBoard();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setContent(rs.getString(4)); // 추가
				board.setReadCount(rs.getInt(5));
				board.setWriteDate(rs.getDate(6));
				// board.setDeleted(rs.getBoolean(7));				
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return board;
	}
		
	public void delete(int boardNo) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);

			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
									
			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "update showmydog set deleted = true where boardno = ? ";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setInt(1, boardNo); 
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			pstmt.executeUpdate(); // executeQuery : select, exeucteUpdate : select 이외의 sql

			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리

		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		} finally {
				// 6. 연결 종료
				try { pstmt.close(); } catch (Exception ex) {}
				try { conn.close(); } catch (Exception ex) {}
			}
		
	}
	
	public void update(ShowMyDogBoard board) {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
	
			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
									
			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "update showmydog set " + 
						 "title = ? , content = ? " +						 
						 "where boardno= ? ";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setString(1, board.getTitle()); // SQL의 1번째 ?에 사용될 데이터
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBoardNo());
	
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			pstmt.executeUpdate(); // executeQuery : select, exeucteUpdate : select 이외의 sql
	
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
	
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		} finally {
				// 6. 연결 종료
				try { pstmt.close(); } catch (Exception ex) {}
				try { conn.close(); } catch (Exception ex) {}
			}	
	}
	
	public int selectBoardCount() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		int count = 0; // 조회 결과를 저장할 변수
						
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select count(*) from showmydog " ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			rs.next(); // 언제나 결과가 있는 조회이기 때문에 if 또는 while 생략
			count = rs.getInt(1);
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return count;
	}

	public void insertBoardAttach(ShowMyDogBoardAttach attach) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
	
			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
									
			//3. SQL 작성 + 명령 만들기
			String sql = 
				"insert showmydogattach " +
				"(boardno, userfilename, savedfilename) " +
				"VALUES (?, ?, ?)";
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

	public List<ShowMyDogBoardAttach> selectBoardAttachByBoardNo(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //조회 결과를 참조하는 변수
		
		// 조회 결과를 저장할 변수
		ArrayList<ShowMyDogBoardAttach> files = new ArrayList<>(); 
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
	
			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
												
			//3. SQL 작성 + 명령 만들기
			String sql = 
					"select attachno, userfilename, savedfilename, downloadcount, boardno " +
					"FROM showmydogattach " +
					"WHERE boardno = ?";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			//4. 명령 실행
			rs = pstmt.executeQuery(); // select를 위한 메서드
			
			//5. 결과가 있다면 결과 처리 (select)
			while (rs.next()) { //조회된 데이터가 있다면
				//조회된 데이터를 UploadFile 객체에 저장
				ShowMyDogBoardAttach file = new ShowMyDogBoardAttach();
				file.setAttachNo(rs.getInt(1));
				file.setUserFileName(rs.getString(2));
				file.setSavedFileName(rs.getString(3));
				file.setDownloadCount(rs.getInt(4));
				file.setBoardNo(rs.getInt(5));
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
		
		return files; //조회된 데이터를 저장한 객체 반환
	}

	public ShowMyDogBoardAttach selectBoardAttachByAttachNo(int attachNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //조회 결과를 참조하는 변수
		
		// 조회 결과를 저장할 변수
		ShowMyDogBoardAttach file = null;
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
	
			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
									
			//3. SQL 작성 + 명령 만들기
			String sql = 
					"select attachno, userfilename, savedfilename, downloadcount, boardno  " +
					"from showmydogattach " +
					"where attachno = ?";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, attachNo);
			
			//4. 명령 실행
			rs = pstmt.executeQuery(); // select를 위한 메서드
			
			//5. 결과가 있다면 결과 처리 (select)
			if (rs.next()) { //조회된 데이터가 있다면
				//조회된 데이터를 UploadFile 객체에 저장
				file = new ShowMyDogBoardAttach();
				file.setAttachNo(rs.getInt(1));
				file.setUserFileName(rs.getString(2));
				file.setSavedFileName(rs.getString(3));
				file.setDownloadCount(rs.getInt(4));
				file.setBoardNo(rs.getInt(5));
				
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

	
	
	
}
