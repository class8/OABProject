package com.oab.admin.rental.dao;

import java.util.List;

import com.oab.client.rental.vo.RentalVO;

public interface AdminRentalDao {
	public List<RentalVO> adminRentalList(RentalVO arvo);
	public int adminRentalListCnt(RentalVO arvo);
	public int adminRentalInsert(RentalVO arvo);
	public int adminRentalDelete(int rent_number);
	public int adminRentalModify(RentalVO arvo);
}
