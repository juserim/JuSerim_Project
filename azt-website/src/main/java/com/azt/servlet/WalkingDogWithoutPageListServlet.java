package com.azt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.WalkingDogBoard;
import com.azt.service.WalkingDogBoardService;

//@WebServlet(urlPatterns = {"/walkingDogBoard/walkingDogList.action"})
public class WalkingDogWithoutPageListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		WalkingDogBoardService boardService = new WalkingDogBoardService();
		List<WalkingDogBoard> boardList = boardService.findAll();
		
		req.setAttribute("boardList", boardList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/walkingDogBoard/walkingDogList.jsp");
		dispatcher.forward(req, resp);
	}
	
	
}
