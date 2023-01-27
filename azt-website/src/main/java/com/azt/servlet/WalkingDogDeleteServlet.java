package com.azt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.service.WalkingDogBoardService;

@WebServlet(urlPatterns = {"/walkingDogBoard/walkingDogDelete.action"})
public class WalkingDogDeleteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sBoardNo = req.getParameter("boardno");
		
		if(sBoardNo == null || sBoardNo.length() == 0) {// 잘못된 요청
			resp.sendRedirect("walkingDogList.action");
			return;
		}
		
		int boardNo = Integer.parseInt(sBoardNo);
		
		WalkingDogBoardService boardService = new WalkingDogBoardService();
		boardService.delete(boardNo);
		
		resp.sendRedirect("walkingDogList.action");
		
	}
	
}
