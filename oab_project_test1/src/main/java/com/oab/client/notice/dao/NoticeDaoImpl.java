package com.oab.client.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;

	// 글 목록 구현
	@Override
	public List<NoticeVO> noticeList() {
		return session.selectList("noticeList");
	}

	// 글 입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}

	// 글 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		return (NoticeVO) session.selectOne("noticeDetail", nvo);
	}

	// 글 수정 구현
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}

	// 글 삭제 구현
	@Override
	public int noticeDelete(int nt_number) {
		return session.delete("noticeDelete", nt_number);
	}

	// 전체 레코드 건수를 구현한다
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return (Integer) session.selectOne("noticeListCnt");
	}

}
