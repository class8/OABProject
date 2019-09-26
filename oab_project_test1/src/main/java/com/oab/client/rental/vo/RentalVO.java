package com.oab.client.rental.vo;

import com.oab.client.reservation.vo.ReservationVO;

public class RentalVO extends ReservationVO {
	// 상속 받았음으로 mt_id pt_number rest_number 전부다 사용 가능
	private int rest_number;
	private int rent_number;// 대여번호
	private String rent_status; // 대여 반납 상태
	private int rent_overtime;// 대여 초과시간
	private int rent_addcost; // 대여 추가 비용
	private String rent_actrent; // 실대여 일시
	private String rent_expretrun; // 반납 예상 일시
	private String rent_actretrun; // 실 반납 일시
	private String pt_name;// 상품 이름

	public RentalVO() {
		super();
	}

	

	public RentalVO(int rent_number, String rent_status, int rent_overtime, int rent_addcost, String rent_actrent,
			String rent_expretrun, String rent_actretrun, String pt_name) {
		super();
		this.rent_number = rent_number;
		this.rent_status = rent_status;
		this.rent_overtime = rent_overtime;
		this.rent_addcost = rent_addcost;
		this.rent_actrent = rent_actrent;
		this.rent_expretrun = rent_expretrun;
		this.rent_actretrun = rent_actretrun;
		this.pt_name = pt_name;
	}



	public int getRest_number() {
		return rest_number;
	}



	public void setRest_number(int rest_number) {
		this.rest_number = rest_number;
	}



	public int getRent_number() {
		return rent_number;
	}

	public void setRent_number(int rent_number) {
		this.rent_number = rent_number;
	}

	public String getRent_status() {
		return rent_status;
	}

	public void setRent_status(String rent_status) {
		this.rent_status = rent_status;
	}

	
	public int getRent_overtime() {
		return rent_overtime;
	}



	public void setRent_overtime(int rent_overtime) {
		this.rent_overtime = rent_overtime;
	}



	public int getRent_addcost() {
		return rent_addcost;
	}



	public void setRent_addcost(int rent_addcost) {
		this.rent_addcost = rent_addcost;
	}



	public String getRent_actrent() {
		return rent_actrent;
	}

	public void setRent_actrent(String rent_actrent) {
		this.rent_actrent = rent_actrent;
	}

	public String getRent_expretrun() {
		return rent_expretrun;
	}

	public void setRent_expretrun(String rent_expretrun) {
		this.rent_expretrun = rent_expretrun;
	}

	public String getRent_actretrun() {
		return rent_actretrun;
	}

	public void setRent_actretrun(String rent_actretrun) {
		this.rent_actretrun = rent_actretrun;
	}

	public String getPt_name() {
		return pt_name;
	}

	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}

}