package com.oab.client.member.service;

import java.util.List;

import com.oab.client.member.vo.MemberVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.UserInfoVO;

public interface MemberService {

	public int mt_IdConfirm(String mt_id);
	public int mt_EmailConfirm(String mt_email);

	public MemberVO memberSelect(String mt_id);

	public int memberInsert(MemberVO mvo);

	public boolean memberUpdate(MemberVO mvo);

	public int memberSecede(MemberVO mvo);

	public List<UserInfoVO> memberUserInfo(UserInfoVO uvo);

	public int UserInfoUpdate(UserInfoVO uvo);

	public int UserInfoListCnt(UserInfoVO uvo);
	
	public int UserInfoListTotal(UserInfoVO uvo);
		
	public List<RentalVO> memberrentalInfo(RentalVO revo);
	
	public int RentalInfoListCnt(RentalVO revo);

}
