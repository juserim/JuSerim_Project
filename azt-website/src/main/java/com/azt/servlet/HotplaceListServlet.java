package com.azt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.HotplaceBoard;
import com.azt.service.HotplaceBoardService;
import com.azt.ui.HotplaceThePager;




@WebServlet(urlPatterns = { "/hotplaceBoard/hotplaceList.action" })
public class HotplaceListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sPageNo = req.getParameter("pageno");
		if (sPageNo == null || sPageNo.length() == 0) {
			sPageNo = "1";
		}
		int pageNo = Integer.parseInt(sPageNo);
		int pageSize = 5;  // 한 페이지에 표시할 데이터 개수
		int pagerSize = 3; // 표시되는 페이지 번호 개수  (보이지 않은 페이지 번호는 다음, 이전 ... 등으로 표시)
		int count = 0; // 전체 데이터 개수
		
		HotplaceBoardService boardService = new HotplaceBoardService();
		List<HotplaceBoard> boardList = boardService.FindByPage(pageNo, pageSize);
		
		count = boardService.findBoardCount(); // 데이터 베이스에 전체 게시물 개수 조회
		HotplaceThePager pager = new HotplaceThePager(count, pageNo, pageSize, pagerSize, "hotplaceList.action");
		
		// 3. JSP에서 사용할 수 있도록 Request 객체에 데이터 저장 ( forward 이동 인경우 )
		req.setAttribute("boardList", boardList);
		req.setAttribute("pager", pager);
		req.setAttribute("pageno", pageNo);
		
//		HotplaceBoardService boardService = new HotplaceBoardService();
//		List<HotplaceBoard> boardList = boardService.findAll();
//		req.setAttribute("boardList", boardList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hotplaceBoard/hotplaceList.jsp");
		dispatcher.forward(req, resp);
	}
	
}
