package com.oab.admin.login.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {

	@Autowired
	private SqlSession session;

	@Override
	public AdminLoginVO adminLoginSelect(AdminLoginVO aLvo) {
		// TODO Auto-generated method stub
		return (AdminLoginVO) session.selectOne("adminLoginSelect", aLvo);
	}

	// 1:1문의 목록 구현
	@Override
	public List<QuestionVO> mainQuestionList() {
		return session.selectList("mainQuestionList");
	}

}
