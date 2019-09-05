package com.oab.client.login.dao;

import com.oab.client.login.vo.LoginVO;

public interface LoginDao {

	public LoginVO mt_idSelect(String mt_id);

	public LoginVO loginSelect(LoginVO lvo);

	public int history_tblInsert(LoginVO lvo);

	public int history_tblUpdate(LoginVO lvo);

	public LoginVO history_tblSelect(String mt_id);

}
