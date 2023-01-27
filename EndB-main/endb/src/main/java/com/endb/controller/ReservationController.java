package com.endb.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.endb.dto.Check;
import com.endb.dto.Reservation;
import com.endb.dto.Room;
import com.endb.dto.User;
import com.endb.service.BoardService;
import com.endb.service.ReservationService;

@Controller
@RequestMapping(path = "/booking")
public class ReservationController {
	
	@Autowired
	@Qualifier("reservationService")
	private ReservationService reservationService;
	
	
	@GetMapping(path = "/reservation")
	public String reservation(@RequestParam(name="roomid", defaultValue = "-1")int roomId
			,@RequestParam(name="pageNo", defaultValue = "-1")int pageNo, Model model) {
		if (roomId == -1 || pageNo == -1) {
            return "redirect:/endb/home";
        }

        Room room = reservationService.findAll(roomId);
        if (room == null) { // 해당 번호의 게시글이 없는 경우
            return "redirect:/endb/home";
        }
        List<Reservation> dto = reservationService.ReservationSelectByRoomId(roomId);

        Date from = new Date();
        SimpleDateFormat fm = new SimpleDateFormat("yyyy,MM,dd");
        String to = fm.format(from);
		if (dto == null) {
			return "redirect:/home";
		}
//		model.addAttribute("confirmation_payment", confirmation_payment);
		model.addAttribute("dto", dto);
        model.addAttribute("room", room);
		model.addAttribute(roomId);
		model.addAttribute(pageNo);
		return "booking/reservation";
	}
	
	@PostMapping(path = "/reservation")
	public String reservationwrite(int userNo,int roomId, String checkIn, 
			String checkOut, int adult, int kid,int diff, int price, HttpSession session, Model model) throws ParseException {
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");            
		Date checkIn1 = formatter.parse(checkIn);
		Date checkOut1 = formatter.parse(checkOut);
		
		Reservation reservation = new Reservation();
		reservation.setUserNo(userNo);
		reservation.setRoomId(roomId);
		reservation.setCheckIn(checkIn1);
		reservation.setCheckOut(checkOut1);
		reservation.setAdult(adult);
		reservation.setKid(kid);

		int RoomPrice = reservationService.RoomPrice(roomId);
		int price1 = RoomPrice * diff;
		reservation.setPrice(price);
		reservationService.reservationInsert(reservation);
		//		dto.setUserNo((String) session.getAttribute("userNo"));
//		int duplicateFind = reservationService.DuplicateFind(dto);
//		if (duplicateFind >= 1) {
//			model.addAttribute("duplicateFind", duplicateFind);
//			return "booking/reservation";
//		}

//		String ReservationNumber = UUID.randomUUID().toString(); 
//		dto.setReservationNumber(ReservationNumber);
//		
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
//		Date beginDate = formatter.parse(dto.getCheckIn()); 
//		Date endDate = formatter.parse(dto.getCheckOut()); 
//		long diff = endDate.getTime() - beginDate.getTime(); 
//
//		long diffDays = diff / (24 * 60 * 60 * 1000) + 1;.
//		
//		int price = RoomPrice * (int) diffDays;
//		dto.setPrice(price);
//		reservationService.reservationInsert(dto);
//		model.addAttribute("dto", dto);
		return "booking/reservation";
	}
	
	@GetMapping(path = "/reservationSelect")
	public String reservationSelect(@RequestParam(name="pageNo", defaultValue = "-1")int pageNo,
			HttpSession session, Reservation reservation, Model model) {
//		String confirmation_payment = reservationService.PayCheck((int) session.getAttribute("userNo"));
		User user = (User)session.getAttribute("loginuser");
		int userNo = user.getUserNo();
		List<Reservation> dto = reservationService.ReservationSelect(userNo);
		
		if (dto == null) {
			return "redirect:/home";
		}
//		model.addAttribute("confirmation_payment", confirmation_payment);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", pageNo);
		return "booking/reservationSelect";
	}
	
}
