package com.endb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.endb.dto.Message;
import com.endb.dto.User;
import com.endb.service.MessageService;
import com.endb.ui.MessagePager;
import com.endb.ui.ThePager;

@Controller
@RequestMapping(path = { "/message" })
public class MessageController {

	@Autowired
	@Qualifier("messageService")
	private MessageService messageService;

	@GetMapping(path = { "/list" })
	public String list(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) {

		int pageSize = 4;
		int pagerSize = 4;
		int count = 0;

		User user = (User) session.getAttribute("loginuser");

		List<Message> messageList = messageService.findByPage(pageNo, pageSize, user.getUserNo());
		count = messageService.findMessageCount(user.getUserNo());

		MessagePager messagepager = new MessagePager(count, pageNo, pageSize, pagerSize, "list");

		model.addAttribute("messageList", messageList);
		model.addAttribute("messagepager", messagepager);
		model.addAttribute("messageList", messageList);
		model.addAttribute("pageNo", pageNo);
		
		return "message/list";
	}

//	@GetMapping(path = {"/messageList"})
//	public String messageList (Model model, HttpSession session ) {
//		
//		User user = (User)session.getAttribute("loginuser");
//		
//		List<Message> messageList = messageService.findMessageListByUserNo(user.getUserNo());
//		model.addAttribute("messageList", messageList);
//		
//		return "message/messageList";
//		
//	}

	@GetMapping(path = { "/sendlist" })
	public String sandlist(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) {

		int pageSize = 4;
		int pagerSize = 4;
		int count = 0;

		User user = (User) session.getAttribute("loginuser");

		List<Message> messageSendList = messageService.findByPage2(pageNo, pageSize, user.getUserNo());
		count = messageService.findMessageCount(user.getUserNo());

		MessagePager messagepager = new MessagePager(count, pageNo, pageSize, pagerSize, "sandlist");

		model.addAttribute("messageSendList", messageSendList);
		model.addAttribute("messagepager", messagepager);
		model.addAttribute("pageNo", pageNo);

		return "message/sendlist";
	}
//	
//	@GetMapping(path= {"/messageSandList"})
//	public String messageSandList (Model model, HttpSession session) {
//		
//		User user = (User)session.getAttribute("loginuser");
//		
//		List<Message> messageSandList = messageService.findByPage2(user.getUserNo());
//		model.addAttribute("messageSandList", messageSandList);
//		
//		return "message/messageSandList";
//		
//	}

		
	@GetMapping(path = { "/write" })
	public String showWrite(Model model) {

		List<User> userList = messageService.findUserList();
		model.addAttribute("userList", userList);

		return "message/write";
	}

	@PostMapping(path = { "/write" })
	public String showWriteForm(Message message, HttpServletRequest req) {
		messageService.writeMessage(message);

		return "redirect:list";
	}

	@PostMapping(path = { "/receiver" })
	public String receiver(User user, Model model) {

		List<User> userList = messageService.findUserList();
		model.addAttribute("userList", userList);

		// messageService.receiver(user);
		
		return "message/receiver";
		
		
		
		
	}

	@GetMapping(path = { "/detail" })
    public String detail(@RequestParam(name = "messageno", defaultValue=  "-1")int messageNo, 
    		             @RequestParam(name = "pageNo", defaultValue= "-1")int pageNo, Model model ) {
		
		if (messageNo == -1 || pageNo == -1) 
				{
			return "redirect:list";

		}
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) {
			return "redirect:list";
		}

		model.addAttribute("message", message);
		model.addAttribute("pageNo", pageNo);

		return "message/detail";

	}
	@GetMapping(path = { "/detail2" })
    public String detail2(@RequestParam(name = "messageno", defaultValue=  "-1")int messageNo, 
    		             @RequestParam(name = "pageNo", defaultValue= "-1")int pageNo, Model model ) {
		
		if (messageNo == -1 || pageNo == -1) 
				{
			return "redirect:list";

		}
		Message message = messageService.findByMessageNo(messageNo);
		if (message == null) {
			return "redirect:list";
		}

		model.addAttribute("message", message);
		model.addAttribute("pageNo", pageNo);

		return "message/detail2";

	}

	@GetMapping(path = { "/reply" })
	public String showReply(@RequestParam(defaultValue = "-1") int receiverNo, String receiverId, Model model) {

		if (receiverNo == -1 || receiverId == null || receiverId.length() == 0) {
			return "list";
		}

		return "message/reply";
	}

	@PostMapping(path = { "/reply" })
	public String showReplyForm(Message message, HttpServletRequest req) {
		messageService.replyMessage(message);

		return "redirect:list";
	}

	@GetMapping(path = { "/delete" })
	public String delete(@RequestParam(name = "messageno", defaultValue = "-1") int messageNo,
			@RequestParam(defaultValue = "-1") int pageNo) {

		if (messageNo > 0 && pageNo > 0) {
			messageService.delete(messageNo);
			return "redirect:list?messageNo=" + pageNo;
		}
		return "redirect:list";
	}

}
