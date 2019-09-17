package com.oab.admin.notice.vo;

import com.oab.client.common.vo.CommonVO;

public class AdminNoticeVO extends CommonVO {

	private int nt_number = 0; // 글 번호
	private String nt_title = ""; // 글제목
	private String nt_writer = ""; // 작성자
	private String nt_content = ""; // 글 내용
	private String nt_regdate = ""; // 작성일
	private int nt_readcnt = 0; // 조회수

	// 디폴트 생성자 생성
	public AdminNoticeVO() {
		super();
	}

	// 모든 생성자 생성
	public AdminNoticeVO(int nt_number, String nt_title, String nt_writer, String nt_content, String nt_regdate,
			int nt_readcnt) {
		super();
		this.nt_number = nt_number;
		this.nt_title = nt_title;
		this.nt_writer = nt_writer;
		this.nt_content = nt_content;
		this.nt_regdate = nt_regdate;
		this.nt_readcnt = nt_readcnt;
	}

	// 접근자와 설정자 생성
	public int getNt_number() {
		return nt_number;
	}

	public void setNt_number(int nt_number) {
		this.nt_number = nt_number;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_writer() {
		return nt_writer;
	}

	public void setNt_writer(String nt_writer) {
		this.nt_writer = nt_writer;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public String getNt_regdate() {
		return nt_regdate;
	}

	public void setNt_regdate(String nt_regdate) {
		this.nt_regdate = nt_regdate;
	}

	public int getNt_readcnt() {
		return nt_readcnt;
	}

	public void setNt_readcnt(int nt_readcnt) {
		this.nt_readcnt = nt_readcnt;
	}

	@Override
	public String toString() {
		return "NoticeVO [nt_number=" + nt_number + ", nt_title=" + nt_title + ", nt_writer=" + nt_writer
				+ ", nt_content=" + nt_content + ", nt_regdate=" + nt_regdate + ", nt_readcnt=" + nt_readcnt + "]";
	}

}
