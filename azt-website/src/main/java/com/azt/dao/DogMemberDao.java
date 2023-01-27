package com.azt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.azt.dto.DogMember;
import com.azt.dto.DogMember;

public class DogMemberDao {
	private final String driverClass = "com.mysql.cj.jdbc.Driver";
	private final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
	private final String dbId = "azt";
	private final String dbPwd = "azt";
	
	public void insertDogMember(DogMember dogmember) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {		
			Class.forName(driverClass);
		
			conn = DriverManager.getConnection(
					connectionUrl, 
					dbId, dbPwd); 
			
			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "insert into dogmember values(?, ?, ?, ?, ?, ?) ";
		//System.out.println("dogmember.getSurgery() >>>" + dogmember.getSurgery());
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dogmember.getOwner());
			pstmt.setString(2, dogmember.getDogname());
			pstmt.setString(3, dogmember.getBreed());
			pstmt.setString(4, dogmember.getSurgery());
			pstmt.setString(5, dogmember.getLoc());
			pstmt.setInt(6, dogmember.getWeight());
			
			
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
		public DogMember selectDogMemberByOwner(DogMember dogmember) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DogMember dogmember2 = null; // 조회 결과를 저장할 변수
			
			try {		
				Class.forName(driverClass);
			
				conn = DriverManager.getConnection(
						connectionUrl, 
						dbId, dbPwd); 
				
				// 3. SQL 작성 + 명령 객체 만들기
				String sql = "select owner, dogname, breed, surgery, loc, weight " +
							 "from dogmember " +
							 "where owner = ? ";
				pstmt = conn.prepareStatement(sql); // 명령객체 만들기
				pstmt.setString(1, dogmember.getOwner());
				
				// 4. 명령 실행 ( select인 경우 ResultSet 형식의 결과 반환 )
				rs = pstmt.executeQuery(); // executeQuery : select, exeucteUpdate : select 이외의 sql
				
				// 5. 결과가 있으면 (select 명령인 경우) 결과 처리
				if (rs.next()) { // pk 검색이므로 결과가 있다면 한 건 -> while 대신 if 사용 가능
					dogmember2 = new DogMember();
					dogmember2.setOwner(rs.getString(1));
					dogmember2.setDogname(rs.getString(2));
					dogmember2.setBreed(rs.getString(3));
					dogmember2.setSurgery(rs.getString(4));
					dogmember2.setLoc(rs.getString(5));
					dogmember2.setWeight(rs.getInt(6));
				}
				
			} catch (Exception ex) {
				ex.printStackTrace(); // 오류 메시지를 화면에 출력
			} finally {
				// 6. 연결 종료
				try { rs.close(); } catch (Exception ex) {}
				try { pstmt.close(); } catch (Exception ex) {}
				try { conn.close(); } catch (Exception ex) {}
			}
			
			return dogmember2;
		}

	}