package com.oab.client.login.service;

import com.oab.client.login.vo.LoginVO;

public interface LoginService {
	public LoginVO mt_idSelect(String mt_id);

	public LoginVO loginSelect(String mt_id, String mt_pw);

	public int history_tblInsert(LoginVO lvo);

	public int history_tblUpdate(LoginVO lvo);

	public LoginVO history_tblSelect(String mt_id);
}
