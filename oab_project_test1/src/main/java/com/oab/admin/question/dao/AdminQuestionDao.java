package com.oab.admin.question.dao;

import java.util.List;

import com.oab.client.question.vo.QuestionVO;

public interface AdminQuestionDao {

	public List<QuestionVO> adminQuestionList();

	public QuestionVO adminQuestionDetail(QuestionVO qvo);

	public int adminQuestionDelete(int qt_number);

	public int adminReplyInsert(QuestionVO qvo);

	public int adminStatusUpdate(QuestionVO qvo);

}
