package com.azt.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.service.HotplaceBoardService;
import com.azt.service.MessageService;

@WebServlet(urlPatterns = {"/message/messageDelete.action"})
public class MessageDeleteServlet extends HttpServlet {
	
	@Override
	protected void 
	doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {			
		
		String sMessageNo = req.getParameter("messageno");
		if (sMessageNo == null || sMessageNo.length() == 0) { 
			resp.sendRedirect("messageList.action");
			return;
		} 
		
		int messageNo = Integer.parseInt(sMessageNo);		
		
		MessageService messageService = new MessageService();
		messageService.delete(messageNo);
						
		resp.sendRedirect("messageList.action");
	}

}
