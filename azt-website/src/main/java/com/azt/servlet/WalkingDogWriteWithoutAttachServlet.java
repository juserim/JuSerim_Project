package com.azt.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.dto.WalkingDogBoard;
import com.azt.service.WalkingDogBoardService;

//@WebServlet(urlPatterns = {"/walkingDogBoard/walkingDogWrite.action"})
public class WalkingDogWriteWithoutAttachServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		if(session.getAttribute("loginuser") == null) { // 로그인하지 않는 경우
			resp.sendRedirect("/azt-website/account/login.action");
			return;
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/walkingDogBoard/walkingDogWrite2.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String dogName = req.getParameter("dogName");
		String breed = req.getParameter("breed");
		String weight = req.getParameter("weight");
		String location = req.getParameter("location");
		String content = req.getParameter("content");
		
		WalkingDogBoard board = new WalkingDogBoard();
		board.setTitle(title);
		board.setWriter(writer);
		board.setDogName(dogName);
		board.setBreed(breed);
		board.setWeight(weight);
		board.setLocation(location);
		board.setContent(content);
		
		WalkingDogBoardService boardService = new WalkingDogBoardService();
		boardService.writeBoard(board);
		
		resp.sendRedirect("/azt-website/walkingDogBoard/walkingDogList.action");
		
	}
}
