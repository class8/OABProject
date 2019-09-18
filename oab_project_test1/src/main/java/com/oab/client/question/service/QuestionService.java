package com.oab.client.question.service;

import java.util.List;

import com.oab.client.question.vo.QuestionVO;

public interface QuestionService {

	public List<QuestionVO> questionList(QuestionVO qvo); // 글 목록 조회
	// public List<QuestionVO> questionList(); // 글 목록 조회

	public int questionInsert(QuestionVO qvo); // 문의 글 등록

	public QuestionVO QuestionDetail(QuestionVO qvo); // 글 목록 상세보기

	public int questionUpdate(QuestionVO qvo); // 업데이트 첨부파일 포함

	public int questionDelete(int qt_number); //삭제기능

}
