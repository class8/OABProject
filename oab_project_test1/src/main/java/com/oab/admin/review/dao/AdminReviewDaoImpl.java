package com.oab.admin.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.review.vo.ReviewVO;

@Repository
public class AdminReviewDaoImpl implements AdminReviewDao {

	@Autowired
	private SqlSession session;

	// 목록
	@Override
	public List<ReviewVO> adminReviewList(ReviewVO rvo) {
		return session.selectList("adminReviewList", rvo);
	}

	// 레코드 수
	@Override
	public int adminReviewListCnt(ReviewVO rvo) {
		return (Integer) session.selectOne("adminReviewListCnt");
	}

	// 상세보기
	@Override
	public ReviewVO adminReviewDetail(ReviewVO rvo) {
		return (ReviewVO) session.selectOne("adminReviewDetail", rvo);
	}

	// 삭제하기
	@Override
	public int adminReviewDelete(int revt_number) {
		return session.delete("adminReviewDelete", revt_number);
	}

}
