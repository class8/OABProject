package com.oab.client.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.question.vo.QuestionVO;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SqlSession session;

	// 글 목록을 구현한다
	@Override
	public List<QuestionVO> questionList(QuestionVO qvo) {
		return session.selectList("questionList",qvo); // 리스트를 불러오기 위해서는 로그인이 되어야 합니다.

	}

	@Override
	public int questionInsert(QuestionVO qvo) {
		return session.insert("questionInsert", qvo); // 등록 이벤트!

	}

	// 상세보기
	@Override
	public QuestionVO questionDetail(QuestionVO qvo) {
		return (QuestionVO) session.selectOne("questionDetail", qvo);
	}
	
	@Override
	public int qusetionUpdate(QuestionVO qvo) {
		return session.update("qusetionUpdate", qvo);
	}

	@Override
	public int questionDelete(int qt_number) {
		return session.delete("questionDelete", qt_number);
	}



}
