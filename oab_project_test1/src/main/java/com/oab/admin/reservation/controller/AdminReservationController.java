package com.oab.admin.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oab.admin.reservation.service.AdminReservationService;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.reservation.vo.ReservationVO;

@Controller
@RequestMapping(value = "/admin/reservation")
public class AdminReservationController {
	//로그 안먹힘.
	//private Logger log = LoggerFactory.getLogger(AdminReservationController.class);
	
	@Autowired
	private AdminReservationService adminReservationService;
	
	//예약대기 리스트
	@RequestMapping(value = "/adminReservationWaitingList" , method = RequestMethod.GET)
	public String adminReservationWaitingList_Chk(@ModelAttribute ReservationVO rvo , Model model,HttpServletRequest request) {
		System.out.println("예약 정보 리스트 Controller 호출 성공");
		
		//페이징 세팅
		Paging.setPage(rvo);
		
		//전체 레코드 수
		int total = adminReservationService.adminReservationWaitingListCnt(rvo);
		System.out.println("예약 전체 레코드 수 확인 : " + total);
		
		//글번호 재설정
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());
		System.out.println("예약 count 수 확인 : " + count);
		
		List<ReservationVO> adminReservationWaitingList = adminReservationService.adminReservationWaitingList(rvo);
		model.addAttribute("adminReservationWaitingList", adminReservationWaitingList);
		model.addAttribute("count" , count);
		model.addAttribute("total" , total);
		model.addAttribute("data" , rvo);
		return "admin/reservation/adminReservationWaitingList";
	}
	
	//예약완료 리스트
	@RequestMapping(value = "/adminReservationCompleteList" , method = RequestMethod.GET)
	public String adminReservationCompleteList_Chk(@ModelAttribute ReservationVO rvo , Model model,HttpServletRequest request) {
		System.out.println("예약 완료 리스트 Controller 호출 성공");
		
		//페이징 세팅
		Paging.setPage(rvo);
		
		//전체 레코드 수
		int total = adminReservationService.adminReservationCompleteListCnt(rvo);
		System.out.println("예약 전체 레코드 수 확인 : " + total);
		
		//글번호 재설정
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());
		System.out.println("예약 count 수 확인 : " + count);
		
		List<ReservationVO> adminReservationCompleteList = adminReservationService.adminReservationCompleteList(rvo);
		
		model.addAttribute("adminReservationCompleteList", adminReservationCompleteList);
		model.addAttribute("count" , count);
		model.addAttribute("total" , total);
		model.addAttribute("data" , rvo);
		return "admin/reservation/adminReservationCompleteList";
	}
	
	//예약취소 리스트
	@RequestMapping(value = "/adminReservationCancelList" , method = RequestMethod.GET)
	public String adminReservationCancelList_Chk(@ModelAttribute ReservationVO rvo , Model model,HttpServletRequest request) {
		System.out.println("예약 완료 리스트 Controller 호출 성공");
		
		//페이징 세팅
		Paging.setPage(rvo);
		
		//전체 레코드 수
		int total = adminReservationService.adminReservationCancelListCnt(rvo);
		System.out.println("예약 전체 레코드 수 확인 : " + total);
		
		//글번호 재설정
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());
		System.out.println("예약 count 수 확인 : " + count);
		
		List<ReservationVO> adminReservationCancelList = adminReservationService.adminReservationCancelList(rvo);
		
		model.addAttribute("adminReservationCancelList", adminReservationCancelList);
		model.addAttribute("count" , count);
		model.addAttribute("total" , total);
		model.addAttribute("data" , rvo);
		return "admin/reservation/adminReservationCancelList";
	}
	
	
	//예약 환불요청 완료 리스트
	@RequestMapping(value = "/adminReservationRefundList" , method = RequestMethod.GET)
	public String adminReservationRefundList_Chk(@ModelAttribute ReservationVO rvo , Model model,HttpServletRequest request) {
		System.out.println("예약 완료 리스트 Controller 호출 성공");
		
		//페이징 세팅
		Paging.setPage(rvo);
		
		//전체 레코드 수
		int total = adminReservationService.adminReservationRefundListCnt(rvo);
		System.out.println("예약 전체 레코드 수 확인 : " + total);
		
		//글번호 재설정
		int count = total - (Util.nvl(rvo.getPage()) - 1) * Util.nvl(rvo.getPageSize());
		System.out.println("예약 count 수 확인 : " + count);
		
		List<ReservationVO> adminReservationRefundList = adminReservationService.adminReservationRefundList(rvo);
		
		model.addAttribute("adminReservationRefundList", adminReservationRefundList);
		model.addAttribute("count" , count);
		model.addAttribute("total" , total);
		model.addAttribute("data" , rvo);
		return "admin/reservation/adminReservationRefundList";
	}
	
	
	//예약 상태 변경하는 메소드
	@RequestMapping(value = "/adminReservationStatusUpdate" , method = RequestMethod.POST)
	public String adminReservationStatusUpdate_Chk(@ModelAttribute ReservationVO rvo , Model model , @RequestParam(value = "url", required = false, defaultValue = "/admin/reservation/adminReservationWaitingList") String url,HttpServletRequest request) {
		int result = 0;
		String getURL = "";
		result = adminReservationService.adminReservationStatusUpdate(rvo);
		if(result == 1) {
			getURL = url;
		}
		return "redirect:"+getURL;
	}
}
