package com.oab.client.reservation.dao;

import java.util.List;

import com.oab.client.reservation.vo.ReservationVO;

public interface ReservationDao {
	public List<ReservationVO> reservationList(ReservationVO rvo);

	public int reservationListCnt(ReservationVO rvo);
	
	public int reservationInsert(ReservationVO rvo);
	
	public int reservationBnumber();

}
