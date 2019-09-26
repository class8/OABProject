package com.oab.admin.reservation.dao;

import java.util.List;

import com.oab.client.reservation.vo.ReservationVO;

public interface AdminReservationDao {
	public List<ReservationVO> adminReservationWaitingList(ReservationVO rvo);//예약 대기 상태 리스트
	public int adminReservationWaitingListCnt(ReservationVO rvo); //예약 대기 상태 레코드 수
	
	public List<ReservationVO> adminReservationCompleteList(ReservationVO rvo);//예약 완료 상태 리스트
	public int adminReservationCompleteListCnt(ReservationVO rvo); //예약 완료 상태 레코드 수
	
	public List<ReservationVO> adminReservationCancelList(ReservationVO rvo);//예약 취소 상태 리스트
	public int adminReservationCancelListCnt(ReservationVO rvo); //예약 취소 상태 레코드 수

	public List<ReservationVO> adminReservationRefundList(ReservationVO rvo);//예약 환불 요청 완료 상태 리스트
	public int adminReservationRefundListCnt(ReservationVO rvo);// 예약 환불 대기 완료 상태 레코드 수
	
	public int adminReservationStatusUpdate(ReservationVO rvo);
}
