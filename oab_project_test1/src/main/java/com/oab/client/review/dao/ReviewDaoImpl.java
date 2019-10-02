package com.oab.client.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.review.vo.ReviewVO;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSession session;

	@Override // 포토후기 등록리스트
	public List<ReviewVO> reviewList(ReviewVO rvo) {
		return session.selectList("reviewList", rvo);
	}

	@Override // 추가
	public int reviewInsert(ReviewVO rvo) {
		return session.insert("reviewInsert", rvo);
	}

	// 페이징 처리
	@Override
	public int reviewListCnt(ReviewVO rvo) {
		return (Integer) session.selectOne("reviewListCnt");
	}

	// 포토후기 상세보기
	@Override
	public ReviewVO reviewDetail(ReviewVO rvo) {
		return (ReviewVO) session.selectOne("reviewDetail", rvo);
	}

	// 포토후기업데이트
	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return session.update("reviewUpdate", rvo);
	}

	// 포토후기 삭제하기
	@Override
	public int reviewDelete(int revt_number) {
		return session.delete("reviewDelete", revt_number);
	}

	// 조회수 증가
	@Override
	public int reviewReadCntUpdate(ReviewVO rvo) {
		return session.update("reviewReadCntUpdate", rvo);
	}

}
