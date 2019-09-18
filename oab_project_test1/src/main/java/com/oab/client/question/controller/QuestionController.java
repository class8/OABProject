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

import com.oab.client.common.file.FileUploadUtil;
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
	public String questionList(@ModelAttribute QuestionVO qvo, Model model, HttpSession session) {
		System.out.println("리스트 호출 성공");
		log.info("questionList 호출 성공");

		// 로그인 한 사용자만 볼 수 있기 때문에 가져온다
		LoginVO login = (LoginVO) session.getAttribute("login");
		System.out.println(login);
		try {
			if (login.getMt_id() != null) {
				qvo.setMt_id(login.getMt_id());

				// 리스트 목록을 만든다
				// List<QuestionVO> questionList = questionService.questionList(qvo);
			}

		} catch (Exception e) {

			return "question/questionList";
		}

		// 반환한다
		List<QuestionVO> questionList = questionService.questionList(qvo);
		model.addAttribute("questionList", questionList); // 값을 가져온다

		return "question/questionList";

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

			System.out.println("이제그만");
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

	/*
	 * // 글 수정 폼 출력하기
	 * 
	 * @RequestMapping(value = "/questionUpdateForm") // 주소값 public String
	 * questionUpdateForm(@ModelAttribute QuestionVO qvo, Model model, HttpSession
	 * session, HttpServletRequest request) throws IllegalStateException,
	 * IOException {
	 * 
	 * log.info("questionUpdateForm 호출 성공"); log.info("qt_number = " +
	 * qvo.getQt_number()); System.out.println("1"); QuestionVO updateData = new
	 * QuestionVO(); updateData = questionService.QuestionDetail(qvo);
	 * System.out.println("2"); // log.info(updateData.getQt_file()); // 파일
	 * model.addAttribute("updateData", updateData);
	 * 
	 * return "/question/questionUpdate"; // 반환값
	 * 
	 * }
	 * 
	 * // 글 수정하기
	 * 
	 * @RequestMapping(value = "/questionUpdate", method = RequestMethod.POST)
	 * public String questionUpdate(@ModelAttribute QuestionVO qvo, Model model,
	 * HttpServletRequest request) throws IllegalStateException, IOException {
	 * System.out.println("3"); log.info("questionUpdate 호출성공");
	 * 
	 * int result = 0; String url = "";
	 * 
	 * // 09.17 파일업로드 소스 추가하기 if (qvo.getQt_file() != null) {
	 * 
	 * String qt_file = FileUploadUtil.fileUpload(qvo.getFile(), request,
	 * "qt_file"); qvo.setQt_file(qt_file); // 파일 수정
	 * 
	 * }
	 * 
	 * if (qvo.getQt_file() == null) { String qt_file = ""; qvo.setQt_file(qt_file);
	 * // 파일 수정
	 * 
	 * }
	 * 
	 * result = questionService.questionUpdate(qvo); if (result == 1) { // 아래 url은
	 * 수정 후 상세 페이지로 이동 url = "/question/questionDetail?qt_number=" +
	 * qvo.getQt_number() + "&page=" + qvo.getPage() + "&pageSize=" +
	 * qvo.getPageSize(); }
	 * 
	 * return "redirect:" + url;
	 * 
	 * }
	 */

	// 문의 글 삭제 구현
	@RequestMapping(value = "/questionDelete")
	public String questionDelete(@ModelAttribute QuestionVO qvo, Model model, HttpSession session,
			HttpServletRequest request) throws IOException {

		log.info("questionDelete 호출성공");

		int result = 0;
		String url = "";

		if (qvo.getFile() != null) {

			FileUploadUtil.fileDelete(qvo.getQt_file(), request);
		}

		result = questionService.questionDelete(qvo.getQt_number());

		if (result == 1) {
			url = "/question/questionList?page=" + qvo.getPage() + "&pageSize=" + qvo.getPageSize();
		}

		return "redirect:" + url;

	}

}
