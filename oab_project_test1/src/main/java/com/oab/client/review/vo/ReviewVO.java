package com.oab.client.review.vo;

import org.springframework.web.multipart.MultipartFile;

import com.oab.client.login.vo.LoginVO;

//포토후기 VO
public class ReviewVO extends LoginVO { // mt_id

	private int revt_number; // 포토후기번호
	private String revt_title; // 제목
	private String revt_writer; // 작성자
	private String revt_content; // 글 내용
	private String revt_regdate; // 작성일
	private String revt_thumbnail; // 대표이미지
	private String revt_image1; // 이미지1
	private String revt_image2; // 이미지2
	private String revt_image3; // 이미지3
	private String revt_pw; // 작성 시 비밀번호
	private int revt_readcnt; // 조회수
	private String revt_branch; // 이용지점
	// 추가
	private MultipartFile revt_file; // 썸네일 파일업로드
	private MultipartFile revt_file1; // 파일업로드
	private MultipartFile revt_file2; // 파일업로드
	private MultipartFile revt_file3; // 파일업로드

	public int getRevt_number() {
		return revt_number;
	}

	public void setRevt_number(int revt_number) {
		this.revt_number = revt_number;
	}

	public String getRevt_title() {
		return revt_title;
	}

	public void setRevt_title(String revt_title) {
		this.revt_title = revt_title;
	}

	public String getRevt_writer() {
		return revt_writer;
	}

	public void setRevt_writer(String revt_writer) {
		this.revt_writer = revt_writer;
	}

	public String getRevt_content() {
		return revt_content;
	}

	public void setRevt_content(String revt_content) {
		this.revt_content = revt_content;
	}

	public String getRevt_regdate() {
		return revt_regdate;
	}

	public void setRevt_regdate(String revt_regdate) {
		this.revt_regdate = revt_regdate;
	}

	public String getRevt_thumbnail() {
		return revt_thumbnail;
	}

	public void setRevt_thumbnail(String revt_thumbnail) {
		this.revt_thumbnail = revt_thumbnail;
	}

	public String getRevt_image1() {
		return revt_image1;
	}

	public void setRevt_image1(String revt_image1) {
		this.revt_image1 = revt_image1;
	}

	public String getRevt_image2() {
		return revt_image2;
	}

	public void setRevt_image2(String revt_image2) {
		this.revt_image2 = revt_image2;
	}

	public String getRevt_image3() {
		return revt_image3;
	}

	public void setRevt_image3(String revt_image3) {
		this.revt_image3 = revt_image3;
	}

	public String getRevt_pw() {
		return revt_pw;
	}

	public void setRevt_pw(String revt_pw) {
		this.revt_pw = revt_pw;
	}

	public int getRevt_readcnt() {
		return revt_readcnt;
	}

	public void setRevt_readcnt(int revt_readcnt) {
		this.revt_readcnt = revt_readcnt;
	}

	public String getRevt_branch() {
		return revt_branch;
	}

	public void setRevt_branch(String revt_branch) {
		this.revt_branch = revt_branch;
	}

	public MultipartFile getRevt_file() {
		return revt_file;
	}

	public void setRevt_file(MultipartFile revt_file) {
		this.revt_file = revt_file;
	}

	public MultipartFile getRevt_file1() {
		return revt_file1;
	}

	public void setRevt_file1(MultipartFile revt_file1) {
		this.revt_file1 = revt_file1;
	}

	public MultipartFile getRevt_file2() {
		return revt_file2;
	}

	public void setRevt_file2(MultipartFile revt_file2) {
		this.revt_file2 = revt_file2;
	}

	public MultipartFile getRevt_file3() {
		return revt_file3;
	}

	public void setRevt_file3(MultipartFile revt_file3) {
		this.revt_file3 = revt_file3;
	}

	public ReviewVO(int revt_number, String revt_title, String revt_writer, String revt_content, String revt_regdate,
			String revt_thumbnail, String revt_image1, String revt_image2, String revt_image3, String revt_pw,
			int revt_readcnt, String revt_branch, MultipartFile revt_file, MultipartFile revt_file1,
			MultipartFile revt_file2, MultipartFile revt_file3) {
		super();
		this.revt_number = revt_number;
		this.revt_title = revt_title;
		this.revt_writer = revt_writer;
		this.revt_content = revt_content;
		this.revt_regdate = revt_regdate;
		this.revt_thumbnail = revt_thumbnail;
		this.revt_image1 = revt_image1;
		this.revt_image2 = revt_image2;
		this.revt_image3 = revt_image3;
		this.revt_pw = revt_pw;
		this.revt_readcnt = revt_readcnt;
		this.revt_branch = revt_branch;
		this.revt_file = revt_file;
		this.revt_file1 = revt_file1;
		this.revt_file2 = revt_file2;
		this.revt_file3 = revt_file3;
	}

	public ReviewVO() {
		super();
	}

}