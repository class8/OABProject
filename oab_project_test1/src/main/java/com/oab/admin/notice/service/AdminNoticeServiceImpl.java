package com.oab.admin.notice.service;

import java.util.List;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.notice.dao.AdminNoticeDao;
import com.oab.client.notice.vo.NoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeDao adminNoticeDao;

	// 글 목록 구현

	// 글 입력 구현
	@Override
	public int noticeInsert(NoticeVO nvo) {

		int result = 0;
		try {

			result = adminNoticeDao.adminNoticeInsert(nvo);
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
		detail = adminNoticeDao.adminNoticeDetail(nvo);
		return detail;
	}

	// 글 수정 구현
	@Override
	public int noticeUpdate(NoticeVO nvo) {

		int result = 0;
		try {

			result = adminNoticeDao.adminNoticeUpdate(nvo);
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

			result = adminNoticeDao.adminNoticeDelete(nt_number);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<NoticeVO> noticeList() {

		List<NoticeVO> myList = null;

		myList = adminNoticeDao.adminNoticeList();
		System.out.println(myList);
		return myList;
	}

}
