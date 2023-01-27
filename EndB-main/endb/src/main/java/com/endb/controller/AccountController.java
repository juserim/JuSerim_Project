package com.endb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.endb.dto.User;
import com.endb.service.AccountService;
import com.mysql.cj.Session;

@Controller
@RequestMapping(path = { "/account" })
public class AccountController {

	private AccountService accountService;

	public AccountController(AccountService accountService) {
		this.accountService = accountService;
	}

	@GetMapping(path = { "/register" })
	public String ShowRegister() {
		return "account/register";
	}

	@PostMapping(path = { "/register" })
	public String register(User user) {

		accountService.register(user);

		return "redirect:login";
	}

	@GetMapping(path = { "/login" })
	public String showLogin() {
		return "account/login";
	}

	@PostMapping(path = { "/login" })
	public String login(User user, HttpSession httpSession, Model model) {

		User user2 = accountService.login(user);
		if (user2 != null) {
			httpSession.setAttribute("loginuser", user2);
			System.out.println("LOGIN SUCCESS");
			return "redirect:/home";
		} else {
			model.addAttribute("msg", "아이디, 비밀번호를 확인해주세요.");
			System.out.println("LOGIN FAIL");
			return "account/login";
		}
	}

	@GetMapping(path = { "/logout" })
	public String logout(HttpSession httpSession) {
		httpSession.removeAttribute("loginuser");
		return "redirect:/home";
	}

	@PostMapping(path = { "checkId" })
	@ResponseBody
	public String checkId(String checkId) {
		int check = accountService.checkId(checkId);
		if (check == 0) {
			return "success";
		} else {
			return "fail";
		}
	}

}
