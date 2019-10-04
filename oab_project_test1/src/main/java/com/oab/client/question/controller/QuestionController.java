package com.oab.client.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oab.client.common.file.FileUploadUtil;
import com.oab.client.common.page.Paging;
import com.oab.client.common.util.Util;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.question.service.QuestionService;
import com.oab.client.question.vo.QuestionVO;

//문의글 컨트롤러
@Controller
@RequestMapping(value = "/question")
public class QuestionController {

	private Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Autowired // 빈객체를 생성한다
	private QuestionService questionService;

	// 문의 게시글 목록을 구현한다
	@RequestMapping(value = "/questionList", method = RequestMethod.GET)
	public ModelAndView questionList(@ModelAttribute("QuestionVO") QuestionVO qvo, Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("리스트 호출 성공");
		log.info("questionList 호출 성공");

		// 로그인 한 사용자만 볼 수 있기 때문에 가져온다
		String id = "";
		LoginVO login = (LoginVO) session.getAttribute("login");

		// 페이지 셋팅
		Paging.setPage(qvo);

		// 전체 레코드 수를 구현한다
		int total = questionService.questionListCnt(qvo);
		log.info("total = " + total);

		// 글 번호를 재 설정 해야 합니다
		int count = total - (Util.nvl(qvo.getPage()) - 1) * Util.nvl(qvo.getPageSize());
		log.info("count = " + count);

		if (login == null) {
			mav.setViewName("login/login");
			return mav;// 로그인이 안되어있다면 로그인하라고 로그인화면을 보여줌
		}

		id = login.getMt_id();
		qvo.setMt_id(id);

		// 반환한다
		List<QuestionVO> questionList = questionService.questionList(qvo);

		model.addAttribute("questionList", questionList); // 값을 가져온다
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", qvo);

		mav.setViewName("question/questionList");
		return mav;
	}

	// 문의 게시판 글쓰기 폼 출력
	@RequestMapping(value = "/questionWrite")
	public String writeForm() {
		log.info("questionWriteForm 호출 성공");
		System.out.println("1");
		return "question/questionWrite"; // 반환

	}

	// 문의게시글작성
	@RequestMapping(value = "/questionInsert", method = RequestMethod.POST)
	public String questionInsert(@ModelAttribute QuestionVO qvo, Model model, HttpSession session,
			HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("2");
		// 파일명이 제대로 들어오는지 확인한다

		int result = 0;
		String url = "";

		LoginVO login = (LoginVO) session.getAttribute("login");

		// 파일업로드를 위한 것
		if (qvo.getFile() != null) {
			System.out.println("3");

			String qt_file = FileUploadUtil.fileUpload(qvo.getFile(), request, "qt_file");
			qvo.setQt_file(qt_file);
		}

		result = questionService.questionInsert(qvo);

		if (result == 1) {
			System.out.println("4");
			url = "/question/questionList";

		} else {
			model.addAttribute("code", 1);
			url = "/question/questionInsert";
		}

		return "redirect:" + url;
	}

	// 상세보기 구현하기
	@RequestMapping(value = "/questionDetail", method = RequestMethod.GET)
	public String QuestionDetail(@ModelAttribute QuestionVO qvo, Model model, HttpSession session) {

		System.out.println("questionDetail 호출 성공");
		log.info("qt_number = " + qvo.getQt_number());

		LoginVO login = (LoginVO) session.getAttribute("login");
		System.out.println("mt_id");

		QuestionVO detail = new QuestionVO();
		detail = questionService.QuestionDetail(qvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setQt_content(detail.getQt_content().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);
		return "question/questionDetail";

	}

	// 문의 글 삭제 구현
	@RequestMapping(value = "/questionDelete")
	public String questionDelete(@ModelAttribute QuestionVO qvo, Model model, HttpSession session,
			HttpServletRequest request) throws IOException {

		System.out.println("1");
		log.info("questionDelete 호출성공");

		int result = 0;
		String url = "";

		if (qvo.getFile() != null) {

			FileUploadUtil.fileDelete(qvo.getQt_file(), request);
		}

		result = questionService.questionDelete(qvo.getQt_number());

		/*
		 * if (result == 1) { log.info("55"); url = "/question/questionList?page=" +
		 * qvo.getPage() + "&pageSize=" + qvo.getPageSize(); }
		 */
		System.out.println("삭제");

		if (result == 1) {
			url = "/question/questionList?page=" + qvo.getPage() + "&pageSize=" + qvo.getPageSize();
		} else {
			url = "/question/questionList?qt_number=" + qvo.getQt_number() + "&page=" + qvo.getPage() + "&pageSize="
					+ qvo.getPageSize();
		}
		return "redirect:" + url;
	}

}
