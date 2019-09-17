package com.oab.admin.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.question.vo.QuestionVO;

@Repository
public class AdminQuestionDaoImpl implements AdminQuestionDao {

	private static final String Namespace = null;
	@Autowired
	private SqlSession session;

	// 글 목록 구현
	@Override
	public List<QuestionVO> adminQuestionList() {
		return session.selectList("adminQuestionList");
	}

	// 글 상세보기 구현

	@Override
	public QuestionVO adminQuestionDetail(QuestionVO qvo) {
		return (QuestionVO) session.selectOne("adminQuestionDetail", qvo);
	}

	// 글 삭제 구현
	@Override
	public int adminQuestionDelete(int qt_number) {
		return session.delete("adminQuestionDelete", qt_number);
	}

	// 댓글 입력 구현
	@Override
	public int adminReplyInsert(QuestionVO qvo) {
		return session.insert("adminReplyInsert", qvo);
	}

}
