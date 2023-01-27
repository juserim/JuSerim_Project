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



@WebServlet(urlPatterns = {"/hotplaceBoard/comment-write.action"})
public class HotplaceBoardCommentWriteServlet extends HttpServlet {		
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(req.getParameter("boardno"));
		String writer = req.getParameter("writer");		
		String content = req.getParameter("content");
	
		HotplaceBoardComment comment = new HotplaceBoardComment();
		comment.setBoardNo(boardNo);
		comment.setWriter(writer);
		comment.setContent(content);
		
		HotplaceBoardService boardService = new HotplaceBoardService();
		boardService.writeHotplaceBoardComment(comment);
		
		PrintWriter out = resp.getWriter();
		out.print("success");
	}
}

	
 