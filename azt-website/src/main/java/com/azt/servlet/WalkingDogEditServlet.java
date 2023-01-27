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

@WebServlet(urlPatterns = {"/walkingDogBoard/walkingDogEdit.action"})
public class WalkingDogEditServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sBoardNo = req.getParameter("boardno");
		if(sBoardNo == null || sBoardNo.length() == 0) {// 잘못된 요청
			resp.sendRedirect("walkingDogList.action");
			return;
		}
		
		int boardNo = Integer.parseInt(sBoardNo);
		
		WalkingDogBoardService boardService = new WalkingDogBoardService();
		WalkingDogBoard dogBoard = boardService.findByBoardNo(boardNo);
		
		if(dogBoard == null) { // 해당 번호의 게시글이 없는 경우 
			resp.sendRedirect("walkingDogList.action");
			return;
		}
		
		req.setAttribute("dogBoard", dogBoard);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/walkingDogBoard/walkingDogEdit.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		String sBoardNo = req.getParameter("boardno");
		int boardNo = Integer.parseInt(sBoardNo);
		String title = req.getParameter("title");
		String dogName = req.getParameter("dogName");
		String breed = req.getParameter("breed");
		String weight = req.getParameter("weight");
		String location = req.getParameter("location");
		String content = req.getParameter("content");
		
		WalkingDogBoard dogBoard = new WalkingDogBoard();
		dogBoard.setBoardNo(boardNo);
		dogBoard.setTitle(title);
		dogBoard.setDogName(dogName);
		dogBoard.setBreed(breed);
		dogBoard.setWeight(weight);
		dogBoard.setLocation(location);
		dogBoard.setContent(content);
		
		
		WalkingDogBoardService boardService = new WalkingDogBoardService();
		boardService.update(dogBoard);
		
		resp.sendRedirect("walkingDogdetail.action?boardno=" + sBoardNo);
		
	}
	
}
