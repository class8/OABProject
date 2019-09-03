package com.oab.admin.notice.dao;

import java.util.List;

import com.oab.admin.notice.vo.NoticeVO;

public interface NoticeDao {

	public List<NoticeVO> noticeList();

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public int noticeDelete(int nt_number);

}
