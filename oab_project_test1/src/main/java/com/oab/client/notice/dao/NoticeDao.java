package com.oab.client.notice.dao;

import java.util.List;

import com.oab.client.notice.vo.NoticeVO;

//data Access Object : DB를 사용해서 뎅터를 조회하거나 조작하는 기능을 전담하는 오브젝트 
public interface NoticeDao {

	public List<NoticeVO> noticeList();

	public int noticeInsert(NoticeVO nvo);

	public NoticeVO noticeDetail(NoticeVO nvo);

	public int noticeUpdate(NoticeVO nvo);

	public int noticeDelete(int nt_number);

	int noticeListCnt(NoticeVO nvo); // 페이지를 위해서 추가

}
