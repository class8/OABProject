package com.oab.client.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.login.vo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public LoginVO mt_idSelect(String mt_id) {
		return (LoginVO)session.selectOne("mt_idSelect",mt_id);
	}

	@Override
	public LoginVO loginSelect(LoginVO lvo) {
		return (LoginVO)session.selectOne("loginSelect",lvo);
	}

	@Override
	public int history_tblInsert(LoginVO lvo) {
		// TODO Auto-generated method stub
		return session.insert("history_tblInsert",lvo);
	}

	@Override
	public int history_tblUpdate(LoginVO lvo) {
		// TODO Auto-generated method stub
		return session.update("history_tblUpdate", lvo);
	}

	@Override
	public LoginVO history_tblSelect(String mt_id) {
		// TODO Auto-generated method stub
		return (LoginVO)session.selectOne("history_tblSelect", mt_id);
	}


}
