package com.azt.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.azt.common.Util;
import com.azt.dto.ShowMyDogBoard;
import com.azt.dto.ShowMyDogBoardAttach;
import com.azt.dto.ShowMyDogBoardComment;
import com.azt.service.ShowMyDogBoardService;

@WebServlet(urlPatterns = { "/showmydog/comment-delete.action" })
public class ShowMyDogCommentDeleteServlet extends HttpServlet {
		
	// post 요청 처리 ( 여기서는 글쓰기 처리 요청 )
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 로그인 여부 확인 (로그인 안했으면 로그인 화면으로 이동)
		// --> Filter에서 일괄처리하는 방식으로 변경
		
		//1. 요청 데이터 읽기
		req.setCharacterEncoding("utf-8");
		int commentNo = Integer.parseInt(req.getParameter("commentno"));
		
		//2. 요청 처리		
		ShowMyDogBoardService boardService = new ShowMyDogBoardService();
		boardService.deleteComment(commentNo);
		
		//3. JSP에서 읽을 수 있도록 request 객체에 데이터 저장
		
		//4. 응답
		PrintWriter out = resp.getWriter();
		out.print("success");
		
	}
}