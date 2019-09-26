package com.oab.client.review.service;

import java.util.List;

import com.oab.client.review.vo.ReviewVO;

public interface ReviewService {

	public List<ReviewVO> reviewList(ReviewVO rvo); //포토후기 리스트

	public int reviewInsert(ReviewVO rvo); // 포토후기 등록하기

	public int reviewListCnt(ReviewVO rvo); //포토후기 페이징

	public ReviewVO reviewDetail(ReviewVO rvo); //상세보기

	public int reviewUpdate(ReviewVO rvo); //포토후기 수정하기

	public int reviewDelete(ReviewVO rvo); //포토후기 삭제하기
}