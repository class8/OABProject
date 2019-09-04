package com.oab.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oab.admin.login.dao.AdminLoginDao;
import com.oab.admin.login.vo.AdminLoginVO;

@Service
@Transactional
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDao adminLoginDao;
	
	@Override
	public AdminLoginVO adminLoginSelect(String adminID, String adminPW) {
		AdminLoginVO vo = null;
		AdminLoginVO aLvo = new AdminLoginVO();
		aLvo.setAdminID(adminID);
		aLvo.setAdminPW(adminPW);
		
		vo = adminLoginDao.adminLoginSelect(aLvo);
		return vo;
	}

}
