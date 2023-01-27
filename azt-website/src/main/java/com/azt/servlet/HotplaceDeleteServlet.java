package com.azt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.service.HotplaceBoardService;

@WebServlet(urlPatterns = {"/hotplaceBoard/hotplaceDelete.action"})
public class HotplaceDeleteServlet extends HttpServlet {
	
	@Override
	protected void 
	doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		
		String sBoardNo = req.getParameter("boardno");
		if (sBoardNo == null || sBoardNo.length() == 0) { 
			resp.sendRedirect("hotplaceList.action");
			return;
		} 
		
		int boardNo = Integer.parseInt(sBoardNo);		
		
		HotplaceBoardService boardService = new HotplaceBoardService();
		boardService.delete(boardNo);
				
		resp.sendRedirect("hotplaceList.action");
	}

}
