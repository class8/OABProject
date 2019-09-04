package com.oab.client.member.dao;

import com.oab.client.member.vo.MemberSecurity;
import com.oab.client.member.vo.MemberVO;

public interface MemberDao {
	public int securityInsert(MemberSecurity set);

	public MemberSecurity securitySelect(String mt_id);

	public int securityDelete(String mt_id);

	public MemberVO memberSelect(String mt_id);

	public int memberInsert(MemberVO mvo);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(String mt_id);

}
