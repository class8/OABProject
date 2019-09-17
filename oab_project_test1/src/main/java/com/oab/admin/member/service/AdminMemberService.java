package com.oab.admin.member.service;

import java.util.List;

import com.oab.client.member.vo.MemberVO;

public interface AdminMemberService {
	public List<MemberVO> adminMemberList(MemberVO amvo);
	public int adminMemberListCnt(MemberVO amvo);
	public int adminMemberDisabledUpdate(MemberVO amvo);
}
