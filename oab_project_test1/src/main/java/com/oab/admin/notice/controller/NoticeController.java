package com.oab.admin.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oab.admin.notice.service.NoticeService;
import com.oab.admin.notice.vo.NoticeVO;

import org.slf4j.LoggerFactory;

import java.util.List;

import org.slf4j.Logger;

@Controller
@RequestMapping(value = "/admin/notice")
public class NoticeController {

	private Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	// 글목록 구현하기

	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model) {

		log.info("noticeList Controller 호출 성공");
		System.out.println("공지사항컨트롤러 호출 성공");

		List<NoticeVO> noticeList = noticeService.noticeList();

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("data");

		return "notice/noticeList";

	}

	// 글쓰기 폼 출력하기
	@RequestMapping(value = "/writeForm")
	public String writeForm() {

		log.info("writForm 호출 성공");
		return "notice/writeForm";
	}

	// 글쓰기 구현하기
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute NoticeVO nvo, Model model) {

		log.info("noticeInsert 호출 성공");

		int result = 0;
		String url = "";

		result = noticeService.noticeInsert(nvo);

		if (result == 1) {
			url = "/notice/noticeList";
		} else {
			model.addAttribute("code", 1);
			url = "/notice/writeForm";
		}

		return "redirect:" + url;
	}

	// 글 상세보기 구현
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {

		log.info("noticeDetail 호출 성공");

		NoticeVO detail = new NoticeVO();
		detail = noticeService.noticeDetail(nvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setNt_content(detail.getNt_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);
		return "notice/noticeDetail";

	}

	// 글 수정 폼 출력하기

	@RequestMapping(value = "/updateForm")
	public String updateForm(@ModelAttribute NoticeVO nvo, Model model) {

		log.info("updateForm 호출 성공");

		NoticeVO updateData = new NoticeVO();
		updateData = noticeService.noticeDetail(nvo);

		model.addAttribute("updateData", updateData);
		return "notice/updateForm";
	}

	// 글 삭제 구현하기
	@RequestMapping(value = "/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVO nvo) {

		log.info("noticeDelet 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값을 담습니다.
		String url = "";

		url = "/notice/noticeDetail?nt_number=" + nvo.getNt_number();

		return "redirect:" + url;

	}

}
