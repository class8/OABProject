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
	
	
	//문의글 목록
	@Override
	public List<QuestionVO> questionList() {

	List<QuestionVO> myQuestionList = null;
	myQuestionList = questionDao.questionList();
	return myQuestionList;
	
	
	}

	//문의글 등록
	@Override
	public int questionInsert(QuestionVO qvo) {

	int result = 0;
	try {
		result = questionDao.questionInsert(qvo);
	}catch(Exception e){
		e.printStackTrace();
		result=0;
	}
	return result;
	}

	
	
}
