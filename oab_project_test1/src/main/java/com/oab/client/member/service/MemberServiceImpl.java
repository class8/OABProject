package com.oab.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.client.common.util.BCrypt;
import com.oab.client.common.util.Util;
import com.oab.client.member.dao.MemberDao;
import com.oab.client.member.vo.MemberSecurity;
import com.oab.client.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public int mt_IdConfirm(String mt_id) {
		int result;
		if (memberDao.memberSelect(mt_id) != null) {
			result = 1;
		} else {
			result = 2;
		}
		return result;
	}

	@Override
	public MemberVO memberSelect(String mt_id) {
		MemberVO vo = memberDao.memberSelect(mt_id);
		return vo;
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		int sCode = 2;
		if (memberDao.memberSelect(mvo.getMt_id()) != null) {
			return 1;
		} else {
			try {
				MemberSecurity sec = new MemberSecurity();
				sec.setMt_id(mvo.getMt_id());
				sec.setSalt(Util.getRandomString());
				sCode = memberDao.securityInsert(sec);
				if (sCode == 1) {
					mvo.setMt_pw(new String(BCrypt.getSHA256(mvo.getMt_pw(), sec.getSalt())));
					
					System.out.println(mvo.getMt_name());
					memberDao.memberInsert(mvo);
					return 3;
				} else {
					return 2;
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				return 2;
			}
		}
	}

	@Override
	public boolean memberUpdate(MemberVO mvo) {
		try {
			if (!mvo.getMt_pw().isEmpty()) {
				MemberSecurity sec = memberDao.securitySelect(mvo.getMt_id());
				mvo.setMt_pw(new String(BCrypt.getSHA256(mvo.getMt_pw(), sec.getSalt())));
			}
			memberDao.memberUpdate(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public int memberDelete(String mt_id) {
		int mCode, sCode, isSucessCode = 3;
		try {
			mCode = memberDao.memberDelete(mt_id);
			if (mCode == 1) {
				sCode = memberDao.securityDelete(mt_id);
				if (sCode == 1) {
					isSucessCode = 2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			isSucessCode = 3;
		}
		return isSucessCode;

	}

}
