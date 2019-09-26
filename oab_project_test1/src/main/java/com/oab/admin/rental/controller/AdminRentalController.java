package com.oab.admin.rental.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.admin.rental.service.AdminRentalService;
import com.oab.admin.reservation.service.AdminReservationService;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.rental.vo.RentalVO;

@Controller
@RequestMapping(value = "/admin/rental")
public class AdminRentalController {
	
	@Autowired
	private AdminRentalService adminRentalService;
	@Autowired
	private AdminReservationService adminReservationService;
	
	@RequestMapping(value = "/adminRentalList" , method = RequestMethod.GET)
	public String adminRentalList(@ModelAttribute RentalVO arvo ,Model model) {
		
		Paging.setPage(arvo);
		
		int total = adminRentalService.adminRentalListCnt(arvo);
		System.out.println("rental 토탈수 : " + total);
		
		int count = total - (Util.nvl(arvo.getPage()) - 1) * Util.nvl(arvo.getPageSize());
		System.out.println("rental 카운트 " + count);
		
		List<RentalVO> adminRentalList = adminRentalService.adminRentalList(arvo);
		model.addAttribute("adminRentalList" , adminRentalList);
		model.addAttribute("count" , count);
		model.addAttribute("total" , total);
		model.addAttribute("data" , arvo);
		
		return "admin/rental/adminRentalList";
	}
	
	@RequestMapping(value = "/adminRentalInsert" , method = RequestMethod.POST)
	public String adminRentalInsert(@ModelAttribute RentalVO arvo , Model model) {
		System.out.println("rental 등록 메서드 호출 성공");
		int result = 0;
		int result_reservation = 0;
		String url = "";
		
		result = adminRentalService.adminRentalInsert(arvo);
		result_reservation = adminReservationService.adminReservationStatusUpdate(arvo);
		
		if (result == 1 && result_reservation == 1) {
			System.out.println("rental 등록 성공");
			url = "/admin/reservation/adminReservationCompleteList";
		}else {
			System.out.println("rental 등록 실패");
			url = "/admin/reservation/adminReservationCompleteList";
		}
		return "redirect:" + url;
	}
	
	@RequestMapping(value = "/adminRentalDelete" , method = RequestMethod.POST )
	public String adminRentalDelete(@ModelAttribute RentalVO arvo) {
		int result = 0;
		int result_reservationn = 0;
		String url = "/admin/rental/adminRentalList";
		arvo.getRest_number();
		result_reservationn = adminReservationService.adminReservationStatusUpdate(arvo);
		result = adminRentalService.adminRentalDelete(arvo.getRent_number());
		if(result == 1 && result_reservationn == 1) {
			System.out.println("rental 삭제 성공");
		}else {
			System.out.println("rental 삭제 실패");
		}
		return "redirect:" + url;
	}
	
	
	@RequestMapping(value = "/adminRentalModify" , method = RequestMethod.POST)
	public String adminRentalModify(@ModelAttribute RentalVO arvo) {
		int result = 0;
		String rent_expretrun =arvo.getRent_expretrun();
		
		DateFormat sysdate_all = new SimpleDateFormat("yyyy-MM-dd HH:mm");//예 2019-09-25 15:13:31
		Date sysdate_time = new Date();
		String sysdate_day = sysdate_all.format(sysdate_time);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date d = null;
		Date d2 = null;
		try {
			d = df.parse(rent_expretrun);
			d2 = df.parse(sysdate_day);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(sysdate_day);
		System.out.println(rent_expretrun);
		System.out.println(d.getTime());
		System.out.println(d2.getTime());
		
		long test1 = (long)d.getTime();
		long test2 = (long)d2.getTime();
		System.out.println(test1);//반납예상시간
		System.out.println(test2);//현재시간
		long overtime = (test2-test1) / 6000;
		System.out.println(overtime);
		System.out.println(overtime/6000);//시간과 분을 분으로
		arvo.setRent_actretrun(sysdate_day);
		
		if(overtime <= 240) {
			arvo.setRent_overtime(0);
			arvo.setRent_addcost(0);
			result = adminRentalService.adminRentalModify(arvo);
		} else /* if (overtime >240) */ {
			double overtime_test = overtime/60;
			int test5 = (int) Math.ceil(overtime_test);
			arvo.setRent_overtime(test5);
			arvo.setRent_addcost(test5 * 3000);
			result = adminRentalService.adminRentalModify(arvo);
		}
		
		if(result == 1 ) {
			System.out.println("rental 수정 성공");
		}else {
			System.out.println("rental 수정 실패");
		}
		return "redirect:/admin/rental/adminRentalList";
	}
}
