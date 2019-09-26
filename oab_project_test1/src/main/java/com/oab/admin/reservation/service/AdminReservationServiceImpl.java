package com.oab.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.reservation.dao.AdminReservationDao;
import com.oab.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class AdminReservationServiceImpl implements AdminReservationService {
	
	@Autowired
	private AdminReservationDao adminReservationDao;
	
	@Override
	public List<ReservationVO> adminReservationWaitingList(ReservationVO rvo) {
		List<ReservationVO> reservationWaitingList = null;
		reservationWaitingList = adminReservationDao.adminReservationWaitingList(rvo);
		return reservationWaitingList;
	}

	@Override
	public int adminReservationWaitingListCnt(ReservationVO rvo) {
		return adminReservationDao.adminReservationWaitingListCnt(rvo);
	}

	@Override
	public int adminReservationStatusUpdate(ReservationVO rvo) {
		int result = 0;
		try {
			result = adminReservationDao.adminReservationStatusUpdate(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public List<ReservationVO> adminReservationCompleteList(ReservationVO rvo) {
		// TODO Auto-generated method stub
		List<ReservationVO> reservationCompleteList = null;
		reservationCompleteList = adminReservationDao.adminReservationCompleteList(rvo);
		return reservationCompleteList;
	}

	@Override
	public int adminReservationCompleteListCnt(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminReservationDao.adminReservationCompleteListCnt(rvo);
	}

	@Override
	public List<ReservationVO> adminReservationCancelList(ReservationVO rvo) {
		// TODO Auto-generated method stub
		List<ReservationVO> reservationCancelList = null;
		reservationCancelList = adminReservationDao.adminReservationCancelList(rvo);
		return reservationCancelList;
	}

	@Override
	public int adminReservationCancelListCnt(ReservationVO rvo) {
		// TODO Auto-generated method stub
		return adminReservationDao.adminReservationCancelListCnt(rvo);
	}

	@Override
	public List<ReservationVO> adminReservationRefundList(ReservationVO rvo) {
		// TODO Auto-generated method stub
		List<ReservationVO> reservationRefundList = null;
		reservationRefundList = adminReservationDao.adminReservationRefundList(rvo);
		return reservationRefundList;
	}

	@Override
	public int adminReservationRefundListCnt(ReservationVO rvo) {
		return adminReservationDao.adminReservationRefundListCnt(rvo);
	}

}
