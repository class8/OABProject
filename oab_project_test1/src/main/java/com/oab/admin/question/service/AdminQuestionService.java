package com.oab.admin.question.service;

import java.util.List;

import com.oab.client.question.vo.QuestionVO;

public interface AdminQuestionService {

	public List<QuestionVO> adminQuestionList(QuestionVO qvo);

	public int adminQuestionListCnt(QuestionVO qvo);

	public QuestionVO adminQuestionDetail(QuestionVO qvo);

	public int adminQuestionDelete(int qt_number);

	public int adminReplyInsert(QuestionVO qvo);

	public int adminStatusUpdate(QuestionVO qvo);

	public int adminReplyUpdate(QuestionVO qvo);

}
