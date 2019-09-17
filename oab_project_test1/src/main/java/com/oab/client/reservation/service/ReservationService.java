package com.oab.client.reservation.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.oab.client.product.vo.ProductVO;
import com.oab.client.reservation.vo.ReservationVO;

public interface ReservationService {
	public List<ReservationVO> reservationList(ReservationVO rvo);

	public int reservationListCnt(ReservationVO rvo);

	public int reservationInsert(ReservationVO rvo, String[] pt_num, String[] pt_cnt, String[] price);
	
	public int reservationBnumber();

}
