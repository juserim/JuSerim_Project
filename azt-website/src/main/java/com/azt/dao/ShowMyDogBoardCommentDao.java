package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.ShowMyDogBoardComment;

public class ShowMyDogBoardCommentDao {
	
	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dvPwd = "azt";	
	
	public void insertBoardComment(ShowMyDogBoardComment boardComment) {
		
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
			String sql = "insert into showmydogcomment (boardno, writer, content, groupno, step, depth) " +
						 "values (?, ?, ?, 0, 1, 0)";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			
			pstmt.setInt(1, boardComment.getBoardNo());
			pstmt.setString(2, boardComment.getWriter());
			pstmt.setString(3, boardComment.getContent());
			
			// 4. 명령 실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			pstmt.executeUpdate(); // executeQuery : select, exeucteUpdate : select 이외의 sql
						
			// 자동 증가 컬럼값 조회를 위한 sql 실행
			sql = "select last_insert_id()"; // oracle : select sequence.currval from dual
			pstmt2 = conn.prepareStatement(sql);
			rs = pstmt2.executeQuery();
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			rs.next();
			int newCommentNo = rs.getInt(1);
			boardComment.setCommentNo(newCommentNo);
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { pstmt2.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
	}

	public List<ShowMyDogBoardComment> selectByBoardNo(int boardNo) {
		
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<ShowMyDogBoardComment> commentList = new ArrayList<>(); // 조회 결과를 저장할 변수
	
	try {
		// 1. JDBC 드라이버 준비
		// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		Class.forName(driverClass);

		// 2. 데이터베이스에 연결 ( 연결객체 준비 )
		conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
		
		// 3. SQL 작성 + 명령 객체 만들기
		String sql = "select commentno, boardno, writer, content, writedate, deleted, groupno, step, depth " +
					 "from showmydogcomment " +
					 "where boardno = ? and deleted = false " +
					 "order by commentno desc"; // 최근에 작성된 글을 앞에 표시
		pstmt = conn.prepareStatement(sql); // 명령객체 만들기
		pstmt.setInt(1, boardNo);
		
		// 4. 명령 실행 ( select인 경우 ResultSet 형식의 결과 반환 )
		rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
		// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
		while (rs.next()) { 
			ShowMyDogBoardComment comment = new ShowMyDogBoardComment();
			comment.setCommentNo(rs.getInt(1));
			comment.setBoardNo(rs.getInt(2));
			comment.setWriter(rs.getString(3));
			comment.setContent(rs.getString(4));
			comment.setWriteDate(rs.getDate(5));
			comment.setDeleted(rs.getBoolean(6));
			comment.setGroupNo(rs.getInt(7));
			comment.setStep(rs.getInt(8));
			comment.setDepth(rs.getInt(9));
			commentList.add(comment);
		}
	} catch (Exception ex) {
		ex.printStackTrace(); // 오류 메시지를 화면에 출력
	} finally {
		// 6. 연결 종료
		try { rs.close(); } catch (Exception ex) {}
		try { pstmt.close(); } catch (Exception ex) {}
		try { conn.close(); } catch (Exception ex) {}
	}
	return commentList;
	}

	public void delete(int commentNo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);

			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
			
			// 3. SQL 작성 + 명령 객체 만들기
			// String sql = "delete from board where boardno = ?";
			String sql = "update showmydogcomment set deleted = true where commentno = ?";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setInt(1, commentNo);
			
			// 4. 명령 실행 ( select인 경우 ResultSet 형식의 결과 반환 )
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

	public void update(ShowMyDogBoardComment comment) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);

			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
			
			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "update showmydogcomment " +
						 "set content = ? " +
						 "where commentno = ?";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setString(1, comment.getContent());
			pstmt.setInt(2, comment.getCommentNo());
			
			// 4. 명령 실행 ( select인 경우 ResultSet 형식의 결과 반환 )
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
	
}
