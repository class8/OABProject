package com.oab.admin.review.dao;

import java.util.List;

import com.oab.client.review.vo.ReviewVO;

public interface AdminReviewDao {

	public List<ReviewVO> adminReviewList(ReviewVO rvo);

	public int adminReviewListCnt(ReviewVO rvo);

	public ReviewVO adminReviewDetail(ReviewVO rvo);

	public int adminReviewDelete(int revt_number);

	public int reviewInsert(ReviewVO rvo);

}
