package com.oab.client.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.client.member.vo.MemberSecurity;
import com.oab.client.member.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession session;

	@Override
	public int securityInsert(MemberSecurity set) {
		// TODO Auto-generated method stub
		return session.insert("securityInsert", set);
	}

	@Override
	public MemberSecurity securitySelect(String mt_id) {
		// TODO Auto-generated method stub
		return (MemberSecurity) session.selectOne("securitySelect", mt_id);
	}

	@Override
	public int securityDelete(String mt_id) {
		// TODO Auto-generated method stub
		return session.delete("securityDelete", mt_id);
	}

	@Override
	public MemberVO memberSelect(String mt_id) {
		// TODO Auto-generated method stub
		return (MemberVO) session.selectOne("memberSelect", mt_id);
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.insert("memberInsert", mvo);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("memberUpdate", mvo);
	}

	@Override
	public int memberDelete(String mt_id) {
		// TODO Auto-generated method stub
		return session.delete("memberDelete", mt_id);
	}

}