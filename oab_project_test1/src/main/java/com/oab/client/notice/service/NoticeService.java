package com.oab.client.notice.service;

import java.util.List;

import com.oab.client.notice.vo.NoticeVO;

public interface NoticeService {

	List<NoticeVO> noticeList(NoticeVO nvo); //글 목록을 불러오기 위해서 만들었다.

	NoticeVO noticeDetail(NoticeVO nvo); //글 목록 상세 보기

	int noticeListCnt(NoticeVO nvo); // 페이징을 위해서 추가



}
