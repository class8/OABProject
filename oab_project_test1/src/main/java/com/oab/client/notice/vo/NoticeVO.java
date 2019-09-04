package com.oab.client.notice.vo;


import com.oab.client.common.vo.CommonVO;

public class NoticeVO extends CommonVO {

	private int nt_number; // 공지사항 글 번호
	private String nt_title; // 공지사항 제목
	private String nt_writer; // 공지사항 작성자
	private String nt_content; // 공지사항 내용
	private String nt_regdate; // 공지사항 작성일
	private int nt_readcnt; // 조회수
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
	
	
	
	

}
