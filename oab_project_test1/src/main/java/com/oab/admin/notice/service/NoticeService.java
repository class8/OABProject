package com.oab.admin.notice.service;

import java.util.List;

import com.oab.admin.notice.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> noticeList();

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public int noticeDelete(int nt_number);

}
