package com.oab.client.member.vo;

public class MemberSecurity {
	private String mt_id;
	private String salt;
	
	
	public MemberSecurity() {
		super();
	}


	public String getMt_id() {
		return mt_id;
	}


	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}


	public String getSalt() {
		return salt;
	}


	public void setSalt(String salt) {
		this.salt = salt;
	}


	@Override
	public String toString() {
		return "MemberSecurity [mt_id=" + mt_id + ", salt=" + salt + "]";
	}


	
	

}
