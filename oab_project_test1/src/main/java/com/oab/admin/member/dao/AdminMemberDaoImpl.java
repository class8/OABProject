package com.oab.admin.member.dao;
//개발자 : 최대근
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.member.vo.MemberVO;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MemberVO> adminMemberList(MemberVO amvo) {
		// TODO Auto-generated method stub
		return session.selectList("adminMemberList" , amvo);
	}

	@Override
	public int adminMemberListCnt(MemberVO amvo) {
		return (Integer) session.selectOne("adminMemberListCnt");
	}

	@Override
	public int adminMemberDisabledUpdate(MemberVO amvo) {
		return session.update("adminMemberDisabledUpdate" , amvo);
	}

}
