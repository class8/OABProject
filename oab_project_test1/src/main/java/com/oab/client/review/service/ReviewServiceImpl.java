package com.oab.client.review.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.client.review.dao.ReviewDao;
import com.oab.client.review.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	private Logger log = LoggerFactory.getLogger(ReviewServiceImpl.class);

	@Autowired
	private ReviewDao reviewDao;

	@Override // 포토후기 작성
	public int reviewInsert(ReviewVO rvo) {
		int result = 0;
		try {
			result = reviewDao.reviewInsert(rvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}

	@Override // 글 목록 구현하기
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		List<ReviewVO> myReviewList = null;
		// 정렬에 대한 기본값 설정
		if (rvo.getOrder_by() == null) {
			rvo.setOrder_by("revt_number");
		}
		if (rvo.getOrder_sc() == null) {
			rvo.setOrder_sc("DESC");
		}
		myReviewList = reviewDao.reviewList(rvo);
		return myReviewList;
	}

	//포토후기 페이징
	@Override
	public int reviewListCnt(ReviewVO rvo) {
		return reviewDao.reviewListCnt(rvo);
	}

	// 상세보기
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		ReviewVO detail = null;
		detail = reviewDao.reviewDetail(rvo);
		return detail;
	}

	//포토후기 업로드하기
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		int result =0;
		try {
			result = reviewDao.reviewUpdate(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	//포토후기 삭제하기
	@Override
	public int reviewDelete(ReviewVO rvo) {
		int result =0;
		try {
			result = reviewDao.reviewDelete(rvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
