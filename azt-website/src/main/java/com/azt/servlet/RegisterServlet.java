package com.azt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.dto.DogMember;
import com.azt.dto.Member;
import com.azt.service.AccountService2;
import com.azt.service.AccountService3;

@WebServlet(urlPatterns = { "/account/register.action" })
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// RequestDispatcher : 요청을 다른 처리기에게 (Servlet or JSP)에게 전달하는 도구
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/account/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1. 요청 데이터 읽기
		req.setCharacterEncoding("utf-8");
		String memberId = req.getParameter("memberId");
		String passwd = req.getParameter("passwd");
		String confirm = req.getParameter("confirm");
		String email = req.getParameter("email");		
		// System.out.printf("[%s][%s][%s][%s]\n", memberId, passwd, confirm, email);
		
		// 읽은 요청 데이터를 DTO 객체에 저장
		Member member = new Member();
		member.setMemberId(memberId);
		member.setPasswd(passwd);
		member.setEmail(email);
		
		// 2. 요청 처리 (회원가입 처리 : 데이터베이스에 데이터 저장)
		//    서비스 객체에게 요청해서 처리
		AccountService2 accountService = new AccountService2();
		accountService.registerMember(member);
		
		
		// 1. 요청 데이터 읽기
			
		String check = req.getParameter("check");		
		if(check != null) {
			//String owner = req.getParameter("owner");
			String owner = memberId;
			String dogname = req.getParameter("dogname");
			String breed = req.getParameter("breed");
			String surgery = req.getParameter("surgery");
			String loc = req.getParameter("loc");	
			String sWeight = req.getParameter("weight"); // req.getParameter : 항상 문자열로 데이터 읽기
			int weight = Integer.parseInt(sWeight);
			// System.out.printf("[%s][%s][%s][%s]\n", memberId, passwd, confirm, email);
			
			// 읽은 요청 데이터를 DTO 객체에 저장
			DogMember dogMember = new DogMember();
			dogMember.setOwner(owner);
			dogMember.setDogname(dogname);
			dogMember.setBreed(breed);
			dogMember.setSurgery(surgery);
			dogMember.setLoc(loc);
			dogMember.setWeight(weight);
			
			// 2. 요청 처리 (회원가입 처리 : 데이터베이스에 데이터 저장)
			//    서비스 객체에게 요청해서 처리
			AccountService3 accountService4 = new AccountService3();
			accountService4.registerDogMember(dogMember);
			
		}
		
		resp.sendRedirect("/azt-website/account/login.action");

		
	}

}