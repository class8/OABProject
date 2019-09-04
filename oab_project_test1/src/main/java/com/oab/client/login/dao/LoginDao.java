package com.oab.client.login.dao;

import com.oab.client.login.vo.LoginVO;

public interface LoginDao {

	public LoginVO mt_idSelect(String mt_id);

	public LoginVO loginSelect(LoginVO lvo);

	public int loginHistory2Insert(LoginVO lvo);

	public int loginHistory2Update(LoginVO lvo);

	public LoginVO loginHistory2Select(String mt_id);

}
