package com.azt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.service.ShowMyDogBoardService;

@WebServlet(urlPatterns = { "/showmydog/showmydogdelete.action" })
public class ShowMyDogDeleteServlet extends HttpServlet {

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
		if (sBoardNo == null || sBoardNo.length() == 0 ) { //
			resp.sendRedirect("/azt-website/showmydog/showmydoglist.action");
			return;
		}	
		
		int boardNo = Integer.parseInt(sBoardNo); // 문자열 -> 숫자
		
		//2. 요청 처리
		ShowMyDogBoardService boardService = new ShowMyDogBoardService();
		boardService.delete(boardNo);
				
		//3. JSP에서 사용할 수 있도록 request 데이터 저장( forward 이동인 경우 )

		//4. 이동 ( forward or redirect)
		resp.sendRedirect("/azt-website/showmydog/showmydoglist.action");
			
	}
}
