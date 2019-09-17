package com.oab.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.member.dao.AdminMemberDao;
import com.oab.client.member.vo.MemberVO;

@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private AdminMemberDao adminMemberDao;
	
	@Override
	public List<MemberVO> adminMemberList(MemberVO amvo) {
		List<MemberVO> adminMemeberList = null;
		adminMemeberList = adminMemberDao.adminMemberList(amvo);
		return adminMemeberList;
	}

	@Override
	public int adminMemberListCnt(MemberVO amvo) {
		return adminMemberDao.adminMemberListCnt(amvo);
	}

	@Override
	public int adminMemberDisabledUpdate(MemberVO amvo) {
		int result = 0;
		try {
			result = adminMemberDao.adminMemberDisabledUpdate(amvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
}
