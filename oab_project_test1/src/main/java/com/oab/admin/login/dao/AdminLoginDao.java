package com.oab.admin.login.dao;

import java.util.List;

import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;

public interface AdminLoginDao {
	public AdminLoginVO adminLoginSelect(AdminLoginVO aLvo);

	public List<QuestionVO> mainQuestionList();
}
