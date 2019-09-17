package com.oab.client.member.service;


import com.oab.client.member.vo.MemberVO;

public interface MemberService {

	public int mt_IdConfirm(String mt_id);

	public MemberVO memberSelect(String mt_id);

	public int memberInsert(MemberVO mvo);

	public boolean memberUpdate(MemberVO mvo);

	public int memberSecede(MemberVO mvo);
	
	//public int memberUpdate2(MemberVO mvo);

}
