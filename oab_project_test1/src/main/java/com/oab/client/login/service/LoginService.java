package com.oab.client.login.service;

import com.oab.client.login.vo.LoginVO;

public interface LoginService {
	public LoginVO mt_idSelect(String mt_id);

	public LoginVO loginSelect(String mt_id, String mt_pw);

	public int loginHistory2Insert(LoginVO lvo);

	public int loginHistory2Update(LoginVO lvo);

	public LoginVO loginHistory2Select(String mt_id);
}
