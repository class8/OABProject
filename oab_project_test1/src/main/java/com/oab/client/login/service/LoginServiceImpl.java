package com.oab.client.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.client.common.util.BCrypt;
import com.oab.client.login.dao.LoginDao;
import com.oab.client.login.vo.LoginVO;
import com.oab.client.member.dao.MemberDao;
import com.oab.client.member.vo.MemberSecurity;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;

	@Autowired
	private MemberDao memberDao;

	@Override
	public LoginVO mt_idSelect(String mt_id) {
		// TODO Auto-generated method stub
		return loginDao.mt_idSelect(mt_id);
	}

	@Override
	public LoginVO loginSelect(String mt_id, String mt_pw) {
		LoginVO vo = null;
		MemberSecurity sec = memberDao.securitySelect(mt_id);

		if (sec != null) {
			mt_pw = new String(BCrypt.getSHA256(mt_pw, sec.getSalt()));
			LoginVO lvo = new LoginVO();
			lvo.setMt_id(mt_id);
			lvo.setMt_pw(mt_pw);

			vo = loginDao.loginSelect(lvo);
		}
		return vo;
	}

	@Override
	public int history_tblInsert(LoginVO lvo) {
		int result;
		if (mt_idSelect(lvo.getMt_id()) == null) {
			result = 1;
		} else {
			LoginVO vo = history_tblSelect(lvo.getMt_id());
			if (vo == null) {
				loginDao.history_tblInsert(lvo);
			}
			result = 2;
		}
		return result;
	}

	@Override
	public LoginVO history_tblSelect(String mt_id) {
		
		return loginDao.history_tblSelect(mt_id);
	}



	@Override
	public int history_tblUpdate(LoginVO lvo) {
		// TODO Auto-generated method stub
		return loginDao.history_tblUpdate(lvo);
	}


}
