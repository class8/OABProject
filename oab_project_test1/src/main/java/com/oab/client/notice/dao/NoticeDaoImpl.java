package com.oab.client.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.notice.vo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession session;

	
	//글 목록을 구현합니다
	@Override
	public List<NoticeVO> noticeList() {
		System.out.println("1");
		return session.selectList("noticeList");
		
	}


	//글 목록 상세보기
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (NoticeVO)session.selectOne("noticeDetail", nvo);
	}


	//전체 레코드 건수를 구현한다
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return (Integer)session.selectOne("noticeListCnt");
	}


	
	
}
