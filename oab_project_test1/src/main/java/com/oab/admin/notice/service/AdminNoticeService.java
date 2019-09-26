package com.oab.admin.notice.service;

import java.util.List;

import com.oab.admin.notice.vo.AdminNoticeVO;

public interface AdminNoticeService {

	public List<AdminNoticeVO> adminNoticeList(AdminNoticeVO nvo);

	public int adminNoticeListCnt(AdminNoticeVO nvo);

	public int adminNoticeInsert(AdminNoticeVO nvo);

	public AdminNoticeVO adminNoticeDetail(AdminNoticeVO nvo);

	public int adminNoticeUpdate(AdminNoticeVO nvo);

	public int adminNoticeDelete(int nt_number);

	public int adminReadCntUpdate(AdminNoticeVO nvo);

}
