package com.azt.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConn {

	public static Connection getConnection() {
		final String driverClass = "com.mysql.cj.jdbc.Driver";
		final String connectionUrl = "jdbc:mysql://@3.39.192.122:3306/aztweb";
		final String dbId = "azt";
		final String dvPwd = "azt";
		Connection conn = null;
		try {
			// 1. JDBC 드라이버 준비
			// DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			Class.forName(driverClass);

			// 2. 데이터베이스에 연결 ( 연결객체 준비 )
			conn = DriverManager.getConnection(connectionUrl, dbId, dvPwd); // 계정 정보
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException se) {
			}
		}

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException se) {
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException se) {
			}
		}
	}
}
