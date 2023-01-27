package com.azt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.common.DBConn;
import com.azt.common.StringUtil;

@WebServlet(urlPatterns = { "/dogbreedintro/dogbreedlikely.action" })
public class DogBreedLikelyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 요청 데이터 읽기
		req.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(StringUtil.nvl(req.getParameter("boardNo"), "0"));
		String memberId = StringUtil.nvl(req.getParameter("memberId"));
		//System.out.println("boardNo = " + boardNo + ", memberId = " + memberId);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String message = "";
		int status = 0;

		try {
			conn = DBConn.getConnection();
			String sql = "SELECT COUNT(*) FROM likely WHERE boardno = ? AND memberid = ?";
			// String ;
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setInt(idx++, boardNo);
			pstmt.setString(idx++, memberId);
			rs = pstmt.executeQuery();
			int result = 0;
			if (rs.next()) {
				result = rs.getInt(1);
			}
			rs.close();
			pstmt.close();

			if (result == 0) {
				sql = "INSERT INTO likely(boardno, memberid) values(?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
				pstmt.setString(2, memberId);
				status = pstmt.executeUpdate();
				pstmt.close();
			}

			sql = "SELECT COUNT(*) FROM likely WHERE boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			status = -1;
			e.printStackTrace();
		} finally {
			DBConn.close(conn, pstmt, rs);
		}

		PrintWriter out = resp.getWriter();
		StringBuffer output = new StringBuffer();
		output.append("{");
		output.append(String.format("\"status\":%d", status));
		output.append(String.format(", \"count\":%d", count));
		output.append("}");
		out.print(output.toString());
	}
}
