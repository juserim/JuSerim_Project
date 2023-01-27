package com.azt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.HotplaceBoard;
import com.azt.dto.HotplaceBoardComment;
import com.azt.service.HotplaceBoardService;



@WebServlet(urlPatterns = {"/hotplaceBoard/comment-list.action"})
public class HotplaceBoardCommentListServlet extends HttpServlet {		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(req.getParameter("boardno"));
		
		HotplaceBoardService boardService = new HotplaceBoardService();
		List<HotplaceBoardComment> comments = boardService.findCommentByBoardNo(boardNo);
		
		req.setAttribute("comments", comments);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hotplaceBoard/comments.jsp");
		dispatcher.forward(req, resp);
		
	}
}

	
 