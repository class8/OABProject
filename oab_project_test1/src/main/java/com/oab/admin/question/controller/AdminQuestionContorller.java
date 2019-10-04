package com.oab.admin.question.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.oab.admin.question.service.AdminQuestionService;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.question.vo.QuestionVO;

@Controller
@RequestMapping(value = "/admin/question")
public class AdminQuestionContorller {

	private Logger log = LoggerFactory.getLogger(AdminQuestionContorller.class);

	@Autowired
	private AdminQuestionService adminQuestionService;

	// 문의 글 목록 구현하기
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public String adminQuestionList(@ModelAttribute QuestionVO qvo, Model model) {

		System.out.println("1:1 문의 컨트롤러 호출 성공");

		// 페이지 세팅
		Paging.setPage(qvo);

		// 전체 레코드 수 구현
		int total = adminQuestionService.adminQuestionListCnt(qvo);
		log.info("total = " + total);

		// 글 번호 재설정
		int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());

		List<QuestionVO> questionList = adminQuestionService.adminQuestionList(qvo);

		model.addAttribute("questionList", questionList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", qvo);

		return "admin/question/adminQuestionList";

	}

	// 상세보기 구현하기
	@RequestMapping(value = "/questionDetail", method = RequestMethod.GET)
	public String adminQuestionDetail(@ModelAttribute QuestionVO qvo, Model model) {

		System.out.println("문의 디테일 호출 성공");

		QuestionVO detail = new QuestionVO();
		detail = adminQuestionService.adminQuestionDetail(qvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setQt_content(detail.getQt_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);
		return "admin/question/adminQuestionDetail";

	}

	// 글 삭제 구현하기
	@RequestMapping(value = "/questionDelete", method = RequestMethod.POST)
	public String adminQuestionDelete(@ModelAttribute QuestionVO qvo, Model model) {

		System.out.println("문의 삭제 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태 값이 들어감
		int result = 0;
		String url = "";

		result = adminQuestionService.adminQuestionDelete(qvo.getQt_number());

		if (result >= 1) {
			url = "/admin/question/questionList";

		} else {
			url = "/admin/question/adminQuestionDetail?qt_number=" + qvo.getQt_number();
		}
		return "redirect:" + url;
	}

	// 댓글 폼 출력하기
	@RequestMapping(value = "/replyWriteForm", method = RequestMethod.POST)
	public String adminReplyWriteForm(@ModelAttribute QuestionVO qvo, Model model) {
		System.out.println("글쓰기 폼 호출 성공");

		QuestionVO question = new QuestionVO();
		question = adminQuestionService.adminQuestionDetail(qvo);

		model.addAttribute("question", question);

		return "admin/question/adminReplyWriteForm";
	}

	// 댓글쓰기 구현하기
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public String adminReplyInsert(@ModelAttribute QuestionVO qvo, Model model) {

		log.info("replyInsert 호출 성공");

		int result = 0;
		String url = "";

		result = adminQuestionService.adminReplyInsert(qvo);

		if (result == 1) {
			adminQuestionService.adminStatusUpdate(qvo);
			url = "/admin/question/questionList";

		} else {
			model.addAttribute("code", 1);
			url = "/admin/question/adminReplyWriteForm?qt_number=" + qvo.getQt_number();
		}

		return "redirect:" + url;

	}

	// 댓글 수정 폼 불러 오기
	@RequestMapping(value = "/replyUpdateForm", method = RequestMethod.POST)
	public String updateForm(@ModelAttribute QuestionVO qvo, Model model) {

		log.info("replyUpdateForm 호출 성공");

		QuestionVO replyUpdateForm = new QuestionVO();
		replyUpdateForm = adminQuestionService.adminQuestionDetail(qvo);

		model.addAttribute("replyUpdateForm", replyUpdateForm);
		return "admin/question/adminReplyUpdateForm";
	}

	// 글 수정 구현하기
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute QuestionVO qvo, Model model) {

		System.out.println("replyUpdate 호출성공");

		int result = 0;
		String url = "";

		result = adminQuestionService.adminReplyUpdate(qvo);

		if (result == 1) {
			url = "/admin/question/questionList";
		} else {
			url = "/admin/question/adminReplyUpdateForm?qt_number=" + qvo.getQt_number();
		}

		return "redirect:" + url;
	}

}
