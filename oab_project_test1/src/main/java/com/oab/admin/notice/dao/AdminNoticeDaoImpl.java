package com.oab.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.admin.notice.vo.AdminNoticeVO;

@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao {

	@Autowired
	private SqlSession session;

	// 전체 레코드 건 수 구현
	@Override
	public int adminNoticeListCnt(AdminNoticeVO nvo) {
		return (Integer) session.selectOne("noticeListCnt");
	}

	// 글 목록 구현
	@Override
	public List<AdminNoticeVO> adminNoticeList(AdminNoticeVO nvo) {
		return session.selectList("adminNoticeList", nvo);
	}

	// 글 입력 구현
	@Override
	public int adminNoticeInsert(AdminNoticeVO nvo) {
		return session.insert("adminNoticeInsert", nvo);
	}

	// 글 상세 구현
	@Override
	public AdminNoticeVO adminNoticeDetail(AdminNoticeVO nvo) {
		return (AdminNoticeVO) session.selectOne("adminNoticeDetail", nvo);
	}

	// 글 수정 구현
	@Override
	public int adminNoticeUpdate(AdminNoticeVO nvo) {
		return session.update("adminNoticeUpdate", nvo);
	}

	// 글 삭제 구현
	@Override
	public int adminNoticeDelete(int nt_number) {
		return session.delete("adminNoticeDelete", nt_number);
	}

	// 조회수 업데이트
	@Override
	public int adminReadCntUpdate(AdminNoticeVO nvo) {
		return session.update("adminReadCntUpdate", nvo);
	}

}
