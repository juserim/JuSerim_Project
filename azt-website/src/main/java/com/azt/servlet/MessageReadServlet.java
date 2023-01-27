package com.azt.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.Message;
import com.azt.service.MessageService;

@WebServlet(urlPatterns = {"/message/readMessage.action"})
public class MessageReadServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sMessageNo = req.getParameter("messageno");
		
		if (sMessageNo == null || sMessageNo.length() == 0) {
			resp.sendRedirect("messageList.action");
			return;
		}
		
		int messageNo = Integer.parseInt(sMessageNo);
		
		MessageService messageService = new MessageService();
		Message message = messageService.findByMessageNo(messageNo);
		
		if(message == null) {
			resp.sendRedirect("messageList.action");
			return;
		}
		req.setAttribute("messages", message);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/message/readMessage.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
