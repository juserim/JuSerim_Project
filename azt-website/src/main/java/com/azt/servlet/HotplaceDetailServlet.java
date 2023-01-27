package com.azt.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.HotplaceBoard;
import com.azt.dto.HotplaceBoardComment;
import com.azt.service.HotplaceBoardService;


@WebServlet(urlPatterns = {"/hotplaceBoard/hotplaceDetail.action"})
public class HotplaceDetailServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sBoardNo = req.getParameter("boardno");
		//페이지 넘버
		if (sBoardNo == null || sBoardNo.length() == 0) { // 잘못된 요청
			resp.sendRedirect("hotplaceList.action");
			return;
		}
		
		int boardNo = Integer.parseInt(sBoardNo); 
		
		HotplaceBoardService boardService = new HotplaceBoardService();
		HotplaceBoard board = boardService.findByBoardNo(boardNo);
		
		if (board == null) {
			resp.sendRedirect("hotplaceList.action");
			return;
		}
		req.setAttribute("hotplaceBoard", board);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hotplaceBoard/hotplaceDetail.jsp");
		dispatcher.forward(req, resp);	

	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");
		String writer = req.getParameter("writer");
		String comment = req.getParameter("comment");
		
		HotplaceBoardComment hotplaceBoardComment = new HotplaceBoardComment();
		hotplaceBoardComment.setContent(comment);
		hotplaceBoardComment.setContent(writer);
		
		HotplaceBoardService boardService = new HotplaceBoardService();
		boardService.hotplaceBoardComment(hotplaceBoardComment);
		
		resp.sendRedirect("hotplaceDetail.action");
		
		
	}
	
	
	
	
}













