package com.oab.client.question.dao;

import java.util.List;

import com.oab.client.question.vo.QuestionVO;

public interface QuestionDao {

	public List<QuestionVO> questionList(QuestionVO qvo); // 글목록

	public int questionInsert(QuestionVO qvo); // 문의 글 등록

	public QuestionVO questionDetail(QuestionVO qvo);// 글 목록 상세보기

	public int qusetionUpdate(QuestionVO qvo); // 문의 글 수정

	public int questionDelete(int qt_number); // 문의 글 삭제

}
