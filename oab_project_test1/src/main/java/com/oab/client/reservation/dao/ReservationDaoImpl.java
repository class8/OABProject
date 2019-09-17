package com.oab.client.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.reservation.vo.ReservationVO;

@Repository
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession session;

	// 예약하기 페이지 구현
	@Override
	public List<ReservationVO> reservationList(ReservationVO rvo) {
		return session.selectList("reservationList", rvo);
	}

	// 전체 레코드 건수 구현
	@Override
	public int reservationListCnt(ReservationVO rvo) {
		return (Integer) session.selectOne("reservationListCnt");
	}

	// 예약 삽입 구현
	@Override
	public int reservationInsert(ReservationVO rvo) {
		return session.insert("reservationInsert", rvo);
	}
	
	@Override
	public int reservationBnumber() {
		return session.selectOne("reservationBnumber");
	}

}
