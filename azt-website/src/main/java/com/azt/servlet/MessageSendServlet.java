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
import com.azt.service.MemberService;
import com.azt.service.MessageService;
import com.azt.ui.ReceiveMessagePager;
import com.azt.ui.SendMessagePager;

@WebServlet(urlPatterns = { "/message/sendMessage.action" })
public class MessageSendServlet extends HttpServlet {
	
	@Override
	protected void 
	doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
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
		List<Message> messageList = messageService.readMessagePage2(memberId, pageNo, pageSize);
		
		count = messageService.findMessageCount();
		SendMessagePager pager = new SendMessagePager(count, pageNo, pageSize, pagerSize, "sendMessage.action");
		
		req.setAttribute("messageList", messageList);
		req.setAttribute("pager", pager);
		req.setAttribute("pageno", pageNo);
//		MessageService messageService = new MessageService();
//		List<Message> messageList = messageService.sendMessage(memberId);
//		req.setAttribute("messageList", messageList);
		
		MemberService memberService = new MemberService();
		List<Member> members = memberService.findMembers();
		req.setAttribute("members", members);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/message/sendMessage.jsp");
		dispatcher.forward(req, resp);
		} else {
			resp.sendRedirect("/azt-website/home.action");
		}
		
	}
	
	
	@Override
	protected void 
	doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		String sender = req.getParameter("sender");
		String receiver = req.getParameter("receiver");
		String message = req.getParameter("message");
		
		Message messageDto = new Message();
		messageDto.setSender(sender);
		messageDto.setReceiver(receiver);
		messageDto.setMessage(message);
		
		MessageService messageservice = new MessageService();
		messageservice.sendMessage(messageDto);
		
		resp.sendRedirect("sendMessage.action");
		
		
	}
	
}
