package com.oab.admin.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oab.admin.login.vo.AdminLoginVO;

@Repository
public class AdminLoginDaoImpl implements AdminLoginDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public AdminLoginVO adminLoginSelect(AdminLoginVO aLvo) {
		// TODO Auto-generated method stub
		return (AdminLoginVO) session.selectOne("adminLoginSelect" , aLvo);
	}

}
