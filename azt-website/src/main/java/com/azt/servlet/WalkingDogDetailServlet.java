package com.azt.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.WalkingDogBoard;
import com.azt.service.WalkingDogBoardService;

@WebServlet(urlPatterns = {"/walkingDogBoard/walkingDogdetail.action"})
public class WalkingDogDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sBoardNo= req.getParameter("boardno");
		int boardNo = Integer.parseInt(sBoardNo);
		
		WalkingDogBoardService boardService = new WalkingDogBoardService();
		WalkingDogBoard dogBoard = boardService.findByBoardNo(boardNo);
		
		req.setAttribute("dogBoard", dogBoard);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/walkingDogBoard/walkingDogDetail2.jsp");
		dispatcher.forward(req, resp);
	}
	
	
}
