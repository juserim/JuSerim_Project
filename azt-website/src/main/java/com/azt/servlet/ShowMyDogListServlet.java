package com.azt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.ShowMyDogBoard;
import com.azt.service.ShowMyDogBoardService;
import com.azt.ui.ShowMyDogThePager;

@WebServlet(urlPatterns = { "/showmydog/showmydoglist.action" })
public class ShowMyDogListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		// 로그인 여부 확인 (로그인 안했으면 로그인 화면으로 이동) 
		// --> Filter에서 일괄처리 하는 방식으로 변경
		
		//1. 요청 데이터 읽기
		String sPageNo = req.getParameter("pageNo");
		if (sPageNo == null || sPageNo.length() == 0) {
				sPageNo = "1";
		}
		int pageNo = Integer.parseInt(sPageNo);
		
		//2. 요청 처리		
		int pageSize = 8; // 한 페이지에 표시할 데이터 개수
		int pagerSize = 3; // 표시되는 페이지 번호 개수 ( 보이지 않은 페이지 번호는 다음, 이전 등으로 표시 )
		int count = 0; // 전체 데이터 갯수
		
		ShowMyDogBoardService boardService = new ShowMyDogBoardService();
		List<ShowMyDogBoard> boardList = boardService.findByPage(pageNo, pageSize);
				
		count =boardService.findBoardCount(); // 데이터베이스에 전체 게시물 갯수 조회
		
		// 페이지 번호 표시기 클래스 객체 생성
		ShowMyDogThePager pager = new ShowMyDogThePager(count, pageNo, pageSize, pagerSize, "showmydoglist.action");
		
		//3. JSP에서 사용할 수 있도록 request 데이터 저장( forward 이동인 경우 )
		req.setAttribute("boardList", boardList);
		req.setAttribute("pager", pager);
		req.setAttribute("pageNo", pageNo);
		
		
		//4. 이동 ( forward or redirect)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/showmydog/showmydoglist.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
