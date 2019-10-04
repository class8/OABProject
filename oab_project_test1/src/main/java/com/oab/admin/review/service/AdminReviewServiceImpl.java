package com.oab.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.review.dao.AdminReviewDao;
import com.oab.client.review.vo.ReviewVO;

@Service
@Transactional
public class AdminReviewServiceImpl implements AdminReviewService {

	@Autowired
	private AdminReviewDao adminReviewDao;

	@Override
	public List<ReviewVO> adminReviewList(ReviewVO rvo) {
		List<ReviewVO> myList = null;
		// 정렬에 대한 기본값 설정
		if (rvo.getOrder_by() == null) {
			rvo.setOrder_by("revt_number");
		}
		if (rvo.getOrder_sc() == null) {
			rvo.setOrder_sc("DESC");
		}
		myList = adminReviewDao.adminReviewList(rvo);
		return myList;
	}

	@Override
	public int adminReviewListCnt(ReviewVO rvo) {
		return adminReviewDao.adminReviewListCnt(rvo);
	}

	// 후기 상세보기
	@Override
	public ReviewVO adminReviewDetail(ReviewVO rvo) {
		ReviewVO reviewDetail = null;
		reviewDetail = adminReviewDao.adminReviewDetail(rvo);
		return reviewDetail;
	}

	// 후기 삭제하기
	@Override
	public int adminReviewDelete(int revt_number) {

		int result = 0;
		try {
			result = adminReviewDao.adminReviewDelete(revt_number);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
