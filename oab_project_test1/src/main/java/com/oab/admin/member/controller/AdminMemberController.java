package com.oab.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.admin.member.service.AdminMemberService;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/admin/member")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	//회원 전체 리스트 구현
	@RequestMapping(value = "/adminMemberList" , method = RequestMethod.GET)
	public String adminMemberList(@ModelAttribute MemberVO amvo , Model model) {
		
		//페이징
		Paging.setPage(amvo);
		
		//전체 레코드 수 구현
		int total = adminMemberService.adminMemberListCnt(amvo);
		System.out.println("토탈" + total);
		
		//글번호 재설정
		int count = total - (Util.nvl(amvo.getPage()) - 1) * Util.nvl(amvo.getPageSize());
		System.out.println("카운트 " + count);
		
		List<MemberVO> adminMemberList = adminMemberService.adminMemberList(amvo);
		System.out.println(amvo);
		model.addAttribute("adminMemberList" , adminMemberList);
		model.addAttribute("count" , count);
		model.addAttribute("total" , total);
		model.addAttribute("data" , amvo);
		
		return "admin/member/adminMemberList";
	}
	
	@RequestMapping(value = "/adminMemberDisabledUpdate" , method = RequestMethod.POST)
	public String adminMemberDisabledUpdate(@ModelAttribute MemberVO amvo , Model model) {
		int result = 0;
		String url = "";
		
		result = adminMemberService.adminMemberDisabledUpdate(amvo);
		System.out.println("여긴오니?");
		System.out.println(amvo.getMt_number());
		if(result == 1) {
			url = "/admin/member/adminMemberList";
		}
		return "redirect:" + url;
	}
	
}
