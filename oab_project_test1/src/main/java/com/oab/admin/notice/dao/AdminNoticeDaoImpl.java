package com.oab.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.notice.vo.NoticeVO;

@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao {

	@Autowired
	private SqlSession session;

	// 글 목록 구현
	@Override
	public List<NoticeVO> adminNoticeList() {
		return session.selectList("noticeList");
	}

	// 글 입력 구현
	@Override
	public int adminNoticeInsert(NoticeVO nvo) {
		return session.insert("noticeInsert", nvo);
	}

	// 글 상세 구현
	@Override
	public NoticeVO adminNoticeDetail(NoticeVO nvo) {
		return (NoticeVO) session.selectOne("noticeDetail", nvo);
	}

	// 글 수정 구현
	@Override
	public int adminNoticeUpdate(NoticeVO nvo) {
		return session.update("noticeUpdate", nvo);
	}

	// 글 삭제 구현
	@Override
	public int adminNoticeDelete(int nt_number) {
		return session.delete("noticeDelete", nt_number);
	}

}
