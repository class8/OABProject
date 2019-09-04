package com.oab.client.login.vo;

public class LoginVO extends LoginHistory2{
	private String mt_id="";//회원 아이디
	private String mt_pw="";//회원 비밀번호
	private String mt_name="";//회원 이름
	
	
	public LoginVO() {
		super();
	}

	

	public LoginVO(String mt_id, String mt_pw, String mt_name) {
		super();
		this.mt_id = mt_id;
		this.mt_pw = mt_pw;
		this.mt_name = mt_name;
	}



	public String getMt_id() {
		return mt_id;
	}


	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}


	public String getMt_pw() {
		return mt_pw;
	}


	public void setMt_pw(String mt_pw) {
		this.mt_pw = mt_pw;
	}


	public String getMt_name() {
		return mt_name;
	}


	public void setMt_name(String mt_name) {
		this.mt_name = mt_name;
	}



	@Override
	public String toString() {
		return "LoginVO [mt_id=" + mt_id + ", mt_pw=" + mt_pw + ", mt_name=" + mt_name + ", getIdx()=" + getIdx()
				+ ", getRetry()=" + getRetry() + ", getLastFailedLogin()=" + getLastFailedLogin()
				+ ", getLastSuccessedLogin()=" + getLastSuccessedLogin() + ", getClientIP()=" + getClientIP() + "]";
	}



	
	
	
	

}
