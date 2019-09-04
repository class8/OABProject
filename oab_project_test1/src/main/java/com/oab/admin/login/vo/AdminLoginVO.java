package com.oab.admin.login.vo;

public class AdminLoginVO {
	private String adminID = "";
	private String adminPW = "";
	
	public AdminLoginVO() {
		super();
	}

	public AdminLoginVO(String adminID, String adminPW) {
		super();
		this.adminID = adminID;
		this.adminPW = adminPW;
	}

	public String getAdminID() {
		return adminID;
	}

	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}

	public String getAdminPW() {
		return adminPW;
	}

	public void setAdminPW(String adminPW) {
		this.adminPW = adminPW;
	}

	@Override
	public String toString() {
		return "AdminLoginVO [adminID=" + adminID + ", adminPW=" + adminPW + "]";
	}
}
