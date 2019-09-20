package com.oab.admin.login.service;

import java.util.List;

import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;

public interface AdminLoginService {
	public AdminLoginVO adminLoginSelect(String adminID, String adminPW);
	
	public List<QuestionVO> mainQuestionList();
}
