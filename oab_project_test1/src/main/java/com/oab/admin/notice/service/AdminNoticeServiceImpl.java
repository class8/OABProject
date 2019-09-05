package com.oab.admin.notice.service;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.client.notice.dao.NoticeDao;
import com.oab.client.notice.vo.NoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private NoticeDao noticeDao;

	// 글 목록 구현

	// 글 입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) {

		int result = 0;
		try {

			result = noticeDao.noticeInsert(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	// 글 상세 구현
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		return detail;
	}

	// 글 수정 구현
	@Override
	public int noticeUpdate(NoticeVO nvo) {

		int result = 0;
		try {

			result = noticeDao.noticeUpdate(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}

		return result;
	}

	// 글 삭제 구현
	@Override
	public int noticeDelete(int nt_number) {

		int result = 0;
		try {

			result = noticeDao.noticeDelete(nt_number);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<NoticeVO> noticeList() {

		List<NoticeVO> myList = null;

		myList = noticeDao.noticeList();
		System.out.println(myList);
		return myList;
	}

}
