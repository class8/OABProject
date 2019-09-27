package com.oab.client.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.client.question.dao.QuestionDao;
import com.oab.client.question.vo.QuestionVO;

@Service
@Transactional
public class QuestionserviceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	// 문의글 목록 구현
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		List<QuestionVO> myQuestionList = null;
		myQuestionList = questionDao.questionList(qvo);
		return myQuestionList;
	}

	// 문의글 등록
	@Override
	public int questionInsert(QuestionVO qvo) {

		int result = 0;
		try {
			System.out.println(qvo.getMt_id());
			System.out.println(qvo.getQt_title());
			result = questionDao.questionInsert(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 문의글 상세보기
	@Override
	public QuestionVO QuestionDetail(QuestionVO qvo) {
		QuestionVO detail = null;
		detail = questionDao.questionDetail(qvo);
		return detail;
	}

	// 문의글 수정
	@Override
	public int questionUpdate(QuestionVO qvo) {
		int result = 0;
		try {
			result = questionDao.qusetionUpdate(qvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	// 문의글 삭제
	@Override
	public int questionDelete(int qt_number) {

		int result = 0;
		try {

			System.out.println("이건 나오나욜?");
			result = questionDao.questionDelete(qt_number);

		} catch (Exception e) {

			e.printStackTrace();
			result = 0;
		}

		return 0;
	}

	//문의글 페이지 레코드 수 구현하기
	@Override
	public int questionListCnt(QuestionVO qvo) {
		return questionDao.questionListCnt(qvo);
	}

}
