package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.HotplaceBoardComment;

public class HotplaceBoardCommentDao {
	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dbPwd = "azt";
	
	public void insertComment(HotplaceBoardComment comment) {

		Connection conn = null;				
		PreparedStatement pstmt = null,	pstmt2 = null;
		ResultSet rs = null;
		
		try {		
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 

			String sql = "insert into hotplacecomment (boardno, writer, content, groupno, step, depth) " +
						 "values (?, ?, ?, 0, 1, 0)";
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setInt(1, comment.getBoardNo());
			pstmt.setString(2, comment.getWriter());
			pstmt.setString(3, comment.getContent());
			
			pstmt.executeUpdate(); 
						
			// 자동 증가 컬럼값 조회를 위한 sql 실행
			sql = "select last_insert_id()"; 
			pstmt2 = conn.prepareStatement(sql);
			rs = pstmt2.executeQuery();
			
		
			rs.next();
			int newCommentNo = rs.getInt(1);
			comment.setCommentNo(newCommentNo);
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { pstmt2.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
	}

	public List<HotplaceBoardComment> selectByBoardNo(int boardNo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<HotplaceBoardComment> commentList = new ArrayList<>(); // 조회 결과를 저장할 변수
		
		try {
			
			Class.forName(driverClass);
			
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
						
			String sql = "select commentno, boardno, writer, content, writedate, deleted, groupno, step, depth " +
						 "from hotplacecomment "
					   + "where boardno = ? and deleted = false "
					   + "order by commentno desc"; 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery(); 
	
			while (rs.next()) { 
				HotplaceBoardComment comment = new HotplaceBoardComment();
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
			ex.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		return commentList;
		
		
	}

	public void deletComment(int commentNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driverClass);
			
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
		
			String sql = "update hotplacecomment set deleted = true where commentno = ?";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, commentNo);
			
			pstmt.executeUpdate(); 
				
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {
			// 6. 연결 종료
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
	}

	public void updateComment(HotplaceBoardComment comment) {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName(driverClass);
			
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "update hotplacecomment " +
						 "set content = ? " +
						 "where commentno = ?";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, comment.getContent());
			pstmt.setInt(2, comment.getCommentNo());			
			
			pstmt.executeUpdate(); 
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {
			// 6. 연결 종료
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
	}

}
