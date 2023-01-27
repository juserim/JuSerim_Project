package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.ShowMyDogBoardAttach;
import com.azt.dto.ShowMyDogBoardComment;
import com.azt.dto.WalkingDogBoard;
import com.azt.dto.DogBreedIntro;
import com.azt.dto.DogMember;
import com.azt.dto.HotplaceBoard;
import com.azt.dto.Member;
import com.azt.dto.ShowMyDogBoard;

public class MyPageDao {
	
	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dvPwd = "azt";
		
	public Member selectAll(String memberId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		Member member = null; // 조회 결과를 저장할 변수
				
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select memberid, email, usertype, regdate, active  " +
						 "from member " +
						 "where memberid = ? " ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, memberId);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			if (rs.next()) {
				member = new Member();
				member.setMemberId(rs.getString(1));
				member.setEmail(rs.getString(2));
				member.setUserType(rs.getString(3));
				member.setRegDate(rs.getDate(4));
				member.setActive(rs.getBoolean(5));
							
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return member;
	}

	public DogMember selectDogAll(String owner) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		DogMember dogMember = null; // 조회 결과를 저장할 변수
				
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select owner, dogname, breed, surgery, loc, weight  " +
						 "from dogmember " +
						 "where owner = ? " ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, owner);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			if (rs.next()) {
				dogMember = new DogMember();
				dogMember.setOwner(rs.getString(1));
				dogMember.setDogname(rs.getString(2));
				dogMember.setBreed(rs.getString(3));
				dogMember.setSurgery(rs.getString(4));
				dogMember.setLoc(rs.getString(5));
				dogMember.setWeight(rs.getInt(6));
				
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}

		return dogMember;
	}

	public List<ShowMyDogBoard> selectShowMyDogBoardList(String writer) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<ShowMyDogBoard> boardList = new ArrayList<ShowMyDogBoard>();
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select boardno, title, writer, writedate, deleted  " +
						 "from showmydog " +
						 "where writer = ? " ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			while (rs.next()) {
				ShowMyDogBoard board = new ShowMyDogBoard();				
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setWriteDate(rs.getDate(4));
				board.setDeleted(rs.getBoolean(5));				
				
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

	public List<HotplaceBoard> selectHotPlaceBoardList(String writer) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<HotplaceBoard> boardList2 = new ArrayList<HotplaceBoard>();
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select boardno, title, writer, writedate, deleted  " +
						 "from hotplace " +
						 "where writer = ? " ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			while (rs.next()) {
				HotplaceBoard board2 = new HotplaceBoard();				
				board2.setBoardNo(rs.getInt(1));
				board2.setTitle(rs.getString(2));
				board2.setWriter(rs.getString(3));
				board2.setWriteDate(rs.getDate(4));
				board2.setDeleted(rs.getBoolean(5));
				
				boardList2.add(board2);
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return boardList2;
	}

	public List<WalkingDogBoard> selectWalkingDogBoardList(String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<WalkingDogBoard> boardList3 = new ArrayList<WalkingDogBoard>();
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select boardno, title, writer, writedate, deleted  " +
						 "from walktogether " +
						 "where writer = ? " ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			while (rs.next()) {
				WalkingDogBoard board3 = new WalkingDogBoard();				
				board3.setBoardNo(rs.getInt(1));
				board3.setTitle(rs.getString(2));
				board3.setWriter(rs.getString(3));
				board3.setWriteDate(rs.getDate(4));
				board3.setDeleted(rs.getBoolean(5));
				
				boardList3.add(board3);
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return boardList3;
	
	}

	public List<DogBreedIntro> selectListDogBreedIntroList(String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<DogBreedIntro> boardList4 = new ArrayList<DogBreedIntro>();
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select boardno, title, writer, writedate, deleted  " +
						 "from dogbreedintro " +
						 "where writer = ? " ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			while (rs.next()) {
				DogBreedIntro board4 = new DogBreedIntro();				
				board4.setBoardNo(rs.getInt(1));
				board4.setTitle(rs.getString(2));
				board4.setWriter(rs.getString(3));
				board4.setWriteDate(rs.getDate(4));
				board4.setDeleted(rs.getBoolean(5));
				
				boardList4.add(board4);
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return boardList4;
	}

	public int selectShowMyDogBoardCount(String writer) {
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
			String sql = "select count(title) from showmydog " +
						 "where writer = ? and deleted = false ";						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
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

	public int selectHotPlaceBoardCount(String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		int count2 = 0; // 조회 결과를 저장할 변수
						
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select count(title) from hotplace " +
						 "where writer = ? and deleted = false ";						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			rs.next(); // 언제나 결과가 있는 조회이기 때문에 if 또는 while 생략
			count2 = rs.getInt(1);
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return count2;
	}

	public int selectWalkingDogBoardCount(String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		int count3 = 0; // 조회 결과를 저장할 변수
						
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select count(title) from walktogether " +
						 "where writer = ? and deleted = false ";						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			rs.next(); // 언제나 결과가 있는 조회이기 때문에 if 또는 while 생략
			count3 = rs.getInt(1);
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return count3;
	}
	
	public int selectBreedIntroCount(String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		int count4 = 0; // 조회 결과를 저장할 변수
						
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select count(title) from dogbreedintro " +
						 "where writer = ? and deleted = false ";						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			rs.next(); // 언제나 결과가 있는 조회이기 때문에 if 또는 while 생략
			count4 = rs.getInt(1);
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return count4;
	}
	
	public List<ShowMyDogBoardComment> selectShowMyDogBoarComment(String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		ArrayList<ShowMyDogBoardComment> comments = new ArrayList<ShowMyDogBoardComment>();
		
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);
			
			// 2. 데이터베이스에 연결 ( 연결객체 준비 ) 
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
						
			// 3-2. SQL 작성 + 명령 객체 만들기2 ( SQL과 데이터를 분리 )
			String sql = "select commentno, boardno, writer, content, writedate, deleted, groupno, step, depth " +
					 	 "from showmydogcomment " +
					     "where writer = ?  " +
					     "order by writedate desc" ;						 			
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기		
			pstmt.setString(1, writer);
			
			// 4. 명령실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			while (rs.next()) {
				ShowMyDogBoardComment comment = new ShowMyDogBoardComment();				
				comment.setCommentNo(rs.getInt(1));
				comment.setBoardNo(rs.getInt(2));
				comment.setWriter(rs.getString(3));
				comment.setContent(rs.getString(4));
				comment.setWriteDate(rs.getDate(4));
				comment.setDeleted(rs.getBoolean(5));
				
				comments.add(comment);
			}	
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력			
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex ) {}
			try { conn.close();} catch (Exception ex ) {}
		}
		return comments;
	
	}
	
	
	
}

	
