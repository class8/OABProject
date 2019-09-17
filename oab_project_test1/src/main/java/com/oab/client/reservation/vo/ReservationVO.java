package com.oab.client.reservation.vo;

import org.springframework.web.multipart.MultipartFile;

import com.oab.client.common.vo.CommonVO;

public class ReservationVO extends CommonVO {
	private int rest_number;
	private String mt_id;
	private int pt_number;
	private int rest_bnumber;
	private String rest_bname;
	private String rest_name;
	private String rest_phone;
	private String rest_status;
	private int rest_total;
	private String rest_exprent;
	private String rest_payoption;
	private String rest_regdate;
	private int rest_count;

	public int getRest_number() {
		return rest_number;
	}

	public void setRest_number(int rest_number) {
		this.rest_number = rest_number;
	}

	public String getMt_id() {
		return mt_id;
	}

	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}

	public int getPt_number() {
		return pt_number;
	}

	public void setPt_number(int pt_number) {
		this.pt_number = pt_number;
	}

	public int getRest_bnumber() {
		return rest_bnumber;
	}

	public void setRest_bnumber(int rest_bnumber) {
		this.rest_bnumber = rest_bnumber;
	}

	public String getRest_bname() {
		return rest_bname;
	}

	public void setRest_bname(String rest_bname) {
		this.rest_bname = rest_bname;
	}

	public String getRest_name() {
		return rest_name;
	}

	public void setRest_name(String rest_name) {
		this.rest_name = rest_name;
	}

	public String getRest_phone() {
		return rest_phone;
	}

	public void setRest_phone(String rest_phone) {
		this.rest_phone = rest_phone;
	}

	public String getRest_status() {
		return rest_status;
	}

	public void setRest_status(String rest_status) {
		this.rest_status = rest_status;
	}

	public int getRest_total() {
		return rest_total;
	}

	public void setRest_total(int rest_total) {
		this.rest_total = rest_total;
	}

	public String getRest_exprent() {
		return rest_exprent;
	}

	public void setRest_exprent(String rest_exprent) {
		this.rest_exprent = rest_exprent;
	}

	public String getRest_payoption() {
		return rest_payoption;
	}

	public void setRest_payoption(String rest_payoption) {
		this.rest_payoption = rest_payoption;
	}

	public String getRest_regdate() {
		return rest_regdate;
	}

	public void setRest_regdate(String rest_regdate) {
		this.rest_regdate = rest_regdate;
	}

	public int getRest_count() {
		return rest_count;
	}

	public void setRest_count(int rest_count) {
		this.rest_count = rest_count;
	}

}
