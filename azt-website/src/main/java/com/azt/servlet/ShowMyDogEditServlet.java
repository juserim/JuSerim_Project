package com.azt.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.ClassLoaderFactory.Repository;
import org.apache.jasper.TrimSpacesOption;

import com.azt.dto.ShowMyDogBoard;
import com.azt.service.ShowMyDogBoardService;

@WebServlet(urlPatterns = { "/showmydog/showmydogedit.action" })
public class ShowMyDogEditServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//로그인 확인
		HttpSession session = req.getSession();
		if(session.getAttribute("loginuser") == null) { // 로그인하지 않는 경우
			resp.sendRedirect("/azt-website/account/login.action");
			return;
		}
		
		//1. 요청 데이터 읽기
		String sBoardNo = req.getParameter("boardno");
		if (sBoardNo == null || sBoardNo.length() == 0) { //잘못된 요청
			resp.sendRedirect("/azt-website/showmydog/showmydoglist.action");
			return;
		}		
		//System.out.println(sBoardNo);
		int boardNo = Integer.parseInt(sBoardNo); // 문자열 -> 숫자
		
		//2. 요청 처리
		ShowMyDogBoardService boardService = new ShowMyDogBoardService();
		ShowMyDogBoard board = boardService.findByBoardNo(boardNo);
//		System.out.println(board.getTitle() + "/" + board.getWriter());
		if (board == null) { // 해당 번호의 게시글이 없는 경우
			resp.sendRedirect("/azt-website/showmydog/showmydoglist.action");
			return;
		}
		
		//3. JSP에서 사용할 수 있도록 request 데이터 저장( forward 이동인 경우 )
		req.setAttribute("board", board);
		
		//4. 이동 ( forward or redirect)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/showmydog/showmydogedit.jsp");
		dispatcher.forward(req, resp);
	}
		
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1. 요청 데이터 읽기
		req.setCharacterEncoding("utf-8");
		String sBoardNo = req.getParameter("boardno");
		int boardNo = Integer.parseInt(sBoardNo); // 문자열 -> 숫자
		String title = req.getParameter("title");		
		String content = req.getParameter("content");
		 
		//2. 요청 처리
		ShowMyDogBoard board = new ShowMyDogBoard();
		board.setBoardNo(boardNo);
		board.setTitle(title);
		board.setContent(content); 
		
		ShowMyDogBoardService boardService = new ShowMyDogBoardService();
		boardService.update(board);
		
		//3. JSP에서 사용할 수 있도록 데이터 저장( forward 이동인 경우 )
		//4. 이동 ( forward or redirect)
		resp.sendRedirect("showmydogdetail.action?boardno="+sBoardNo);
	}
}
