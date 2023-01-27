package com.endb.controller;

import com.endb.dto.Room;
import com.endb.service.BoardService;
import com.endb.ui.ThePager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller // http 요청 처리 객체로 ioc 컨테이너에 등록
public class HomeController {
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

	@RequestMapping(path = {"/", "/home"}) // "/" 또는 "/home" 요청을 처리하는 메서드로 등록
	public String home(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int pageSize = 9; // 한 페이지에 표시할 데이터 개수
		int pagerSize = 10; // 표시되는 페이지 번호 개수 ( 보이지 않은 페이지 번호는 다음, 이전 등으로 표시 )
		int count = 0; // 전체 데이터 개수

		// List<Board> boardList = boardService.findAll();
		List<Room> boardList = boardService.findByPage(pageNo, pageSize);
		count = boardService.findBoardCount(); // 데이터베이스에 전체 개시물 개수 조회

		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");

		// Model 타입의 전달인자에 데이터를 저장하면 View(JSP)로 데이터가 전달됩니다. ( request에 저장 )
		model.addAttribute("boardList", boardList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		return "home";

	}
}
