package com.azt.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.DogBreedIntro;
import com.azt.service.DogBreedIntroService;



@WebServlet(urlPatterns = {"/DogBreedIntro/DogBreedIntroBoardComment.action"})
public class DogBreedIntroBoardCommentServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("/WEB-INF/views/DogBreedIntro/DogBreedIntroWrite.jsp");
		dispatcher.forward(req, resp);		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.setCharacterEncoding("utf-8");
		String writer = req.getParameter("writer");		
		String content = req.getParameter("content");
	
		DogBreedIntro dogBreedIntro = new DogBreedIntro();
		dogBreedIntro.setWriter(writer);
		dogBreedIntro.setContent(content);
		
		DogBreedIntroService boardservice = new DogBreedIntroService();
		boardservice.dogBreedIntroComment(dogBreedIntro);
		
		resp.sendRedirect("dogBreedIntroDetail.action");
	}
}
