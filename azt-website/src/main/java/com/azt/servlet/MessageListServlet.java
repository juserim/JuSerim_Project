package com.azt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.dto.Member;
import com.azt.dto.Message;
import com.azt.service.MessageService;
import com.azt.ui.ReceiveMessagePager;

@WebServlet(urlPatterns = { "/message/messageList.action" })
public class MessageListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginuser");
		if (member != null) {
			String memberId = member.getMemberId();
			
			String sPageNo = req.getParameter("pageno");
			if (sPageNo == null || sPageNo.length() == 0) {
				sPageNo = "1";
			}
			int pageNo = Integer.parseInt(sPageNo);
			int pageSize = 10;  // 한 페이지에 표시할 데이터 개수
			int pagerSize = 3; // 표시되는 페이지 번호 개수  (보이지 않은 페이지 번호는 다음, 이전 ... 등으로 표시)
			int count = 0; // 전체 데이터 개수
		
			MessageService messageService = new MessageService();
			List<Message> messageList = messageService.readMessagePage(memberId, pageNo, pageSize);
			
			count = messageService.findMessageCount();
			ReceiveMessagePager pager = new ReceiveMessagePager(count, pageNo, pageSize, pagerSize, "messageList.action");
			
			req.setAttribute("messageList", messageList);
			req.setAttribute("pager", pager);
			req.setAttribute("pageno", pageNo);
			
//			MessageService messageService = new MessageService();
//			List<Message> messageList = messageService.readMessage(memberId);
//			req.setAttribute("messageList", messageList);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/message/messageList.jsp");
			dispatcher.forward(req, resp);
		} else {
			resp.sendRedirect("/azt-website/home.action");
		}
		
	}
	
}
