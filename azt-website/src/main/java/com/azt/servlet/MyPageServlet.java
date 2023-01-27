package com.azt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azt.dto.DogBreedIntro;
import com.azt.dto.DogMember;
import com.azt.dto.HotplaceBoard;
import com.azt.dto.Member;
import com.azt.dto.ShowMyDogBoard;
import com.azt.dto.ShowMyDogBoardComment;
import com.azt.dto.WalkingDogBoard;
import com.azt.service.AccountService3;
import com.azt.service.MyPageService;
import com.azt.service.ShowMyDogBoardService;

@WebServlet(urlPatterns = { "/account/mypage.action" })
public class MyPageServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		if (session.getAttribute("loginuser") == null) { // 로그인하지 않은 경우
			resp.sendRedirect("/azt-website/account/login.action");
			return;
		}		
		
		//1. 요청 데이터 읽기				
		String memberId= req.getParameter("memberId");
		String owner = req.getParameter("memberId");
		String writer = req.getParameter("memberId");
		int count = 0; 
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		
		//2. 요청 처리		
		MyPageService myPageService = new MyPageService();
		DogMember dogMember = myPageService.findByOwner(owner);		
		Member member = myPageService.findByMemberId(memberId);
		List<ShowMyDogBoard> boardList = myPageService.findShowMyDogBoardList(writer);	
		List<HotplaceBoard> boardList2 = myPageService.findHotPlaceBoardList(writer);
		List<WalkingDogBoard> boardList3 = myPageService.findWalkingDogBoardList(writer); 
		List<DogBreedIntro> boardList4 = myPageService.findDogBreedIntroList(writer); 
		count = myPageService.findShowMyDogBoardCount(writer);
		count2 = myPageService.findHotPlaceBoardCount(writer);
		count3 = myPageService.findWalkingDogBoardCount(writer);
		count4 = myPageService.findBreedIntroCount(writer);
		List<ShowMyDogBoardComment> comments = myPageService.findShowMyDogBoardComment(writer);
		
		//3. JSP에서 사용할 수 있도록 request 데이터 저장( forward 이동인 경우 )

		req.setAttribute("memberId", memberId);
		req.setAttribute("member", member);		
		req.setAttribute("owner", owner);		
		req.setAttribute("dogMember", dogMember);	
		req.setAttribute("boardList", boardList);
		req.setAttribute("boardList2", boardList2);		
		req.setAttribute("boardList3", boardList3);	
		req.setAttribute("boardList4", boardList4);	
		req.setAttribute("count", count);
		req.setAttribute("count2", count2);
		req.setAttribute("count3", count3);
		req.setAttribute("count4", count4);
		req.setAttribute("comments", comments);
		
		//4. 이동 ( forward or redirect)
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/account/mypage.jsp");
		dispatcher.forward(req, resp);

	}
}
