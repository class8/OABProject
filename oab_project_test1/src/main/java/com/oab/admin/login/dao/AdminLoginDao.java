package com.oab.admin.login.dao;
//개발자 : 최대근
import java.util.List;

import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.ReservationVO;

public interface AdminLoginDao {
	public AdminLoginVO adminLoginSelect(AdminLoginVO aLvo);

	public List<QuestionVO> mainQuestionList();

	public List<ReservationVO> mainReservationList();
	
	public List<RentalVO> mainRentalList(); 
}
