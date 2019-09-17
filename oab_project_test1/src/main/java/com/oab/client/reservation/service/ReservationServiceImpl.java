package com.oab.client.reservation.service;

import java.lang.reflect.Method;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.oab.client.reservation.dao.ReservationDao;
import com.oab.client.reservation.vo.ReservationVO;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService {
	private Logger log = LoggerFactory.getLogger(ReservationServiceImpl.class);

	@Autowired
	private ReservationDao reservationDao;

	// 예약 목록 구현
	@Override
	public List<ReservationVO> reservationList(ReservationVO rvo) {
		List<ReservationVO> myList = null;
		// 정렬에 대한 기본값 설정
		if (rvo.getOrder_by() == null) {
			rvo.setOrder_by("pt_name");
		}
		if (rvo.getOrder_sc() == null) {
			rvo.setOrder_sc("DESC");
		}
		myList = reservationDao.reservationList(rvo);
		return myList;
	}

	// 전체 레코드 수 구현
	@Override
	public int reservationListCnt(ReservationVO rvo) {
		return reservationDao.reservationListCnt(rvo);
	}

	@Override
	public int reservationBnumber() {
		int result = 0;
		result = reservationDao.reservationBnumber();
		return result;
	}

	@Override
	public int reservationInsert(ReservationVO rvo, String[] pt_num, String[] pt_cnt, String[] price) {
		System.out.println("예약삽입 service 호출 성공");
		int result = 0;
		try {
			if (rvo.getRest_payoption().equals("카드")) {
				rvo.setRest_status("예약완료");
			} else {
				rvo.setRest_status("예약대기");
			}
			for (int i = 0; i < pt_num.length; i++) {
				rvo.setPt_number(Integer.parseInt(pt_num[i]));
				rvo.setRest_count(Integer.parseInt(pt_cnt[i]));
				rvo.setRest_total(Integer.parseInt(price[i]));

				result = reservationDao.reservationInsert(rvo);
				/*
				 * if (result == 1) { System.out.println(i + "번째 상품 : 상품번호 = " + pt_num[i] +
				 * "상품수량 = " + pt_cnt[i]); }
				 */
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
