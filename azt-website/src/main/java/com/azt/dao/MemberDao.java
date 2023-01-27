package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.DogMember;
import com.azt.dto.Member;
import com.azt.dto.Message;

public class MemberDao {
	
	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dbPwd = "azt";
	
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {		
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "insert into member (memberid, passwd, email) " +
						 "values (?, ?, ?)";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getEmail());
			
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

	public Member selectMemberByIdAndPasswd(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member2 = null; // 조회 결과를 저장할 변수
		
		try {		
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "select memberid, email, usertype, active, regdate " +
						 "from member " +
						 "where memberid = ? and passwd = ? and active = true";
			pstmt = conn.prepareStatement(sql); // 명령객체 만들기
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			
			// 4. 명령 실행 ( select인 경우 ResultSet 형식의 결과 반환 )
			rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
			
			// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
			if (rs.next()) { // pk 검색이므로 결과가 있다면 한 건 -> while 대신 if 사용 가능
				member2 = new Member();
				member2.setMemberId(rs.getString(1));
				member2.setEmail(rs.getString(2));
				member2.setUserType(rs.getString(3));
				member2.setActive(rs.getBoolean(4));
				member2.setRegDate(rs.getDate(5));
			}
			
		} catch (Exception ex) {
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return member2;
	}

	public List<Member> findAllMembers() {

		Connection conn = null;				
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> members = new ArrayList<Member>(); 
		
		try {		
			Class.forName(driverClass);
					
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			String sql = "select memberid from member ";
									
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString(1));
						
				members.add(member);
			}
								
		} catch (Exception ex) {
			ex.printStackTrace(); 
		} finally {		
			try { rs.close();} catch (Exception ex) {}
			try { pstmt.close();} catch (Exception ex) {}
			try { conn.close();} catch (Exception ex) {}
		}

		return members;
		
	}

	

}
