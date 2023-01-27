package com.azt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.HotplaceBoard;
import com.azt.dto.HotplaceBoardComment;
import com.azt.service.HotplaceBoardService;



@WebServlet(urlPatterns = {"/hotplaceBoard/comment-delete.action"})
public class HotplaceBoardCommentDeleteServlet extends HttpServlet {		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");
		int commentNo = Integer.parseInt(req.getParameter("commentno"));		
	
		HotplaceBoardService boardService = new HotplaceBoardService();
		boardService.deleteHotplaceBoardComment(commentNo);
		
		PrintWriter out = resp.getWriter();
		out.print("success");
	}
}

	
 