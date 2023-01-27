package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.HotplaceBoard;
import com.azt.dto.Message;

public class MessageDao {

	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dbPwd = "azt";
	
	public void insertMessage(Message messageDto) {
	
		Connection conn = null;				
		PreparedStatement pstmt = null;
	
		
		try {		
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "insert into message(sender, receiver, message) "
						+ "values(?,?,?)";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, messageDto.getSender());			
			pstmt.setString(2, messageDto.getReceiver());
			pstmt.setString(3, messageDto.getMessage());
						
			pstmt.executeUpdate(); 
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {	
			try { pstmt.close();} catch (Exception ex) {}		
			try { conn.close();} catch (Exception ex) {}
		}
		
	}

	public List<Message> readMessages(String memberId) {
		
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> messageList = new ArrayList<Message>(); 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select messageno, sender, receiver, senddate , message, deleted "
						+ "from message "
						+ "where receiver = ? "
						+ "order by messageno desc";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				Message messageDto = new Message();
				messageDto.setMessageNo(rs.getInt(1));
				messageDto.setSender(rs.getString(2));
				messageDto.setReceiver(rs.getString(3));
				messageDto.setSendDate(rs.getDate(4));
				messageDto.setMessage(rs.getString(5));
				messageDto.setDeleted(rs.getBoolean(6));
						
				messageList.add(messageDto);
			}
								
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return messageList;
		
	
	}
	
	public List<Message> sendMessages(String memberId) {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> messageList = new ArrayList<Message>(); 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select messageno, sender, receiver, senddate , message, deleted "
						+ "from message "
						+ "where sender = ? "
						+ "order by messageno desc";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				Message messageDto = new Message();
				messageDto.setMessageNo(rs.getInt(1));
				messageDto.setSender(rs.getString(2));
				messageDto.setReceiver(rs.getString(3));
				messageDto.setSendDate(rs.getDate(4));
				messageDto.setMessage(rs.getString(5));
				messageDto.setDeleted(rs.getBoolean(6));
						
				messageList.add(messageDto);
			}
								
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return messageList;
	}

	public Message selectByMessageNo(int messageNo) {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Message messages = null; 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select messageno, sender, receiver, message, senddate "
						+ "from message "
						+ "where messageno = ? and deleted = false";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageNo);
			rs = pstmt.executeQuery(); 

			if (rs.next()) {
				messages = new Message();
				messages.setMessageNo(rs.getInt(1));
				messages.setSender(rs.getString(2));
				messages.setReceiver(rs.getString(3));
				messages.setMessage(rs.getString(4));
				messages.setSendDate(rs.getDate(5));
			}
								
			
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return messages;
		
		
	}

	public void deleteMessage(int messageNo) {
		Connection conn = null;				
		PreparedStatement pstmt = null;		
		
		try {
			Class.forName(driverClass);
		 	
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "update message set deleted = true where messageno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageNo);
		
			pstmt.executeUpdate(); 

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {			
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}
		
	}

	public List<Message> selectByMessageRange(String memberId, int from, int count) {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> messageList = new ArrayList<Message>(); // 조회 결과를 저장 할 변수
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select messageno, sender, receiver, message, senddate , deleted "
						+ "from message "
						+ "where receiver = ? "
						+ "order by messageno desc "
						+ "limit ?, ?";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, from);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				Message messageDto = new Message();
				messageDto.setMessageNo(rs.getInt(1));
				messageDto.setSender(rs.getString(2));
				messageDto.setReceiver(rs.getString(3));
				messageDto.setMessage(rs.getString(4));
				messageDto.setSendDate(rs.getDate(5));				
				messageDto.setDeleted(rs.getBoolean(6));
						
				messageList.add(messageDto);
			}
								
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return messageList;
	}

	public int selectByReceiveMssCount() {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0; 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select count(*) from message ";
			
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

	public List<Message> selectByMessageRange2(String memberId, int from, int count) {
		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> messageList = new ArrayList<Message>(); // 조회 결과를 저장 할 변수
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select messageno, sender, receiver, message, senddate , deleted "
						+ "from message "
						+ "where sender = ? "
						+ "order by messageno desc "
						+ "limit ?, ?";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, from);
			pstmt.setInt(3, count);
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				Message messageDto = new Message();
				messageDto.setMessageNo(rs.getInt(1));
				messageDto.setSender(rs.getString(2));
				messageDto.setReceiver(rs.getString(3));
				messageDto.setMessage(rs.getString(4));
				messageDto.setSendDate(rs.getDate(5));				
				messageDto.setDeleted(rs.getBoolean(6));
						
				messageList.add(messageDto);
			}
								
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return messageList;
	}



}
