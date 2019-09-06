package com.oab.client.question.dao;

import java.util.List;

import com.oab.client.question.vo.QuestionVO;

public interface QuestionDao {

	List<QuestionVO> questionList(); //글목록

	int questionInsert(QuestionVO qvo); //문의 글 등록

}
