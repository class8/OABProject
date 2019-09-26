package com.oab.client.member.dao;

import java.util.List;

import com.oab.client.login.vo.LoginVO;
import com.oab.client.member.vo.MemberSecurity;
import com.oab.client.member.vo.MemberVO;
import com.oab.client.rental.vo.RentalVO;
import com.oab.client.reservation.vo.UserInfoVO;

public interface MemberDao {
	public int securityInsert(MemberSecurity set);

	public MemberSecurity securitySelect(String mt_id);

	public int securityDelete(String mt_id);

	public MemberVO memberSelect(String mt_id);
	public MemberVO mt_EmailConfirm(String mt_email);

	public int memberInsert(MemberVO mvo);

	public int memberUpdate(MemberVO mvo);

	public int memberSecede(MemberVO mvo);

	public int memberPwUpdate(LoginVO lvo);

	public MemberVO memberIdselect(MemberVO mvo);

	public int securityPwUpdate(MemberSecurity sec);

	public List<UserInfoVO> memberUserInfo(UserInfoVO uvo);

	public int UserInfoUpdate(UserInfoVO uvo);

	public int UserInfoListCnt(UserInfoVO uvo);
	
	public List<RentalVO> memberrentalInfo(UserInfoVO uvo);
	
	public int RentalInfoListCnt(RentalVO revo);
}
