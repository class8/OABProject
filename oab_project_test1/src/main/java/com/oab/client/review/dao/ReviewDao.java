package com.oab.client.review.dao;

import java.util.List;

import com.oab.client.review.vo.ReviewVO;

public interface ReviewDao {

	public int reviewInsert(ReviewVO rvo); // 글 등록

	public List<ReviewVO> reviewList(ReviewVO rvo); // 글 목록

	public int reviewListCnt(ReviewVO rvo); // 글목록카운트

	public ReviewVO reviewDetail(ReviewVO rvo); // 문의글 상세보기

	public int reviewUpdate(ReviewVO rvo); // 포토후기 수정

	public int reviewDelete(int revt_number); // 포토후기 삭제

	public int reviewReadCntUpdate(ReviewVO rvo); // 조회수 증가

}
