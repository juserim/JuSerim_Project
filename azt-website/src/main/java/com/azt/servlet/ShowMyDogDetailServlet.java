package com.azt.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.dto.ShowMyDogBoard;
import com.azt.service.ShowMyDogBoardService;

@WebServlet(urlPatterns = { "/showmydog/showmydogdetail.action" })
public class ShowMyDogDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 요청 데이터 읽기
		String sBoardNo = req.getParameter("boardno");
		String sPageNo = req.getParameter("pageNo");
		if (sBoardNo == null || sBoardNo.length() == 0 ||
			sPageNo == null || sPageNo.length() == 0) { //잘못된 요청
			resp.sendRedirect("/azt-website/showmydog/showmydoglist.action");
			return;
		}	
		
		int boardNo = Integer.parseInt(sBoardNo); // 문자열 -> 숫자
		int PageNo = Integer.parseInt(sPageNo);
		
		//2. 요청 처리
		ShowMyDogBoardService boardService = new ShowMyDogBoardService();
		ShowMyDogBoard board = boardService.findByBoardNo(boardNo);
				
		if (board == null) { // 해당 번호의 게시글이 없는 경우
			resp.sendRedirect("/azt-website/showmydog/showmydoglist.action");
			return;
		}
		
		//3. JSP에서 사용할 수 있도록 request 데이터 저장( forward 이동인 경우 )
		req.setAttribute("board", board);
		req.setAttribute("pageNo", PageNo);
		
		//4. 이동 ( forward or redirect)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/showmydog/showmydogdetail.jsp");
		dispatcher.forward(req, resp);
	
	
	}
}
