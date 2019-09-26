package com.oab.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.notice.dao.AdminNoticeDao;
import com.oab.admin.notice.vo.AdminNoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeDao adminNoticeDao;

	// 전체 레코드 수 구현
	@Override
	public int adminNoticeListCnt(AdminNoticeVO nvo) {
		return adminNoticeDao.adminNoticeListCnt(nvo);
	}

	// 글 목록 구현
	@Override
	public List<AdminNoticeVO> adminNoticeList(AdminNoticeVO nvo) {

		List<AdminNoticeVO> myList = null;

		/*
		 * // 정렬에 대한 기본 값 설정 if (nvo.getOrder_by() == null) {
		 * nvo.setOrder_by("nt_number"); } if (nvo.getOrder_sc() == null) {
		 * nvo.setOrder_sc("DESC"); }
		 */

		myList = adminNoticeDao.adminNoticeList(nvo);
		return myList;
	}

	// 글 입력 구현
	@Override
	public int adminNoticeInsert(AdminNoticeVO nvo) {

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
	public AdminNoticeVO adminNoticeDetail(AdminNoticeVO nvo) {
		AdminNoticeVO detail = null;
		detail = adminNoticeDao.adminNoticeDetail(nvo);
		return detail;
	}

	// 글 수정 구현
	@Override
	public int adminNoticeUpdate(AdminNoticeVO nvo) {

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
	public int adminNoticeDelete(int nt_number) {

		int result = 0;
		try {

			result = adminNoticeDao.adminNoticeDelete(nt_number);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int adminReadCntUpdate(AdminNoticeVO nvo) {
		int result = 0;
		try {
			result = adminNoticeDao.adminReadCntUpdate(nvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
