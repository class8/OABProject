package com.oab.client.notice.dao;

import java.util.List;

import com.oab.client.notice.vo.NoticeVO;

//data Access Object : DB를 사용해서 뎅터를 조회하거나 조작하는 기능을 전담하는 오브젝트 
public interface NoticeDao {

	List<NoticeVO> noticeList(); //글 목록을 출력하기 위한 객체 

	NoticeVO noticeDetail(NoticeVO nvo); // 글 목록 상세 보기

	int noticeListCnt(NoticeVO nvo); //페이지를 위해서 추가
	

}
