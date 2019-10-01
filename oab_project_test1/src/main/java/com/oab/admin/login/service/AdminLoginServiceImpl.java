package com.oab.admin.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.login.dao.AdminLoginDao;
import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	private AdminLoginDao adminLoginDao;

	@Override
	public AdminLoginVO adminLoginSelect(String adminID, String adminPW) {
		AdminLoginVO vo = null;
		AdminLoginVO aLvo = new AdminLoginVO();
		aLvo.setAdminID(adminID);
		aLvo.setAdminPW(adminPW);

		vo = adminLoginDao.adminLoginSelect(aLvo);
		return vo;
	}

	// 글 목록 구현
	@Override
	public List<QuestionVO> mainQuestionList() {

		List<QuestionVO> mainQuestionList = null;

		mainQuestionList = adminLoginDao.mainQuestionList();
		return mainQuestionList;
	}

	@Override
	public List<ReservationVO> mainReservationList() {
		List<ReservationVO> mainReservationList = null;

		mainReservationList = adminLoginDao.mainReservationList();
		return mainReservationList;
	}

	@Override
	public List<RentalVO> mainRentalList() {

		List<RentalVO> mainRentalList = null;

		mainRentalList = adminLoginDao.mainRentalList();
		return mainRentalList;
	}

}
