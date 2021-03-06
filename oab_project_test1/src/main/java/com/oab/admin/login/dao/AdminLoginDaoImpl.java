package com.oab.admin.login.dao;
//개발자 : 최대근
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.admin.login.vo.AdminLoginVO;
import com.oab.client.question.vo.QuestionVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.ReservationVO;

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

	@Override
	public List<ReservationVO> mainReservationList() {
		return session.selectList("mainReservationList");
	}

	@Override
	public List<RentalVO> mainRentalList() {
		return session.selectList("mainRentalList");
	}

}
