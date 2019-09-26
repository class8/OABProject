package com.oab.client.reservation.vo;

import com.oab.client.common.vo.CommonVO;

public class UserInfoVO extends CommonVO{
	private String mt_id="";
	private int rest_number;//예약 번호
	private int rest_bnumber;//예약 번호
	private String pt_name = ""; // 상품 명
	private String rest_payoption;
	private int rest_count;
	private int pt_price = 0; // 상품 가격
	private String rest_regdate;
	private int rest_total;
	private String rest_status;
	private String rent_status;
	
	
	
	
	public int getRest_bnumber() {
		return rest_bnumber;
	}
	public void setRest_bnumber(int rest_bnumber) {
		this.rest_bnumber = rest_bnumber;
	}
	public String getRest_payoption() {
		return rest_payoption;
	}
	public void setRest_payoption(String rest_payoption) {
		this.rest_payoption = rest_payoption;
	}
	public String getMt_id() {
		return mt_id;
	}
	public void setMt_id(String mt_id) {
		this.mt_id = mt_id;
	}
	public int getRest_number() {
		return rest_number;
	}
	public void setRest_number(int rest_number) {
		this.rest_number = rest_number;
	}
	public String getPt_name() {
		return pt_name;
	}
	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}
	public int getRest_count() {
		return rest_count;
	}
	public void setRest_count(int rest_count) {
		this.rest_count = rest_count;
	}
	public int getPt_price() {
		return pt_price;
	}
	public void setPt_price(int pt_price) {
		this.pt_price = pt_price;
	}
	public String getRest_regdate() {
		return rest_regdate;
	}
	public void setRest_regdate(String rest_regdate) {
		this.rest_regdate = rest_regdate;
	}
	public int getRest_total() {
		return rest_total;
	}
	public void setRest_total(int rest_total) {
		this.rest_total = rest_total;
	}
	public String getRest_status() {
		return rest_status;
	}
	public void setRest_status(String rest_status) {
		this.rest_status = rest_status;
	}
	public String getRent_status() {
		return rent_status;
	}
	public void setRent_status(String rent_status) {
		this.rent_status = rent_status;
	}
	
	
	
	

}
