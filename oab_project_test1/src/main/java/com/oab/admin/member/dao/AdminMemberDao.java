package com.oab.admin.member.dao;
//개발자 : 최대근
import java.util.List;

import com.oab.client.member.vo.MemberVO;

public interface AdminMemberDao {
	public List<MemberVO> adminMemberList(MemberVO amvo);
	public int adminMemberListCnt(MemberVO amvo);
	public int adminMemberDisabledUpdate(MemberVO amvo);
}
