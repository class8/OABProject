package com.oab.client.question.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String questionList(Model model) {

		log.info("questionList 호출 성공");

		List<QuestionVO> questionList = questionService.questionList();

		model.addAttribute("questionList", questionList);
		model.addAttribute("data");

		return "question/questionList";

	}

	// 문의 게시판 글쓰기 폼 출력
	@RequestMapping(value = "/questionWrite")
	public String writeForm() {

		log.info("questionWriteForm 호출 성공");
		return "question/questionWrite";

	}

	// 문의 게시판 글쓰기 구현하기
	@RequestMapping(value = "/questionInsert", method = RequestMethod.POST)
	public String questionInsert(@ModelAttribute QuestionVO qvo, Model model) {

		log.info("questionInsert 호출 성공");

		int result = 0;
		String url = "";

		result = questionService.questionInsert(qvo);

		if (result == 1) {

			url = "/question/questionList";

		} else {

			model.addAttribute("code", 1);
			url = "/question/questionInsert";
		}

		return "redirect:" + url;
	}

	

}
