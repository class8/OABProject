package com.oab.admin.notice.service;

import java.util.List;

import com.oab.client.notice.vo.NoticeVO;

public interface AdminNoticeService {

	public List<NoticeVO> adminNoticeList(NoticeVO nvo);

	public int adminNoticeListCnt(NoticeVO nvo);

	public int adminNoticeInsert(NoticeVO nvo);

	public NoticeVO adminNoticeDetail(NoticeVO nvo);

	public int adminNoticeUpdate(NoticeVO nvo);

	public int adminNoticeDelete(int nt_number);

	public int adminReadCntUpdate(NoticeVO nvo);

}
