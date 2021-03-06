package com.oab.client.question.vo;

import org.springframework.web.multipart.MultipartFile;

import com.oab.client.login.vo.LoginVO;

//사용자 1:1 문의 게시판
public class QuestionVO extends LoginVO {

	private int qt_number; // 문의 게시글 번호
	private String mt_id;
	private String qt_title; // 문의 글 제목
	private String qt_content; // 문의 글 내용
	private String qt_status; // 문의글 카테고리
	private String qt_pw; // 문의글 비밀번호
	private String qt_regdate; // 문의글 등록일자
	private String qt_writer; // 문의글 작성자 이름
	private String qt_file; // 문의글에 첨부할 파일
	private int qt_root = 0; // 답글로 인한 추가
	private int qt_step = 0; // 문의글의 계층 변수참조형
	private int qt_level = 0; // 문의글 계층 변수위치형
	private MultipartFile file; // 파일업로드

	public int getQt_number() {
		return qt_number;
	}

	public void setQt_number(int qt_number) {
		this.qt_number = qt_number;
	}

	public String getQt_title() {
		return qt_title;
	}

	public void setQt_title(String qt_title) {
		this.qt_title = qt_title;
	}

	public String getQt_content() {
		return qt_content;
	}

	public void setQt_content(String qt_content) {
		this.qt_content = qt_content;
	}

	public String getQt_status() {
		return qt_status;
	}

	public void setQt_status(String qt_status) {
		this.qt_status = qt_status;
	}

	public String getQt_pw() {
		return qt_pw;
	}

	public void setQt_pw(String qt_pw) {
		this.qt_pw = qt_pw;
	}

	public String getQt_regdate() {
		return qt_regdate;
	}

	public void setQt_regdate(String qt_regdate) {
		this.qt_regdate = qt_regdate;
	}

	public String getQt_writer() {
		return qt_writer;
	}

	public void setQt_writer(String qt_writer) {
		this.qt_writer = qt_writer;
	}

	public String getQt_file() {
		return qt_file;
	}

	public void setQt_file(String qt_file) {
		this.qt_file = qt_file;
	}

	public int getQt_root() {
		return qt_root;
	}

	public void setQt_root(int qt_root) {
		this.qt_root = qt_root;
	}

	public int getQt_step() {
		return qt_step;
	}

	public void setQt_step(int qt_step) {
		this.qt_step = qt_step;
	}

	public int getQt_level() {
		return qt_level;
	}

	public void setQt_level(int qt_level) {
		this.qt_level = qt_level;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getMt_id() {
		return mt_id;
	}

	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}

	public QuestionVO() {
		super();
	}

	public QuestionVO(int qt_number, String qt_title, String qt_content, String qt_status, String qt_pw,
			String qt_regdate, String qt_writer, String qt_file, int qt_root, int qt_step, int qt_level,
			MultipartFile file) {
		super();
		this.qt_number = qt_number;
		this.qt_title = qt_title;
		this.qt_content = qt_content;
		this.qt_status = qt_status;
		this.qt_pw = qt_pw;
		this.qt_regdate = qt_regdate;
		this.qt_writer = qt_writer;
		this.qt_file = qt_file;
		this.qt_root = qt_root;
		this.qt_step = qt_step;
		this.qt_level = qt_level;
		this.file = file;
	}

}