package com.oab.client.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.oab.client.question.vo.QuestionVO;

public class QuestionImpl implements QuestionDao{

	@Autowired
	private SqlSession session;
	
	
	//글 목록을 구현한다
	@Override
	public List<QuestionVO> questionList() {
		
		return session.selectList("questionList");
	
	}

	//글 목록을 구현한다
	@Override
	public int questionInsert(QuestionVO qvo) {

		return session.insert("questionInsert", qvo);
	
	}

}
