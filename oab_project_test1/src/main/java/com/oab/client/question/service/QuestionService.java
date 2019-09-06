package com.oab.client.question.service;

import java.util.List;

import com.oab.client.question.vo.QuestionVO;

public interface QuestionService {

	public List<QuestionVO> questionList(); //글 목록 조회

	public int questionInsert(QuestionVO qvo); //문의 글 등록

	
	
	
	
}
