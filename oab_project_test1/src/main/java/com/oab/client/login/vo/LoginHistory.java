package com.oab.client.login.vo;

import com.oab.client.common.vo.CommonVO;

public class LoginHistory extends CommonVO{
	
	private int ht_number;//순번
	private int ht_retry;//로그인 시도횟수
	private long ht_lastFail;//마지막으로 실패한로그인시간
	private long ht_lastSuccess;//마지막으로 성공한 로그인 시간
	private String ht_Ip;//로그인한 사용자의 ip 주소
	
	
	public LoginHistory() {
		super();
	}


	public int getHt_number() {
		return ht_number;
	}


	public void setHt_number(int ht_number) {
		this.ht_number = ht_number;
	}


	public int getHt_retry() {
		return ht_retry;
	}


	public void setHt_retry(int ht_retry) {
		this.ht_retry = ht_retry;
	}


	public long getHt_lastFail() {
		return ht_lastFail;
	}


	public void setHt_lastFail(long ht_lastFail) {
		this.ht_lastFail = ht_lastFail;
	}


	public long getHt_lastSuccess() {
		return ht_lastSuccess;
	}


	public void setHt_lastSuccess(long ht_lastSuccess) {
		this.ht_lastSuccess = ht_lastSuccess;
	}


	public String getHt_Ip() {
		return ht_Ip;
	}


	public void setHt_Ip(String ht_Ip) {
		this.ht_Ip = ht_Ip;
	}
	
	
}
