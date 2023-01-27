package com.azt.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.HotplaceBoard;
import com.azt.service.HotplaceBoardService;



@WebServlet(urlPatterns = {"/hotplaceBoard/hotplaceEdit.action"})
public class HotplaceEditServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String sBoardNo = req.getParameter("boardno");
		if (sBoardNo == null || sBoardNo.length() == 0) { 
			resp.sendRedirect("hotplaceEdit.action");
			return;
		} 
		
		int boardNo = Integer.parseInt(sBoardNo);		
		
		HotplaceBoardService boardService = new HotplaceBoardService();
		HotplaceBoard board = boardService.findByBoardNo(boardNo);
		
		if (board == null) {
			resp.sendRedirect("hotplaceList.action");
			return;
		}				
		req.setAttribute("board", board);
		
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/hotplaceBoard/hotplaceEdit.jsp");
		dispatcher.forward(req, resp);		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String place = req.getParameter("place");
		String loc = req.getParameter("loc");
		String content = req.getParameter("content");
		String sBoardNo = req.getParameter("boardno");
		int boardNo = Integer.parseInt(sBoardNo);
				
		HotplaceBoard hotplaceBoard = new HotplaceBoard();
		hotplaceBoard.setTitle(title);
		hotplaceBoard.setWriter(writer);
		hotplaceBoard.setPlace(place);
		hotplaceBoard.setLoc(loc);
		hotplaceBoard.setContent(content);
		hotplaceBoard.setBoardNo(boardNo);
		
		HotplaceBoardService boardservice = new HotplaceBoardService();
		boardservice.Edit(hotplaceBoard);
		
		resp.sendRedirect("hotplaceDetail.action?boardno="+sBoardNo);
		
	}
}

	
 