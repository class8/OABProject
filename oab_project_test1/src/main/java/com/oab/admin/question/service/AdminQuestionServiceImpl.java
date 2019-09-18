package com.oab.admin.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.question.dao.AdminQuestionDao;
import com.oab.client.question.vo.QuestionVO;

@Service
@Transactional
public class AdminQuestionServiceImpl implements AdminQuestionService {

	@Autowired
	private AdminQuestionDao adminQuestionDao;

	// 글 목록 구현
	@Override
	public List<QuestionVO> adminQuestionList() {

		List<QuestionVO> questionList = null;

		questionList = adminQuestionDao.adminQuestionList();
		return questionList;
	}

	// 글 목록 상세 구현
	@Override
	public QuestionVO adminQuestionDetail(QuestionVO qvo) {

		QuestionVO detail = null;
		detail = adminQuestionDao.adminQuestionDetail(qvo);
		return detail;
	}

	@Override
	public int adminQuestionDelete(int qt_number) {

		int result = 0;
		try {

			result = adminQuestionDao.adminQuestionDelete(qt_number);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 댓글 입력 구현
	@Override
	public int adminReplyInsert(QuestionVO qvo) {

		int result = 0;
		try {

			result = adminQuestionDao.adminReplyInsert(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	@Override
	public int adminStatusUpdate(QuestionVO qvo) {
		
		int result = 0;
		try {
			result = adminQuestionDao.adminStatusUpdate(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

}
