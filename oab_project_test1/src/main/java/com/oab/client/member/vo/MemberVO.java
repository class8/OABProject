package com.oab.client.member.vo;

import com.oab.client.login.vo.LoginVO;

public class MemberVO extends LoginVO{
	
	private int mt_number;//회원 번호
	private String oldmt_pw;//수정이나 변경할때 사용하기 위한 변경전 비밀번호 필드
	private String mt_name;//회원 이름
	private String mt_birth;//회원 생년월일
	private String mt_gender;//회원 성별
	private String mt_email;//회원 이메일
	private String mt_phone;//회원 전화번호
	private String mt_regdate;//회원 등록 일자
	private String mt_disabled;//회원 탈퇴 유무
	
	
	public int getMt_number() {
		return mt_number;
	}
	public void setMt_number(int mt_number) {
		this.mt_number = mt_number;
	}
	public String getOldmt_pw() {
		return oldmt_pw;
	}
	public void setOldmt_pw(String oldmt_pw) {
		this.oldmt_pw = oldmt_pw;
	}
	
	public String getMt_name() {
		return mt_name;
	}
	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}
	
	public String getMt_birth() {
		return mt_birth;
	}
	public void setMt_birth(String mt_birth) {
		this.mt_birth = mt_birth;
	}
	public String getMt_gender() {
		return mt_gender;
	}
	public void setMt_gender(String mt_gender) {
		this.mt_gender = mt_gender;
	}
	public String getMt_email() {
		return mt_email;
	}
	public void setMt_email(String mt_email) {
		this.mt_email = mt_email;
	}
	public String getMt_phone() {
		return mt_phone;
	}
	public void setMt_phone(String mt_phone) {
		this.mt_phone = mt_phone;
	}
	public String getMt_regdate() {
		return mt_regdate;
	}
	public void setMt_regdate(String mt_regdate) {
		this.mt_regdate = mt_regdate;
	}
	public String getMt_disabled() {
		return mt_disabled;
	}
	public void setMt_disabled(String mt_disabled) {
		this.mt_disabled = mt_disabled;
	}
	@Override
	public String toString() {
		return "MemberVO [mt_number=" + mt_number + ", oldmt_pw=" + oldmt_pw + ", mt_name="
				+ mt_name + ", mt_birth=" + mt_birth + ", mt_gender=" + mt_gender + ", mt_email=" + mt_email
				+ ", mt_phone=" + mt_phone + ", mt_regdate=" + mt_regdate + ", mt_disabled=" + mt_disabled + "]";
	}
	
	
	
	

}
