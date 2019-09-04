package com.oab.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.client.notice.dao.NoticeDao;
import com.oab.client.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao; //값만 저정하고 실제로 로직상 사용을 안하고 있어서 문법상 오류 곧 해결

	//글 목록을 구현한다
	@Override
	public List<NoticeVO> noticeList() {
		
		List<NoticeVO> mynotice = null;
		mynotice = noticeDao.noticeList();
		return mynotice;
	
	
	}

	//글 목록 상세 보기
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {

		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		return detail;
		
		
		}

	//전체 레코드 수 구현
	@Override
	public int noticeListCnt(NoticeVO nvo) {

	return noticeDao.noticeListCnt(nvo);
	}
	
	}
	
	
	


	

