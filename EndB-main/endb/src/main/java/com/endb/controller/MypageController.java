package com.endb.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.endb.common.Util;
import com.endb.dto.Board;
import com.endb.dto.Reservation;
import com.endb.dto.User;
import com.endb.service.AccountService;
import com.endb.service.MypageService;
import com.mysql.cj.Session;

@Controller
@RequestMapping(path = { "/mypage" })
public class MypageController {

	MypageService mypageService;

	public MypageController(MypageService mypageService) {
		this.mypageService = mypageService;
	}

	@GetMapping(path = { "/info" })
	public String info(int userNo, Model model) {
		
		User user = mypageService.findUserInfo(userNo);
		List<Reservation> reservationList = mypageService.reservationInfo(userNo);
		List<Board> boardList = mypageService.boardInfo(userNo);
		
		model.addAttribute("user", user);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("boardList", boardList);
		return "/mypage/info";
	}

	@PostMapping(path = { "/info" })
	public String editInfo(User user, HttpServletRequest req, MultipartFile attach) {

		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");

		String userFileName = attach.getOriginalFilename();
		if (userFileName != null && userFileName.length() > 0) {
			String savedFileName = Util.makeUniqueFileName(userFileName);
			user.setUserFileName(userFileName);
			user.setSavedFileName(savedFileName);
			try {
				File path = new File(uploadDir, savedFileName);
				attach.transferTo(path); // 파일 저장
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		mypageService.editInfo(user);
		return "redirect:/home";
	}
	
	@GetMapping (path = { "/userDelete" })
	public String userDelete(int userNo, HttpSession httpSession) {
		
		mypageService.userDelete(userNo);
		httpSession.removeAttribute("loginuser");
		return "redirect:/home";
	}
	
	
}
