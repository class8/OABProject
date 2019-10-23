package com.oab.admin.reservation.dao;
//개발자 : 최대근
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.reservation.vo.ReservationVO;

@Repository
public class AdminReservationDaoImpl implements AdminReservationDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReservationVO> adminReservationWaitingList(ReservationVO rvo) {
		return session.selectList("adminReservationWaitingList",rvo);
	}

	@Override
	public int adminReservationWaitingListCnt(ReservationVO rvo) {
		return (Integer) session.selectOne("adminReservationWaitingListCnt");
	}

	@Override
	public int adminReservationStatusUpdate(ReservationVO rvo) {
		return session.update("adminReservationStatusUpdate" , rvo);
	}

	@Override
	public List<ReservationVO> adminReservationCompleteList(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return session.selectList("adminReservationCompleteList",rvo);
	}

	@Override
	public int adminReservationCompleteListCnt(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("adminReservationCompleteListCnt");
	}

	@Override
	public List<ReservationVO> adminReservationCancelList(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return session.selectList("adminReservationCancelList",rvo);
	}

	@Override
	public int adminReservationCancelListCnt(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("adminReservationCancelListCnt");
	}

	@Override
	public List<ReservationVO> adminReservationRefundList(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return session.selectList("adminReservationRefundList",rvo);
	}

	@Override
	public int adminReservationRefundListCnt(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("adminReservationRefundListCnt");
	}

}
