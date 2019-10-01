package com.oab.admin.login.service;

import java.util.List;

import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.ReservationVO;

public interface AdminLoginService {
	public AdminLoginVO adminLoginSelect(String adminID, String adminPW);

	public List<QuestionVO> mainQuestionList();

	public List<ReservationVO> mainReservationList();

	public List<RentalVO> mainRentalList();
}
