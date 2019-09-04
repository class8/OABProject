package com.oab.admin.login.service;

import com.oab.admin.login.vo.AdminLoginVO;

public interface AdminLoginService {
	public AdminLoginVO adminLoginSelect(String adminID, String adminPW);
}
