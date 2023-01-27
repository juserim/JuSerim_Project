package com.azt.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azt.dto.WalkingDogBoard;
import com.azt.service.WalkingDogBoardService;
import com.azt.ui.WalkingDogThePager;

@WebServlet(urlPatterns = { "/walkingDogBoard/walkingDogList.action" })
public class WalkingDogListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sPageNo = req.getParameter("pageNo");
		if (sPageNo == null || sPageNo.length() == 0) {
			sPageNo = "1";
		}
		int pageNo = Integer.parseInt(sPageNo);

		int pageSize = 10;
		int pagerSize = 3;
		int count = 0;

		WalkingDogBoardService boardService = new WalkingDogBoardService();
		List<WalkingDogBoard> boardList = boardService.findByPage(pageNo, pageSize);

		count = boardService.finBoardCount();

		WalkingDogThePager pager = new WalkingDogThePager(count, pageNo, pageSize, pagerSize, "walkingDogList.action");

		req.setAttribute("boardList", boardList);
		req.setAttribute("pager", pager);
		req.setAttribute("pageNo", pageNo);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/walkingDogBoard/walkingDogList.jsp");
		dispatcher.forward(req, resp);
	}

}
