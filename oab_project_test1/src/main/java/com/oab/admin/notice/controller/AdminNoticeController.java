package com.oab.admin.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.admin.notice.service.AdminNoticeService;
import com.oab.admin.notice.vo.AdminNoticeVO;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;

import org.slf4j.LoggerFactory;

import java.util.List;

import org.slf4j.Logger;

@Controller
@RequestMapping(value = "/admin/notice")
public class AdminNoticeController {

	private Logger log = LoggerFactory.getLogger(AdminNoticeController.class);

	@Autowired
	private AdminNoticeService adminNoticeService;

	// 글목록 구현하기
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute AdminNoticeVO nvo, Model model) {

		log.info("noticeList Controller 호출 성공");

		// 페이지 세팅
		Paging.setPage(nvo);

		// 전체 레코드 수 구현
		int total = adminNoticeService.adminNoticeListCnt(nvo);
		log.info("total = " + total);

		// 글 번호 재설정
		int count = total - (Util.nvl(nvo.getPage()) - 1) * Util.nvl(nvo.getPageSize());
		log.info("count = " + count);

		List<AdminNoticeVO> noticeList = adminNoticeService.adminNoticeList(nvo);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);

		return "admin/notice/adminNoticeList";

	}

	// 글쓰기 폼 출력하기
	@RequestMapping(value = "/writeForm")
	public String writeForm() {

		return "admin/notice/adminNoticeWriteForm";
	}

	// 글쓰기 구현하기
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute AdminNoticeVO nvo, Model model) {

		log.info("noticeInsert 호출 성공");

		int result = 0;
		String url = "";

		result = adminNoticeService.adminNoticeInsert(nvo);

		if (result == 1) {
			url = "/admin/notice/noticeList";
		} else {
			model.addAttribute("code", 1);
			url = "/admin/notice/adminWriteForm";
		}

		return "redirect:" + url;
	}

	// 글 상세보기 구현
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute AdminNoticeVO nvo, Model model) {

		log.info("noticeDetail 호출 성공");

		AdminNoticeVO detail = new AdminNoticeVO();
		detail = adminNoticeService.adminNoticeDetail(nvo);

		if (detail != null && (!detail.equals(""))) {
			adminNoticeService.adminReadCntUpdate(nvo);
			detail.setNt_content(detail.getNt_content().toString().replaceAll("\n", "<br>"));
			System.out.println(detail.getNt_readcnt());
		}

		model.addAttribute("detail", detail);
		return "admin/notice/adminNoticeDetail";

	}

	// 글 수정 폼 출력하기

	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String updateForm(@ModelAttribute AdminNoticeVO nvo, Model model) {

		log.info("updateForm 호출 성공");

		AdminNoticeVO updateData = new AdminNoticeVO();
		updateData = adminNoticeService.adminNoticeDetail(nvo);

		model.addAttribute("updateData", updateData);
		return "admin/notice/adminNoticeUpdateForm";
	}

	// 글 수정 구현하기
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute AdminNoticeVO nvo, Model model) {

		System.out.println("noticeUpdate 호출성공");

		int result = 0;
		String url = "";

		result = adminNoticeService.adminNoticeUpdate(nvo);

		if (result == 1) {
			url = "/admin/notice/noticeList";
		} else {
			url = "/admin/notice/adminNoticeUpdateForm?nt_number=" + nvo.getNt_number();
		}

		return "redirect:" + url;
	}

	// 글 삭제 구현하기
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(@ModelAttribute AdminNoticeVO nvo, Model model) {

		log.info("noticeDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값을 담습니다.
		int result = 0;
		String url = "";

		result = adminNoticeService.adminNoticeDelete(nvo.getNt_number());

		if (result == 1) {
			url = "/admin/notice/noticeList";

		} else {
			url = "/admin/notice/adminNoticeDetail?nt_number=" + nvo.getNt_number();
		}
		return "redirect:" + url;

	}

}
